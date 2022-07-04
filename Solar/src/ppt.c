/*
 * Copyright (c) 2009, Tim Nolan (www.timnolan.com)
 *               2014, Ralf Schlatterbeck Open Source Consulting
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the Institute nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE INSTITUTE AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE INSTITUTE OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

/**
 * \addtogroup Peak Power Tracking Solar Charger
 *
 * This software implements Tim Nolan's Peak Power Tracking Solar
 * Charger. Originally designed with an Arduino Duemilanove Board it was
 * ported to Contiki by Ralf Schlatterbeck and rewritten in large parts.
 * The original soft- and hardware of the project is open source "free
 * of any restiction for anyone to use". I'm putting this under the
 * 3-clause BSD license (see above) to be compatible with other Contiki
 * code.
 *
 * The original author, Tim Nolan writes: "All I ask is that if you use
 * any of my hardware or software or ideas from this project is that you
 * give me credit and add a link to my website www.timnolan.com to your
 * documentation. Thank you."
 *
 * @{
 */

/**
 * \file
 *      Peak Power Tracking Solar Charger
 * \author
 *      Tim Nolan (www.timnolan.com)
 *      Ralf Schlatterbeck <rsc@runtux.com>
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "contiki.h"
#include "contiki-net.h"
#include "er-coap.h"
#include "Arduino.h"
#include "ppt.h"

#define DEBUG 1
#if DEBUG
#define PRINTF(...) printf(__VA_ARGS__)
#else
#define PRINTF(...)
#endif

/* PIN definitions */
#define PIN_ADC_SOL_AMPS   5  /* Solar Ampere */
#define PIN_ADC_SOL_VOLTS  4  /* Solar Volt */
#define PIN_ADC_BAT_VOLTS  6  /* Battery Volt */
#define PIN_PWM            2  /* PWM output step-down converter */
#define PIN_PWM_ENABLE     3  /* Enable MOSFETs via MOSFET driver */
#define PIN_LED            4

/* ADC averaging */
#define ADC_AVG_NUM 8

/*
 * Integer arithmetics for ampere/voltage values, define a multiplier
 * for each depending on the hardware, this makes calibration in
 * software possible. The ADC is 10bit, 0-1023.
 *
 * V: 1023 equiv 1.6V at input pin
 *    Voltage divider 10k / 560
 *    1023 equiv 1600 * (10000 + 560) / 560 = 30171
 * A: R = 0.005 Ohm, Amplification 100
 *    U = I * R * 100 = I * 0.005 * 100 = I * 0.5
 *    1023 equiv 3200 mA
 * Calculation is in long to avoid overflows
 */
#define SCALE_SOL_VOLT_MUL  29670L
#define SCALE_SOL_VOLT_DIV   1023L
#define SCALE_BAT_VOLT_MUL  30000L
#define SCALE_BAT_VOLT_DIV   1023L
#define SCALE_SOL_AMPS_MUL   2805L
#define SCALE_SOL_AMPS_DIV   1023L

/* Timer definitions */
#define TIMER         3
#define TIMER_CHANNEL HWT_CHANNEL_A

/* Period of the mainloop, wait-time between two invocations */
#define LOOP_PERIOD (CLOCK_SECOND / 16)

/* PWM duty-cycle definitions in percent */
#define PWM_MAX   100
#define PWM_MIN    60
#define PWM_START  90
#define PWM_INC     1

/* Charger state-machine */
#define CHARGER_OFF   0
#define CHARGER_ON    1
#define CHARGER_BULK  2
#define CHARGER_FLOAT 3

/* Measurements that lead to charger state changes */
#define SOL_MILLIWATT_RST     100
#define SOL_MILLIWATT_MIN     200
#define SOL_MILLIWATT_LOW    5000
#define BAT_MILLIVOLT_MIN   11000
#define BAT_MILLIVOLT_MAX   14500
#define BAT_MILLIVOLT_HIGH  13000

/* Number of iterations of charger in OFF state */
#define OFF_WAIT (2 * CLOCK_SECOND / LOOP_PERIOD)
/* Number of iterations of charger in ON state when coming from OFF */
#define CHG_WAIT (1 * CLOCK_SECOND / LOOP_PERIOD / 2)

#define mosfets_on()  digitalWrite (PIN_PWM_ENABLE, HIGH)
#define mosfets_off() digitalWrite (PIN_PWM_ENABLE, LOW)

/* Global variables available to contiki resources */
uint16_t sol_milliampere = 0;
uint16_t sol_millivolt   = 0;
uint16_t bat_millivolt   = 0;
uint32_t sol_milliwatt   = 0;
uint32_t sol_mW_last     = 0;

/* Static variables (moduel global) */
/*
 * PWM settings: pwm_max is the max. dutycycle which we know after
 * initializing the timer. Since the MOSFET driver chip has a
 * charge-pump and needs pwm, we set this 1 smaller than the maximum,
 * the maximum would set the pin to continuous high.
 */
static uint16_t pwm_max   = 0;
static uint16_t pwm_start = 0;
static uint16_t pwm_inc   = 0;
static uint16_t pwm_delta = 0;
static uint16_t pwm_5pc   = 0;
static uint16_t pwm       = 0;

static uint8_t  charger_state = CHARGER_OFF;

PROCESS(ppt, "Peak Power Tracking Solar Charger");

AUTOSTART_PROCESSES (&ppt);

/**
 * \brief Averaged read of analog input
 * \param channel: The analog input to read from
 * \return averaged input value over several reads
 */
static uint16_t read_adc (uint8_t channel)
{
  uint16_t sum = 0;
  uint8_t i = 0;

  adc_setup (ADC_DEFAULT, channel);
  for (i=0; i<ADC_AVG_NUM; i++) {
    sum += adc_read ();
    clock_delay_usec (50);
  }
  adc_fin ();
  return sum / ADC_AVG_NUM;
}

/**
 * \brief Read analog inputs, battery/solar voltage, solar amps
 *        compute solar watts.
 */
static void read_analog_inputs (void)
{
  /* Multiplier / divisor constants are long, so this is long arithmetics */
  sol_milliampere = read_adc (PIN_ADC_SOL_AMPS)
                  * SCALE_SOL_AMPS_MUL / SCALE_SOL_AMPS_DIV
                  ;
  sol_millivolt   = read_adc (PIN_ADC_SOL_VOLTS)
                  * SCALE_SOL_VOLT_MUL / SCALE_SOL_VOLT_DIV
                  ;
  bat_millivolt   = read_adc (PIN_ADC_BAT_VOLTS)
                  * SCALE_BAT_VOLT_MUL / SCALE_BAT_VOLT_DIV
                  ;
  sol_milliwatt = (long)sol_milliampere * (long)sol_millivolt / 1000L;
}

/**
 * \brief LED control
 * We blink up to 4 times and then have a long pause.
 * Number of blinks depends on charger state.
 */
#define LED_PERIOD (CLOCK_SECOND / LOOP_PERIOD * 2)
#define LED_MAX    (LED_PERIOD > 16 ? LED_PERIOD : 16)
#define LED_MASK   (LED_MAX - 1)
#define LED_DIV    (LED_MAX / 16)
static void led_state_machine (void)
{
  static uint8_t counter = 0;
  uint8_t shifted = 0; 
  counter &= LED_MASK;
  shifted  = counter / LED_DIV;
  if (shifted & 1) {
    digitalWrite (PIN_LED, HIGH);
  }
  else if ((shifted / 2) <= charger_state) {
    digitalWrite (PIN_LED, LOW);
  }
  counter++;
}

/**
 * \brief set pwm only if it changed, overflow check
 */
static void set_pwm (void)
{
  static uint16_t oldpwm = 0;
  if (pwm > pwm_max) {
    pwm = pwm_max;
  }
  if (pwm != oldpwm) {
    oldpwm = pwm;
    hwtimer_set_pwm (TIMER, TIMER_CHANNEL, pwm);
  }
}

/**
 * \brief Charger state machine
 *
 * Depending on current charger state compute new state and pwm to be
 * set. We have four states:
 *
 * CHARGER_ON: we have SOL_MILLIWATT_MIN < sol_milliwatt < SOL_MILLIWATT_LOW
 *   Probably happening at dawn or dusk when solar power is too low for
 *   bulk charging state but not low enough for off state. We set pwm to
 *   pwm_max to get the available power to the battery.
 *   When entering this state from CHARGER_OFF, we also wait CHG_WAIT
 *   until power has settled (or until power drops below
 *   SOL_MILLIWATT_RST).
 *
 * CHARGER_BULK: sol_milliwatt > SOL_MILLIWATT_LOW
 *   Bulk charging of battery running the Peak Power Tracking algorithm.
 *   We try to run the maximum amount of current into the battery.
 *
 * CHARGER_FLOAT: As the battery voltage rises up to BAT_MILLIVOLT_MAX
 *   we are done with bulk charging. We try to keep the battery voltage
 *   at BAT_MILLIVOLT_MAX by adjusting the pwm value. If we get to
 *   pwm_max it means we can't keep the battery voltage at
 *   BAT_MILLIVOLT_MAX which probably means the battery is being drawn
 *   by some load. So we need to go back to bulk charging mode.
 *
 * CHARGER_OFF: Entered when sol_milliwatt < SOL_MILLIWATT_MIN. The
 *   charger goes into this state when it gets dark and there is no more
 *   power being generated by the solar panel. The MOSFETs are turned
 *   off in this state so that power from the battery doesn't leak back
 *   into the solar panel. When this state is entered a counter is set
 *   to OFF_WAIT and decremented in each cycle. This is done because if
 *   the battery is disconnected (or a fuse is blown) it takes some time
 *   before the battery voltage changes enough so we can tell that the
 *   battery is no longer connected. Counting down from OFF_WAIT gives
 *   some time for the battery voltage to change so we can tell this.
 */
static void charger_state_machine (void)
{
  static int off_wait = OFF_WAIT;
  static uint16_t sol_milliwatt_old = 0;

  switch (charger_state) {
    case CHARGER_ON:
      if (sol_milliwatt > SOL_MILLIWATT_RST && off_wait) {
        off_wait--;
      }
      else if (sol_milliwatt < SOL_MILLIWATT_MIN) {
        charger_state = CHARGER_OFF;
        off_wait = OFF_WAIT;
        sol_mW_last = sol_milliwatt;
        mosfets_off ();
      }
      else if (bat_millivolt > BAT_MILLIVOLT_MAX) {
        charger_state = CHARGER_FLOAT;
      }
      else if (sol_milliwatt < SOL_MILLIWATT_LOW) {
        pwm = pwm_max;
        set_pwm ();
      } else {
        // 5% more than bat_voltage / sol_voltage
        pwm = ((long)pwm_max * (long)bat_millivolt) / sol_millivolt + pwm_5pc;
        set_pwm ();
        charger_state = CHARGER_BULK;
      }
      break;
    case CHARGER_BULK:
      if (sol_milliwatt < SOL_MILLIWATT_MIN) {
        charger_state = CHARGER_OFF;
        off_wait = OFF_WAIT;
        mosfets_off ();
      }
      else if (bat_millivolt > BAT_MILLIVOLT_MAX) {
        charger_state = CHARGER_FLOAT;
      }
      else if (sol_milliwatt < SOL_MILLIWATT_LOW) {
        charger_state = CHARGER_ON;
      } else {
        if (sol_milliwatt_old >= sol_milliwatt) {
          pwm_delta = -pwm_delta;
        }
        pwm += pwm_delta;
        sol_milliwatt_old = sol_milliwatt;
        set_pwm ();
      }
      break;
    case CHARGER_FLOAT:
      if (sol_milliwatt < SOL_MILLIWATT_MIN) {
        charger_state = CHARGER_OFF;
        off_wait = OFF_WAIT;
        mosfets_off ();
      }
      else if (bat_millivolt > BAT_MILLIVOLT_MAX) {
        uint8_t inc = (bat_millivolt - BAT_MILLIVOLT_MAX) > 200 ?  pwm_inc : 1;
        pwm -= inc;
        set_pwm ();
      }
      else if (bat_millivolt < BAT_MILLIVOLT_MAX) {
        uint8_t inc = (BAT_MILLIVOLT_MAX - bat_millivolt) > 200 ?  pwm_inc : 1;
        pwm += inc;
        set_pwm ();
        if (pwm >= pwm_max) {
          charger_state = CHARGER_BULK;
        }
      }
      break;
    case CHARGER_OFF:
      if (off_wait > 0) {
        off_wait--;
      }
      else if
        (  bat_millivolt > BAT_MILLIVOLT_HIGH
        && bat_millivolt < BAT_MILLIVOLT_MAX
        && sol_millivolt > bat_millivolt
        )
      {
        charger_state = CHARGER_FLOAT;
        set_pwm ();
        mosfets_on ();
      }
      else if
        (  bat_millivolt > BAT_MILLIVOLT_MIN
        && bat_millivolt < BAT_MILLIVOLT_MAX
        && sol_millivolt > bat_millivolt
        )
      {
        pwm = pwm_max;
        set_pwm ();
        charger_state = CHARGER_ON;
        off_wait = CHG_WAIT;
        mosfets_on ();
      }
      break;
    default:
      mosfets_off ();
      break;
  }
}

PROCESS_THREAD (ppt, ev, data)
{
  static struct etimer et;
  PROCESS_BEGIN ();

  rest_init_engine ();
  //rest_activate_resource (&res_info);
  rest_activate_resource (&res_solar_current, "solar_current");
  rest_activate_resource (&res_solar_voltage, "solar_voltage");
  rest_activate_resource (&res_battery_voltage, "bat_voltage");
  rest_activate_resource (&res_solar_power, "solar_power");
  rest_activate_resource (&res_solar_power_last, "solar_power_last");
  adc_init ();
  /* 20µs cycle time for timer, fast pwm mode, ICR */
  hwtimer_pwm_ini (TIMER, 20, HWT_PWM_FAST, 0);
  hwtimer_pwm_enable (TIMER, TIMER_CHANNEL);
  pwm_max = hwtimer_pwm_max_ticks (TIMER) - 1;
  /* Do long arithmetics here, the duty-cycle can be up to 0xFFFF */
  pwm_start = (pwm_max + 1L) * PWM_START / 100L;
  pwm_inc   = (pwm_max + 1L) * 1L        / 100L;
  pwm_delta = pwm_inc;
  pwm_5pc   = (pwm_max + 1L) * 5L        / 100L;
  pwm       = pwm_start;
  hwtimer_set_pwm (TIMER, TIMER_CHANNEL, pwm);
  pinMode (PIN_ADC_SOL_AMPS,  INPUT);
  pinMode (PIN_ADC_SOL_VOLTS, INPUT);
  pinMode (PIN_ADC_BAT_VOLTS, INPUT);
  pinMode (PIN_PWM_ENABLE,    OUTPUT);
  pinMode (PIN_PWM,           OUTPUT);
  pinMode (PIN_LED,           OUTPUT);
  mosfets_on ();
  charger_state = CHARGER_ON;
  etimer_set (&et, LOOP_PERIOD);

  while(1) {
    PROCESS_WAIT_EVENT    ();
    read_analog_inputs    ();
    led_state_machine     ();
    charger_state_machine ();
    etimer_reset       (&et);
  } /* while (1) */

  PROCESS_END();
}

/*
 * VI settings, see coding style
 * ex:ts=8:et:sw=2
 */

/** @} */


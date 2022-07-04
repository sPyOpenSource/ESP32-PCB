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
 * \defgroup Peak Power Tracking Solar Charger
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

#ifndef ppt_h
#define ppt_h

/* Global variables */
extern uint16_t sol_milliampere;
extern uint16_t sol_millivolt;
extern uint16_t bat_millivolt;
/* We expect up to around 25V and 5A, thats 125W so we need 32 bit */
extern uint32_t sol_milliwatt;
/* Last mW measurement before going to off mode */
extern uint32_t sol_mW_last;

/* Resources */
//extern resource_t res_info;
extern resource_t res_solar_current;
extern resource_t res_solar_voltage;
extern resource_t res_battery_voltage;
extern resource_t res_solar_power;
extern resource_t res_solar_power_last;

/*
 * VI settings, see coding style
 * ex:ts=8:et:sw=2
 */

/** @} */

#endif // ppt_h

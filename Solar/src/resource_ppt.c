/*
 * Copyright (c) 2014, Ralf Schlatterbeck Open Source Consulting
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
 * @{
*/


/**
 * \file
 *      Resources for peak power charger
 * \author
 *      Ralf Schlatterbeck <rsc@runtux.com>
 *
 * \brief Resource definitions
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "contiki.h"
#include "er-coap.h"
#include "generic_resource.h"
#include "ppt.h"

size_t sol_ampere (const char *n, const char *uri, char *buf, size_t bs)
{
    return snprintf
        (buf, bs, "%d.%03d", sol_milliampere / 1000, sol_milliampere % 1000);
}

GENERIC_RESOURCE \
    ( solar_current
    , Solar Current
    , A
    , 0
    , NULL
    , sol_ampere
    );

size_t sol_watt (const char *n, const char *uri, char *buf, size_t bs)
{
    return snprintf
        (buf, bs, "%ld.%03ld", sol_milliwatt / 1000, sol_milliwatt % 1000);
}

GENERIC_RESOURCE \
    ( solar_power
    , Solar Power
    , W
    , 0
    , NULL
    , sol_watt
    );

size_t sol_watt_last (const char *n, const char *uri, char *buf, size_t bs)
{
    return snprintf
        (buf, bs, "%ld.%03ld", sol_mW_last / 1000, sol_mW_last % 1000);
}

GENERIC_RESOURCE \
    ( solar_power_last
    , Last Solar Power
    , W
    , 0
    , NULL
    , sol_watt_last
    );

size_t sol_volt (const char *n, const char *uri, char *buf, size_t bs)
{
    return snprintf
        (buf, bs, "%d.%03d", sol_millivolt / 1000, sol_millivolt % 1000);
}

GENERIC_RESOURCE \
    ( solar_voltage
    , Solar Voltage
    , V
    , 0
    , NULL
    , sol_volt
    );

size_t bat_volt (const char *n, const char *uri, char *buf, size_t bs)
{
    return snprintf
        (buf, bs, "%d.%03d", bat_millivolt / 1000, bat_millivolt % 1000);
}

GENERIC_RESOURCE \
    ( battery_voltage
    , Battery Voltage
    , V
    , 0
    , NULL
    , bat_volt
    );

/*
 * VI settings, see coding style
 * ex:ts=8:et:sw=2
 */


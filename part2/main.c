/*********************************************************************
*                    SEGGER Microcontroller GmbH                     *
*                        The Embedded Experts                        *
**********************************************************************
*                                                                    *
*            (c) 2014 - 2019 SEGGER Microcontroller GmbH             *
*                                                                    *
*           www.segger.com     Support: support@segger.com           *
*                                                                    *
**********************************************************************
*                                                                    *
* All rights reserved.                                               *
*                                                                    *
* Redistribution and use in source and binary forms, with or         *
* without modification, are permitted provided that the following    *
* conditions are met:                                                *
*                                                                    *
* - Redistributions of source code must retain the above copyright   *
*   notice, this list of conditions and the following disclaimer.    *
*                                                                    *
* - Neither the name of SEGGER Microcontroller GmbH                  *
*   nor the names of its contributors may be used to endorse or      *
*   promote products derived from this software without specific     *
*   prior written permission.                                        *
*                                                                    *
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND             *
* CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,        *
* INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF           *
* MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE           *
* DISCLAIMED.                                                        *
* IN NO EVENT SHALL SEGGER Microcontroller GmbH BE LIABLE FOR        *
* ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR           *
* CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT  *
* OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;    *
* OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF      *
* LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT          *
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE  *
* USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH   *
* DAMAGE.                                                            *
*                                                                    *
**********************************************************************

-------------------------- END-OF-HEADER -----------------------------

File    : main.c
Purpose : Generic application start

*/

#include <stdio.h>
#include <stdlib.h>

#include "ble_handler.h"
#include "err_handler.h"

#include <nrf_sdm.h>

/*********************************************************************
*
*       main()
*
*  Function description
*   Application entry point.
*/



void main(void) {
  // Start the softdevice with RC oscillator LF clock
  nrf_clock_lf_cfg_t clock_config;
  /*
  clock_config.source = NRF_CLOCK_LF_SRC_RC;
  clock_config.rc_ctiv = 16; // Per manual
  clock_config.rc_temp_ctiv = 2; // Per manual
  clock_config.accuracy = NRF_CLOCK_LF_ACCURACY_250_PPM;// According to manual this is what we get with above parameters
  */
  clock_config.source = NRF_CLOCK_LF_SRC_XTAL;
  clock_config.rc_ctiv = 0;
  clock_config.rc_temp_ctiv = 0;
  clock_config.accuracy = NRF_CLOCK_LF_ACCURACY_20_PPM;

  int err = sd_softdevice_enable(&clock_config,fault_handler);

  CHK_ERR(err);
  INFO("SoftDevice started");
  // Start BLE - found in ble_handler.c
  ble_start();
  while (1){
    CHK_ERR(sd_app_evt_wait());
    ble_handle_events();
  }
}

/*************************** End of file ****************************/

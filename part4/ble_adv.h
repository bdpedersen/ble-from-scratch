#ifndef __BLE_ADV
#define __BLE_ADV

#include <stdint.h>

// Starting advertising with some interval
void ble_adv_start();

// Configuring the advertise and scan response packets
void ble_adv_configure(uint32_t interval);


const int CONN_TAG = 1;

#endif
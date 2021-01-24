#include "ble_adv.h"
#include <nrf_sdm.h>
#include <ble.h>
#include <ble_gap.h>
#include <stddef.h>
#include "ble_adv_data.h"
#include "uuids.h"



uint8_t adv_handle = BLE_GAP_ADV_SET_HANDLE_NOT_SET;;
ble_gap_adv_data_t adv_data;
ble_gap_adv_params_t adv_params;

// Configuring the advertise and scan response packets
void ble_adv_configure(uint32_t interval){

  // peer address - not set for connectable advertise
  adv_params = {
   .properties = {
     .type = BLE_GAP_ADV_TYPE_CONNECTABLE_SCANNABLE_UNDIRECTED,
     .anonymous = 0,
     .include_tx_power= 0
    }, // properties - the two last are not supported on S112
   .p_peer_addr = NULL, // No peer address for undirected with static addresses
   .interval = BLE_GAP_ADV_INTERVAL_MIN, // interval
   .duration = BLE_GAP_ADV_TIMEOUT_GENERAL_UNLIMITED, // Duration - infinite
   .max_adv_evts = 0, // Number of events - infinite
   .channel_mask = {0x0,0x0,0x0,0x0,0x00}, // Channel mask - enable all channels (1 means disable)
   .filter_policy = BLE_GAP_ADV_FP_ANY, // Filter policy - allow any device to connect
   .primary_phy = BLE_GAP_PHY_1MBPS, // primary phy - for simple devices always use 1MBPS
   .secondary_phy = 0, // Secondary phy - ignored
   .set_id = 0, // Set ID - ignored on this device
   .scan_req_notification = 0   // scan req notification - we don't need to know when we are scanned
  };

  adv_data = {
   .adv_data= {
    .p_data = adv.data,
    .len = adv.sz,
    },
   .scan_rsp_data = {
     .p_data = (scan_resp.sz) ? scan_resp.data : NULL,
     .len = scan_resp.sz,
    }
  };

  // Configure the advertise set
  CHK_ERR(sd_ble_gap_adv_set_configure(&adv_handle,&adv_data,&adv_params));
  INFO("Advertising configured ..");
}

// Starting advertising with some interval
void ble_adv_start(){
  sd_ble_gap_adv_start(adv_handle, CONN_TAG);

}


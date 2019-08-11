#include "ble_handler.h"
#include <ble.h>
#include <stdint.h>
#include <string.h>
#include <cstdio>
#include <nrf_sdm.h>
#include <ble.h>
#include <ble_gap.h>
#include "bfs_alloca.h"
#include "ble_adv.h"
#include "ble_adv_data.h"
#include "err_handler.h"


const int MAX_ATT_MTU = 100; // bytes
const int ADV_INTERVAL = 200; // ms

extern uint8_t __app_ram_start__; // Magic variable that points to the start segment for the application - see the section layout file for declaration

static uint32_t app_ram_base=(uint32_t)(&__app_ram_start__);

// Start the BLE stack
void ble_start(){
  // Configure the softdevice for one connection only
  ble_cfg_t link1_cfg = {
    .conn_cfg = {
      .conn_cfg_tag = CONN_TAG, 
      .params = { .gap_conn_cfg = {
        .conn_count=1, 
        .event_length=4
       }}
    }
  }; // one link, max 5 ms connection event


  ble_cfg_t att_cfg = {
    .conn_cfg = {
      .conn_cfg_tag =  CONN_TAG, 
      .params = { .gatt_conn_cfg = {
        .att_mtu = MAX_ATT_MTU
      }}
    }
  };
  
  ble_cfg_t link2_cfg ={
    .gap_cfg = {
      .role_count_cfg = {
        .adv_set_count = 1,
        .periph_role_count = 1
      }
    }
  };

  ble_cfg_t name_cfg = {
    .gap_cfg = {
      .device_name_cfg = {
        .write_perm = {.sm = 0, .lv = 0}, // Cannot be written
        .vloc = BLE_GATTS_VLOC_USER,
        .p_value = (uint8_t *)devicename,
        .current_len = (uint16_t)strlen(devicename),
        .max_len = (uint16_t)strlen(devicename)
      }
    }
  };

  // Set up the four configurations
  CHK_ERR(sd_ble_cfg_set( BLE_CONN_CFG_GAP, &link1_cfg, app_ram_base));
  CHK_ERR(sd_ble_cfg_set( BLE_CONN_CFG_GATTS, &att_cfg, app_ram_base));
  CHK_ERR(sd_ble_cfg_set( BLE_GAP_CFG_ROLE_COUNT, &link2_cfg, app_ram_base));
  CHK_ERR(sd_ble_cfg_set( BLE_GAP_CFG_DEVICE_NAME, &name_cfg, app_ram_base));

  // Start BLE
  uint32_t ram_base = app_ram_base;
  int err = sd_ble_enable(&ram_base);
  
  char str[80];
  sprintf(str,"SoftDevice reported %d bytes free\n",app_ram_base-ram_base);
  INFO(str);

  CHK_ERR(err);

  // Initialize advertisement
  ble_adv_configure(ADV_INTERVAL);

  // Start advertising
  ble_adv_start();
}


constexpr inline int bytes2words(int x){
  int r = x >> 2;
  r += (x & 3) ? 1 : 0;
  return r;
}



// Handle events in thread mode
void ble_handle_events(){

    
    uint16_t event_len;

    ble_evt_t *event;

    while (NRF_ERROR_NOT_FOUND != sd_ble_evt_get(NULL, &event_len)){
      uint16_t buflen = 4*bytes2words(event_len);
      uint32_t *buf = (uint32_t *)alloca(buflen >> 2);
      event = (ble_evt_t *)buf;

      if (buflen > 4096){
        INFO("Risk of stack overflow");
      }

      CHK_ERR(sd_ble_evt_get((uint8_t *)buf,&buflen));

      char str[80];

      switch (event->header.evt_id){
      case BLE_GAP_EVT_DISCONNECTED:
        ble_adv_configure(0x20);
        ble_adv_start();
        INFO("Disconnected, Advertising restarted");
        break;

      case BLE_GAP_EVT_CONNECTED:
        INFO("Device connected, Advertising stopped");
        break;

      case BLE_GAP_EVT_PHY_UPDATE_REQUEST:
        {
        INFO("Phy update requested - will reject");
        ble_gap_phys_t phys = {
         .tx_phys = BLE_GAP_PHY_1MBPS,
         .rx_phys = BLE_GAP_PHY_1MBPS
        };
        sd_ble_gap_phy_update(event->evt.gap_evt.conn_handle, &phys);
        break;
        }

      case BLE_GAP_EVT_PHY_UPDATE:
        {
        ble_gap_evt_phy_update_t phys = event->evt.gap_evt.params.phy_update;
        sprintf(str,"Phy set to tx=%d, rx=%d",phys.tx_phy,phys.rx_phy);
        INFO(str);
        break;
        }

      case BLE_GATTS_EVT_EXCHANGE_MTU_REQUEST:
        { // Local scope due to allocation of variables
        INFO("MTU exchange request received");
        uint16_t req_mtu = event->evt.gatts_evt.params.exchange_mtu_request.client_rx_mtu;
        uint16_t resp_mtu = (req_mtu > MAX_ATT_MTU) ? MAX_ATT_MTU : req_mtu;
        while (NRF_ERROR_BUSY == sd_ble_gatts_exchange_mtu_reply(event->evt.gatts_evt.conn_handle,resp_mtu)) INFO("Had to retry MTU response");
        sprintf(str,"MTU set to %d",resp_mtu);
        INFO(str);
        break;
        }

 
      default:
        sprintf(str,"Event 0x%x received with length %d\n",event->header.evt_id, event_len);
        INFO(str);
        break;
      }

    }
}

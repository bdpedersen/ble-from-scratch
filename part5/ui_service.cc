#define LED_PIN 17 // Active low - external pull-up
#define BTN_PIN 13 // Active low - internal pull-up

#include "uuids.h"
#include "ble_handler.h"
#include <ble.h>
#include <ble_types.h>
#include <ble_gatts.h>
#include <nrf52.h>

// Variables for the two characterisitcs
static uint8_t led_state=1;
static uint16_t btn_cnt;
static ble_gatts_char_handles_t led_state_handles, btn_cnt_handles;


// ***** Very small device driver for the LED
void configure_led(){
  // Set up the led pin as output, disconnect the input buffer and drive when set to 0
  NRF_P0->PIN_CNF[LED_PIN]=
    (GPIO_PIN_CNF_DIR_Output << GPIO_PIN_CNF_DIR_Pos) |
    (GPIO_PIN_CNF_INPUT_Disconnect << GPIO_PIN_CNF_INPUT_Pos) |
    (GPIO_PIN_CNF_DRIVE_H0D1 << GPIO_PIN_CNF_DRIVE_Pos);

}

void set_led_state(){
  // LED is inverted
  if (led_state){
    NRF_P0->OUTCLR = 1 << LED_PIN;
  }else{
    NRF_P0->OUTSET = 1 << LED_PIN;
  }
}

// ***** very small device driver for the button - normally this would be a file on its own.
volatile uint32_t btn_int_cnt = 0;

static mainloop_func_t mainloop;

void mainloop_btn(){
  // Do rest of the mainloop - make sure to handle BLE events first
  mainloop();


  uint32_t _btn_int_cnt;
  uint8_t dummy;
  // Enter critical section and copy/reset the btn_int_cnt - for this simple flag it is not necessary so see this as an example
  // Also word of caution: This is not the best way to sense buttons - some debouncing driven by a timer after the initial detection should be done
  CHK_ERR(sd_nvic_critical_region_enter(&dummy));
  _btn_int_cnt = btn_int_cnt;
  btn_int_cnt = 0;
  CHK_ERR(sd_nvic_critical_region_exit(dummy));

  // Check if we are connected - if not, then 
  uint16_t conn_hdl = ble_conn_handle();
  if (conn_hdl==0xFFFF){
      if (_btn_int_cnt)
        INFO("Detected button press, but ignored due to missing connection");
      return;
  };


  // If it is larger than 0 increment the btn_cnt and write/notify in the softdevice
  if (_btn_int_cnt){
    uint8_t notifications_enabled = 0;
    ble_gatts_value_t cccd_value = {
      .len = 1,
      .offset = 0,
      .p_value = &notifications_enabled
    };
    CHK_ERR(sd_ble_gatts_value_get(ble_conn_handle(),btn_cnt_handles.cccd_handle,&cccd_value));
    if (notifications_enabled){

      uint16_t newcount = btn_cnt + 1;
      uint16_t len = 2;
      ble_gatts_hvx_params_t params = {
        .handle = btn_cnt_handles.value_handle,
        .type = BLE_GATT_HVX_NOTIFICATION,
        .offset = 0,
        .p_len = &len,
        .p_data = (uint8_t *)&newcount
      };
      // To avoid races you should avoid writing the values for the characteristics directly. Rather use the copy/writeback
      // shown here
      CHK_ERR(sd_ble_gatts_hvx(conn_hdl,&params));
      INFO("Notified a new value");
    }else{
      // 
      INFO("Notifications not enabled");
    }
  }

}

void configure_btn(){
  // configure button as input
  NRF_P0->PIN_CNF[BTN_PIN] =
  (GPIO_PIN_CNF_DIR_Input << GPIO_PIN_CNF_DIR_Pos) |
  (GPIO_PIN_CNF_INPUT_Connect << GPIO_PIN_CNF_INPUT_Pos) |
  (GPIO_PIN_CNF_PULL_Pullup << GPIO_PIN_CNF_PULL_Pos) |
  (GPIO_PIN_CNF_SENSE_Disabled << GPIO_PIN_CNF_SENSE_Pos);

  // configure GPIOTE interrupt
  NRF_GPIOTE->CONFIG[0] =
  (GPIOTE_CONFIG_MODE_Event << GPIOTE_CONFIG_MODE_Pos) |
  (BTN_PIN << GPIOTE_CONFIG_PSEL_Pos) |
  (GPIOTE_CONFIG_POLARITY_HiToLo << GPIOTE_CONFIG_POLARITY_Pos);


  sd_nvic_DisableIRQ(GPIOTE_IRQn);
  sd_nvic_ClearPendingIRQ(GPIOTE_IRQn);
  sd_nvic_SetPriority(GPIOTE_IRQn,3);


  NRF_GPIOTE->INTENSET = 1; // Enable interrupt for events_in[0];

  // enable NVIC interrupt
  sd_nvic_EnableIRQ(GPIOTE_IRQn);

  // Insert button handler in the mainloop chain
  mainloop = chain_mainloop_func(mainloop_btn);
}

// GPIOTE interrupt handler
extern "C" void GPIOTE_IRQHandler() __attribute__((isr));
extern "C" void GPIOTE_IRQHandler() {
  btn_int_cnt ++;
  NRF_GPIOTE->EVENTS_IN[0]=0;
  sd_nvic_ClearPendingIRQ(GPIOTE_IRQn);
}



// ****** Setup of the BLE stack

static ble_uuid_t led_state_uuid, btn_cnt_uuid, ui_service_uuid;


// Characteristic metadata
const ble_gatts_char_md_t readnotify = {
  .char_props = {
    .read = 1,
    .notify = 1
  }
};

const ble_gatts_char_md_t write = {
  .char_props = {
    .write = 1
  }
};

// Loan from deviceinfo
extern const ble_gatts_attr_md_t public_readonly_attr_md;

// ... and add one for the writeable property
const ble_gatts_attr_md_t public_write_attr_md = {
  .write_perm = {
    .sm = 1,
    .lv = 1
  },
  .vloc = BLE_GATTS_VLOC_USER
};

// The actual characteristics
const ble_gatts_attr_t ui_service_led_state{
  .p_uuid = &led_state_uuid,
  .p_attr_md = &public_write_attr_md,
  .init_len = sizeof(led_state),
  .init_offs = 0,
  .max_len = sizeof(led_state),
  .p_value = (uint8_t *)&led_state
};

const ble_gatts_attr_t ui_service_btn_cnt{
  .p_uuid = &btn_cnt_uuid,
  .p_attr_md = &public_readonly_attr_md,
  .init_len = sizeof(btn_cnt),
  .init_offs = 0,
  .max_len = sizeof(btn_cnt),
  .p_value = (uint8_t *)&btn_cnt
};



// The write handler that will detect writes to "our" characteristic value
void ui_service_write_handler(ble_gatts_evt_write_t& evt);
static write_handler_t trampoline;


void set_led_state();
void ui_service_write_handler(ble_gatts_evt_write_t& evt){
  // Check if we know this handle
  if (evt.handle == led_state_handles.value_handle){
    INFO("Output handle characteristic was written");
    char str[80];
    sprintf(str,"New value is %d\n",led_state);
    INFO(str);

    set_led_state();

    return;
  }

  // Someone else will handle events this function could'nt handle
  trampoline(evt);
}


void install_ui_service(){
  configure_led();
  configure_btn();
  set_led_state();

  // Install the write handler
  trampoline = chain_write_handler(ui_service_write_handler);

  // Allocate custom UUIDS in the softdevice - we will allocate them as three different base UUIDs. If we want to save a bit of memory, we could use the 
  // service UUID as base UUID alone.
  UUID _service_uuid = UUID(UI_SERVICE);
  UUID _led_state_uuid = UUID(UI_LED_STATE);
  UUID _btn_cnt_uuid = UUID(UI_BTN_CNT);

  // Register with softdevice and fill in the uuid fields
  CHK_ERR(sd_ble_uuid_vs_add((const ble_uuid128_t *)_service_uuid.data, &ui_service_uuid.type));
  ui_service_uuid.uuid = _service_uuid.shortform();

  CHK_ERR(sd_ble_uuid_vs_add((const ble_uuid128_t *)_led_state_uuid.data, &led_state_uuid.type));
  led_state_uuid.uuid = _led_state_uuid.shortform();

  CHK_ERR(sd_ble_uuid_vs_add((const ble_uuid128_t *)_btn_cnt_uuid.data, &btn_cnt_uuid.type));
  btn_cnt_uuid.uuid = _btn_cnt_uuid.shortform();

  // Set up the actual service
  uint16_t hdl;

  CHK_ERR(sd_ble_gatts_service_add(BLE_GATTS_SRVC_TYPE_PRIMARY, &ui_service_uuid, &hdl));
  CHK_ERR(sd_ble_gatts_characteristic_add(hdl,&readnotify,&ui_service_btn_cnt,&btn_cnt_handles));
  CHK_ERR(sd_ble_gatts_characteristic_add(hdl,&write,&ui_service_led_state,&led_state_handles));

}



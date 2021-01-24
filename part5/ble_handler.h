#ifndef __BLE_HANDLER
#define __BLE_HANLDER

#include <ble_gatts.h>

typedef void (*write_handler_t)(ble_gatts_evt_write_t& evt);
typedef void (*mainloop_func_t)(void);

write_handler_t chain_write_handler(write_handler_t new_handler);
mainloop_func_t chain_mainloop_func(mainloop_func_t new_loop);

// Start the BLE stack
void ble_start();

// Function to overload in main.cc
void ble_register_services();

// Return the handle for the currently active connection.
uint16_t ble_conn_handle();

// Handle events in thread mode
extern mainloop_func_t ble_handle_events;


#endif
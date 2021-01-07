#include "err_handler.h"
#include <nrf_sdm.h>
#include <nrf_error.h>
#include <stdio.h>

void report_err(const char* file, int line, const char* msg){
  printf("Error in %s:%d: %s\n",file,line,msg);
}

#define CE(x,y)\
case x:\
errmsg = y;\
break

void print_err(const char* file, int line, int err){
  const char * errmsg;
  char c[80];
  switch (err){
  CE(NRF_ERROR_SVC_HANDLER_MISSING,"SVC handler missing");
  CE(NRF_ERROR_SOFTDEVICE_NOT_ENABLED,"SoftDevice not enabled");
  CE(NRF_ERROR_INTERNAL,"Internal error");
  CE(NRF_ERROR_NO_MEM,"Out of memory");
  CE(NRF_ERROR_NOT_FOUND,"Not found");
  CE(NRF_ERROR_NOT_SUPPORTED,"Not supported");
  CE(NRF_ERROR_INVALID_PARAM,"Invalid parameter");
  CE(NRF_ERROR_INVALID_STATE,"Operation not allowed in this state");
  CE(NRF_ERROR_INVALID_FLAGS,"Invalid flags");
  CE(NRF_ERROR_DATA_SIZE,"Invalid data size");
  CE(NRF_ERROR_TIMEOUT,"Timeout");
  CE(NRF_ERROR_NULL,"Null pointer not allowed");
  CE(NRF_ERROR_FORBIDDEN,"Forbidden operation");
  CE(NRF_ERROR_INVALID_ADDR,"Invalid address");
  CE(NRF_ERROR_BUSY,"Busy");
  CE(NRF_ERROR_CONN_COUNT,"Maximum connection count exceeded");
  CE(NRF_ERROR_RESOURCES,"Not enough resources for this operation");
  default:
  sprintf(c,"Unknown error %d",err);
  errmsg=c;
  }
  report_err(file,line,errmsg);
}

// Softdevice fault handler. Prints out useful information before resetting
void fault_handler(uint32_t id, uint32_t pc, uint32_t info){
  switch (id){
  case NRF_FAULT_ID_SD_ASSERT: 
    printf("Hardfault assertion at address 0x%08X\n",pc);
    break;
  case NRF_FAULT_ID_APP_MEMACC:
    printf("Memory access violation at address 0x%08X accessing 0x%08X\n",pc,info);
    break;
  default:
    printf("Unknown hardfault (ID=%d) at address 0x%08X\n",id,pc);
  }
}

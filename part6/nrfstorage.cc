// Storage implementation for fdb
#include "../fdb/fdb.hh"
#include "socevents.hh"
#include "err_handler.h"

extern const uint32_t __fdbstore[2048]; // Declared in data file

FDB::Storage::Storage(){}
FDB::Storage::~Storage(){}

// Return page size in 32bit words
int FDB::Storage::PageSize(){
  return 1024;
}

// Return pointer for the first page
const uint32_t * FDB::Storage::Data(){
  return &__fdbstore[0];
}

// Write data to the backing store
int FDB::Storage::Write(const uint32_t *src, int len, uint32_t offset, uint8_t page){
  uint32_t *baseptr = (uint32_t *)Data();
  baseptr += (1&page) << 10;
  baseptr += offset;

  do{
  #ifdef DEBUG
  printf("?");
  #endif
    uint32_t err;
    if (NRF_SUCCESS != (err=sd_flash_write(baseptr,src,len))){
      INFO1("Flash write failed with error %d\n",err);
      break;
    }
  }while (NRF_EVT_FLASH_OPERATION_SUCCESS != bfs::SoCEvents::waitfor(NRF_EVT_FLASH_OPERATION_SUCCESS,NRF_EVT_FLASH_OPERATION_ERROR));
  #ifdef DEBUG
  printf("!\n");
  #endif
  return len;
}

void FDB::Storage::ErasePage(int pageno){
  int basepage = (uint32_t)Data() >> 12; // Page size is assumed to be 4096
  do{
    uint32_t err;
    #ifdef DEBUG
    printf("?");
    #endif
    if (NRF_SUCCESS != (err=sd_flash_page_erase(basepage+(pageno&1)))){
      INFO1("Flash write failed with error %d\n",err);
      break;
    }
  }while (NRF_EVT_FLASH_OPERATION_SUCCESS != bfs::SoCEvents::waitfor(NRF_EVT_FLASH_OPERATION_SUCCESS,NRF_EVT_FLASH_OPERATION_ERROR));
  #ifdef DEBUG
  printf("#\n");
  #endif
}


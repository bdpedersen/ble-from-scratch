// Storage implementation for fdb
#include "../../fdb/fdb.hh"
#include "socevents.hh"


fdb::Storage::Storage(){}
fdb::Storage::~Storage(){}

// Return page size in 32bit words
int fdb::Storage::PageSize(){
  return 1024;
}

// Return pointer for the first page
const uint32_t * fdb::Storage::Data(){
  return &_fdbstore;
}

// Write data to the backing store
int fdb::Storage::Write(const uint32_t *src, int len, uint32_t offset, uint8_t page){
  uint32_t *baseptr = &_fdbstore;
  baseptr += (1&page) << 10;
  baseptr += offset;

  do{
    uint32_t err;
    if (NRF_SUCCESS != (err=sd_flash_write(baseptr,src,len))){
      #ifdef DEBUG_PRINT
      std::cout << "Flash erase call failed with error " << err << std::endl;
      #endif
      break;
    }
  }while (NRF_EVT_FLASH_OPERATION_SUCCESS != bfs::SoCEvents::waitfor(NRF_EVT_FLASH_OPERATION_SUCCESS,NRF_EVT_FLASH_OPERATION_ERROR));
  #ifdef DEBUG_PRINT
  std::cout << "Wrote flash page" << std::endl;
  #endif
}

void fdb::Storage::ErasePage(int pageno){
  basepage = (uint32_t)&_fdbstore >> 12; // Page size is assumed to be 4096
  do{
    uint32_t err;
    if (NRF_SUCCESS != (err=sd_flash_page_erase(basepage+(pageno&1)))){
      std::cout << "Flash erase call failed with error " << err << std::endl;
      break;
    }
  }while (NRF_EVT_FLASH_OPERATION_SUCCESS != bfs::SoCEvents::waitfor(NRF_EVT_FLASH_OPERATION_SUCCESS,NRF_EVT_FLASH_OPERATION_ERROR));
  #ifdef DEBUG_PRINT
  std::cout << "Erased flash page" << std::endl;
  #endif
}

extern uint32_t _fdbstore; // Declared by linker

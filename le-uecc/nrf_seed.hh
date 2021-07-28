#ifndef __NRF_SEED_HH
#define __NRF_SEED_HH

#include "le_keygen.hh"
#include <nrf_soc.h>

namespace bfs {

  class NRFSeed : public virtual KeySeed {
  public:
    bool getByte(uint8_t &n){
      uint8_t buf=0;
      uint32_t result = sd_rand_application_vector_get(&buf,1);
      n=buf;
      return (result == NRF_SUCCESS);
    }
  };
}



#endif

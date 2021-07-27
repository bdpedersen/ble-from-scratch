#ifndef __KRANG_HH
#define __KRANG_HH

#include "sponge.hh"
#include <cstdint>

namespace krang{
  class Krang : public Sponge<uint8_t>{
  public:
    void seed(uint8_t *data, int nbytes){
      uint8_t *p = &A[0][0];
      while (nbytes >= 8){
	for (int i=0; i < 8; i++){
	  p[i]^=*data++;
	  keccak_f();
	}
	nbytes -= 8;
      }
      for (int i=0; i < nbytes; i++){
	p[i]^=*data++;    
	keccak_f();
      }
    }

    void fetch(uint8_t *data, int nbytes){
      uint8_t *p = &A[0][0];
      while (nbytes >= 8){
	for (int i=0; i < 8; i++){
	  *data++=p[i];
	  keccak_f();
	}
	nbytes -= 8;
      }
      for (int i=0; i < nbytes; i++){
	*data++=p[i];
	keccak_f();
      }  
    }
  };


}
#endif

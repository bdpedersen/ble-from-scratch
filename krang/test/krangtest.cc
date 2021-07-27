#include "../krang.hh"
#include <iostream>

int main(void){
  krang::Krang rng;

  const char *init="cafebabe";

  rng.seed((uint8_t*)init,8);

  for (int i=0; i < 100; i++){
    uint8_t buf[16];
    rng.fetch(buf,16);
    for (int x=0; x < 16; x++){
      std::cout << (int)buf[x] << " ";
    }
    std::cout << std::endl;
  }
}

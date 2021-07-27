#include "../sponge.hh"
#include <iostream>
#include <cstdint>
#include <string>
#include <cstdio>

void keccakf(void* state);

class SpongeTest : public krang::Sponge<uint64_t> {
public:
  uint64_t *state(){return &A[0][0];};
  void run(){keccak_f();}
};

uint64_t refstate[25]={
  0xabcdef328902323eULL,
  0x8790542981234dfeULL,
  0x7801983274658323ULL,
  0x9810984327405289ULL,
  0x8921056537098753ULL,
  0x9587289018347542ULL,
  0x3490858902487632ULL,
  0x8849572307505483ULL,
  0x8694983283397553ULL,
  0x7437340287562034ULL,
  0x9234814670238945ULL,
  0xa349879205987690ULL,
  0x0483297502989347ULL,
  0x1239807257320345ULL,
  0x3274593039845745ULL,
  0x7278845629274793ULL,
  0x3489390328749509ULL,
  0x3487598024872354ULL,
  0x5489753842094823ULL,
  0x59078430+8723423ULL,
  0x6906598309423596ULL,
  0x2937489240837424ULL,
  0x4380298457023445ULL,
  0x3458029845730245ULL,
  0x1209480258920372ULL
};

std::string fmt(uint64_t x){
  char str[80];
  sprintf(str,"0x%llx",x);
  return std::string(str);
}

int main(void){
  SpongeTest sponge;

  uint64_t *pA = sponge.state();
  for (int n=0; n < 25; n++){
    pA[n]=refstate[n];
  }

  keccakf(refstate);
  sponge.run();

  for (int n=0; n < 25; n++){
    std::cout << fmt(refstate[n]) << " : " << fmt(pA[n]) << std::endl;
  }
}

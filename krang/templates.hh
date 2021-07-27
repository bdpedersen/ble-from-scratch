#ifndef __TEMPLATES_H
#define __TEMPLATES_H

namespace krang {
   template <typename T> int rounds(){return 0;}

  
   template <>
  inline int rounds<uint8_t>(){ return 12+2*3;}
   template <>
  inline int rounds<uint16_t>(){ return 12+2*4;}
   template <>
  inline int rounds<uint32_t>(){ return 12+2*5;}
   template <>
  inline int rounds<uint64_t>(){ return 12+2*6;}

  
  template <typename T>
   inline T rol(T x, unsigned n){ return 0;}

  // Rotate functions. Shift by 0 or full is undefined, so we check for that
  // Due to inlining, that check will never show up in real code
  template <>
   inline uint8_t rol<uint8_t>(uint8_t x, unsigned n){
    n&=7; if (n==0) return x; return (x << n) | (x >> (8-n));
  }
  template <>
    inline uint16_t rol<uint16_t>(uint16_t x, unsigned n){
    n&=15; if (n==0) return x; return (x << n) | (x >> (16-n));
  }
  template <>
   inline uint32_t rol<uint32_t>(uint32_t x, unsigned n){
    n&=31; if (n==0) return x; return (x << n) | (x >> (32-n));
  }
  
  template <>
   inline uint64_t rol<uint64_t>(uint64_t x, unsigned n){
    n&=63; if (n==0) return x; return (x << n) | (x >> (64-n));
  }
  
  extern const uint64_t RC[24];
}


#endif

#ifndef __LE_KEYGEN_H
#define __LE_KEYGEN_H

#include <cstdint>

namespace bfs {
  typedef struct {
    uint8_t value[32];
  } __attribute__((aligned(4))) dhkey_t;

  typedef struct {
    uint8_t value[16];
  }  __attribute__((aligned(4))) irk_t;

  typedef struct {
    uint8_t value[64];
  }  __attribute__((aligned(4))) pubkey_t;
  
  class KeySeed{
  public:
    virtual bool getByte(uint8_t &n)=0;
  };

  // Placeholder - only to be used for testing
  class NullSeed : public virtual KeySeed {
  public:
    bool getByte(uint8_t &n){n = 0; return false;}
  };

  class LEKeygen{
  public:
    virtual void DEBUG_set_private_key(const uint8_t *key)=0;
    virtual void gen_keyset(KeySeed& seed)=0;
    virtual void erase_keyset()=0;
    virtual void generate_irk(irk_t& irk, KeySeed& seed)=0;
    virtual const pubkey_t& public_key()=0;
    virtual bool shared_secret(dhkey_t& secret, const pubkey_t& other_public_key)=0;
  };
}

#endif

#ifndef __LE_KEYGEN_UECC_HH
#define __LE_KEYGEN_UECC_HH

#include "le_keygen.hh"
#include "uECC.h"



namespace bfs {

  class LEKeygen_uECC : public virtual LEKeygen {
  public:
    LEKeygen_uECC();
    virtual void DEBUG_set_private_key(const uint8_t *key);
    virtual void gen_keyset(KeySeed& seed);
    virtual void erase_keyset();
    virtual void generate_irk(irk_t& irk, KeySeed& seed);
    virtual const pubkey_t& public_key();
    virtual bool shared_secret(dhkey_t& secret, const pubkey_t& other_public_key);

  private:
    uint32_t privkey[8];
    pubkey_t pubkey;
    uECC_Curve P256;
  };
  
}


#endif

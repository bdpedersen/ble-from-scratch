#include "le_keygen_uecc.hh"
#include <cstring>
#include "../krang/krang.hh"

static krang::Krang rng;

// Adaptor function for the rng
static int uecc_rng(uint8_t *dest, unsigned size){
  rng.fetch(dest,size);
  return 1;
}


bfs::LEKeygen_uECC::LEKeygen_uECC() : LEKeygen(){
  P256 = uECC_secp256r1();
  uECC_set_rng(uecc_rng);
  erase_keyset();
}

void bfs::LEKeygen_uECC::DEBUG_set_private_key(const uint8_t *key){
  memcpy(privkey,key,32);
}

void bfs::LEKeygen_uECC::gen_keyset(KeySeed& seed){
  uint8_t sd[16] = {0};
  for (int i=0; i < 16; i ++){
    if (!seed.getByte(sd[i])) break;
  }
  rng.seed(sd,16);
  uECC_make_key(pubkey.value,(uint8_t *)&privkey[0],P256);
}

void bfs::LEKeygen_uECC::erase_keyset(){
  memset(privkey,0,32);
  memset(pubkey.value,0,sizeof(pubkey_t));
}

void bfs::LEKeygen_uECC::generate_irk(irk_t& irk, KeySeed& seed){
  uint8_t sd[16] = {0};
  for (int i=0; i < 16; i ++){
    if (!seed.getByte(sd[i])) break;
  }
  rng.seed(sd,16);
  rng.fetch(irk.value,16);
}


const bfs::pubkey_t& bfs::LEKeygen_uECC::public_key() {
  return pubkey;
}

bool bfs::LEKeygen_uECC::shared_secret(dhkey_t& secret, const pubkey_t& other_public_key){
  if (!uECC_valid_public_key(other_public_key.value,P256)) return false;

  uECC_shared_secret(other_public_key.value,(const uint8_t *)&privkey[0],secret.value,P256);
  return true;
}

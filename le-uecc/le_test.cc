#include "uECC.h"
#include "le_testdata.hh"
#include <cstring>
#include <cstdio>
#include "../krang/krang.hh"
#include "le_keygen_uecc.hh"

krang::Krang rng;

using namespace bfs;

// Adaptor function for the rng
int uecc_rng(uint8_t *dest, unsigned size){
  rng.fetch(dest,size);
  return 1;
}

void printhex(uint8_t *data, int size){
  printf("0x");
  for (int i=size-1; i >=0; i--){
    printf("%02x",(int)data[i]);
  }
  printf("\n");
}

int main(void){

  uECC_Curve P256 = uECC_secp256r1();

  uint32_t privkey_buf[8];
  uint32_t dhkey_buf[8];
  uint32_t pubkey_buf[16];

  // Check that the A and B public keys are valid
  for (int i=0; i < 2; i++){
    // A check
    memcpy(&pubkey_buf[0],&pub_Ax[i][0], 32);
    memcpy(&pubkey_buf[8],&pub_Ay[i][0], 32);

    if (uECC_valid_public_key((const uint8_t *)pubkey_buf,P256)){
      printf("A key %d checked OK\n",i);
    }else{
      printf("A key %d did NOT check OK\n",i);
    }

    // B check
    memcpy(&pubkey_buf[0],&pub_Bx[i][0], 32);
    memcpy(&pubkey_buf[8],&pub_By[i][0], 32);

    if (uECC_valid_public_key((const uint8_t *)pubkey_buf,P256)){
      printf("B key %d checked OK\n",i);
    }else{
      printf("B key %d did NOT check OK\n",i);
    }
  }

  for (int i=0; i < 2; i++){
    // Compute B private, A public
    memcpy(&pubkey_buf[0],&pub_Ax[i][0], 32);
    memcpy(&pubkey_buf[8],&pub_Ay[i][0], 32);

    if (!uECC_shared_secret((const uint8_t *)&pubkey_buf[0],(const uint8_t *)&priv_B[i][0],(uint8_t *)&dhkey_buf[0],P256)){
      printf("Failed to compute shared secret from private B, Public A index %d\n",i);
    }else{
      if (0==memcmp(&dhkey_buf[0],&dhkey[i][0],32)){
	printf("Successfully computed shared secret from private B, public A index %d\n",i);
      }else{
	printf("Wrong shared secret computed from private B, public A index %d\n",i);
      }
    }

    // Compute A private, B public
    memcpy(&pubkey_buf[0],&pub_Bx[i][0], 32);
    memcpy(&pubkey_buf[8],&pub_By[i][0], 32);

    if (!uECC_shared_secret((const uint8_t *)&pubkey_buf[0],(const uint8_t *)&priv_A[i][0],(uint8_t *)&dhkey_buf[0],P256)){
      printf("Failed to compute shared secret from private A, Public B index %d\n",i);
    }else{
      if (0==memcmp(&dhkey_buf[0],&dhkey[i][0],32)){
	printf("Successfully computed shared secret from private A, public B, index %d\n",i);
      }else{
	printf("Wrong shared secret computed from private A, public B, index %d\n",i);
      }
    }
  }

  // Testing generation of keypair using KRANG
  uECC_set_rng(uecc_rng);

  for (int i=0; i < 4; i++){
    if (!uECC_make_key((uint8_t *)&pubkey_buf[0],(uint8_t *)&privkey_buf[0],P256)){
      printf("Failed to generate keypair using KRANG\n");
    }else{
      printf("Generated keypair using KRANG\n");
      printf("Public: ");
      printhex((uint8_t*)&pubkey_buf[0],64);
      printf("Private:");
      printhex((uint8_t*)&privkey_buf[0],32);
      
      if (uECC_valid_public_key((const uint8_t *)pubkey_buf,P256)){
	printf("Generated public key checked OK\n");
      }else{
	printf("Generated public key did NOT check OK\n");
      }
 
    }
  }

  auto alice = bfs::LEKeygen_uECC();
  auto bob = bfs::LEKeygen_uECC();
  auto xeed = bfs::NullSeed();
  
  for (int i=0; i < 2 ; i++){
    alice.DEBUG_set_private_key((const uint8_t *)&priv_A[i]);
    bob.DEBUG_set_private_key((const uint8_t *)&priv_B[i]);

    pubkey_t pub_buf;
    dhkey_t secret;
    
    memcpy(&pub_buf.value[0],&pub_Ax[i][0], 32);
    memcpy(&pub_buf.value[32],&pub_Ay[i][0], 32);

    
    if (!bob.shared_secret(secret,pub_buf)) printf("Bob failed to compute the secret at all\n");
    if (0==memcmp(secret.value,&dhkey[i][0],32)){
      printf("Bob successfully computed the secret, index %d\n",i);
    }else{
      printf("Bob failed to compute the secret correctly, index %d\n",i);
    }
    
    memcpy(&pub_buf.value[0],&pub_Bx[i][0], 32);
    memcpy(&pub_buf.value[32],&pub_By[i][0], 32);


    if (!alice.shared_secret(secret,pub_buf)) printf("Alice failed to compute the secret at all\n");
    if (0==memcmp(secret.value,&dhkey[i][0],32)){
      printf("Alice successfully computed the secret, index %d\n",i);
    }else{
      printf("Alice failed to compute the secret correctly, index %d\n",i);
    }
    
    alice.erase_keyset();
    alice.gen_keyset(xeed);
    
    if (uECC_valid_public_key(alice.public_key().value,P256)){
      printf("Alices generated public key checked OK\n");
    }else{
      printf("Alices generated public key did NOT check OK\n");
    }

    bob.erase_keyset();
    bob.gen_keyset(xeed);

    if (uECC_valid_public_key(bob.public_key().value,P256)){
      printf("Bobs generated public key checked OK\n");
    }else{
      printf("Bobs generated public key did NOT check OK\n");
    }

    dhkey_t bobs_secret, alices_secret;
    

    if (!bob.shared_secret(bobs_secret,alice.public_key())){
      printf("Bob couldn't compute his secret\n");
    }

    if (!alice.shared_secret(alices_secret,bob.public_key())){
      printf("Bob couldn't compute his secret\n");
    }

    if (0==memcmp(bobs_secret.value,alices_secret.value,32)){
      printf("They got the same secret\n");
    }else{
      printf("They did NOT get the same secret\n");      
    }

    if (0==memcmp(bob.public_key().value,alice.public_key().value,64)){
      printf("Aaargh they had the same key\n");
    }else{
      printf("They did NOT get the same keyset - a good thing\n");      
    }

    
  }

  for (int i=0;i < 4; i++){
    irk_t irk;
    alice.generate_irk(irk,xeed);
    printhex(irk.value,16);
    printf("\n");
  }
  
}

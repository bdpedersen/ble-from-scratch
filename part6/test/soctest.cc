#include "soctest.hh"

// For testing LE keygen
#include "../../le-uecc/le_testdata.hh"
#include <cstring>
#include <cstdio>
#include <cassert>
#include <nrf52.h>
#include "../../le-uecc/le_keygen_uecc.hh"
#include "../timer.hh"
#include "../../le-uecc/nrf_seed.hh"
#include "../../krang/krang.hh"
#include "../../fdb/fdb.hh"

HWTimer timer(NRF_TIMER4);

using namespace bfs;

static const char hexv[16]={'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};

void printhex(uint8_t *data, int size){
  printf("0x");
  for (int i=size-1; i >=0; i--){
    int d = data[i];
    printf("%c",hexv[d>>4]);
    printf("%c",hexv[d&15]);
  }
  printf("\n");
}


void test_le_keygen(){
  auto alice = bfs::LEKeygen_uECC();
  auto bob = bfs::LEKeygen_uECC();
  auto xeed = bfs::NRFSeed();

  uECC_Curve P256 = uECC_secp256r1();

  timer.start();
  
  for (int i=0; i < 2 ; i++){
    alice.DEBUG_set_private_key((const uint8_t *)&priv_A[i]);
    bob.DEBUG_set_private_key((const uint8_t *)&priv_B[i]);

    pubkey_t pub_buf;
    dhkey_t secret;
    
    memcpy(&pub_buf.value[0],&pub_Ax[i][0], 32);
    memcpy(&pub_buf.value[32],&pub_Ay[i][0], 32);

    uint32_t t0,t1,dt;
    
    t0 = timer.read();
    if (!bob.shared_secret(secret,pub_buf)) printf("Bob failed to compute the secret at all\n");
    t1 = timer.read();
    dt = t1-t0;
    printf("Used %d us for computing the shared secret\n",dt);
    
    if (0==memcmp(secret.value,&dhkey[i][0],32)){
      printf("Bob successfully computed the secret, index %d\n",i);
    }else{
      printf("Bob failed to compute the secret correctly, index %d\n",i);
    }
    
    memcpy(&pub_buf.value[0],&pub_Bx[i][0], 32);
    memcpy(&pub_buf.value[32],&pub_By[i][0], 32);

    t0 = timer.read();
    if (!alice.shared_secret(secret,pub_buf)) printf("Alice failed to compute the secret at all\n");
    t1 = timer.read();
    dt = t1-t0;
    printf("Used %d us for computing the shared secret\n",dt);

    if (0==memcmp(secret.value,&dhkey[i][0],32)){
      printf("Alice successfully computed the secret, index %d\n",i);
    }else{
      printf("Alice failed to compute the secret correctly, index %d\n",i);
    }
    
    alice.erase_keyset();
    t0 = timer.read();
    alice.gen_keyset(xeed);
    t1 = timer.read();
    dt = t1-t0;
    printf("Used %d us for generating a keyset\n",dt);

    
    if (uECC_valid_public_key(alice.public_key().value,P256)){
      printf("Alices generated public key checked OK\n");
    }else{
      printf("Alices generated public key did NOT check OK\n");
    }

    bob.erase_keyset();
    t0 = timer.read();
    bob.gen_keyset(xeed);
    t1 = timer.read();
    dt = t1-t0;
    printf("Used %d us for generating a keyset\n",dt);

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
    uint32_t t0 = timer.read();
    alice.generate_irk(irk,xeed);
    uint32_t t1 = timer.read();
    uint32_t dt = t1-t0;
    printf("Used %d us for generating an IRK\n",dt);

    printhex(irk.value,16);
    printf("\n");
  }
  

}

extern krang::Krang rng;

struct DeviceIdentity{
    uint8_t irk[16];

    bool operator==(struct DeviceIdentity& other){
        return (0==memcmp(this,&other,sizeof(struct DeviceIdentity)));
    }

    bool operator!=(struct DeviceIdentity& other){
        return !(*this == other);
    }
};


void generate_random_bytes(uint8_t *dest, int N){
  rng.fetch(dest,N);
}

void print_bytes(uint8_t *dest, int N){
    printhex(dest,N);
}

void simulate_bond(DeviceIdentity &id, FDB::Index<DeviceIdentity,3,1> &devices, FDB::Index<uint32_t,3,2> &session_data){
    uint32_t result = devices.Append(id);
    uint32_t oldest_id = FDB::NOT_FOUND;
    if (result == FDB::NOT_FOUND){
      printf("Index already full\n");
        // Find oldest ID in the session data to find the device to evict
        for (int i=0; i < session_data.Size(); i++){
            uint32_t entry_id = session_data.GetEntryID(i);
            if (entry_id<oldest_id) oldest_id = entry_id;
        }
        // If we can't find session data, just nuke the first one in the index
        uint32_t device_id_to_remove;
        if (oldest_id == FDB::NOT_FOUND) device_id_to_remove = devices.GetEntryID(0);
        else{
            auto dev = session_data.GetEntryWithID(oldest_id);
            device_id_to_remove = dev.value;
        }
        // Delete oldest entry
        auto dev_to_delete = devices.GetEntryWithID(device_id_to_remove);
        printf("Evicting ");
        print_bytes(dev_to_delete.value.irk, 16);
	printf("\n");
        devices.Delete(dev_to_delete);
        // Remove the associated session data (if any)
        session_data.Delete(session_data.GetEntryMatching([=](uint32_t op){return op==device_id_to_remove;}));
        // Try append again
        result = devices.Append(id);
    }
    printf("Bond created for ");
    print_bytes(id.irk,16);
    printf(" at index %d",result);
}

void simulate_connection(DeviceIdentity &id, FDB::Index<DeviceIdentity,3,1> &devices, FDB::Index<uint32_t,3,2> &session_data){

  // Find out if this device is already bonded
  auto search_result = devices.GetEntryMatching([&](DeviceIdentity &op){return id==op;},0);
    uint32_t index = search_result.index;
    if (index == FDB::NOT_FOUND){
      printf("Device not found in bonding table: ");
      print_bytes(id.irk,16);
      printf("\n");
      simulate_bond(id,devices,session_data);
        index=devices.Size()-1;
    }
    // Get the ID for the bonded device
    uint32_t bond_id=devices.GetEntryID(index);
    printf("Bond found for %d\n", bond_id);
    // Get data associated with the bond
    auto bond_data = session_data.GetEntryMatching([=](uint32_t op){return bond_id == op;},0);
    if (bond_data.index == FDB::NOT_FOUND){
      printf("No data found in session data for this bond\n");
    }else{
        uint32_t length = 0;
        int len = 4;
        assert(len == session_data.GetExtendedData(bond_data,&length,len));
        uint32_t data[length+1];
        len = (length+1)*sizeof(uint32_t);
        assert(len == session_data.GetExtendedData(bond_data,data,(length+1)*sizeof(uint32_t)));
        printf("Found %d words of data ", length);
        print_bytes((uint8_t *)(data+1),4*length);
        printf("\n");
    }

    // Simulate a disconnect
    session_data.Delete(bond_data);
    uint8_t newlen_byte;
    rng.fetch(&newlen_byte,1);
    int newlen = newlen_byte & 0x1f;
    uint32_t data[newlen+1];
    data[0]=newlen;
    generate_random_bytes((uint8_t *)(data+1),newlen*4);
    session_data.Append(bond_id,data,newlen+1);
    printf("Stored %d words of new data: ", newlen);
    print_bytes((uint8_t *)(data+1),4*newlen);
    printf("\n");
}

void test_bonding_flow(void){

    // Create some device identities
    DeviceIdentity d1, d2, d3, d4, d5;
    generate_random_bytes(d1.irk,16);
    generate_random_bytes(d2.irk,16);
    generate_random_bytes(d3.irk,16);
    generate_random_bytes(d4.irk,16);
    generate_random_bytes(d5.irk,16);

    FDB::Storage storage;



    FDB::Layout layout(storage);

    FDB::Index<DeviceIdentity,3,1> devices(layout);
    FDB::Index<uint32_t,3,2> session_data(layout);


    for (int i=0; i < 100; i++){
        simulate_connection(d1,devices,session_data);
        layout.GetStatus().print();
        simulate_connection(d2,devices,session_data);
        layout.GetStatus().print();
        simulate_connection(d3,devices,session_data);
        layout.GetStatus().print();
    }
    simulate_connection(d4,devices,session_data); // Should remove d1
    layout.GetStatus().print();

    for (int i=0; i < 100; i++){
        simulate_connection(d4,devices,session_data);
        layout.GetStatus().print();
        simulate_connection(d2,devices,session_data);
        layout.GetStatus().print();
        simulate_connection(d3,devices,session_data);
        layout.GetStatus().print();
    }
    simulate_connection(d5,devices,session_data); // Should remove d4
    layout.GetStatus().print();
}


void test_flash_access(){
  test_bonding_flow();
}

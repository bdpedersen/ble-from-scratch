#include <iostream>
#include <string>
#include <cstdio>
#include "fdb.hh"
#include <cassert>
#include <memory>
#include <cstdint>
#include <random>

class FileStorage : public FDB::Storage {
public:
    FileStorage(const std::string& name, bool restore = true) : name(name){
        FILE *file = NULL;
        if (restore){
            file=fopen(name.c_str(),"rb");
        }

        if (!file){
            std::cout << "New file in use" << std::endl;
        }else{
            assert(2048 == fread(_baseptr,sizeof(uint32_t),2048,file));
            std::cout << "Reloaded existing data" << std::endl;
            fclose(file);
        }
    }

    ~FileStorage(){
        FILE *file=fopen(name.c_str(),"wb");
        fwrite(_baseptr,sizeof(uint32_t),2048,file);
        fclose(file);
    }

private:
    const std::string& name;
};

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
    for (int n=0; n < N; n++){
        dest[n]=std::rand();
    }
}

void print_bytes(uint8_t *dest, int N){
    char s[3];
    for (int n=0; n < N ; n++){
        snprintf(s,3,"%02x",dest[n]);
        std::cout << s;
    }
}

void simulate_bond(DeviceIdentity &id, FDB::Index<DeviceIdentity,3,1> &devices, FDB::Index<uint32_t,3,2> &session_data){
    uint32_t result = devices.Append(id);
    uint32_t oldest_id = FDB::NOT_FOUND;
    if (result == FDB::NOT_FOUND){
        std::cout << "Index already full" <<std::endl;
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
        std::cout << "Evicting ";
        print_bytes(dev_to_delete.value.irk, 16);
        std::cout << std::endl;
        devices.Delete(dev_to_delete);
        // Remove the associated session data (if any)
        session_data.Delete(session_data.GetEntryMatching([=](uint32_t op){return op==device_id_to_remove;}));
        // Try append again
        result = devices.Append(id);
    }
    std::cout << "Bond created for ";
    print_bytes(id.irk,16);
    std::cout << std::endl << "at index " << result << std::endl;
}

void simulate_connection(DeviceIdentity &id, FDB::Index<DeviceIdentity,3,1> &devices, FDB::Index<uint32_t,3,2> &session_data){

    // Find out if this device is already bonded
    auto search_result = devices.GetEntryMatching([&](DeviceIdentity &op){return id==op;},0);
    uint32_t index = search_result.index;
    if (index == FDB::NOT_FOUND){
        std::cout << "Device not found in bonding table: ";
        print_bytes(id.irk,16);
        std::cout << std::endl;
        simulate_bond(id,devices,session_data);
        index=devices.Size()-1;
    }
    // Get the ID for the bonded device
    uint32_t bond_id=devices.GetEntryID(index);
    std::cout << "Bond found for " << bond_id << std::endl;
    // Get data associated with the bond
    auto bond_data = session_data.GetEntryMatching([=](uint32_t op){return bond_id == op;},0);
    if (bond_data.index == FDB::NOT_FOUND){
        std::cout << "No data found in session data for this bond" << std::endl;
    }else{
        uint32_t length = 0;
        int len = 4;
        assert(len == session_data.GetExtendedData(bond_data,&length,len));
        uint32_t data[length+1];
        len = (length+1)*sizeof(uint32_t);
        assert(len == session_data.GetExtendedData(bond_data,data,(length+1)*sizeof(uint32_t)));
        std::cout << "Found " << length << " words of data: ";
        print_bytes((uint8_t *)(data+1),4*length);
        std::cout << std::endl;
    }

    // Simulate a disconnect
    session_data.Delete(bond_data);
    int newlen = rand() & 0x1f;
    uint32_t data[newlen+1];
    data[0]=newlen;
    generate_random_bytes((uint8_t *)(data+1),newlen*4);
    session_data.Append(bond_id,data,newlen+1);
    std::cout << "Stored " << newlen << " words of new data: ";
    print_bytes((uint8_t *)(data+1),4*newlen);
    std::cout << std::endl;
}

void test_bonding_flow(void){

    // Create some device identities
    DeviceIdentity d1, d2, d3, d4, d5;
    generate_random_bytes(d1.irk,16);
    generate_random_bytes(d2.irk,16);
    generate_random_bytes(d3.irk,16);
    generate_random_bytes(d4.irk,16);
    generate_random_bytes(d5.irk,16);

        FileStorage storage("test.db",false);
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

void test_storage(void){
    
}


int main(void){
    std::srand(1);
    
    test_bonding_flow();


}

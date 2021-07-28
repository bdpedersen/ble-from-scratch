#ifndef __ADV_HELPER
#define __ADV_HELPER

#include <stdint.h>
#include "err_handler.h"

const int max_adv_sz = 31;
const int max_scan_sz = 31;
const int max_ad_sz = (max_adv_sz > max_scan_sz) ? max_adv_sz : max_scan_sz;

// A few helper functions
static inline int const_strlen(const char * s){
  int i=0;
  while (s[i]) i++;
  return i;
}

static inline constexpr int const hexch2val(char c){
  switch(c){
    case '0' : return 0;
    case '1' : return 1;
    case '2' : return 2;
    case '3' : return 3;
    case '4' : return 4;
    case '5' : return 5;
    case '6' : return 6;
    case '7' : return 7;
    case '8' : return 8;
    case '9' : return 9;
    case 'a':
    case 'A': return 10;
    case 'b':
    case 'B': return 11;
    case 'c':
    case 'C': return 12;
    case 'd':
    case 'D': return 13;
    case 'e':
    case 'E': return 14;
    case 'f':
    case 'F': return 15;
  }
  return 0;
}

static inline constexpr int const_hex2byte(const char *s){
  return hexch2val(s[1])+(hexch2val(s[0])<<4);
}


class AdvData{
public:
  AdvData() : sz(0){}

  AdvData& add(const AdvData& other){
    CHK(sz + other.sz < max_ad_sz, "Aggregate too long");
    for (int i=0; i < other.sz ; i++, sz++){
      data[sz]=other.data[i];
    }
    return *this;
  }

  uint8_t data[max_ad_sz];
  uint8_t sz;
};

class Flags : public AdvData {
public:
  static const uint8_t LELimitedDiscoverable = 0x1;
  static const uint8_t LEGeneralDiscoverable = 0x2;

  Flags(uint8_t val) : AdvData() {
    sz = 3;
    data[0]=0x2; // Length
    data[1]=0x1; // Flags type
    data[2]=0x4 | val; // Always set BR/EDR not supported
  }

  AdvData& add(const AdvData& other) = delete; // No point in adding stuff to flags
};

class UUID : public AdvData{
public:
  UUID(const char * uuid) {
    int uuidlen = const_strlen(uuid);
    CHK(uuidlen == 6 || uuidlen == 36, "Wrong UUID size");
    if (const_strlen(uuid) == 6) {
      CHK(uuid[0]=='0' && uuid[1]=='x',"Wrong UUID format for short UUID");
      sz=2;
      data[0]=const_hex2byte(&uuid[4]);
      data[1]=const_hex2byte(&uuid[2]);
    }else{
      CHK(uuid[8]=='-' && uuid[13]=='-' && uuid[18]=='-' && uuid[23]=='-', "Wrong UUID format for long UUID");
      sz=16;
      data[0]=const_hex2byte(&uuid[34]);
      data[1]=const_hex2byte(&uuid[32]);
      data[2]=const_hex2byte(&uuid[30]);
      data[3]=const_hex2byte(&uuid[28]);
      data[4]=const_hex2byte(&uuid[26]);
      data[5]=const_hex2byte(&uuid[24]);

      data[6]=const_hex2byte(&uuid[21]);
      data[7]=const_hex2byte(&uuid[19]);

      data[8]=const_hex2byte(&uuid[16]);
      data[9]=const_hex2byte(&uuid[14]);

      data[10]=const_hex2byte(&uuid[11]);
      data[11]=const_hex2byte(&uuid[9]);

      data[12]=const_hex2byte(&uuid[6]);
      data[13]=const_hex2byte(&uuid[4]);
      data[14]=const_hex2byte(&uuid[2]);
      data[15]=const_hex2byte(&uuid[0]);
    }
  }

  uint16_t shortform(void){
    return (uint16_t)data[13] << 8 | data[12];
  }
};

class ServiceUUIDs : public AdvData {
public:
  ServiceUUIDs(bool complete, bool long_uuid) : _long_uuid(long_uuid), AdvData() {
    sz = 2;
    data[0]=1;
    if (long_uuid){
      data[1]=(complete) ? 0x7 : 0x6;
    }else{
      data[1]=(complete) ? 0x3 : 0x2;
    }
  }

  AdvData& add(const AdvData& other) = delete; // No point in adding stuff to sevices
  ServiceUUIDs& add(const UUID& uuid){ // ... except for UUIDs
    CHK((_long_uuid && uuid.sz == 16) || (!_long_uuid && uuid.sz==2), "Wrong UUID type");
    data[0]+=uuid.sz;
    AdvData::add(uuid);
    return *this;
  }
  
private:
  const bool _long_uuid;
};

class LocalName : public AdvData {
public:
   LocalName(bool complete, const char * name): AdvData(){
    const int namelen = const_strlen(name);
    CHK(namelen+2 < max_ad_sz, "Name too long");
    sz = namelen+2;
    data[0] = namelen+1;
    data[1] = (complete) ? 0x9 : 0x8;
    for (int i=0; i < namelen; i++){
      data[i+2]=name[i];
    }
  }

  constexpr AdvData& add(const AdvData& other) = delete; // No point in adding stuff to the name
};

#endif
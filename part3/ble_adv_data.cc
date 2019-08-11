#include "ble_adv_data.h"
#include "uuids.h"

const char * devicename ="BFS";

AdvData adv = AdvData()
.add(Flags(Flags::LEGeneralDiscoverable))
.add(LocalName(true,devicename))
.add(
      ServiceUUIDs(false,true)
      .add(ui_service)
     );


AdvData scan_resp = AdvData();

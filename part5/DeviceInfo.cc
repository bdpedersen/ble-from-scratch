#include "DeviceInfo.h"
#include "err_handler.h"
#include "adv_helper.h"
#include <ble_types.h>
#include <ble_gatts.h>

// Data content
const char *mfgr_name = "Dam Connectivity";
const char *model_number = "BFS 1";
const char *firmware_rev = "Alpha0.1";


const ble_gatts_char_md_t readonly = {
  .char_props = {
    .read = 1,
    /*
    .broadcast = 0,
    .write_wo_resp = 0,
    .write = 0,
    .notify = 0,
    .indicate = 0,
    .auth_signed_wr = 0
    */
  },
  /*
  .char_ext_props = {
    .reliable_wr = 0,
    .wr_aux = 0
  },
  // Set rest to defaults
  .p_char_user_desc = NULL,
  .char_user_desc_max_size = 0,
  .char_user_desc_size = 0,
  .p_char_pf = NULL,
  .p_user_desc_md = NULL,
  .p_cccd_md = NULL,
  .p_sccd_md = NULL
  */
};

extern const ble_gatts_attr_md_t public_readonly_attr_md = {
  .read_perm = {
    .sm = 1,
    .lv = 1
  },
  /*
  .write_perm = {
    .sm = 0,
    .lv = 0
  }
  .vlen = 0,
  */
  .vloc = BLE_GATTS_VLOC_USER,
  /*
  .wr_auth = 0,
  .rd_auth = 0,
  */
};


// Service UUID
const ble_uuid_t devinfo_service = {
  .uuid = 0x180A,
  .type = BLE_UUID_TYPE_BLE
};

// Manufacturer name characteristic UUID
const ble_uuid_t devinfo_mfgr_name = {
  .uuid = 0x2A29,
  .type = BLE_UUID_TYPE_BLE
};

const ble_gatts_attr_t devinfo_mfgr_name_attr = {
  .p_uuid = &devinfo_mfgr_name,
  .p_attr_md = &public_readonly_attr_md,
  .init_len = (uint16_t)const_strlen(mfgr_name),
  .init_offs = 0,
  .max_len = (uint16_t)const_strlen(mfgr_name),
  .p_value = (uint8_t *)mfgr_name
};

// Manufacturer name characteristic UUID
const ble_uuid_t devinfo_model_number = {
  .uuid = 0x2A24,
  .type = BLE_UUID_TYPE_BLE
};

const ble_gatts_attr_t devinfo_model_number_attr = {
  .p_uuid = &devinfo_model_number,
  .p_attr_md = &public_readonly_attr_md,
  .init_len = (uint16_t)const_strlen(model_number),
  .init_offs = 0,
  .max_len = (uint16_t)const_strlen(model_number),
  .p_value = (uint8_t *)model_number
};


// Firmware revision UUID
const ble_uuid_t devinfo_firmware_rev = {
  .uuid = 0x2A26,
  .type = BLE_UUID_TYPE_BLE
};

const ble_gatts_attr_t devinfo_firmware_rev_attr = {
  .p_uuid = &devinfo_firmware_rev,
  .p_attr_md = &public_readonly_attr_md,
  .init_len = (uint16_t)const_strlen(firmware_rev),
  .init_offs = 0,
  .max_len = (uint16_t)const_strlen(firmware_rev),
  .p_value = (uint8_t *)firmware_rev
};

// Firmware revision UUID
const ble_uuid_t devinfo_software_rev = {
  .uuid = 0x2A28,
  .type = BLE_UUID_TYPE_BLE
};

const ble_gatts_attr_t devinfo_software_rev_attr = {
  .p_uuid = &devinfo_software_rev,
  .p_attr_md = &public_readonly_attr_md,
  .init_len = (uint16_t)const_strlen(firmware_rev),
  .init_offs = 0,
  .max_len = (uint16_t)const_strlen(firmware_rev),
  .p_value = (uint8_t *)firmware_rev
};


// Handles

void install_deviceinfo(){

  uint16_t hdl;
  ble_gatts_char_handles_t chdls; // On stack as we really don't need them

  char c[80];

  INFO("Setting up device info service\n");
  CHK_ERR(sd_ble_gatts_service_add(BLE_GATTS_SRVC_TYPE_PRIMARY,&devinfo_service,&hdl));
  sprintf(c,"Service got handle %d\n",hdl);
  INFO(c);

  CHK_ERR(sd_ble_gatts_characteristic_add(hdl,&readonly, &devinfo_mfgr_name_attr,&chdls));
  sprintf(c,"Characteristic got handle %d\n",chdls.value_handle);
  INFO(c);

  CHK_ERR(sd_ble_gatts_characteristic_add(hdl,&readonly, &devinfo_model_number_attr,&chdls));
  sprintf(c,"Characteristic got handle %d\n",chdls.value_handle);
  INFO(c);

  CHK_ERR(sd_ble_gatts_characteristic_add(hdl,&readonly, &devinfo_firmware_rev_attr,&chdls));
  sprintf(c,"Characteristic got handle %d\n",chdls.value_handle);
  INFO(c);

  CHK_ERR(sd_ble_gatts_characteristic_add(hdl,&readonly, &devinfo_software_rev_attr,&chdls));
  sprintf(c,"Characteristic got handle %d\n",chdls.value_handle);
  INFO(c);


}

#pragma once

// BLE OTA GATT — ตรงกับ mobile_app Esp32OtaService
#define RESILNET_OTA_SERVICE_UUID       "e5f6a7b8-c9d0-4123-e456-789abcdef012"
#define RESILNET_OTA_CONTROL_CHAR_UUID  "f6a7b8c9-d0e1-4234-f567-89abcdef0123"
#define RESILNET_OTA_DATA_CHAR_UUID     "a7b8c9d0-e1f2-4345-a678-9abcdef01234"

#define OTA_CHUNK_SIZE_MAX 512
#define OTA_PROGRESS_NOTIFY_EVERY 8192

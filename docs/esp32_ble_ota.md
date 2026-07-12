# ESP32 BLE OTA — แนวทางแฟลชจากมือถือ (ResilNet)

เอกสารนี้อธิบายวิธีให้ผู้ใช้แฟลชเฟิร์มแวร์ ESP32 จากแอป Flutter **โดยไม่ใช้คอมพิวเตอร์** ผ่าน Bluetooth Low Energy (BLE OTA)

## ภาพรวม

```
┌─────────────┐    BLE GATT     ┌──────────────────┐
│ Flutter App │ ──────────────► │ ESP32 (NimBLE)   │
│ .bin ในเครื่อง│  Control+Data   │ esp_ota_write()  │
└─────────────┘                 └────────┬─────────┘
                                         │ commit
                                         ▼
                                  esp_restart()
```

## ขั้นตอนฝั่งแอป (มี scaffold แล้ว)

| ไฟล์ | หน้าที่ |
|------|--------|
| `lib/services/firmware_service.dart` | ดาวน์โหลด `.bin` เก็บใน `Documents/firmware/` |
| `lib/services/esp32_ota_service.dart` | เชื่อมต่อ BLE → ส่ง chunk → commit |
| `lib/services/firmware_config.dart` | URL และชื่อไฟล์ |

### ตั้ง URL ดาวน์โหลด

```bash
flutter run \
  --dart-define=RESILNET_FW_STANDALONE_URL=https://example.com/fw/standalone.bin \
  --dart-define=RESILNET_FW_LORA_GATEWAY_URL=https://example.com/fw/lora_gateway.bin
```

หรือใช้ base:

```bash
--dart-define=RESILNET_FIRMWARE_BASE_URL=https://cdn.example.com/resilnet-fw
```

## ขั้นตอนฝั่ง ESP32 (ต้องพัฒนาเพิ่ม)

### 1. Partition table

ใน `platformio.ini`:

```ini
board_build.partitions = min_spiffs.csv
; หรือ custom partitions ที่มี ota_0, ota_1
```

### 2. NimBLE OTA GATT Service

UUID ที่แนะนำ (ไม่ชน Mule `a1b2c3d4-...` หรือ Gateway `d4e5f6a7-...`):

| ส่วน | UUID |
|------|------|
| Service | `e5f6a7b8-c9d0-4123-e456-789abcdef012` |
| Control (write + notify) | `f6a7b8c9-d0e1-4234-f567-89abcdef0123` |
| Data (write without response) | `a7b8c9d0-e1f2-4345-a678-9abcdef01234` |

### 3. State machine บนบอร์ด

```
IDLE
  │ begin (size, sha256)
  ▼
RECEIVING ──chunk──► esp_ota_write()
  │ commit
  ▼
VERIFY (esp_ota_end)
  ▼
REBOOT
```

### 4. โค้ด C++ ตัวอย่าง (สรุป)

```cpp
#include <esp_ota_ops.h>
#include <NimBLEDevice.h>

static esp_ota_handle_t s_otaHandle;
static const esp_partition_t* s_updatePartition;

void onControlWrite(const std::string& cmd) {
  if (cmd.rfind("begin:", 0) == 0) {
    s_updatePartition = esp_ota_get_next_update_partition(nullptr);
    esp_ota_begin(s_updatePartition, OTA_SIZE_UNKNOWN, &s_otaHandle);
  } else if (cmd == "commit") {
    esp_ota_end(s_otaHandle);
    esp_ota_set_boot_partition(s_updatePartition);
    esp_restart();
  }
}

void onDataWrite(const uint8_t* data, size_t len) {
  esp_ota_write(s_otaHandle, data, len);
}
```

### 5. สร้างไฟล์ `.bin` สำหรับ OTA

```bash
cd esp32_firmware
pio run
# ไฟล์อยู่ที่ .pio/build/esp32dev/firmware.bin
```

LoRa gateway:

```bash
cd esp32_lora_firmware
pio run -e lora_gateway
```

## โปรโตคอลที่แอปใช้ (เวอร์ชัน scaffold)

1. **Connect** ไปยัง ESP32 ที่โฆษณา OTA service (หรือเข้า "โหมดแฟลช" ด้วยปุ่มบนบอร์ด)
2. **Discover** — ตรวจว่ามี `e5f6a7b8-...` service
3. **Control write** `begin:<size>:<kind>`
4. **Data write** chunk 512 bytes (without response)
5. **Control write** `commit`
6. รอ disconnect / reconnect หลัง reboot

## ข้อจำกัดและข้อควรระวัง

| หัวข้อ | รายละเอียด |
|--------|------------|
| **iOS** | ต้อง foreground; ห้ามล็อกหน้าจอนานระหว่างแฟลช |
| **MTU** | ขอ `requestMtu(512)` ถ้า stack รองรับ — ลดเวลาแฟลช |
| **ขนาดไฟล์** | ~800 KB–1.5 MB ใช้เวลา 3–10 นาที ที่ BLE 4.2 |
| **ความปลอดภัย** | ควรเพิ่ม SHA256 + ลายเซ็นใน `begin` ก่อน production |
| **Rollback** | ใช้ dual OTA partition; เก็บ factory partition |
| **พลังงาน** | แบตเตอรี่ต่ำ — ห้ามแฟลช |

## ทางเลือกอื่น

1. **Web Serial / USB OTG (Android)** — ซับซ้อน, ไม่ครอบคลุม iOS
2. **Wi‑Fi SoftAP + HTTP upload** — UX ดีถ้าบอร์ดมี Wi‑Fi
3. **ESP BLE Prov + Wi‑Fi OTA** — มาตรฐาน Espressif แต่ต้องมี Wi‑Fi

## สถานะในโปรเจกต์ ResilNet

- ✅ ดาวน์โหลด `.bin` ลงเครื่อง (`FirmwareService`)
- ✅ UI ตั้งค่า → จัดการเฟิร์มแวร์ ESP32
- ⚠️ `Esp32OtaService` — scaffold พร้อม transfer loop; **บอร์ดยังไม่มี OTA service**
- 📋 ขั้นถัดไป: เพิ่ม `ota_manager.cpp` ใน `esp32_firmware/` และ `esp32_lora_firmware/`

## การทดสอบ

1. ดาวน์โหลด `.bin` จากหน้าตั้งค่า
2. แฟลชบอร์ดครั้งแรกผ่าน USB: `pio run -t upload`
3. เพิ่ม OTA service ใน firmware แล้ว build `.bin` ใหม่
4. ทดสอบแฟลชจากแอปขณะ foreground
5. ตรวจ version ผ่าน Info characteristic หลัง reboot

# ResilNet ESP32 Firmware (Unified)

เฟิร์มแวร์รวม **Standalone Mule Node** และ **LoRa Gateway** พร้อม **BLE OTA**

## Build

```bash
cd esp32_firmware

# Standalone Data Mule + OTA
pio run -e standalone

# LoRa Gateway + OTA
pio run -e lora_gateway

# LoRa Gateway — SoftAP เปิดตลอด (ไม่ปิดหลัง idle 5 นาที)
pio run -e lora_gateway_ap_always_on

# Upload (ครั้งแรกผ่าน USB)
pio run -e standalone -t upload
```

## Partition (dual OTA)

ไฟล์ `partitions_two_ota.csv`:

| Partition | ขนาด |
|-----------|------|
| `ota_0` / `ota_1` | 1.5 MB แต่ละ slot |
| `littlefs` | 960 KB (Mule queue) |

## BLE OTA Service

| UUID | บทบาท |
|------|--------|
| `e5f6a7b8-c9d0-4123-e456-789abcdef012` | Service |
| `f6a7b8c9-d0e1-4234-f567-89abcdef0123` | Control (JSON write + notify) |
| `a7b8c9d0-e1f2-4345-a678-9abcdef01234` | Data (512-byte chunks) |

### Control JSON

```json
{"op":"begin","size":1234567,"crc32":"a1b2c3d4","md5":"...","kind":"standaloneNode"}
{"op":"commit"}
{"op":"abort"}
{"op":"rollback"}
```

### Response

```json
{"op":"ack","stage":"begin"}
{"op":"progress","received":8192,"total":1234567}
{"op":"error","msg":"crc mismatch"}
```

## Auto-rollback

หลัง OTA commit บอร์ด boot ด้วยสถานะ `PENDING_VERIFY` — `setup()` เรียก `esp_ota_mark_app_valid_cancel_rollback()` เมื่อ boot สำเร็จ

## Wi-Fi SoftAP + UDP Bridge (LoRa Gateway)

โหมด `lora_gateway` เปิด SoftAP และ UDP server ควบคู่ BLE:

| รายการ | ค่า |
|--------|-----|
| SSID | `ResilNet-Node-XXXX` (XXXX = 2 ไบต์ท้าย MAC) |
| IP โหนด | `192.168.4.1` |
| UDP พอร์ต | **4210** (รับ + broadcast) |

### Multi-transport routing

```
มือถือ (UDP) ──► LoRa TX
มือถือ (BLE)  ──► LoRa TX
LoRa RX       ──► BLE notify + UDP broadcast (192.168.4.255:4210)
```

### รูปแบบแพ็กเก็ต UDP

รองรับทั้งสองแบบ:

1. **Framed** (แนะนำ): `RN` magic + `ResilNetRadioPacket` + CRC16 — เหมือนกับทางอากาศ LoRa
2. **Raw BLE**: `packet_id(16) + ttl(1) + payload_len(2) + payload`

### ประหยัดพลังงาน

ค่าเริ่มต้น (`WIFI_AP_ALWAYS_ON=0`): ปิด SoftAP หลังไม่มีสถานี Wi-Fi เกาะต่อเนื่อง **5 นาที** — BLE ยังทำงานอยู่

- ปลุก SoftAP กลับเมื่อมีกิจกรรม BLE (มือถือส่งแพ็กเก็ต)
- Build `lora_gateway_ap_always_on` เพื่อเปิด SoftAP ตลอด

Config ใน `include/config.h`:

```cpp
#define WIFI_UDP_PORT 4210
#define WIFI_AP_IDLE_TIMEOUT_MS (5 * 60 * 1000)
#define WIFI_AP_ALWAYS_ON 0        // หรือ 1
#define WIFI_AP_PASSWORD ""        // ว่าง = เปิด AP ไม่มีรหัส
```

## แอป Flutter

ตั้งค่า → จัดการเฟิร์มแวร์ → ดาวน์โหลด `.bin` → **แฟลชผ่าน Bluetooth**

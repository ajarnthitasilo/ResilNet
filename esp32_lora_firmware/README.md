# ResilNet ESP32 LoRa Firmware

เฟิร์มแวร์ขยายระบบ ResilNet ด้วย **LoRa** (RadioLib) + **BLE** (NimBLE) รองรับ 2 โหมดในโค้ดเดียว

## โหมดการทำงาน

| Environment | Flag | บทบาท |
|-------------|------|--------|
| `lora_gateway` | `NODE_TYPE_LORA_GATEWAY` | BLE Server ↔ LoRa Bridge (มือถือ Flutter) |
| `lora_repeater` | `NODE_TYPE_STANDALONE_REPEATER` | LoRa Relay + Heartbeat 5 นาที |

## Build & Upload

```bash
cd esp32_lora_firmware

# Gateway (920–925 MHz default)
pio run -e lora_gateway -t upload

# Repeater
pio run -e lora_repeater -t upload

# 433 MHz variant
pio run -e lora_gateway_433 -t upload
pio device monitor
```

## โครงสร้างไฟล์

```
esp32_lora_firmware/
├── platformio.ini
├── include/
│   ├── config.h          # ขา GPIO, ความถี่, UUID
│   ├── packet.h          # ResilNetRadioPacket
│   ├── dedup_cache.h     # กรอง id ซ้ำ 20 รายการ
│   ├── lora_manager.h
│   └── ble_manager.h     # Gateway เท่านั้น
└── src/
    ├── main.cpp
    ├── packet.cpp
    ├── lora_manager.cpp
    └── ble_manager.cpp
```

## แพ็กเก็ตไบนารี (`ResilNetRadioPacket`)

สอดคล้องกับ `MessagePacket` (Rust `resilnet_core`):

| ฟิลด์ | ขนาด |
|--------|------|
| `packet_id` | 16 bytes (UUID v4) |
| `ttl` | 1 byte |
| `payload_len` | 2 bytes |
| `payload` | ≤ 230 bytes |

เฟรม LoRa: `Magic "RN"` + body + CRC16-CCITT

## FreeRTOS Tasks

| Task | Gateway | Repeater |
|------|---------|----------|
| `TaskLoRaRx` | ✓ | ✓ |
| `TaskLoRaTx` | ✓ | ✓ |
| `TaskBLE` | ✓ | — |
| `TaskHeartbeat` | — | ✓ (5 min) |

## ปรับขา Hardware

แก้ใน `include/config.h`:

- `LORA_PIN_*` ให้ตรงบอร์ด SX1262
- `LORA_FREQ_HZ` — default `923500000` (AS923)

## BLE (Gateway)

- ชื่ออุปกรณ์: `ResilNet-Gateway-XXXX` (จาก MAC)
- Service UUID: `d4e5f6a7-b8c9-4012-def0-123456789abc`
- Write → LoRa TX | Notify ← LoRa RX

## โปรเจกต์ที่เกี่ยวข้อง

- `esp32_firmware/` — BLE Mule Node (LittleFS store-and-forward)
- `resilnet_core/` — Rust hybrid_router
- `mobile_app/` — Flutter frontend

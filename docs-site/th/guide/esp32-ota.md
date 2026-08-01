# แฟลชเฟิร์มแวร์และ BLE OTA

คู่มือนี้สำหรับผู้ใช้ที่ต้องการแฟลช ESP32 ให้ใช้กับ ResilNet — รายละเอียดมากกว่าในแอป

## ดาวน์โหลดไฟล์ `.bin`

เลือกชนิดโหนดแล้วโหลดจาก CDN (ลิงก์เต็ม ใช้ได้บนมือถือ):

**Standalone mule (เก็บส่งต่อ BLE)**

- [esp32_standalone/latest.bin](https://ajarnthitasilo.github.io/ResilNet/firmware/esp32_standalone/latest.bin) — เวอร์ชัน **1.9.49**
- หรือชื่อเดิม: [resilnet_esp32_standalone.bin](https://ajarnthitasilo.github.io/ResilNet/firmware/resilnet_esp32_standalone.bin)

**LoRa gateway (สะพาน BLE ↔ LoRa)**

- [esp32_lora_gateway/latest.bin](https://ajarnthitasilo.github.io/ResilNet/firmware/esp32_lora_gateway/latest.bin) — เวอร์ชัน **1.9.49**
- หรือชื่อเดิม: [resilnet_esp32_lora_gateway.bin](https://ajarnthitasilo.github.io/ResilNet/firmware/resilnet_esp32_lora_gateway.bin)

**Manifest / checksum**

- [manifest.json](https://ajarnthitasilo.github.io/ResilNet/firmware/manifest.json) — ตรวจ SHA-256 ก่อนแฟลช

หน้าสรุปรวม: [เฟิร์มแวร์](../firmware/)

หรือในแอป: **ตั้งค่า → ดาวน์โหลดเฟิร์มแวร์ ESP32** (ออนไลน์ → แคช → baseline ในแอป)

## แฟลชครั้งแรก (แนะนำ: USB)

ถ้าบอร์ดยังว่าง / ยังไม่มีเฟิร์มแวร์ ResilNet:

1. เชื่อม ESP32 กับคอมพิวเตอร์ผ่าน USB
2. แฟลชด้วย PlatformIO หรือ esptool จากไฟล์ `.bin` ที่โหลดไว้
3. เปิดไฟบอร์ด แล้วเปิด Bluetooth บนมือถือ

ตัวอย่าง PlatformIO (ใน repo):

```bash
cd esp32_firmware
pio run -e standalone -t upload          # mule
pio run -e lora_gateway -t upload        # LoRa gateway
```

ดูเพิ่ม: [ESP32 Mule](esp32-mule.md) · [LoRa Gateway](esp32-lora.md)

## อัปเดตผ่านแอป (BLE OTA)

เมื่อบอร์ดมีเฟิร์มแวร์ ResilNet ที่รองรับ OTA แล้ว:

1. ในแอป: **ตั้งค่า → ดาวน์โหลดเฟิร์มแวร์ ESP32** — ให้ไฟล์พร้อมในเครื่อง
2. เลือก **แฟลชเฟิร์มแวร์ผ่าน Bluetooth**
3. สแกนหาบอร์ด → ส่ง `.bin` → รอ commit / รีบูต

ข้อควรรู้:

- อยู่ใกล้บอร์ดระหว่างส่งไฟล์ (ไฟล์ ~0.7–1.1 MB)
- อย่าปิดแอปกลางทาง
- ถ้าส่งไม่สำเร็จ ลองใหม่หรือแฟลช USB เป็นทางสำรอง

## โปรโตคอล OTA (ภาพรวม)

แอปส่งเฟิร์มแวร์ผ่าน BLE GATT (Control + Data) ไปยัง ESP32 ที่เขียนด้วย `esp_ota_write()` แล้ว commit / restart

| ส่วน | UUID (อ้างอิง) |
|------|----------------|
| OTA Service | `e5f6a7b8-c9d0-4123-e456-789abcdef012` |
| Control | `f6a7b8c9-d0e1-4234-f567-89abcdef0123` |
| Data | `a7b8c9d0-e1f2-4345-a678-9abcdef01234` |

รายละเอียดเทคนิคฝั่งนักพัฒนา: ใน repo ที่ `docs/esp32_ble_ota.md` และหน้า [สำหรับนักพัฒนา](../dev/)

## ตรวจเวอร์ชัน

หลังแฟลช เทียบกับค่าใน [manifest.json](https://ajarnthitasilo.github.io/ResilNet/firmware/manifest.json) (`appVersion`, `sha256`)

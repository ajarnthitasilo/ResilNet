# เฟิร์มแวร์ ESP32

แอป ResilNet ใช้ระบบ **hybrid**:

1. **ออนไลน์** — ดาวน์โหลดจาก CDN / เว็บเอกสารนี้
2. **แคชในเครื่อง** — ไฟล์ที่โหลดไว้ก่อนหน้า (ตรวจ checksum)
3. **Baseline ในแอป** — สำรองเมื่อไม่มีเน็ต (เวอร์ชันที่ฝังตอน build แอป)

เวอร์ชันเฟิร์มแวร์ปัจจุบันบนเว็บนี้: **1.9.49**  
(ดูค่าสดใน [manifest.json](https://ajarnthitasilo.github.io/ResilNet/firmware/manifest.json))

> คู่มือแอปอัปเดตเป็น **1.9.75** แล้ว (รวม Apple Watch / Tor / Area) — เฟิร์มแวร์บน CDN ยังเป็น **1.9.49** จนกว่าจะ sync รอบใหม่ ใช้ manifest เป็นแหล่งจริงของ `.bin`

> ลิงก์ดาวน์โหลดด้านล่างเป็น URL เต็มของ GitHub Pages — กดแล้วได้ไฟล์ `.bin` โดยตรง (ไม่ผ่าน hash route ของ Docsify)

## ดาวน์โหลด — 1.9.49 (ล่าสุด)

- [Manifest (SHA-256)](https://ajarnthitasilo.github.io/ResilNet/firmware/manifest.json) — `manifest.json`
- [Standalone mule — latest.bin](https://ajarnthitasilo.github.io/ResilNet/firmware/esp32_standalone/latest.bin)
- [LoRa gateway — latest.bin](https://ajarnthitasilo.github.io/ResilNet/firmware/esp32_lora_gateway/latest.bin)
- [Standalone — ชื่อเดิม `resilnet_esp32_standalone.bin`](https://ajarnthitasilo.github.io/ResilNet/firmware/resilnet_esp32_standalone.bin)
- [LoRa gateway — ชื่อเดิม `resilnet_esp32_lora_gateway.bin`](https://ajarnthitasilo.github.io/ResilNet/firmware/resilnet_esp32_lora_gateway.bin)

### ประวัติเวอร์ชันบน CDN

| เวอร์ชัน | อัปเดต | Standalone | LoRa gateway |
|---------|--------|------------|--------------|
| **1.9.49** (ปัจจุบัน) | 2026-07-31 | [latest.bin](https://ajarnthitasilo.github.io/ResilNet/firmware/esp32_standalone/latest.bin) | [latest.bin](https://ajarnthitasilo.github.io/ResilNet/firmware/esp32_lora_gateway/latest.bin) |

เวอร์ชันเก่าจะเพิ่มแถวในตารางนี้เมื่อ sync ขึ้น CDN (ดู [สำหรับนักพัฒนา](../dev/))

## วิธีแฟลช / OTA

อ่านคู่มือเต็ม: **[แฟลชเฟิร์มแวร์และ BLE OTA](../guide/esp32-ota.md)**

สรุปสั้นๆ:

1. ดาวน์โหลด `.bin` จากลิงก์ด้านบน **หรือ** ในแอป: ตั้งค่า → ดาวน์โหลดเฟิร์มแวร์ ESP32
2. ครั้งแรก: แฟลชผ่าน USB (PlatformIO / esptool) หรือใช้บอร์ดที่มี OTA อยู่แล้ว
3. ครั้งถัดไป: ในแอป → แฟลชผ่าน Bluetooth (BLE OTA)

## ดาวน์โหลดจากแอป

ตั้งค่า → ดาวน์โหลดเฟิร์มแวร์ ESP32 — เลือกชนิดโหนด แล้วให้แอป resolve แหล่งที่ดีที่สุด (ออนไลน์ → แคช → baseline)

## สร้างแอปที่ชี้ CDN นี้

```bash
flutter build apk --release \
  --dart-define=RESILNET_FIRMWARE_BASE_URL=https://ajarnthitasilo.github.io/ResilNet/firmware
```

**Docs:** https://ajarnthitasilo.github.io/ResilNet/  
**Firmware base:** https://ajarnthitasilo.github.io/ResilNet/firmware

แอปจะเรียก:

- `{base}/esp32_standalone/latest.bin`
- `{base}/esp32_lora_gateway/latest.bin`

## อัปเดตไฟล์บนเว็บ (นักพัฒนา)

```bash
./tool/sync_firmware_release.sh   # build outputs → releases/ + docs-site/firmware/
# หรือ
./tool/sync_docs_firmware.sh      # mirror จาก releases/ อย่างเดียว
```

## ตรวจความถูกต้อง

เทียบ SHA-256 ใน `manifest.json` กับไฟล์ที่ดาวน์โหลดก่อนแฟลชถ้าทำเองนอกแอป

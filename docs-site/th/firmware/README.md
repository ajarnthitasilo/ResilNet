# เฟิร์มแวร์ ESP32

แอป ResilNet ใช้ระบบ **hybrid**:

1. **ออนไลน์** — ดาวน์โหลดจาก CDN / เว็บเอกสาร (เมื่อตั้ง `RESILNET_FIRMWARE_BASE_URL`)
2. **แคชในเครื่อง** — ไฟล์ที่โหลดไว้ก่อนหน้า (ตรวจ checksum)
3. **Baseline ในแอป** — สำรองเมื่อไม่มีเน็ต (เวอร์ชันที่ฝังตอน build แอป)

เวอร์ชันเฟิร์มแวร์ที่สอดคล้องกับเอกสารชุดนี้: **1.9.49**  
(ดูค่าล่าสุดใน [`firmware/manifest.json`](../../firmware/manifest.json))

## ดาวน์โหลดจากเว็บนี้

| ไฟล์ | ลิงก์ |
|------|--------|
| Manifest (SHA-256) | [`manifest.json`](../../firmware/manifest.json) |
| Standalone mule (`latest.bin`) | [`esp32_standalone/latest.bin`](../../firmware/esp32_standalone/latest.bin) |
| LoRa gateway (`latest.bin`) | [`esp32_lora_gateway/latest.bin`](../../firmware/esp32_lora_gateway/latest.bin) |
| Standalone (ชื่อเดิม) | [`resilnet_esp32_standalone.bin`](../../firmware/resilnet_esp32_standalone.bin) |
| LoRa gateway (ชื่อเดิม) | [`resilnet_esp32_lora_gateway.bin`](../../firmware/resilnet_esp32_lora_gateway.bin) |

## ดาวน์โหลดจากแอป

ตั้งค่า → Firmware / OTA — เลือกชนิดโหนด แล้วให้แอป resolve แหล่งที่ดีที่สุด

## สร้างแอปที่ชี้ CDN นี้

หลัง GitHub Pages ขึ้นแล้ว (URL ด้านล่าง):

```bash
flutter build apk --release \
  --dart-define=RESILNET_FIRMWARE_BASE_URL=https://ajarnthitasilo.github.io/ResilNet/firmware
```

**Docs site:** https://ajarnthitasilo.github.io/ResilNet/  
**Firmware base:** https://ajarnthitasilo.github.io/ResilNet/firmware

แอปจะเรียก:

- `{base}/esp32_standalone/latest.bin`
- `{base}/esp32_lora_gateway/latest.bin`

ถ้าไม่ตั้ง URL แอปยังแฟลชจาก **baseline ในแอป** ได้เมื่อออฟไลน์

## อัปเดตไฟล์บนเว็บ (นักพัฒนา)

```bash
./tool/sync_firmware_release.sh   # build outputs → releases/ + docs-site/firmware/
# หรือ
./tool/sync_docs_firmware.sh      # mirror จาก releases/ อย่างเดียว
```

## ตรวจความถูกต้อง

เทียบ SHA-256 ใน `manifest.json` กับไฟล์ที่ดาวน์โหลดก่อนแฟลชถ้าทำเองนอกแอป

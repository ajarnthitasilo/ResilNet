# สำหรับนักพัฒนา

เอกสารนี้สั้น — รายละเอียดเต็มอยู่ใน GitHub repo

## Repo

[https://github.com/ajarnthitasilo/ResilNet](https://github.com/ajarnthitasilo/ResilNet)

## โครงสร้างหลัก

```text
mobile_app/         Flutter + FFI
resilnet_core/      Rust
esp32_firmware/     PlatformIO (standalone + lora_gateway)
releases/firmware/  .bin + manifest.json
docs-site/          เว็บคู่มือนี้ (Docsify)
tool/               sync_firmware_release.sh
```

## Build เฟิร์มแวร์

```bash
cd esp32_firmware
pio run -e standalone
pio run -e lora_gateway
cd ..
./tool/sync_firmware_release.sh 1.9.49
# mirror docs CDN only:
./tool/sync_docs_firmware.sh
```

## Build แอปพร้อม CDN เฟิร์มแวร์

```bash
cd mobile_app
flutter build apk --release \
  --dart-define=RESILNET_FIRMWARE_BASE_URL=https://ajarnthitasilo.github.io/ResilNet/firmware
```

**เว็บเอกสาร:** https://ajarnthitasilo.github.io/ResilNet/

## เอกสารเทคนิคอื่นใน repo

- [แฟลช / BLE OTA (คู่มือผู้ใช้)](../guide/esp32-ota.md) — ดาวน์โหลด + ขั้นตอนแฟลช
- `docs/esp32_ble_ota.md` — โปรโตคอล OTA เชิงลึก (ใน GitHub repo)
- `releases/firmware/README.md` — นโยบาย hybrid baseline
- `mobile_app/docs/GEO_PRESENCE_NOSTR.md` — geo presence

**CDN เฟิร์มแวร์ (ลิงก์ตรง):**

- https://ajarnthitasilo.github.io/ResilNet/firmware/manifest.json
- https://ajarnthitasilo.github.io/ResilNet/firmware/esp32_standalone/latest.bin
- https://ajarnthitasilo.github.io/ResilNet/firmware/esp32_lora_gateway/latest.bin

## ดูเว็บนี้บนเครื่อง

```bash
cd docs-site
python3 -m http.server 8080
```

เปิด `http://127.0.0.1:8080`

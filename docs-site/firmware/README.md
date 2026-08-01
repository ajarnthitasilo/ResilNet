# Firmware hub

Canonical release copies live in `../../releases/firmware/`.  
This folder is the **docs CDN layout** expected by the mobile app when
`RESILNET_FIRMWARE_BASE_URL` points at this site’s `/firmware` path.

## Layout (do not rename)

| URL path | Role |
|----------|------|
| `manifest.json` | Version, sizes, SHA-256 |
| `esp32_standalone/latest.bin` | App download path (standalone mule) |
| `esp32_lora_gateway/latest.bin` | App download path (LoRa gateway) |
| `resilnet_esp32_standalone.bin` | Same bytes, original filename |
| `resilnet_esp32_lora_gateway.bin` | Same bytes, original filename |

## Refresh after a firmware build

```bash
cd esp32_firmware
pio run -e standalone && pio run -e lora_gateway
cd ..
./tool/sync_firmware_release.sh   # also calls sync_docs_firmware.sh
# or only mirror docs:
./tool/sync_docs_firmware.sh
```

## Local smoke test

```bash
cd docs-site && python3 -m http.server 8080
curl -I http://127.0.0.1:8080/firmware/manifest.json
curl -I http://127.0.0.1:8080/firmware/esp32_standalone/latest.bin
```

## ดาวน์โหลด

ไฟล์ `.bin` อยู่ที่โฟลเดอร์ [`firmware/`](./) ของไซต์นี้ (ไม่ใช่ Docsify hash route)

| ไฟล์ | URL ตรง |
|------|---------|
| Manifest | https://ajarnthitasilo.github.io/ResilNet/firmware/manifest.json |
| Standalone latest | https://ajarnthitasilo.github.io/ResilNet/firmware/esp32_standalone/latest.bin |
| LoRa gateway latest | https://ajarnthitasilo.github.io/ResilNet/firmware/esp32_lora_gateway/latest.bin |

User guides: [ไทย](../th/firmware/) · [English](../en/firmware/) · OTA: [ไทย](../th/guide/esp32-ota.md) · [EN](../en/guide/esp32-ota.md)

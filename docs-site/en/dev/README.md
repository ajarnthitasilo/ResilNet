# For developers

Short pointers — full detail lives in the GitHub repo.

## Repository

[https://github.com/ajarnthitasilo/ResilNet](https://github.com/ajarnthitasilo/ResilNet)

## Layout

```text
mobile_app/         Flutter + FFI
resilnet_core/      Rust
esp32_firmware/     PlatformIO (standalone + lora_gateway)
releases/firmware/  .bin + manifest.json
docs-site/          This Docsify site
tool/               sync_firmware_release.sh
```

## Build firmware

```bash
cd esp32_firmware
pio run -e standalone
pio run -e lora_gateway
cd ..
./tool/sync_firmware_release.sh 1.9.64
# docs CDN mirror only:
./tool/sync_docs_firmware.sh
```

## App build with firmware CDN

```bash
cd mobile_app
flutter build apk --release \
  --dart-define=RESILNET_FIRMWARE_BASE_URL=https://ajarnthitasilo.github.io/ResilNet/firmware
```

**Docs site:** https://ajarnthitasilo.github.io/ResilNet/

## Other technical docs in-repo

- [Flash / BLE OTA (user guide)](../guide/esp32-ota.md) — downloads + flash steps
- `docs/esp32_ble_ota.md` — deep OTA protocol (in the GitHub repo)
- `releases/firmware/README.md` — hybrid baseline policy
- `mobile_app/docs/GEO_PRESENCE_NOSTR.md` — geo presence

**Firmware CDN (direct links):**

- https://ajarnthitasilo.github.io/ResilNet/firmware/manifest.json
- https://ajarnthitasilo.github.io/ResilNet/firmware/esp32_standalone/latest.bin
- https://ajarnthitasilo.github.io/ResilNet/firmware/esp32_lora_gateway/latest.bin

## Preview this site

```bash
cd docs-site
python3 -m http.server 8080
```

Open `http://127.0.0.1:8080`

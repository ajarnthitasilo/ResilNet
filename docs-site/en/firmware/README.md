# ESP32 firmware

ResilNet uses a **hybrid** delivery model:

1. **Online** — download from this docs CDN
2. **On-device cache** — previously downloaded files (checksum verified)
3. **In-app baseline** — offline emergency copy bundled at app build time

Firmware version currently on this site: **1.9.49**  
(Live values: [manifest.json](https://ajarnthitasilo.github.io/ResilNet/firmware/manifest.json))

> App guide is updated for **1.9.75** (Apple Watch / Tor / Area). CDN firmware remains **1.9.49** until the next sync — trust `manifest.json` for `.bin` hashes.

> Download links below are absolute GitHub Pages URLs so browsers fetch `.bin` files directly (Docsify hash routes do not rewrite them).

## Downloads — 1.9.49 (current)

- [Manifest (SHA-256)](https://ajarnthitasilo.github.io/ResilNet/firmware/manifest.json) — `manifest.json`
- [Standalone mule — latest.bin](https://ajarnthitasilo.github.io/ResilNet/firmware/esp32_standalone/latest.bin)
- [LoRa gateway — latest.bin](https://ajarnthitasilo.github.io/ResilNet/firmware/esp32_lora_gateway/latest.bin)
- [Standalone — original name `resilnet_esp32_standalone.bin`](https://ajarnthitasilo.github.io/ResilNet/firmware/resilnet_esp32_standalone.bin)
- [LoRa gateway — original name `resilnet_esp32_lora_gateway.bin`](https://ajarnthitasilo.github.io/ResilNet/firmware/resilnet_esp32_lora_gateway.bin)

### Version history on the CDN

| Version | Updated | Standalone | LoRa gateway |
|---------|---------|------------|--------------|
| **1.9.49** (current) | 2026-07-31 | [latest.bin](https://ajarnthitasilo.github.io/ResilNet/firmware/esp32_standalone/latest.bin) | [latest.bin](https://ajarnthitasilo.github.io/ResilNet/firmware/esp32_lora_gateway/latest.bin) |

Older rows will appear here when new builds are synced (see [For developers](../dev/)).

## Flashing / OTA

Full guide: **[Flash firmware & BLE OTA](../guide/esp32-ota.md)**

Short path:

1. Download a `.bin` above **or** in the app: Settings → Download ESP32 firmware
2. First flash: USB (PlatformIO / esptool), or a board that already has OTA firmware
3. Later updates: in-app → Flash over Bluetooth (BLE OTA)

## Download from the app

Settings → Download ESP32 firmware — pick node kind; the app resolves online → cache → baseline.

## Build the app against this CDN

```bash
flutter build apk --release \
  --dart-define=RESILNET_FIRMWARE_BASE_URL=https://ajarnthitasilo.github.io/ResilNet/firmware
```

**Docs:** https://ajarnthitasilo.github.io/ResilNet/  
**Firmware base:** https://ajarnthitasilo.github.io/ResilNet/firmware

The app requests:

- `{base}/esp32_standalone/latest.bin`
- `{base}/esp32_lora_gateway/latest.bin`

## Refresh files on the site (developers)

```bash
./tool/sync_firmware_release.sh   # PIO outputs → releases/ + docs-site/firmware/
# or
./tool/sync_docs_firmware.sh      # mirror from releases/ only
```

## Verify integrity

Compare SHA-256 in `manifest.json` with any file you flash outside the app.

# ESP32 firmware

ResilNet uses **hybrid** delivery:

1. **Online** — download from the docs CDN when `RESILNET_FIRMWARE_BASE_URL` is set
2. **On-device cache** — previously downloaded file (checksum verified)
3. **Bundled baseline** — offline fallback shipped inside the app

Firmware version aligned with this docs set: **1.9.49**  
(See live values in [`firmware/manifest.json`](../../firmware/manifest.json).)

## Download from this site

| File | Link |
|------|------|
| Manifest (SHA-256) | [`manifest.json`](../../firmware/manifest.json) |
| Standalone mule (`latest.bin`) | [`esp32_standalone/latest.bin`](../../firmware/esp32_standalone/latest.bin) |
| LoRa gateway (`latest.bin`) | [`esp32_lora_gateway/latest.bin`](../../firmware/esp32_lora_gateway/latest.bin) |
| Standalone (original name) | [`resilnet_esp32_standalone.bin`](../../firmware/resilnet_esp32_standalone.bin) |
| LoRa gateway (original name) | [`resilnet_esp32_lora_gateway.bin`](../../firmware/resilnet_esp32_lora_gateway.bin) |

## From the app

Settings → Firmware / OTA — pick node kind; the app resolves the best source.

## Point a release build at this CDN

After GitHub Pages is live:

```bash
flutter build apk --release \
  --dart-define=RESILNET_FIRMWARE_BASE_URL=https://ajarnthitasilo.github.io/ResilNet/firmware
```

**Docs site:** https://ajarnthitasilo.github.io/ResilNet/  
**Firmware base:** https://ajarnthitasilo.github.io/ResilNet/firmware

The app requests:

- `{base}/esp32_standalone/latest.bin`
- `{base}/esp32_lora_gateway/latest.bin`

With an empty base URL, offline flashing still uses the **bundled baseline**.

## Refresh hub files (developers)

```bash
./tool/sync_firmware_release.sh   # PIO outputs → releases/ + docs-site/firmware/
# or
./tool/sync_docs_firmware.sh      # mirror from releases/ only
```

## Verify

Compare SHA-256 in `manifest.json` with any file you flash outside the app.

# Flash firmware & BLE OTA

User guide for flashing ESP32 boards for ResilNet — more detail than the in-app screens.

## Download `.bin` files

Pick your node kind (absolute CDN links work on phones):

**Standalone mule (BLE store-and-forward)**

- [esp32_standalone/latest.bin](https://ajarnthitasilo.github.io/ResilNet/firmware/esp32_standalone/latest.bin) — version **1.9.49**
- Original name: [resilnet_esp32_standalone.bin](https://ajarnthitasilo.github.io/ResilNet/firmware/resilnet_esp32_standalone.bin)

**LoRa gateway (BLE ↔ LoRa bridge)**

- [esp32_lora_gateway/latest.bin](https://ajarnthitasilo.github.io/ResilNet/firmware/esp32_lora_gateway/latest.bin) — version **1.9.49**
- Original name: [resilnet_esp32_lora_gateway.bin](https://ajarnthitasilo.github.io/ResilNet/firmware/resilnet_esp32_lora_gateway.bin)

**Manifest / checksums**

- [manifest.json](https://ajarnthitasilo.github.io/ResilNet/firmware/manifest.json) — verify SHA-256 before flashing

Hub page: [Firmware](../firmware/)

Or in the app: **Settings → Download ESP32 firmware** (online → cache → in-app baseline).

## First flash (recommended: USB)

If the board is blank / has no ResilNet firmware yet:

1. Connect the ESP32 to a computer over USB
2. Flash with PlatformIO or esptool using the downloaded `.bin`
3. Power the board and enable Bluetooth on the phone

PlatformIO example (in the repo):

```bash
cd esp32_firmware
pio run -e standalone -t upload          # mule
pio run -e lora_gateway -t upload        # LoRa gateway
```

See also: [ESP32 Mule](esp32-mule.md) · [LoRa Gateway](esp32-lora.md)

## Update from the app (BLE OTA)

Once the board already runs ResilNet firmware with OTA:

1. In the app: **Settings → Download ESP32 firmware** — ensure a `.bin` is ready on device
2. Open **Flash firmware over Bluetooth**
3. Scan → transfer → wait for commit / reboot

Tips:

- Stay close to the board during transfer (~0.7–1.1 MB)
- Do not kill the app mid-transfer
- On failure, retry or fall back to USB

## OTA protocol (overview)

The app sends firmware over BLE GATT (Control + Data) to an ESP32 that writes with `esp_ota_write()`, then commits and restarts.

| Part | UUID (reference) |
|------|------------------|
| OTA Service | `e5f6a7b8-c9d0-4123-e456-789abcdef012` |
| Control | `f6a7b8c9-d0e1-4234-f567-89abcdef0123` |
| Data | `a7b8c9d0-e1f2-4345-a678-9abcdef01234` |

Developer deep-dive: repo file `docs/esp32_ble_ota.md` and [For developers](../dev/).

## Verify version

After flashing, compare against [manifest.json](https://ajarnthitasilo.github.io/ResilNet/firmware/manifest.json) (`appVersion`, `sha256`).

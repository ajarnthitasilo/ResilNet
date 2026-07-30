# ResilNet ESP32 firmware releases

Pre-built `.bin` artifacts for BLE OTA from the mobile app (Settings → Firmware).

| File | Role | Build env |
|------|------|-----------|
| `resilnet_esp32_standalone.bin` | BLE Data Mule + store-and-forward | `esp32_firmware` → `standalone` |
| `resilnet_esp32_lora_gateway.bin` | BLE ↔ LoRa gateway + UDP bridge | `esp32_firmware` → `lora_gateway` |

`manifest.json` lists SHA-256 and app version alignment.

## Rebuild & refresh

```bash
cd esp32_firmware
pio run -e standalone
pio run -e lora_gateway
cd ..
./tool/sync_firmware_release.sh 1.9.44
```

Phone **BLE mesh** (peer discovery) uses UUID `9d2f3bb2-…` — separate from ESP32 mule/gateway services (see `manifest.json` → `ble`).

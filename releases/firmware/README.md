# ResilNet ESP32 firmware releases

Pre-built `.bin` artifacts for BLE OTA from the mobile app (Settings → Firmware).

| File | Role | Build env |
|------|------|-----------|
| `resilnet_esp32_standalone.bin` | BLE Data Mule + store-and-forward | `esp32_firmware` → `standalone` |
| `resilnet_esp32_lora_gateway.bin` | BLE ↔ LoRa gateway + UDP + multi-hop mesh relay | `esp32_firmware` → `lora_gateway` |

`manifest.json` lists SHA-256, app version alignment, and `minCompatibleVersion`.

## Hybrid delivery (baseline policy)

The app ships a **bundled baseline** copy of these bins (`mobile_app/assets/firmware/`)
and resolves firmware in this order:

1. **online_latest** — direct URL / base URL (`--dart-define=RESILNET_FIRMWARE_BASE_URL=...`)
2. **offline_cached** — previously downloaded file (SHA-256 re-verified against its metadata)
3. **offline_bundled_baseline** — asset baked into the app (SHA-256 verified against bundled manifest)

Rules:

- Baseline (currently **1.9.49**) is an *offline emergency fallback*, not the latest forever.
  Future firmware releases go online-only; the in-app baseline is NOT updated every release.
- If the baseline version is below `minCompatibleVersion`, flashing is blocked and the user
  is told to go online for a newer build.
- Any checksum mismatch blocks flashing.
- The UI always shows which source is in use (online / cached / baseline).

### Rotating the baseline (only when needed)

Copy new bins + manifest into `mobile_app/assets/firmware/` (same files as this folder),
bump the app version, and ship a new app release. Do this only when the old baseline becomes
incompatible with shipping hardware.

### Expected behavior summary

| Scenario | Result |
|----------|--------|
| No internet, no cache | Flash from bundled baseline (if compatible) |
| Internet OK | Download and use online latest |
| Internet fails mid-way | Fall back to cache, then baseline |
| Checksum mismatch | Flashing blocked, user notified |
| Baseline < minCompatibleVersion | Flashing blocked, must go online |

## Rebuild & refresh

```bash
cd esp32_firmware
pio run -e standalone
pio run -e lora_gateway
cd ..
./tool/sync_firmware_release.sh 1.9.44
```

Phone **BLE mesh** (peer discovery) uses UUID `9d2f3bb2-…` — separate from ESP32 mule/gateway services (see `manifest.json` → `ble`).

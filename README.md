# ResilNet — Decentralized Offline & Online Mesh

**ResilNet** is a crisis-ready, account-less messaging system. It works without cellular service or a central cloud server, spanning short-range BLE, mid-range LoRa (via ESP32), and long-range sync over public **Nostr** relays.

**Current app version:** `1.9.54`  
**ESP32 firmware (releases/):** `1.9.49` (LoRa mesh relay + store-and-forward)  
**Bundled ESP32 firmware baseline:** `1.9.49`

## Project layout

```text
ResilNet/
├── mobile_app/            # Flutter app (UI, BLE, Nostr sync, FFI → Rust)
├── resilnet_core/         # Rust core (routing, crypto, SQLite, Nostr client)
├── esp32_firmware/        # ESP32 standalone BLE mule + LoRa gateway (PlatformIO)
├── esp32_lora_firmware/   # Legacy / alternate LoRa firmware tree
├── releases/firmware/     # Pre-built .bin artifacts + manifest (SHA-256)
├── docs-site/             # User docs website (Docsify, TH + EN) — preview locally
├── tool/                  # Release helpers (e.g. sync_firmware_release.sh)
└── docs/                  # Extra technical documentation
```

**User documentation:**

- **Live (GitHub Pages):** https://ajarnthitasilo.github.io/ResilNet/
- **Firmware CDN base:** `https://ajarnthitasilo.github.io/ResilNet/firmware`
- **Local preview:**

```bash
cd docs-site && python3 -m http.server 8080
# open http://127.0.0.1:8080  (Thai default; English in the top nav)
```

Deploy: `.github/workflows/deploy-docs.yml`. First time enable **Settings → Pages → Source: GitHub Actions**.

---

## 1. Architecture highlights (v1.9.x)

- **True decentralization (no cloud backend):** No Supabase or other centralized app server. Remote sync uses **Nostr** over public relays.
- **Account-less cryptographic identity:** No email/phone signup. Keys are generated on-device (`secp256k1` / `npub` / `nsec`) on first launch.
- **Hybrid multi-tier transport:**
  - **Near:** Phone BLE mesh (discovery; chat still prefers Nostr when online)
  - **Mid:** ESP32 BLE data mule / LoRa gateway
  - **Far / Internet:** Nostr relays with local offline queue (store locally, flush when online)
- **Rust-powered core:** Deduplication, hybrid fan-out routing, and queue handling via FFI.
- **E2EE 1:1 messaging:** Sealed private chats with delivery + read receipts; longer voice notes use chunked **MediaPart** payloads over Nostr.
- **ResilNet LoRa mesh relay:** LoRa gateways multi-hop opaque `ResilNetRadioPacket` frames (TTL + dedupe + rate cap + optional store-and-forward when no phone is connected). **Not** Meshtastic-compatible — ResilNet protocol only. Disable with `-DLORA_MESH_RELAY_ENABLE=0`.
- **Public mesh bulletin (#mesh):** Plaintext, self-signed announcements readable by anyone in radio range — no prior key exchange. ESP32 mule nodes store-and-forward bulletins (3-day TTL) so late joiners still receive them offline.
- **Community board invites:** Owner shares a readable invite text, QR, or `resilnet://board/invite?...` deep link (compact public metadata only — never the board private key).
- **Hybrid firmware delivery:** Online-first download, then verified local cache, then **bundled baseline** assets for offline flashing (SHA-256 + `minCompatibleVersion` checks). See `releases/firmware/README.md`.

---

## 2. ESP32 firmware (BLE mule & LoRa gateway)

Pre-built binaries live in `releases/firmware/` (also bundled in the app under `mobile_app/assets/firmware/` as the offline baseline).

| Artifact | Role |
|----------|------|
| `resilnet_esp32_standalone.bin` | BLE data mule + store-and-forward + OTA |
| `resilnet_esp32_lora_gateway.bin` | BLE ↔ LoRa bridge + multi-hop mesh relay + OTA |

### Build & flash (PlatformIO)

```bash
cd esp32_firmware
pio run -e standalone
pio run -e lora_gateway
# upload example:
pio run -e standalone -t upload
```

Refresh release artifacts + hashes (also mirrors into `docs-site/firmware/` for the docs CDN):

```bash
./tool/sync_firmware_release.sh 1.9.49
# or docs hub only:
./tool/sync_docs_firmware.sh
```

LoRa gateway mesh notes (AS923 ~923.5 MHz): attach an antenna before TX. Relay uses TTL decrement, `packet_id` dedupe, and an airtime rate cap. Phone chat TTL defaults (message=5, ACK=3) are enough for multi-hop without app changes.

---

## 3. Mobile app (Flutter + Rust)

```bash
cd mobile_app
flutter pub get
flutter run
```

Release Android APK:

```bash
cd mobile_app
flutter build apk --release
```

**Android support:** `minSdk` 24 (Android 7+) through current `targetSdk` 36. Android 12+ uses `BLUETOOTH_SCAN` / `CONNECT` / `ADVERTISE`.

Optional online firmware CDN at build time:

```bash
flutter build apk --release \
  --dart-define=RESILNET_FIRMWARE_BASE_URL=https://ajarnthitasilo.github.io/ResilNet/firmware
```

Without a URL, the app still flashes from the **bundled baseline** when offline.

---

## 4. BLE service UUIDs

| Role | UUID |
|------|------|
| Phone BLE mesh (discovery) | `9d2f3bb2-3a5a-4f6e-a0c2-9d62c2d4d2a1` |
| ESP32 mule / node service | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` |
| Sync characteristic | `b2c3d4e5-f6a7-8901-bcde-f12345678901` |
| Node info characteristic | `c3d4e5f6-a7b8-9012-cdef-123456789012` |
| ESP32 LoRa gateway service | `d4e5f6a7-b8c9-4012-def0-123456789abc` |
| OTA service | `e5f6a7b8-c9d0-4123-e456-789abcdef012` |

Full artifact hashes and Android notes: `releases/firmware/manifest.json`.

---

## License / status

Active development. App version and firmware baseline versions above should stay in sync with `mobile_app/pubspec.yaml` and `releases/firmware/manifest.json`.

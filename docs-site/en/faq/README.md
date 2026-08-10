# FAQ

## I cannot see nearby peers

- Bluetooth on for both devices
- Android: Location / Nearby devices permissions
- Stay close; avoid aggressive battery savers that kill BLE
- Refresh the nearby list in the app, or **double-tap the ResilNet title** (soft refresh)

## Messages do not arrive

- Online path: check internet + Nostr
- If **Route Nostr via Tor** is on: Orbot/Tor (SOCKS 9050) must be running — the app will not fall back to clearnet
- Offline path: BLE range or ESP32 / LoRa in between
- Messages may sit in a queue — reopen the app when a path exists

## Read ticks never turn blue

- Recipient must **open that chat** (or keep it open)
- An ACK return path is required (internet / BLE / gateway)
- History ON and OFF should both work on 1.9.49+

## Apple Watch says Waiting for iPhone

- Open ResilNet on iPhone, then Refresh on Watch
- Ensure iPhone is Reachable (keep it nearby / do not force-quit immediately)
- Create Direct chats on iPhone before they appear on Watch
- Guide: [Apple Watch](../guide/apple-watch.md)

## Home node (Reticulum) offline / friend never receives

- Is the Mac/Pi bridge running? Is the IP in Settings correct?
- Same Wi‑Fi / can the phone reach the bridge port?
- Have **both** sides linked each other’s home-node addresses?
- Not the same as Local Wi‑Fi — different Settings entry
- Full guide: [Home node / Reticulum](../guide/reticulum-home-node.md)

## Local Wi‑Fi cannot find peers

- Hotspot mode: has the other phone joined the hotspot?
- Router mode: **client isolation** may block discovery — disable it or use hotspot mode
- iOS: allow **Local Network** for ResilNet
- Guide: [Local Wi‑Fi](../guide/local-wifi.md)

## OTA fails

- Enough battery on phone and board
- Stay near the ESP32 for the whole transfer
- Correct binary for the board role (mule ≠ LoRa)
- Checksum mismatches block flashing
- Full guide + downloads: [Flash / BLE OTA](../guide/esp32-ota.md)

## No internet but I need firmware

- Use the **in-app baseline** (Settings → Download ESP32 firmware)
- Or copy a `.bin` from another device / from the [firmware page](../firmware/) when online
- CDN firmware is still **1.9.49** even when the app is 1.9.75

## Board invites look like huge JSON

- Owners should use **share text / QR / deep link** instead of raw JSON

## LoRa TX but nobody receives

- Antenna attached?
- Frequency / SF must match on every node
- TTL and relay rate caps — check gateway Serial logs
- The in-app Meshtastic bridge (Settings) is a separate plaintext text path — it does **not** make RF Meshtastic-compatible

# FAQ

## I cannot see nearby peers

- Bluetooth on for both devices
- Android: Location / Nearby devices permissions
- Stay close; avoid aggressive battery savers that kill BLE
- Refresh the nearby list in the app

## Messages do not arrive

- Online path: check internet + Nostr
- Offline path: BLE range or ESP32 / LoRa in between
- Messages may sit in a queue — reopen the app when a path exists

## Read ticks never turn blue

- Recipient must **open that chat** (or keep it open)
- An ACK return path is required (internet / BLE / gateway)
- History ON and OFF should both work on 1.9.49+

## OTA fails

- Enough battery on phone and board
- Stay near the ESP32 for the whole transfer
- Correct binary for the board role (mule ≠ LoRa)
- Checksum mismatches block flashing

## No internet but I need firmware

- Use the **in-app baseline** (Settings → Firmware)
- Or copy a `.bin` from another device that already downloaded it

## Board invites look like huge JSON

- Owners should use **share text / QR / deep link** instead of raw JSON

## LoRa TX but nobody receives

- Antenna attached?
- Frequency / SF must match on every node
- TTL and relay rate caps — check gateway Serial logs

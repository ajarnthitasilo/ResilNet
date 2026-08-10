# 1:1 chat (end-to-end sealed)

Private messages between you and one peer are **sealed** before they leave the phone. ESP32 / LoRa nodes may forward opaque packets without decrypting them.

## Start a conversation

1. Add a peer (nearby discovery / QR / in-app flows)
2. Open the chat — text, voice, or images as supported
3. With internet, delivery often uses **Nostr** (optional: via Tor in Settings); offline, BLE mesh / ESP32 / local queue apply.  
   On a LAN you may also use **Local Wi‑Fi** or **Home node** if enabled — see [Local Wi‑Fi](local-wifi.md) and [Home node](reticulum-home-node.md).  
   On Apple Watch you can send short texts (~160 chars); the iPhone seals them — see [Apple Watch](apple-watch.md).

## Tick meanings

| Status | Meaning |
|--------|---------|
| Clock / pending | Still local or waiting to send |
| Single gray tick | Sent / relayed |
| Double gray | **Delivered** — recipient device got it |
| Double blue | **Read** — recipient opened that chat |

> Receipts work with **Save message history ON and OFF** (session-only storage).

## What 1:1 is not

- Not a public #mesh bulletin — see [mesh](mesh.md)
- Not a community board post — see [boards](boards.md)

## If delivery fails

- Check online path (Nostr) or offline path (BLE range / ESP32 / LoRa)
- If using Home node: both sides enabled and friends linked?
- Enable history saving if you need messages after app restart
- When debugging ticks, look for `[ACK]` logs: enqueue → flush → apply

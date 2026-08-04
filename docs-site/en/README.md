# ResilNet

**Account-less crisis messaging** — works with or without the internet via nearby Bluetooth, mid-range ESP32 / LoRa, Nostr when online, plus optional **Local Wi‑Fi** and **Home node (Reticulum)** on a LAN.

Current app version: **1.9.64**  
ESP32 firmware: see in-app / firmware page (may match or trail the app version).

## Who it is for

- Field teams and communities with unreliable connectivity
- People who want end-to-end sealed chats without email/phone signup
- Operators of ESP32 “data mule” nodes or LoRa gateways
- (Optional) Operators of a Mac/Pi **Home node** on site Wi‑Fi

## Transport tiers

| Tier | Channel | When |
|------|---------|------|
| Near | Phone BLE mesh | Discovery / nearby mesh |
| LAN | Local Wi‑Fi (phone↔phone) | Same hotspot or router |
| Mid | ESP32 mule or LoRa gateway | Longer offline reach / store-and-forward |
| Home | Home node (Reticulum / LXMF) | Mac/Pi bridge on Wi‑Fi |
| Far | Public Nostr relays | Internet available |

## Quick start

1. [Install the app](guide/install.md) and grant Bluetooth (and Location if the OS requires it)
2. Identity is created on-device — **no account signup**
3. Send a [1:1 chat](guide/chat.md) or a [#mesh public bulletin](guide/mesh.md)
4. (Optional hardware) Set up an [ESP32 Mule](guide/esp32-mule.md) or [LoRa Gateway](guide/esp32-lora.md)
5. (Optional LAN) [Local Wi‑Fi](guide/local-wifi.md) or [Home node / Reticulum](guide/reticulum-home-node.md)

Changes since the 1.9.49 guide: **[What’s new](guide/whats-new.md)**

> **Note:** ResilNet LoRa is ResilNet’s own protocol — **not** Meshtastic-compatible.  
> Home node uses Reticulum/LXMF on a computer — **not** a full LXMF stack on Heltec radios.

[ฉบับภาษาไทย →](/th/)

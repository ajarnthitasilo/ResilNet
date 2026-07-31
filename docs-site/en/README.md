# ResilNet

**Account-less crisis messaging** — works with or without the internet via nearby Bluetooth, mid-range ESP32 / LoRa, and Nostr when online.

Current app version: **1.9.49**  
ESP32 firmware: **1.9.49**

## Who it is for

- Field teams and communities with unreliable connectivity
- People who want end-to-end sealed chats without email/phone signup
- Operators of ESP32 “data mule” nodes or LoRa gateways

## Transport tiers

| Tier | Channel | When |
|------|---------|------|
| Near | Phone BLE mesh | Discovery / nearby mesh |
| Mid | ESP32 mule or LoRa gateway | Longer offline reach / store-and-forward |
| Far | Public Nostr relays | Internet available |

## Quick start

1. [Install the app](guide/install.md) and grant Bluetooth (and Location if the OS requires it)
2. Identity is created on-device — **no account signup**
3. Send a [1:1 chat](guide/chat.md) or a [#mesh public bulletin](guide/mesh.md)
4. (Optional hardware) Set up an [ESP32 Mule](guide/esp32-mule.md) or [LoRa Gateway](guide/esp32-lora.md)

> **Note:** ResilNet LoRa is ResilNet’s own protocol — **not** Meshtastic-compatible.

[ฉบับภาษาไทย →](/th/)

# Wi‑Fi HaLow gateway (switchable RF)

ResilNet can use **Wi‑Fi HaLow (802.11ah)** as an optional **mid-range gateway transport** alongside LoRa. The phone does **not** need a HaLow radio — it still talks to the ESP32 over **BLE** and **SoftAP UDP** (`192.168.4.1:4210`), same as the [LoRa gateway](esp32-lora.md).

## Architecture

```text
Phone  →  BLE / SoftAP UDP  →  ESP32 gateway  →  LoRa  OR  HaLow
```

Sealed E2EE envelopes are unchanged; the gateway switches RF path only.

## Switching from the app

**Settings → Gateway radio**

| Mode | Behavior |
|------|----------|
| **LoRa** | Always TX/RX on LoRa |
| **HaLow** | Use HaLow when the gateway reports it (stub or real module) |
| **Auto** | HaLow when link is up, otherwise LoRa |

The gateway advertises capabilities with **RN_CAPS**; the app sends **RN_RADIO** when you change mode. See [`esp32_firmware/docs/halow_control.md`](https://github.com/AjarnThitasilo/ResilNet/blob/main/esp32_firmware/docs/halow_control.md).

## Firmware builds

| Build | Result |
|-------|--------|
| Default (`HALOW_ENABLE=0`) | LoRa-only gateway — unchanged behavior |
| `-DHALOW_ENABLE=1` | HaLow manager + RN_CAPS bit; **stub driver** for protocol testing |
| `-DHALOW_ENABLE=1` + real Morse Micro (future) | Replace stub SPI driver — app protocol unchanged |

Stub mode (`HALOW_STUB_LOOPBACK=1`) loopbacks TX→RX in firmware so you can test switching without RF hardware.

## RF / regulatory (Thailand)

- LoRa gateway: **AS923 ~920–925 MHz** ([esp32-lora.md](esp32-lora.md))
- HaLow: typically **Sub‑1 GHz** near the same band depending on module/country
- **Do not TX LoRa and HaLow simultaneously** on one board without proper RF isolation, filtering, and NBTC-compliant design
- Use separate antennas/filters or dedicated hardware when operating both paths in the field

## What is not in this release

- HaLow multi-hop mesh (AP/STA topology only)
- Payload larger than `ResilNetRadioPacket` 230 B on air
- HaLow radio inside iPhone/Android (gateway path only)

## Related

- [ESP32 LoRa gateway](esp32-lora.md)
- [Local Wi‑Fi (phone↔phone LAN)](local-wifi.md) — different path, not SoftAP gateway

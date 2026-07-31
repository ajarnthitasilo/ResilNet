# ESP32 LoRa Gateway

Gateways bridge phones to **ResilNet LoRa** and multi-hop between gateways.

## RF / legal notes (Thailand)

- Primary firmware band is about **920–925 MHz (AS923)**, e.g. ~923.5 MHz
- **Attach an antenna before TX**
- Follow local NBTC / regulatory limits for power and duty cycle
- **Not** Meshtastic-compatible and not intended to interoperate with it

## Phone ↔ gateway links

1. **BLE** — app talks to the LoRa gateway GATT service
2. **Wi‑Fi SoftAP + UDP** — AP name like `ResilNet-Node-XXXX`, `192.168.4.1`, UDP port `4210`

(SoftAP may power down when idle, depending on build flags.)

## Multi-hop mesh (ResilNet)

From firmware **1.9.49**:

- LoRa RX still notifies the phone (BLE/UDP) as before
- If TTL remains → **rebroadcast on LoRa** (TTL--, dedupe, rate cap)
- Relays work even with no phone connected
- **RAM store-and-forward** when no client is present; replay when a phone returns

Disable relay at build time: `-DLORA_MESH_RELAY_ENABLE=0`

## Flash

Use `resilnet_esp32_lora_gateway.bin` — see [Firmware](../firmware/)

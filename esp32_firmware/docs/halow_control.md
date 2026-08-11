# Gateway control plane (RN_CAPS / RN_RADIO)

Small control frames on the existing phone ↔ gateway links (SoftAP UDP `:4210` and BLE GATT write/notify). They do **not** carry E2EE payload — only capability and radio preference.

## RN_CAPS (gateway → phone)

| Offset | Size | Field |
|--------|------|-------|
| 0 | 2 | Magic `0x52 0x43` (`RC`) |
| 2 | 1 | Version `1` |
| 3 | 1 | Caps bitmask (see below) |
| 4 | 1 | Active radio: `0`=LoRa, `1`=HaLow |
| 5 | 1 | Reserved `0` |

**Caps bitmask**

| Bit | Name | Meaning |
|-----|------|---------|
| 0 | `GW_CAP_LORA` | LoRa PHY present |
| 1 | `GW_CAP_HALOW` | HaLow hardware (or stub) compiled in |
| 2 | `GW_CAP_HALOW_UP` | HaLow link up (association OK) |
| 3 | `GW_CAP_HALOW_STUB` | Stub driver — loopback test without RF module |

Gateway broadcasts RN_CAPS on UDP when a station connects and periodically while SoftAP is up. Same bytes may be sent on BLE notify (TX characteristic) for phone-only links.

## RN_RADIO (phone → gateway)

| Offset | Size | Field |
|--------|------|-------|
| 0 | 2 | Magic `0x52 0x52` (`RR`) |
| 2 | 1 | Version `1` |
| 3 | 1 | Mode: `0`=LoRa, `1`=HaLow, `2`=Auto |

**Auto** on the gateway: use HaLow when `GW_CAP_HALOW_UP` is set, otherwise LoRa.

## Phone routing

When SoftAP/BLE is active and RN_CAPS is received:

- `lora_available` = bit0 set
- `halow_available` = bit1 && (bit2 || bit3)
- `halow_link_up` = bit2
- Push preference from Settings into Rust `NetworkStatus`
- Router selects **one** gateway transport (LoRa **or** HaLow), never both on RF

Constants are mirrored in `esp32_firmware/include/gateway_control.h` and `mobile_app/lib/core/gateway_control_codec.dart`.

## Backward compatibility

### App RN_CAPS timeout

If no RN_CAPS arrives within **4 seconds** after SoftAP connect, the app assumes **LoRa-only** (legacy firmware) and never blocks waiting indefinitely.

### LoRa-only firmware (`HALOW_ENABLE=0`)

- Gateway **ignores RN_RADIO** silently (no crash, no preference change)
- RN_CAPS still broadcasts with `GW_CAP_LORA` only

### Radio switch + TX queues (approach ข)

When RN_RADIO changes the resolved radio, the gateway **drops pending TX queues** on LoRa and HaLow (no flush-wait). The app retries via TTL / chunk ARQ.

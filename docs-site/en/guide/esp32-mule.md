# ESP32 Standalone (Data Mule)

A **mule** node stores messages/bulletins and syncs with phones over BLE when someone walks by — useful for long offline stretches.

Typical advertisement name: `RN-MULE` / ResilNet node BLE service.

## You need

- An ESP32 flashed with `resilnet_esp32_standalone.bin`
- ResilNet on a phone with Bluetooth on
- On-board BLE antenna is enough

## First-time flash

1. Get the `.bin` from the [firmware page](../firmware/) or the in-app baseline
2. Flash with a computer (PlatformIO / esptool) **or** in-app **BLE OTA** if the board already has OTA-capable firmware
3. Power on — the phone should see the node during sync

Full flash / OTA guide: [Flash firmware & BLE OTA](esp32-ota.md)

## Day-to-day

1. Open the app near the node
2. Let sync push/pull messages and bulletins
3. Public bulletins are retained for a shorter window (~3 days) for late joiners

## Do not confuse with LoRa Gateway

| | Standalone Mule | LoRa Gateway |
|--|-----------------|--------------|
| LoRa radio | No | Yes |
| Main role | BLE store-and-forward | BLE/UDP ↔ LoRa (+ mesh hops) |
| Binary | `…_standalone.bin` | `…_lora_gateway.bin` |

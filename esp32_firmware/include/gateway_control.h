#pragma once

#include <Arduino.h>

/// Gateway control plane — RN_CAPS / RN_RADIO (see docs/halow_control.md)

#define GW_CTRL_CAPS_MAGIC_HI 0x52
#define GW_CTRL_CAPS_MAGIC_LO 0x43
#define GW_CTRL_RADIO_MAGIC_HI 0x52
#define GW_CTRL_RADIO_MAGIC_LO 0x52
#define GW_CTRL_VERSION 1

#define GW_CAP_LORA 0x01
#define GW_CAP_HALOW 0x02
#define GW_CAP_HALOW_UP 0x04
#define GW_CAP_HALOW_STUB 0x08

#define GW_RADIO_LORA 0
#define GW_RADIO_HALOW 1
#define GW_RADIO_AUTO 2

constexpr size_t GW_CAPS_FRAME_LEN = 6;
constexpr size_t GW_RADIO_FRAME_LEN = 4;

/// Build RN_CAPS frame into `out` (capacity ≥ 6). Returns bytes written or 0.
size_t gatewayBuildCapsFrame(uint8_t* out, size_t out_cap);

/// Parse RN_RADIO from phone. Returns true and sets `mode` if valid.
bool gatewayParseRadioFrame(const uint8_t* data, size_t len, uint8_t& mode);

/// Handle RN_RADIO from phone (updates preference + logs).
void gatewayHandleRadioCommand(const uint8_t* data, size_t len);

/// True if datagram is RN_CAPS or RN_RADIO (not a radio payload).
bool gatewayIsControlFrame(const uint8_t* data, size_t len);

/// Broadcast RN_CAPS on UDP and BLE notify.
void gatewayBroadcastCaps();

uint8_t gatewayActiveRadioWire();
void gatewaySetActiveRadioWire(uint8_t radio);

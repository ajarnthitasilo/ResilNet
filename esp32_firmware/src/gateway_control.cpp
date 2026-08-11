#include "gateway_control.h"

#if defined(NODE_TYPE_LORA_GATEWAY)

#include "ble_manager.h"
#include "gateway_radio.h"
#include "halow_manager.h"
#include "lora_manager.h"
#include "wifi_udp_bridge.h"

static uint8_t s_activeRadio = GW_RADIO_LORA;

uint8_t gatewayActiveRadioWire() { return s_activeRadio; }

void gatewaySetActiveRadioWire(uint8_t radio) { s_activeRadio = radio; }

size_t gatewayBuildCapsFrame(uint8_t* out, size_t out_cap) {
  if (out_cap < GW_CAPS_FRAME_LEN) return 0;

  out[0] = GW_CTRL_CAPS_MAGIC_HI;
  out[1] = GW_CTRL_CAPS_MAGIC_LO;
  out[2] = GW_CTRL_VERSION;
  out[3] = gatewayRadio().buildCapsMask();
  out[4] = gatewayRadio().activeRadioWire();
  out[5] = 0;
  return GW_CAPS_FRAME_LEN;
}

bool gatewayParseRadioFrame(const uint8_t* data, size_t len, uint8_t& mode) {
  if (len < GW_RADIO_FRAME_LEN) return false;
  if (data[0] != GW_CTRL_RADIO_MAGIC_HI || data[1] != GW_CTRL_RADIO_MAGIC_LO)
    return false;
  if (data[2] != GW_CTRL_VERSION) return false;
  if (data[3] > GW_RADIO_AUTO) return false;
  mode = data[3];
  return true;
}

bool gatewayIsControlFrame(const uint8_t* data, size_t len) {
  if (len < 2) return false;
  if (data[0] == GW_CTRL_CAPS_MAGIC_HI && data[1] == GW_CTRL_CAPS_MAGIC_LO)
    return true;
  if (data[0] == GW_CTRL_RADIO_MAGIC_HI && data[1] == GW_CTRL_RADIO_MAGIC_LO)
    return true;
  return false;
}

/// Drop pending TX on both radios when preference changes (approach ข).
/// In-flight packets rely on app TTL / chunk ARQ retry — no flush-wait.
static void gatewayDropPendingTxQueues() {
  lora().flushTxQueue();
#if HALOW_ENABLE
  halow().flushTxQueue();
#endif
}

void gatewayHandleRadioCommand(const uint8_t* data, size_t len) {
  uint8_t mode = GW_RADIO_AUTO;
  if (!gatewayParseRadioFrame(data, len, mode)) return;

#if !HALOW_ENABLE
  // LoRa-only build: RN_RADIO is unsupported — ignore silently.
  return;
#endif

  const uint8_t prev = gatewayRadio().resolvedRadio();
  gatewayRadio().setPreference(mode);
  const uint8_t next = gatewayRadio().resolvedRadio();
  s_activeRadio = next;
  if (prev != next) {
    gatewayDropPendingTxQueues();
    Serial.printf(
        "[Gateway] RN_RADIO preference=%u resolved=%u — TX queues dropped\n",
        mode, s_activeRadio);
  } else {
    Serial.printf("[Gateway] RN_RADIO preference=%u resolved=%u\n", mode,
                  s_activeRadio);
  }
  gatewayBroadcastCaps();
}

void gatewayBroadcastCaps() {
  uint8_t frame[GW_CAPS_FRAME_LEN];
  const size_t n = gatewayBuildCapsFrame(frame, sizeof(frame));
  if (n == 0) return;

  wifiUdpBridge().broadcastControlFrame(frame, n);
  bleGateway().notifyControlFrame(frame, n);
}

#endif  // NODE_TYPE_LORA_GATEWAY

#include "transport_router.h"

#if defined(NODE_TYPE_LORA_GATEWAY)

#include "ble_manager.h"
#include "lora_manager.h"
#include "wifi_udp_bridge.h"

#if defined(RESILNET_HAS_CELLULAR)
#include "cellular_bridge.h"
#endif

void transportForwardFromLora(const ResilNetRadioPacket& pkt) {
  bleGateway().notifyPacketToPhone(pkt);
  wifiUdpBridge().broadcastPacket(pkt);
}

void transportForwardFromUdp(const ResilNetRadioPacket& pkt) {
  if (pkt.payload_len > sizeof(pkt.payload)) return;

  Serial.printf("[Router] UDP → LoRa ttl=%u len=%u\n", pkt.ttl, pkt.payload_len);
  lora().enqueueTx(pkt);

#if defined(RESILNET_HAS_CELLULAR)
  cellularBridge().sendPacket(pkt);
#endif
}

void transportForwardFromPhone(const ResilNetRadioPacket& pkt) {
  if (pkt.payload_len > sizeof(pkt.payload)) return;

  wifiUdpBridge().onBleActivity();

  Serial.printf("[Router] BLE → LoRa ttl=%u len=%u\n", pkt.ttl, pkt.payload_len);
  lora().enqueueTx(pkt);

#if defined(RESILNET_HAS_CELLULAR)
  cellularBridge().sendPacket(pkt);
#endif
}

#endif  // NODE_TYPE_LORA_GATEWAY

#include "transport_router.h"

#if defined(NODE_TYPE_LORA_GATEWAY)

#include "ble_manager.h"
#include "gateway_control.h"
#include "gateway_radio.h"
#include "halow_manager.h"
#include "lora_manager.h"
#include "lora_store_forward.h"
#include "wifi_udp_bridge.h"

#if defined(RESILNET_HAS_CELLULAR)
#include "cellular_bridge.h"
#endif

static bool isHeartbeatPacket(const ResilNetRadioPacket& pkt) {
  return pkt.payload_len >= 2 && pkt.payload[0] == 'H' && pkt.payload[1] == 'B';
}

/// บันทึก packet_id ก่อนส่งขึ้น LoRa จาก phone/UDP — กัน ping-pong เมื่อ
/// gateway ข้างเคียง relay แพ็กเก็ตของเรากลับมา
///
/// จงใจ *ไม่* drop เมื่อ id ซ้ำ: chunk ARQ ฝั่งแอป retransmit ด้วย id เดิม
/// การ drop ตรงนี้จะทำให้ retry ใช้ไม่ได้
static void registerOwnTx(const ResilNetRadioPacket& pkt) {
  lora().dedupCheckAndRegister(pkt.packet_id);
#if HALOW_ENABLE
  halow().dedupCheckAndRegister(pkt.packet_id);
#endif
}

static void forwardToGatewayRadio(const ResilNetRadioPacket& pkt) {
  // Radio path chosen at enqueue time from gatewayRadio().resolvedRadio().
  // Pending packets on the other radio are dropped on RN_RADIO switch
  // (see gatewayDropPendingTxQueues) — app TTL / chunk ARQ handles retry.
  gatewaySetActiveRadioWire(gatewayRadio().resolvedRadio());
  if (gatewayActiveRadioWire() == GW_RADIO_HALOW) {
#if HALOW_ENABLE
    Serial.printf("[Router] → HaLow ttl=%u len=%u\n", pkt.ttl, pkt.payload_len);
    halow().enqueueTx(pkt);
#else
    Serial.println("[Router] HaLow requested but HALOW_ENABLE=0 — LoRa fallback");
    lora().enqueueTx(pkt);
#endif
  } else {
    Serial.printf("[Router] → LoRa ttl=%u len=%u\n", pkt.ttl, pkt.payload_len);
    lora().enqueueTx(pkt);
  }
}

void transportForwardFromHalow(const ResilNetRadioPacket& pkt) {
  bleGateway().notifyPacketToPhone(pkt);
  wifiUdpBridge().broadcastPacket(pkt);
}

void transportForwardFromLora(const ResilNetRadioPacket& pkt) {
  bleGateway().notifyPacketToPhone(pkt);
  wifiUdpBridge().broadcastPacket(pkt);

#if LORA_SNF_ENABLE
  // ไม่มี client ฝั่ง phone เลย → notify/broadcast ข้างบนสูญเปล่า
  // เก็บ opaque ไว้ replay เมื่อ client กลับมา (heartbeat ไม่เก็บ)
  if (!isHeartbeatPacket(pkt) && !bleGateway().phoneConnected() &&
      !wifiUdpBridge().hasStations()) {
    loraStoreForward().store(pkt);
  }
#endif

#if LORA_MESH_RELAY_ENABLE
  // Multi-hop: ส่งต่อขึ้น LoRa ถ้า TTL ยังเหลือ (packet_id ถูกบันทึกใน dedup
  // แล้วตอน RX — สำเนาที่วนกลับมาจะถูก drop ก่อนถึงจุดนี้)
  if (pkt.ttl <= 1 || isHeartbeatPacket(pkt)) return;

  // Rate limit: กัน relay storm ตอนโหลดหนัก (นับเฉพาะ relay — เรียกจาก
  // TaskLoRaRx task เดียว จึงไม่ต้องล็อก)
  static uint32_t s_windowStartMs = 0;
  static uint16_t s_windowCount = 0;
  const uint32_t nowMs = millis();
  if (nowMs - s_windowStartMs >= LORA_RELAY_WINDOW_MS) {
    s_windowStartMs = nowMs;
    s_windowCount = 0;
  }
  if (s_windowCount >= LORA_RELAY_MAX_PER_WINDOW) {
    Serial.println("[Router] relay rate cap — drop");
    return;
  }
  s_windowCount++;

  ResilNetRadioPacket relay = pkt;
  relay.ttl = (uint8_t)(pkt.ttl - 1);
  if (relay.ttl > LORA_RELAY_TTL_CAP) relay.ttl = LORA_RELAY_TTL_CAP;

  // Jitter ลดการชนคลื่นเมื่อหลาย gateway ได้ยินแพ็กเก็ตเดียวกันพร้อมกัน
  // (บล็อก TaskLoRaRx สั้นๆ — แนวเดียวกับ repeater เดิม)
  const uint32_t jitter =
      LORA_RELAY_JITTER_MIN_MS + (esp_random() % LORA_RELAY_JITTER_SPAN_MS);
  vTaskDelay(pdMS_TO_TICKS(jitter));

  if (lora().enqueueTx(relay)) {
    Serial.printf("[Router] LoRa relay ttl=%u len=%u jitter=%lums\n", relay.ttl,
                  relay.payload_len, (unsigned long)jitter);
  } else {
    Serial.println("[Router] LoRa relay queue full — drop");
  }
#endif
}

void transportForwardFromUdp(const ResilNetRadioPacket& pkt) {
  if (pkt.payload_len > sizeof(pkt.payload)) return;

  wifiUdpBridge().onBleActivity();
  registerOwnTx(pkt);

  forwardToGatewayRadio(pkt);

#if defined(RESILNET_HAS_CELLULAR)
  cellularBridge().sendPacket(pkt);
#endif
}

void transportForwardFromPhone(const ResilNetRadioPacket& pkt) {
  if (pkt.payload_len > sizeof(pkt.payload)) return;

  wifiUdpBridge().onBleActivity();
  registerOwnTx(pkt);

  forwardToGatewayRadio(pkt);

#if defined(RESILNET_HAS_CELLULAR)
  cellularBridge().sendPacket(pkt);
#endif
}

#endif  // NODE_TYPE_LORA_GATEWAY

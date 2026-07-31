#include "lora_store_forward.h"

#if defined(NODE_TYPE_LORA_GATEWAY)

#include <cstring>

static LoraStoreForward s_snf;

LoraStoreForward& loraStoreForward() { return s_snf; }

bool LoraStoreForward::begin() {
  memset(_entries, 0, sizeof(_entries));
  _mutex = xSemaphoreCreateMutex();
  if (!_mutex) {
    Serial.println("[SnF] mutex create failed");
    return false;
  }
  return true;
}

bool LoraStoreForward::containsLocked(const uint8_t packet_id[16]) const {
  for (const auto& e : _entries) {
    if (e.used && resilnet_packet_id_equal(e.pkt.packet_id, packet_id)) {
      return true;
    }
  }
  return false;
}

void LoraStoreForward::purgeExpiredLocked(uint32_t now_ms) {
  for (auto& e : _entries) {
    if (e.used && (now_ms - e.stored_at_ms) >= LORA_SNF_ENTRY_TTL_MS) {
      e.used = false;
    }
  }
}

void LoraStoreForward::store(const ResilNetRadioPacket& pkt) {
  if (!_mutex) return;
  xSemaphoreTake(_mutex, portMAX_DELAY);

  const uint32_t now = millis();
  purgeExpiredLocked(now);

  if (containsLocked(pkt.packet_id)) {
    xSemaphoreGive(_mutex);
    return;
  }

  // หา slot ว่าง — ถ้าเต็ม ทับรายการเก่าสุด (คิวมีขอบเขตเสมอ)
  Entry* slot = nullptr;
  Entry* oldest = &_entries[0];
  for (auto& e : _entries) {
    if (!e.used) {
      slot = &e;
      break;
    }
    if ((int32_t)(e.stored_at_ms - oldest->stored_at_ms) < 0) oldest = &e;
  }
  if (!slot) slot = oldest;

  slot->pkt = pkt;
  slot->stored_at_ms = now;
  slot->used = true;

  xSemaphoreGive(_mutex);
  Serial.printf("[SnF] stored ttl=%u len=%u (queued=%u)\n", pkt.ttl,
                pkt.payload_len, (unsigned)size());
}

bool LoraStoreForward::popOldest(ResilNetRadioPacket& out) {
  if (!_mutex) return false;
  xSemaphoreTake(_mutex, portMAX_DELAY);

  purgeExpiredLocked(millis());

  Entry* oldest = nullptr;
  for (auto& e : _entries) {
    if (!e.used) continue;
    if (!oldest || (int32_t)(e.stored_at_ms - oldest->stored_at_ms) < 0) {
      oldest = &e;
    }
  }

  if (!oldest) {
    xSemaphoreGive(_mutex);
    return false;
  }

  out = oldest->pkt;
  oldest->used = false;
  xSemaphoreGive(_mutex);
  return true;
}

size_t LoraStoreForward::size() {
  if (!_mutex) return 0;
  xSemaphoreTake(_mutex, portMAX_DELAY);
  size_t n = 0;
  for (const auto& e : _entries) {
    if (e.used) n++;
  }
  xSemaphoreGive(_mutex);
  return n;
}

#endif  // NODE_TYPE_LORA_GATEWAY

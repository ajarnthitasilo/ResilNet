#pragma once

#include <Arduino.h>
#include <cstring>

#include "config.h"
#include "packet.h"

/// Ring buffer กรอง packet_id ซ้ำ — ป้องกัน LoRa relay วนลูป
class DedupCache {
 public:
  DedupCache() { clear(); }

  void clear() {
    _count = 0;
    _head = 0;
    memset(_ids, 0, sizeof(_ids));
  }

  /// คืน true ถ้าเป็นแพ็กเก็ตใหม่ (และบันทึกแล้ว)
  bool accept(const uint8_t packet_id[16]) {
    if (contains(packet_id)) return false;
    memcpy(_ids[_head], packet_id, 16);
    _head = (_head + 1) % DEDUP_CACHE_SIZE;
    if (_count < DEDUP_CACHE_SIZE) _count++;
    return true;
  }

  bool contains(const uint8_t packet_id[16]) const {
    for (size_t i = 0; i < _count; i++) {
      if (resilnet_packet_id_equal(_ids[i], packet_id)) return true;
    }
    return false;
  }

  size_t size() const { return _count; }

 private:
  uint8_t _ids[DEDUP_CACHE_SIZE][16];
  size_t _head = 0;
  size_t _count = 0;
};

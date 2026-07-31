#pragma once

#include "packet.h"

#if defined(NODE_TYPE_LORA_GATEWAY)

#include <Arduino.h>
#include <freertos/FreeRTOS.h>
#include <freertos/semphr.h>

#include "config.h"

/// คิว store-and-forward ฝั่ง LoRa gateway (RAM เท่านั้น — ไม่เขียน flash)
///
/// เก็บแพ็กเก็ต ResilNetRadioPacket แบบ opaque (ไม่แตะ payload/E2EE)
/// ที่รับจาก LoRa ขณะไม่มี phone BLE / UDP client เชื่อมต่ออยู่
/// แล้ว replay ให้ client เมื่อกลับมาเชื่อมต่อ
///
/// แยกขาดจาก MessageStore/LittleFS ของ standalone mule — ไม่แชร์โค้ดหรือไฟล์
class LoraStoreForward {
 public:
  bool begin();

  /// เก็บแพ็กเก็ต (ข้ามถ้า id ซ้ำกับที่ค้างอยู่ / คิวเต็มจะทับรายการเก่าสุด)
  void store(const ResilNetRadioPacket& pkt);

  /// ดึงรายการเก่าสุดที่ยังไม่หมดอายุออกจากคิว — คืน false ถ้าคิวว่าง
  bool popOldest(ResilNetRadioPacket& out);

  size_t size();

 private:
  struct Entry {
    ResilNetRadioPacket pkt;
    uint32_t stored_at_ms;
    bool used;
  };

  bool containsLocked(const uint8_t packet_id[16]) const;
  void purgeExpiredLocked(uint32_t now_ms);

  Entry _entries[LORA_SNF_MAX_ENTRIES];
  SemaphoreHandle_t _mutex = nullptr;
};

LoraStoreForward& loraStoreForward();

#endif  // NODE_TYPE_LORA_GATEWAY

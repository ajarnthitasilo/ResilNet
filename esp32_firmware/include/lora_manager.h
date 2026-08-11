#pragma once

#include <Arduino.h>
#include <freertos/FreeRTOS.h>
#include <freertos/queue.h>
#include <freertos/semphr.h>

#include "dedup_cache.h"
#include "packet.h"

/// Callback เมื่อรับแพ็กเก็ต LoRa ที่ถูกต้องแล้ว
using LoRaRxCallback = void (*)(const ResilNetRadioPacket& pkt, void* user);

/// จัดการวิทยุ LoRa (RadioLib SX1262)
class LoRaManager {
 public:
  bool begin();
  void setRxCallback(LoRaRxCallback cb, void* user);

  /// ส่งแพ็กเก็ต (เข้าคิว TaskLoRaTx)
  bool enqueueTx(const ResilNetRadioPacket& pkt);

  /// ส่งทันทีจาก task ปัจจุบัน (ใช้ภายใน TaskLoRaTx)
  bool transmitNow(const ResilNetRadioPacket& pkt);

  /// เริ่ม FreeRTOS tasks RX/TX
  void startTasks();

  /// ล้างคิว TX ที่ค้าง (ใช้ตอนสวิตช์วิทยุ — ปล่อยให้แอป retry เอง)
  void flushTxQueue();

  DedupCache& dedup() { return _dedup; }

  /// ตรวจ + บันทึก packet_id (thread-safe) — คืน true ถ้าเป็น id ใหม่
  ///
  /// ใช้ทั้งขา RX (กัน relay ซ้ำ) และขา TX จาก phone/UDP (กัน ping-pong:
  /// ถ้าไม่บันทึกตอนส่งเอง gateway ข้างเคียง relay กลับมาแล้วเราจะ relay ซ้ำ)
  bool dedupCheckAndRegister(const uint8_t packet_id[16]);

  /// อ่านแบตจำลอง (0–100%) — ต่อ ADC จริงได้ภายหลัง
  uint8_t readBatteryPercent() const;

 private:
  static void taskRx(void* arg);
  static void taskTx(void* arg);

  void onPacketReceived(const ResilNetRadioPacket& pkt);

  DedupCache _dedup;
  SemaphoreHandle_t _dedup_mutex = nullptr;
  LoRaRxCallback _rx_cb = nullptr;
  void* _rx_user = nullptr;
  QueueHandle_t _tx_queue = nullptr;
  bool _ready = false;
};

/// Singleton สำหรับเข้าถึงจาก BLE / main
LoRaManager& lora();

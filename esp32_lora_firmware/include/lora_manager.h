#pragma once

#include <Arduino.h>
#include <freertos/FreeRTOS.h>
#include <freertos/queue.h>

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

  DedupCache& dedup() { return _dedup; }

  /// อ่านแบตจำลอง (0–100%) — ต่อ ADC จริงได้ภายหลัง
  uint8_t readBatteryPercent() const;

 private:
  static void taskRx(void* arg);
  static void taskTx(void* arg);

  void onPacketReceived(const ResilNetRadioPacket& pkt);

  DedupCache _dedup;
  LoRaRxCallback _rx_cb = nullptr;
  void* _rx_user = nullptr;
  QueueHandle_t _tx_queue = nullptr;
  bool _ready = false;
};

/// Singleton สำหรับเข้าถึงจาก BLE / main
LoRaManager& lora();

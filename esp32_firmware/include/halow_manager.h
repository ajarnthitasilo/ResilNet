#pragma once

#include <Arduino.h>
#include <freertos/FreeRTOS.h>
#include <freertos/queue.h>

#include "dedup_cache.h"
#include "packet.h"

using HaLowRxCallback = void (*)(const ResilNetRadioPacket& pkt, void* user);

/// Wi‑Fi HaLow manager — stub when HALOW_ENABLE without RF module.
class HaLowManager {
 public:
  bool begin();
  void setRxCallback(HaLowRxCallback cb, void* user);

  bool enqueueTx(const ResilNetRadioPacket& pkt);
  bool transmitNow(const ResilNetRadioPacket& pkt);

  void startTasks();

  /// ล้างคิว TX ที่ค้าง (ใช้ตอนสวิตช์วิทยุ)
  void flushTxQueue();

  bool isCapable() const;
  bool linkUp() const;
  bool isStub() const;

  bool dedupCheckAndRegister(const uint8_t packet_id[16]);
  DedupCache& dedup() { return _dedup; }

 private:
  static void taskTx(void* arg);

  void onPacketReceived(const ResilNetRadioPacket& pkt);

  DedupCache _dedup;
  SemaphoreHandle_t _dedup_mutex = nullptr;
  HaLowRxCallback _rx_cb = nullptr;
  void* _rx_user = nullptr;
  QueueHandle_t _tx_queue = nullptr;
  bool _ready = false;
#if HALOW_ENABLE
  bool _link_up = false;
#endif
};

HaLowManager& halow();

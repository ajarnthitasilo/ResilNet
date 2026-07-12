/**
 * ResilNet ESP32 LoRa Firmware
 *
 * Role A (NODE_TYPE_LORA_GATEWAY):
 *   BLE ↔ LoRa bridge สำหรับแอป Flutter
 *
 * Role B (NODE_TYPE_STANDALONE_REPEATER):
 *   LoRa relay + heartbeat ทุก 5 นาที
 */
#include <Arduino.h>

#include "config.h"
#include "dedup_cache.h"
#include "lora_manager.h"
#include "packet.h"

#if defined(NODE_TYPE_LORA_GATEWAY)
#include "ble_manager.h"
#endif

// ─── Gateway: LoRa → BLE forward ───────────────────────────────────────────
#if defined(NODE_TYPE_LORA_GATEWAY)
static void onLoraRxGateway(const ResilNetRadioPacket& pkt, void* /*user*/) {
  Serial.println("[Gateway] LoRa RX → BLE notify");
  bleGateway().notifyPacketToPhone(pkt);
}
#endif

// ─── Repeater: LoRa relay + jitter ─────────────────────────────────────────
#if defined(NODE_TYPE_STANDALONE_REPEATER)
static void onLoraRxRepeater(const ResilNetRadioPacket& pkt, void* /*user*/) {
  // Heartbeat ไม่ relay
  if (pkt.payload_len >= 2 && pkt.payload[0] == 'H' && pkt.payload[1] == 'B') {
    Serial.printf("[Repeater] heartbeat bat=%u%%\n", pkt.payload[2]);
    return;
  }

  if (pkt.ttl <= 1) {
    Serial.println("[Repeater] ttl exhausted — drop");
    return;
  }

  ResilNetRadioPacket relay = pkt;
  relay.ttl = (uint8_t)(pkt.ttl - 1);

  // Random jitter 50–200 ms ลดการชนคลื่น
  const uint32_t jitter = 50 + (esp_random() % 151);
  Serial.printf("[Repeater] relay ttl=%u jitter=%lums\n", relay.ttl, jitter);
  vTaskDelay(pdMS_TO_TICKS(jitter));

  lora().enqueueTx(relay);
}
#endif

#if defined(NODE_TYPE_STANDALONE_REPEATER)
static void taskHeartbeat(void* arg) {
  (void)arg;
  Serial.println("[Repeater] TaskHeartbeat started");

  while (true) {
    vTaskDelay(pdMS_TO_TICKS(HEARTBEAT_INTERVAL_MS));

    ResilNetRadioPacket hb{};
    resilnet_build_heartbeat(hb, lora().readBatteryPercent());
    Serial.println("[Repeater] sending heartbeat");
    lora().enqueueTx(hb);
  }
}
#endif

void setup() {
  Serial.begin(115200);
  delay(500);

#if defined(NODE_TYPE_LORA_GATEWAY)
  Serial.println("\n=== ResilNet ESP32 LoRa GATEWAY ===");
#elif defined(NODE_TYPE_STANDALONE_REPEATER)
  Serial.println("\n=== ResilNet ESP32 LoRa REPEATER ===");
#endif

  if (!lora().begin()) {
    Serial.println("[FATAL] LoRa init failed");
    while (true) delay(1000);
  }

#if defined(NODE_TYPE_LORA_GATEWAY)
  lora().setRxCallback(onLoraRxGateway, nullptr);
  if (!bleGateway().begin()) {
    Serial.println("[FATAL] BLE init failed");
    while (true) delay(1000);
  }
  bleGateway().startTask();
#elif defined(NODE_TYPE_STANDALONE_REPEATER)
  lora().setRxCallback(onLoraRxRepeater, nullptr);
  xTaskCreatePinnedToCore(taskHeartbeat, "TaskHeartbeat", TASK_HEARTBEAT_STACK, nullptr,
                          TASK_HEARTBEAT_PRIO, nullptr, 0);
#endif

  lora().startTasks();
  Serial.println("[Main] All tasks running");
}

void loop() {
  // งานหลักอยู่ใน FreeRTOS tasks
  vTaskDelay(pdMS_TO_TICKS(1000));
}

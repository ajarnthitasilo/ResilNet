/**
 * ResilNet ESP32 Unified Firmware
 *
 * NODE_TYPE_STANDALONE (default): BLE Mule + LittleFS + OTA
 * NODE_TYPE_LORA_GATEWAY: BLE ↔ LoRa Bridge + OTA
 */
#include <Arduino.h>
#include <NimBLEDevice.h>
#include <ArduinoJson.h>
#include <set>

#include "config.h"
#include "ota_ble_service.h"
#include "ota_config.h"
#include "ota_manager.h"

#if defined(NODE_TYPE_STANDALONE)
#include "MessageStore.h"
#include "ReceivedIdsStore.h"
#include "MuleProtocol.h"

static MessageStore gStore;
static ReceivedIdsStore gAckStore(RECEIVED_IDS_PATH);
static NimBLEServer* gServer = nullptr;
static NimBLECharacteristic* gSyncChar = nullptr;
static std::set<String> gPhoneIds;

static String buildHandshakeAck() {
  StaticJsonDocument<4096> doc;
  doc["op"] = "hs_ack";
  JsonArray arr = doc.createNestedArray("ids");
  for (const auto& id : gStore.allIds()) arr.add(id);
  JsonArray acks = doc.createNestedArray("acks");
  for (const auto& id : gAckStore.allIds()) acks.add(id);
  String out;
  serializeJson(doc, out);
  return out;
}

static String buildPullBatch(const std::vector<StoredMessage>& batch) {
  JsonDocument doc;
  doc["op"] = "pull";
  JsonArray msgs = doc["msgs"].to<JsonArray>();
  for (const auto& m : batch) {
    JsonObject o = msgs.add<JsonObject>();
    muleWriteToJson(o, m);
  }
  String out;
  serializeJson(doc, out);
  return out;
}

static void handleSyncPayload(const std::string& value) {
  JsonDocument doc;
  if (deserializeJson(doc, value.c_str())) {
    Serial.println("[Sync] Invalid JSON");
    return;
  }

  const char* op = doc["op"] | "";
  if (strcmp(op, "hs") == 0) {
    gPhoneIds.clear();
    JsonArray arr = doc["ids"].as<JsonArray>();
    for (JsonVariant v : arr) gPhoneIds.insert(v.as<String>());
    gSyncChar->setValue(buildHandshakeAck());
    gSyncChar->notify();
    return;
  }

  if (strcmp(op, "push") == 0) {
    JsonArray msgs = doc["msgs"].as<JsonArray>();
    for (JsonObject o : msgs) {
      StoredMessage m;
      muleReadFromJson(o, m);
      m.receivedAtMs = millis();
      if (gStore.save(m)) gAckStore.add(m.id, m.receivedAtMs);
    }
    auto missing = gStore.messagesNotIn(gPhoneIds);
    if (!missing.empty()) {
      const size_t maxBatch = MULE_PULL_MAX_BATCH;
      std::vector<StoredMessage> batch(
          missing.begin(),
          missing.begin() + std::min(maxBatch, missing.size()));
      gSyncChar->setValue(buildPullBatch(batch));
      gSyncChar->notify();
    } else {
      StaticJsonDocument<128> done;
      done["op"] = "done";
      String out;
      serializeJson(done, out);
      gSyncChar->setValue(out);
      gSyncChar->notify();
      delay(200);
      if (gServer && gServer->getConnectedCount() > 0) {
        gServer->disconnect(0);
      }
    }
    return;
  }

  if (strcmp(op, "done") == 0 && gServer && gServer->getConnectedCount() > 0) {
    gServer->disconnect(0);
  }
}

class MuleServerCallbacks : public NimBLEServerCallbacks {
  void onDisconnect(NimBLEServer* pServer, NimBLEConnInfo& connInfo,
                    int reason) override {
  Serial.printf("[BLE] Disconnected reason=%d\n", reason);
    NimBLEDevice::startAdvertising();
  }
};

class SyncCallbacks : public NimBLECharacteristicCallbacks {
  void onWrite(NimBLECharacteristic* pCharacteristic,
               NimBLEConnInfo& connInfo) override {
    handleSyncPayload(pCharacteristic->getValue());
  }
};

static void setupMuleBle() {
  NimBLEDevice::init(NODE_ADV_NAME);
  NimBLEDevice::setPower(ESP_PWR_LVL_P9);

  gServer = NimBLEDevice::createServer();
  gServer->setCallbacks(new MuleServerCallbacks());

  auto* service = gServer->createService(RESILNET_NODE_SERVICE_UUID);
  auto* infoChar = service->createCharacteristic(
      RESILNET_NODE_INFO_CHAR_UUID, NIMBLE_PROPERTY::READ);
  infoChar->setValue("{\"node\":\"ResilNet-Mule\",\"v\":2,\"proto\":2,\"ota\":1}");

  gSyncChar = service->createCharacteristic(
      RESILNET_NODE_SYNC_CHAR_UUID,
      NIMBLE_PROPERTY::WRITE | NIMBLE_PROPERTY::NOTIFY);
  gSyncChar->setCallbacks(new SyncCallbacks());
  service->start();

  OtaBleService::instance().attach(gServer);

  NimBLEAdvertising* adv = NimBLEDevice::getAdvertising();
  adv->addServiceUUID(RESILNET_NODE_SERVICE_UUID);
  adv->addServiceUUID(RESILNET_OTA_SERVICE_UUID);
  adv->setName(NODE_ADV_NAME);
  adv->start();
  Serial.println("[BLE] Mule + OTA advertising");
}

#endif  // NODE_TYPE_STANDALONE

#if defined(NODE_TYPE_LORA_GATEWAY)
#include "ble_manager.h"
#include "gateway_control.h"
#include "gateway_radio.h"
#include "halow_manager.h"
#include "lora_manager.h"
#include "lora_store_forward.h"
#include "packet.h"
#include "transport_router.h"
#include "wifi_udp_bridge.h"

static void onLoraRxGateway(const ResilNetRadioPacket& pkt, void* /*user*/) {
  transportForwardFromLora(pkt);
}

#if HALOW_ENABLE
static void onHalowRxGateway(const ResilNetRadioPacket& pkt, void* /*user*/) {
  transportForwardFromHalow(pkt);
}
#endif

#if LORA_HEARTBEAT_ENABLE
static void taskGatewayHeartbeat(void* /*arg*/) {
  Serial.println("[Gateway] TaskHeartbeat started");
  while (true) {
    vTaskDelay(pdMS_TO_TICKS(LORA_HEARTBEAT_INTERVAL_MS));

    ResilNetRadioPacket hb{};
    resilnet_build_heartbeat(hb, lora().readBatteryPercent());
    // บันทึก id ตัวเองกันสับสนถ้ามี echo — node อื่นไม่ relay heartbeat อยู่แล้ว
    lora().dedupCheckAndRegister(hb.packet_id);
    Serial.println("[Gateway] sending heartbeat");
    lora().enqueueTx(hb);
  }
}
#endif

static void setupGateway() {
  gatewayRadio().begin();
#if HALOW_ENABLE
  if (halow().begin()) {
    halow().setRxCallback(onHalowRxGateway, nullptr);
    halow().startTasks();
    Serial.println("[Gateway] HaLow stub enabled (HALOW_ENABLE=1)");
  }
#endif
  if (!lora().begin()) {
    Serial.println("[FATAL] LoRa init failed");
    while (true) delay(1000);
  }
#if LORA_SNF_ENABLE
  if (!loraStoreForward().begin()) {
    Serial.println("[WARN] SnF init failed — store-and-forward disabled");
  }
#endif
  lora().setRxCallback(onLoraRxGateway, nullptr);
  lora().startTasks();
  if (!bleGateway().begin()) {
    Serial.println("[FATAL] BLE gateway failed");
    while (true) delay(1000);
  }
  bleGateway().startTask();
  if (!wifiUdpBridge().begin()) {
    Serial.println("[WARN] Wi-Fi SoftAP failed — BLE+LoRa only");
  } else {
    wifiUdpBridge().startTask();
  }
  gatewayBroadcastCaps();

#if LORA_HEARTBEAT_ENABLE
  xTaskCreatePinnedToCore(taskGatewayHeartbeat, "TaskHeartbeat",
                          TASK_HEARTBEAT_STACK, nullptr, TASK_HEARTBEAT_PRIO,
                          nullptr, 0);
#endif

#if LORA_MESH_RELAY_ENABLE
  Serial.println("[Gateway] LoRa mesh relay: ON");
#else
  Serial.println("[Gateway] LoRa mesh relay: OFF");
#endif
}
#endif

void setup() {
  Serial.begin(115200);
  delay(500);

  OtaManager::instance().confirmBootOrRollback();

#if defined(NODE_TYPE_LORA_GATEWAY)
  Serial.println("\n=== ResilNet ESP32 LoRa GATEWAY + OTA ===");
  setupGateway();
#else
  Serial.println("\n=== ResilNet ESP32 Mule + OTA ===");
  if (!gStore.begin()) Serial.println("[Store] Init failed");
  if (!gAckStore.begin()) Serial.println("[ACK] Init failed");
  gStore.purgeExpired(millis());
  gAckStore.purgeExpired(millis());
  setupMuleBle();
#endif
}

void loop() {
#if defined(NODE_TYPE_STANDALONE)
  static unsigned long lastPurge = 0;
  if (millis() - lastPurge > 3600000UL) {
    gStore.purgeExpired(millis());
    gAckStore.purgeExpired(millis());
    lastPurge = millis();
  }
#endif
  delay(200);
}

#include "ble_manager.h"

#if defined(NODE_TYPE_LORA_GATEWAY)

#include <NimBLEDevice.h>
#include <esp_mac.h>

#include "config.h"
#include "lora_manager.h"
#include "lora_store_forward.h"
#include "ota_ble_service.h"
#include "ota_config.h"
#include "transport_router.h"
#include "wifi_udp_bridge.h"

static BleGatewayManager s_ble;
static NimBLEServer* s_server = nullptr;
static NimBLECharacteristic* s_txChar = nullptr;

BleGatewayManager& bleGateway() { return s_ble; }

static String gatewayDeviceName() {
  uint8_t mac[6];
  esp_read_mac(mac, ESP_MAC_BT);
  char buf[32];
  snprintf(buf, sizeof(buf), "ResilNet-Gateway-%02X%02X", mac[4], mac[5]);
  return String(buf);
}

class RxCallbacks : public NimBLECharacteristicCallbacks {
  void onWrite(NimBLECharacteristic* c, NimBLEConnInfo& info) override {
    const std::string& value = c->getValue();
    if (value.size() < 19) {
      Serial.println("[BLE] write too short");
      return;
    }

    ResilNetRadioPacket pkt{};
    memcpy(pkt.packet_id, value.data(), 16);
    pkt.ttl = (uint8_t)value[16];
    pkt.payload_len = (uint16_t)value[17] | ((uint16_t)value[18] << 8);
    if (pkt.payload_len > sizeof(pkt.payload)) {
      Serial.println("[BLE] payload_len invalid");
      return;
    }
    if (value.size() < 19 + pkt.payload_len) {
      Serial.println("[BLE] truncated payload");
      return;
    }
    memcpy(pkt.payload, value.data() + 19, pkt.payload_len);

    Serial.printf("[BLE] RX from phone ttl=%u len=%u → LoRa TX\n", pkt.ttl,
                  pkt.payload_len);
    transportForwardFromPhone(pkt);
  }
};

bool BleGatewayManager::begin() {
  const String name = gatewayDeviceName();
  NimBLEDevice::init(name.c_str());
  NimBLEDevice::setPower(ESP_PWR_LVL_P9);
  setupServer();

  NimBLEAdvertising* adv = NimBLEDevice::getAdvertising();
  adv->addServiceUUID(RESILNET_LORA_SERVICE_UUID);
  adv->addServiceUUID(RESILNET_OTA_SERVICE_UUID);
  adv->setName(name.c_str());
  NimBLEDevice::startAdvertising();
  Serial.printf("[BLE] Gateway advertising as %s\n", name.c_str());
  return true;
}

void BleGatewayManager::setupServer() {
  auto* server = NimBLEDevice::createServer();
  s_server = server;
  auto* service = server->createService(RESILNET_LORA_SERVICE_UUID);

  auto* info = service->createCharacteristic(
      RESILNET_LORA_INFO_CHAR_UUID, NIMBLE_PROPERTY::READ);
  // "mesh":1 = รองรับ LoRa multi-hop relay — client เก่ามองข้าม field ที่ไม่รู้จัก
#if LORA_MESH_RELAY_ENABLE
  info->setValue("{\"role\":\"gateway\",\"proto\":1,\"ota\":1,\"mesh\":1}");
#else
  info->setValue("{\"role\":\"gateway\",\"proto\":1,\"ota\":1,\"mesh\":0}");
#endif

  auto* rx = service->createCharacteristic(
      RESILNET_LORA_RX_CHAR_UUID,
      NIMBLE_PROPERTY::WRITE | NIMBLE_PROPERTY::WRITE_NR);
  rx->setCallbacks(new RxCallbacks());

  s_txChar = service->createCharacteristic(
      RESILNET_LORA_TX_CHAR_UUID, NIMBLE_PROPERTY::NOTIFY);

  service->start();
  OtaBleService::instance().attach(server);
}

void BleGatewayManager::notifyPacketToPhone(const ResilNetRadioPacket& pkt) {
  if (!s_txChar) return;

  uint8_t buf[19 + sizeof(pkt.payload)];
  size_t idx = 0;
  memcpy(buf + idx, pkt.packet_id, 16);
  idx += 16;
  buf[idx++] = pkt.ttl;
  buf[idx++] = (uint8_t)(pkt.payload_len & 0xFF);
  buf[idx++] = (uint8_t)((pkt.payload_len >> 8) & 0xFF);
  memcpy(buf + idx, pkt.payload, pkt.payload_len);
  idx += pkt.payload_len;

  s_txChar->setValue(buf, idx);
  s_txChar->notify();
  Serial.printf("[BLE] notify phone len=%u\n", (unsigned)idx);
}

bool BleGatewayManager::phoneConnected() const {
  return s_server && s_server->getConnectedCount() > 0;
}

void BleGatewayManager::taskBle(void* arg) {
  (void)arg;
  while (true) {
    vTaskDelay(pdMS_TO_TICKS(1000));

#if LORA_SNF_ENABLE
    // Replay คิว store-and-forward เมื่อมี client กลับมาเชื่อมต่อ
    // (poll ทุก 1 วิ — หลัง connect phone มีเวลา subscribe notify ก่อน)
    if (!s_ble.phoneConnected() && !wifiUdpBridge().hasStations()) continue;

    ResilNetRadioPacket pkt;
    size_t replayed = 0;
    while (loraStoreForward().popOldest(pkt)) {
      s_ble.notifyPacketToPhone(pkt);
      wifiUdpBridge().broadcastPacket(pkt);
      replayed++;
      vTaskDelay(pdMS_TO_TICKS(LORA_SNF_REPLAY_GAP_MS));
    }
    if (replayed > 0) {
      Serial.printf("[SnF] replayed %u packet(s) to client\n",
                    (unsigned)replayed);
    }
#endif
  }
}

void BleGatewayManager::startTask() {
  xTaskCreatePinnedToCore(taskBle, "TaskBLE", TASK_BLE_STACK, this, TASK_BLE_PRIO,
                          nullptr, 0);
}

#endif  // NODE_TYPE_LORA_GATEWAY

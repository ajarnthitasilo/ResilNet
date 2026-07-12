#include "ota_ble_service.h"

#include <ArduinoJson.h>
#include <NimBLEDevice.h>

#include <cstring>

#include "ota_config.h"
#include "ota_manager.h"

OtaBleService& OtaBleService::instance() {
  static OtaBleService s;
  return s;
}

uint32_t OtaBleService::parseHexU32(const char* hex) {
  if (!hex) return 0;
  uint32_t v = 0;
  sscanf(hex, "%lx", &v);
  return v;
}

void OtaBleService::notifyJson(const char* json) {
  if (_controlChar && json) {
    _controlChar->setValue(json);
    _controlChar->notify();
  }
}

void OtaBleService::replyAck(const char* stage, int seq) {
  StaticJsonDocument<128> doc;
  doc["op"] = "ack";
  doc["stage"] = stage;
  doc["seq"] = seq;
  String out;
  serializeJson(doc, out);
  notifyJson(out.c_str());
}

void OtaBleService::replyError(const char* msg) {
  StaticJsonDocument<192> doc;
  doc["op"] = "error";
  doc["msg"] = msg;
  String out;
  serializeJson(doc, out);
  notifyJson(out.c_str());
}

void OtaBleService::replyProgress(size_t received, size_t total) {
  StaticJsonDocument<128> doc;
  doc["op"] = "progress";
  doc["received"] = received;
  doc["total"] = total;
  String out;
  serializeJson(doc, out);
  notifyJson(out.c_str());
}

class OtaControlCallbacks : public NimBLECharacteristicCallbacks {
  void onWrite(NimBLECharacteristic* c, NimBLEConnInfo& info) override {
    OtaBleService::instance().handleControlWrite(c->getValue());
  }
};

class OtaDataCallbacks : public NimBLECharacteristicCallbacks {
  void onWrite(NimBLECharacteristic* c, NimBLEConnInfo& info) override {
    OtaBleService::instance().handleDataWrite(c->getValue());
  }
};

void OtaBleService::handleControlWrite(const std::string& value) {
  JsonDocument doc;
  if (deserializeJson(doc, value.c_str())) {
    replyError("invalid json");
    return;
  }

  const char* op = doc["op"] | "";
  auto& ota = OtaManager::instance();

  if (strcmp(op, "begin") == 0) {
    const size_t size = doc["size"] | 0;
    const char* crcHex = doc["crc32"] | "";
    const char* md5Hex = doc["md5"] | "";
    const uint32_t crc = parseHexU32(crcHex);

    ota.setProgressCallback([this](size_t rx, size_t total) {
      static size_t lastNotify = 0;
      if (rx - lastNotify >= OTA_PROGRESS_NOTIFY_EVERY || rx == total) {
        lastNotify = rx;
        replyProgress(rx, total);
      }
    });

    if (!ota.beginSession(size, crc, md5Hex)) {
      replyError("begin failed");
      return;
    }
    replyAck("begin");
    return;
  }

  if (strcmp(op, "commit") == 0) {
    if (!ota.isActive()) {
      replyError("no active session");
      return;
    }
    replyAck("commit");
    if (!ota.commit()) {
      replyError("commit failed");
    }
    return;
  }

  if (strcmp(op, "abort") == 0) {
    ota.abort();
    replyAck("abort");
    return;
  }

  if (strcmp(op, "rollback") == 0) {
    replyAck("rollback");
    ota.rollbackToPrevious();
    return;
  }

  replyError("unknown op");
}

void OtaBleService::handleDataWrite(const std::string& value) {
  if (value.empty()) return;
  auto& ota = OtaManager::instance();
  if (!ota.isActive()) {
    replyError("no session");
    return;
  }
  if (value.size() > OTA_CHUNK_SIZE_MAX) {
    replyError("chunk too large");
    ota.abort();
    return;
  }
  if (!ota.writeChunk(reinterpret_cast<const uint8_t*>(value.data()),
                      value.size())) {
    replyError("write failed");
  }
}

void OtaBleService::attach(NimBLEServer* server) {
  if (!server) return;

  auto* service = server->createService(RESILNET_OTA_SERVICE_UUID);

  _controlChar = service->createCharacteristic(
      RESILNET_OTA_CONTROL_CHAR_UUID,
      NIMBLE_PROPERTY::WRITE | NIMBLE_PROPERTY::NOTIFY);
  _controlChar->setCallbacks(new OtaControlCallbacks());

  _dataChar = service->createCharacteristic(
      RESILNET_OTA_DATA_CHAR_UUID,
      NIMBLE_PROPERTY::WRITE | NIMBLE_PROPERTY::WRITE_NR);
  _dataChar->setCallbacks(new OtaDataCallbacks());

  service->start();
  Serial.println("[OTA] BLE service attached");
}

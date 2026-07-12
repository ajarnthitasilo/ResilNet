#pragma once

#include <Arduino.h>

class NimBLEServer;
class NimBLECharacteristic;

/// NimBLE GATT service สำหรับ BLE OTA
class OtaBleService {
 public:
  static OtaBleService& instance();

  /// เพิ่ม OTA service บน server ที่มีอยู่ (เรียกหลัง createServer)
  void attach(NimBLEServer* server);

  void handleControlWrite(const std::string& value);
  void handleDataWrite(const std::string& value);

  /// ส่ง JSON status ไปยังมือถือ (notify บน control char)
  void notifyJson(const char* json);

 private:
  OtaBleService() = default;

  NimBLECharacteristic* _controlChar = nullptr;
  NimBLECharacteristic* _dataChar = nullptr;

  void replyAck(const char* stage, int seq = 0);
  void replyError(const char* msg);
  void replyProgress(size_t received, size_t total);

  static uint32_t parseHexU32(const char* hex);
};

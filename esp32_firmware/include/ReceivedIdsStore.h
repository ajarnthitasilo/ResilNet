#pragma once

#include <LittleFS.h>
#include <ArduinoJson.h>
#include <set>
#include <vector>

// เก็บรายการ Message IDs ที่ ESP32 "รับและบันทึกแล้ว" (ACK) แบบ Local-only บน LittleFS
//
// ใช้เพื่อให้มือถืออัปเดตสถานะข้อความเป็น Delivered เมื่อเจอ ID ในรายการ ACK
class ReceivedIdsStore {
 public:
  explicit ReceivedIdsStore(const char* path) : _path(path) {}

  bool begin();
  bool add(const String& id, long receivedAtMs);
  std::vector<String> allIds() const;
  void purgeExpired(long nowMs);

 private:
  bool load();
  bool persist() const;

  struct Entry {
    String id;
    long receivedAtMs;
  };

  const char* _path;
  std::vector<Entry> _entries;
};


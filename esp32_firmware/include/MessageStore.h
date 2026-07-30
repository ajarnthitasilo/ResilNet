#pragma once

#include <ArduinoJson.h>
#include <LittleFS.h>
#include <vector>
#include <set>
#include <string>

// โครงสร้างข้อความที่เก็บบน ESP32 (Store-and-Forward Queue) — v2
struct StoredMessage {
  String id;
  String sender;
  long timestamp = 0;
  // เวลาที่ ESP32 รับและบันทึกข้อความ (millis) สำหรับ TTL purge
  long receivedAtMs = 0;
  // "direct" | "bulletin" (public plaintext+signed) | "broadcast" (legacy)
  String type = "broadcast";
  String payload;
  String signedPayload;
  String signature;
  String encryptedKey;
  double lat = 0;
  double lon = 0;
  double radiusM = 0;
  bool hasLocation = false;
  String senderName;
  String receiverId;
  int ttl = 5;
};

class MessageStore {
 public:
  bool begin();
  bool exists(const String& id) const;
  bool save(const StoredMessage& msg);
  std::vector<String> allIds() const;
  std::vector<StoredMessage> messagesNotIn(const std::set<String>& knownIds) const;
  void purgeExpired(long nowMs);

 private:
  bool loadIndex();
  bool persistIndex();
  std::vector<StoredMessage> _messages;
};

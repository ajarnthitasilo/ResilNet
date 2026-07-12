#pragma once

#include <ArduinoJson.h>
#include "MessageStore.h"

// โปรโตคอลซิงก์ v2 — รองรับ emergency broadcast (signed_payload + geofence)
#define MULE_PROTOCOL_VERSION 2

// จำกัด batch เมื่อมี signed_payload ขนาดใหญ่ (BLE MTU)
#define MULE_PULL_MAX_BATCH 2

inline void muleWriteToJson(JsonObject o, const StoredMessage& m) {
  o["id"] = m.id;
  o["sender"] = m.sender;
  o["timestamp"] = m.timestamp;
  o["ttl"] = m.ttl;
  o["type"] = m.type.isEmpty() ? "broadcast" : m.type;
  o["payload"] = m.payload;
  if (!m.signedPayload.isEmpty()) o["signed_payload"] = m.signedPayload;
  if (!m.signature.isEmpty()) o["signature"] = m.signature;
  if (!m.encryptedKey.isEmpty()) o["encrypted_key"] = m.encryptedKey;
  if (m.hasLocation) {
    o["lat"] = m.lat;
    o["lon"] = m.lon;
    o["radius_m"] = m.radiusM;
  }
  if (!m.senderName.isEmpty()) o["sender_name"] = m.senderName;
  if (!m.receiverId.isEmpty()) o["receiver_id"] = m.receiverId;
}

inline void muleReadFromJson(JsonObject o, StoredMessage& m) {
  m.id = o["id"].as<String>();
  m.sender = o["sender"].as<String>();
  m.timestamp = o["timestamp"] | 0L;
  m.ttl = o["ttl"] | 5;
  m.type = o["type"] | "broadcast";
  m.payload = o["payload"] | "";
  m.signedPayload = o["signed_payload"] | "";
  m.signature = o["signature"] | "";
  m.encryptedKey = o["encrypted_key"] | "";
  m.senderName = o["sender_name"] | "";
  m.receiverId = o["receiver_id"] | "";
  if (!o["lat"].isNull() && !o["lon"].isNull() && !o["radius_m"].isNull()) {
    m.lat = o["lat"] | 0.0;
    m.lon = o["lon"] | 0.0;
    m.radiusM = o["radius_m"] | 0.0;
    m.hasLocation = true;
  } else {
    m.hasLocation = false;
  }
}

inline void muleWritePersist(JsonDocument& doc, const StoredMessage& m) {
  doc["id"] = m.id;
  doc["sender"] = m.sender;
  doc["timestamp"] = m.timestamp;
  doc["ra"] = m.receivedAtMs;
  doc["ttl"] = m.ttl;
  doc["ty"] = m.type;
  doc["payload"] = m.payload;
  if (!m.signedPayload.isEmpty()) doc["sp"] = m.signedPayload;
  if (!m.signature.isEmpty()) doc["sig"] = m.signature;
  if (!m.encryptedKey.isEmpty()) doc["ek"] = m.encryptedKey;
  if (m.hasLocation) {
    doc["lat"] = m.lat;
    doc["lon"] = m.lon;
    doc["rad"] = m.radiusM;
  }
  if (!m.senderName.isEmpty()) doc["sn"] = m.senderName;
  if (!m.receiverId.isEmpty()) doc["rid"] = m.receiverId;
}

inline void muleReadPersist(JsonDocument& doc, StoredMessage& m) {
  m.id = doc["id"].as<String>();
  m.sender = doc["sender"].as<String>();
  m.timestamp = doc["timestamp"] | 0L;
  m.receivedAtMs = doc["ra"] | 0L;
  m.ttl = doc["ttl"] | 5;
  m.type = doc["ty"] | "broadcast";
  m.payload = doc["payload"] | "";
  m.signedPayload = doc["sp"] | "";
  m.signature = doc["sig"] | "";
  m.encryptedKey = doc["ek"] | "";
  m.senderName = doc["sn"] | "";
  m.receiverId = doc["rid"] | "";
  if (!doc["lat"].isNull() && !doc["lon"].isNull() && !doc["rad"].isNull()) {
    m.lat = doc["lat"] | 0.0;
    m.lon = doc["lon"] | 0.0;
    m.radiusM = doc["rad"] | 0.0;
    m.hasLocation = true;
  } else {
    m.hasLocation = false;
  }
}

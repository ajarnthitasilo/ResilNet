#include "MessageStore.h"
#include "config.h"
#include "MuleProtocol.h"

bool MessageStore::begin() {
  if (!LittleFS.begin(true)) {
    Serial.println("[Store] LittleFS mount failed");
    return false;
  }
  return loadIndex();
}

bool MessageStore::loadIndex() {
  _messages.clear();
  if (!LittleFS.exists(MESSAGE_DATA_PATH)) return true;

  File f = LittleFS.open(MESSAGE_DATA_PATH, "r");
  if (!f) return false;

  while (f.available()) {
    String line = f.readStringUntil('\n');
    line.trim();
    if (line.isEmpty()) continue;

    StaticJsonDocument<4096> doc;
    if (deserializeJson(doc, line)) continue;

    StoredMessage m;
    muleReadPersist(doc, m);
    if (!m.id.isEmpty()) _messages.push_back(m);
  }
  f.close();
  Serial.printf("[Store] Loaded %u messages\n", (unsigned)_messages.size());
  return true;
}

bool MessageStore::persistIndex() {
  File f = LittleFS.open(MESSAGE_DATA_PATH, "w");
  if (!f) return false;

  for (const auto& m : _messages) {
    StaticJsonDocument<4096> doc;
    muleWritePersist(doc, m);
    serializeJson(doc, f);
    f.print('\n');
  }
  f.close();
  return true;
}

bool MessageStore::exists(const String& id) const {
  for (const auto& m : _messages) {
    if (m.id == id) return true;
  }
  return false;
}

bool MessageStore::save(const StoredMessage& msg) {
  if (msg.id.isEmpty()) return false;
  if (exists(msg.id)) return false; // ป้องกันบันทึกซ้ำ

  _messages.push_back(msg);
  return persistIndex();
}

std::vector<String> MessageStore::allIds() const {
  std::vector<String> ids;
  ids.reserve(_messages.size());
  for (const auto& m : _messages) ids.push_back(m.id);
  return ids;
}

std::vector<StoredMessage> MessageStore::messagesNotIn(const std::set<String>& knownIds) const {
  std::vector<StoredMessage> out;
  for (const auto& m : _messages) {
    if (knownIds.find(m.id) == knownIds.end()) out.push_back(m);
  }
  return out;
}

void MessageStore::purgeExpired(long nowMs) {
  std::vector<StoredMessage> kept;
  for (const auto& m : _messages) {
    // ลบข้อความที่เก่ากว่า 7 วัน
    if (m.receivedAtMs == 0) {
      // ข้อมูลเก่าที่ไม่มี receivedAtMs: เก็บไว้ก่อนเพื่อความปลอดภัย
      kept.push_back(m);
      continue;
    }
    if (nowMs - m.receivedAtMs <= MESSAGE_TTL_MS) kept.push_back(m);
  }
  if (kept.size() != _messages.size()) {
    _messages = std::move(kept);
    persistIndex();
    Serial.println("[Store] Purged expired messages");
  }
}

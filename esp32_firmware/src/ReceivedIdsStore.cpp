#include "ReceivedIdsStore.h"
#include "config.h"

bool ReceivedIdsStore::begin() {
  if (!LittleFS.begin(true)) return false;
  return load();
}

bool ReceivedIdsStore::load() {
  _entries.clear();
  if (!LittleFS.exists(_path)) return true;

  File f = LittleFS.open(_path, "r");
  if (!f) return false;

  while (f.available()) {
    String line = f.readStringUntil('\n');
    line.trim();
    if (line.isEmpty()) continue;

    StaticJsonDocument<256> doc;
    if (deserializeJson(doc, line)) continue;
    Entry e;
    e.id = doc["id"].as<String>();
    e.receivedAtMs = doc["ra"] | 0L;
    if (!e.id.isEmpty()) _entries.push_back(e);
  }
  f.close();
  return true;
}

bool ReceivedIdsStore::persist() const {
  File f = LittleFS.open(_path, "w");
  if (!f) return false;
  for (const auto& e : _entries) {
    StaticJsonDocument<256> doc;
    doc["id"] = e.id;
    doc["ra"] = e.receivedAtMs;
    serializeJson(doc, f);
    f.print('\n');
  }
  f.close();
  return true;
}

bool ReceivedIdsStore::add(const String& id, long receivedAtMs) {
  if (id.isEmpty()) return false;
  for (const auto& e : _entries) {
    if (e.id == id) return false;  // กันซ้ำ
  }
  _entries.push_back(Entry{.id = id, .receivedAtMs = receivedAtMs});
  return persist();
}

std::vector<String> ReceivedIdsStore::allIds() const {
  std::vector<String> ids;
  ids.reserve(_entries.size());
  for (const auto& e : _entries) ids.push_back(e.id);
  return ids;
}

void ReceivedIdsStore::purgeExpired(long nowMs) {
  std::vector<Entry> kept;
  kept.reserve(_entries.size());
  for (const auto& e : _entries) {
    if (e.receivedAtMs == 0) {
      kept.push_back(e);
      continue;
    }
    if (nowMs - e.receivedAtMs <= MESSAGE_TTL_MS) kept.push_back(e);
  }
  if (kept.size() != _entries.size()) {
    _entries = std::move(kept);
    persist();
  }
}


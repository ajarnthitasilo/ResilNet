#include "ota_manager.h"

#include <MD5Builder.h>
#include <esp_ota_ops.h>
#include <esp_partition.h>
#include <esp_system.h>

#include <cstring>
#include <memory>

OtaManager::OtaManager() = default;

OtaManager::~OtaManager() {
  delete static_cast<MD5Builder*>(_md5Builder);
  _md5Builder = nullptr;
}

OtaManager& OtaManager::instance() {
  static OtaManager s;
  return s;
}

uint32_t OtaManager::crc32Update(uint32_t crc, const uint8_t* data, size_t len) {
  crc = ~crc;
  for (size_t i = 0; i < len; i++) {
    crc ^= data[i];
    for (int bit = 0; bit < 8; bit++) {
      const uint32_t mask = -(crc & 1u);
      crc = (crc >> 1) ^ (0xEDB88320u & mask);
    }
  }
  return ~crc;
}

uint32_t OtaManager::crc32Finish(uint32_t crc) { return crc; }

void OtaManager::confirmBootOrRollback() {
  const esp_partition_t* running = esp_ota_get_running_partition();
  if (!running) return;

  esp_ota_img_states_t state;
  if (esp_ota_get_state_partition(running, &state) != ESP_OK) return;

  if (state == ESP_OTA_IMG_PENDING_VERIFY) {
    Serial.println("[OTA] Pending verify — validating boot");
    const esp_err_t err = esp_ota_mark_app_valid_cancel_rollback();
    if (err == ESP_OK) {
      Serial.println("[OTA] Firmware marked valid");
    } else {
      Serial.printf("[OTA] mark valid failed: %d — rollback\n", (int)err);
      esp_ota_mark_app_invalid_rollback_and_reboot();
    }
  }
}

void OtaManager::resetSession() {
  _active = false;
  _expectedSize = 0;
  _received = 0;
  _expectedCrc32 = 0;
  _expectedMd5[0] = '\0';
  _runningCrc32 = 0;
  _wantMd5 = false;
  delete static_cast<MD5Builder*>(_md5Builder);
  _md5Builder = nullptr;
  _otaHandle = nullptr;
  _updatePartition = nullptr;
}

bool OtaManager::beginSession(size_t expectedSize, uint32_t expectedCrc32,
                              const char* expectedMd5Hex) {
  if (_active) abort();
  if (expectedSize == 0) return false;

  _updatePartition = esp_ota_get_next_update_partition(nullptr);
  if (!_updatePartition) {
    Serial.println("[OTA] No OTA partition");
    return false;
  }

  esp_ota_handle_t handle = 0;
  const esp_err_t err = esp_ota_begin(
      static_cast<const esp_partition_t*>(_updatePartition),
      OTA_SIZE_UNKNOWN, &handle);
  if (err != ESP_OK) {
    Serial.printf("[OTA] esp_ota_begin failed: %d\n", (int)err);
    return false;
  }

  _otaHandle = reinterpret_cast<void*>(static_cast<uintptr_t>(handle));
  _expectedSize = expectedSize;
  _expectedCrc32 = expectedCrc32;
  _wantMd5 = expectedMd5Hex && strlen(expectedMd5Hex) == 32;
  if (_wantMd5) {
    strncpy(_expectedMd5, expectedMd5Hex, sizeof(_expectedMd5) - 1);
    _md5Builder = new MD5Builder();
    static_cast<MD5Builder*>(_md5Builder)->begin();
  }
  _runningCrc32 = 0;
  _received = 0;
  _active = true;

  Serial.printf("[OTA] begin size=%u crc32=%08lx\n", (unsigned)expectedSize,
                (unsigned long)expectedCrc32);
  return true;
}

bool OtaManager::writeChunk(const uint8_t* data, size_t len) {
  if (!_active || !_otaHandle || !data || len == 0) return false;
  if (_received + len > _expectedSize) {
    Serial.println("[OTA] chunk overflow");
    return false;
  }

  const esp_ota_handle_t handle =
      static_cast<esp_ota_handle_t>(reinterpret_cast<uintptr_t>(_otaHandle));
  if (esp_ota_write(handle, data, len) != ESP_OK) {
    abort();
    return false;
  }

  _runningCrc32 = crc32Update(_runningCrc32, data, len);
  if (_wantMd5 && _md5Builder) {
    static_cast<MD5Builder*>(_md5Builder)->add(
        const_cast<uint8_t*>(data), len);
  }
  _received += len;
  notifyProgress();
  return true;
}

void OtaManager::notifyProgress() {
  if (_progress) _progress(_received, _expectedSize);
}

bool OtaManager::verifyChecksums() {
  const uint32_t actualCrc = crc32Finish(_runningCrc32);
  if (actualCrc != _expectedCrc32) {
    Serial.printf("[OTA] CRC32 mismatch exp=%08lx got=%08lx\n",
                  (unsigned long)_expectedCrc32, (unsigned long)actualCrc);
    return false;
  }

  if (_wantMd5 && _md5Builder) {
    auto* md5 = static_cast<MD5Builder*>(_md5Builder);
    md5->calculate();
    const String actual = md5->toString();
    if (!actual.equalsIgnoreCase(_expectedMd5)) {
      Serial.printf("[OTA] MD5 mismatch exp=%s got=%s\n", _expectedMd5,
                    actual.c_str());
      return false;
    }
  }
  return true;
}

bool OtaManager::commit() {
  if (!_active || !_otaHandle || !_updatePartition) return false;
  if (_received != _expectedSize) {
    abort();
    return false;
  }
  if (!verifyChecksums()) {
    abort();
    return false;
  }

  const esp_ota_handle_t handle =
      static_cast<esp_ota_handle_t>(reinterpret_cast<uintptr_t>(_otaHandle));
  if (esp_ota_end(handle) != ESP_OK) {
    resetSession();
    return false;
  }
  _otaHandle = nullptr;

  if (esp_ota_set_boot_partition(
          static_cast<const esp_partition_t*>(_updatePartition)) != ESP_OK) {
    resetSession();
    return false;
  }

  Serial.println("[OTA] commit — reboot");
  resetSession();
  delay(200);
  esp_restart();
  return true;
}

void OtaManager::abort() {
  if (_otaHandle) {
    const esp_ota_handle_t handle =
        static_cast<esp_ota_handle_t>(reinterpret_cast<uintptr_t>(_otaHandle));
    esp_ota_abort(handle);
  }
  Serial.println("[OTA] aborted");
  resetSession();
}

bool OtaManager::rollbackToPrevious() {
  const esp_partition_t* running = esp_ota_get_running_partition();
  const esp_partition_t* other = esp_ota_get_next_update_partition(running);
  if (!other) return false;
  if (esp_ota_set_boot_partition(other) != ESP_OK) return false;
  Serial.println("[OTA] rollback reboot");
  delay(200);
  esp_restart();
  return true;
}

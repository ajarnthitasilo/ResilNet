#pragma once

#include <Arduino.h>
#include <functional>

/// จัดการ ESP-IDF OTA partition, CRC32/MD5, rollback
class OtaManager {
 public:
  using ProgressFn = std::function<void(size_t received, size_t total)>;

  static OtaManager& instance();

  void confirmBootOrRollback();

  bool beginSession(size_t expectedSize, uint32_t expectedCrc32, const char* expectedMd5Hex);
  bool writeChunk(const uint8_t* data, size_t len);
  bool commit();
  void abort();
  bool rollbackToPrevious();

  bool isActive() const { return _active; }
  size_t receivedBytes() const { return _received; }
  size_t expectedSize() const { return _expectedSize; }

  void setProgressCallback(ProgressFn fn) { _progress = std::move(fn); }

  static uint32_t crc32Update(uint32_t crc, const uint8_t* data, size_t len);
  static uint32_t crc32Finish(uint32_t crc);

 private:
  OtaManager();
  ~OtaManager();

  void resetSession();
  bool verifyChecksums();
  void notifyProgress();

  bool _active = false;
  size_t _expectedSize = 0;
  size_t _received = 0;
  uint32_t _expectedCrc32 = 0;
  char _expectedMd5[33] = {};
  uint32_t _runningCrc32 = 0;
  bool _wantMd5 = false;
  void* _md5Builder = nullptr;

  void* _otaHandle = nullptr;
  const void* _updatePartition = nullptr;

  ProgressFn _progress;
};

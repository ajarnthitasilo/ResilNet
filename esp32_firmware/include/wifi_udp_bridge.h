#pragma once

#include "packet.h"

#if defined(NODE_TYPE_LORA_GATEWAY)

#include <Arduino.h>
#include <WiFiUdp.h>

/// SoftAP + UDP server สำหรับแอป Flutter (พอร์ต WIFI_UDP_PORT)
class WifiUdpBridge {
 public:
  bool begin();
  void startTask();

  /// Broadcast แพ็กเก็ตไปยังมือถือทุกเครื่องบน SoftAP (UDP)
  void broadcastPacket(const ResilNetRadioPacket& pkt);

  bool isApActive() const { return _apActive; }

  /// มีสถานี Wi-Fi (มือถือ) เกาะ SoftAP อยู่หรือไม่
  bool hasStations() const;

  /// เรียกเมื่อมีสถานี Wi-Fi เชื่อมต่อ / ตัดการเชื่อมต่อ
  void onStationConnected();
  void onStationDisconnected();

  /// เรียกเมื่อมีกิจกรรม BLE (ปลุก SoftAP หลัง power-save)
  void onBleActivity();

 private:
  static void taskUdp(void* arg);
  void pollPowerSave();
  bool ensureApRunning();
  void stopSoftAp();
  bool parseUdpPayload(const uint8_t* data, size_t len, ResilNetRadioPacket& out);

  WiFiUDP _udp;
  bool _apActive = false;
  unsigned long _lastStationActivityMs = 0;
  unsigned long _apStoppedAtMs = 0;
};

WifiUdpBridge& wifiUdpBridge();

#endif  // NODE_TYPE_LORA_GATEWAY

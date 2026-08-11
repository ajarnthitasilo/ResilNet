#pragma once

#include "packet.h"

#if defined(NODE_TYPE_LORA_GATEWAY)

#include <Arduino.h>

/// BLE Server (NimBLE) — รับ/ส่ง ResilNetRadioPacket กับแอป Flutter
class BleGatewayManager {
 public:
  bool begin();
  void startTask();

  /// แจ้งแพ็กเก็ตที่รับจาก LoRa ไปยังมือถือ (Notification)
  void notifyPacketToPhone(const ResilNetRadioPacket& pkt);

  /// ส่ง RN_CAPS / control frame ผ่าน BLE notify
  void notifyControlFrame(const uint8_t* data, size_t len);

  /// มีมือถือเชื่อมต่อ BLE อยู่หรือไม่
  bool phoneConnected() const;

 private:
  static void taskBle(void* arg);
  void setupServer();
};

BleGatewayManager& bleGateway();

#endif  // NODE_TYPE_LORA_GATEWAY

#pragma once

#include "packet.h"

#if defined(NODE_TYPE_LORA_GATEWAY)

/// Multi-transport routing: BLE / Wi-Fi UDP / LoRa (+ optional cellular)

/// แพ็กเก็ตจาก LoRa → BLE + Wi-Fi UDP broadcast
void transportForwardFromLora(const ResilNetRadioPacket& pkt);

/// แพ็กเก็ตจาก Wi-Fi UDP → LoRa (และ cellular หากเปิดใช้)
void transportForwardFromUdp(const ResilNetRadioPacket& pkt);

/// แพ็กเก็ตจาก BLE (มือถือ) → LoRa (+ cellular)
void transportForwardFromPhone(const ResilNetRadioPacket& pkt);

#endif  // NODE_TYPE_LORA_GATEWAY

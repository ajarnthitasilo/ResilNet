#pragma once

#include <Arduino.h>
#include <cstring>

#include "config.h"

/// แพ็กเก็ตวิทยุไบนารี — สอดคล้องกับ MessagePacket (Rust) / hybrid_router
#pragma pack(push, 1)
struct ResilNetRadioPacket {
  uint8_t packet_id[16];   // UUID v4 (raw bytes)
  uint8_t ttl;             // Time-To-Live สำหรับ mesh/repeater
  uint16_t payload_len;    // ความยาว payload จริง (≤ 230)
  uint8_t payload[230];    // ข้อมูลเข้ารหัสดิบ
};
#pragma pack(pop)

static_assert(sizeof(ResilNetRadioPacket) == (16 + 1 + 2 + 230), "ResilNetRadioPacket size mismatch");

/// ขนาดเฟรมสูงสุดบนอากาศ: Magic(2) + struct + CRC16(2)
constexpr size_t RESILNET_RADIO_FRAME_MAX =
    2 + sizeof(ResilNetRadioPacket) + 2;

/// คำนวณ CRC16-CCITT (ตรวจความถูกต้องหลังรับ LoRa)
uint16_t resilnet_crc16(const uint8_t* data, size_t len);

/// แปลง struct → เฟรมไบนารี (พร้อม magic + CRC)
/// คืนความยาวเฟรม หรือ 0 ถ้า payload_len ไม่ถูกต้อง
size_t resilnet_encode_frame(const ResilNetRadioPacket& pkt, uint8_t* out, size_t out_cap);

/// ถอดเฟรมไบนารี → struct (ตรวจ magic + CRC)
/// คืน true ถ้าถูกต้อง
bool resilnet_decode_frame(const uint8_t* data, size_t len, ResilNetRadioPacket& out);

/// เปรียบเทียบ packet_id 16 ไบต์
bool resilnet_packet_id_equal(const uint8_t* a, const uint8_t* b);

/// คัดลอก packet_id
void resilnet_packet_id_copy(uint8_t* dst, const uint8_t* src);

/// สร้าง UUID v4 แบบง่าย (ใช้ esp_random)
void resilnet_generate_uuid_v4(uint8_t out[16]);

/// สร้าง Heartbeat packet สำหรับ repeater
void resilnet_build_heartbeat(ResilNetRadioPacket& pkt, uint8_t battery_pct);

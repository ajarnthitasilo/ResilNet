#pragma once

// Keep in sync with mobile_app pubspec version when cutting a firmware release.
#define RESILNET_FW_VERSION "1.9.49"

// UUID ต้องตรงกับ mobile_app/lib/core/resilnet_protocol.dart
#define RESILNET_NODE_SERVICE_UUID     "a1b2c3d4-e5f6-7890-abcd-ef1234567890"
#define RESILNET_NODE_SYNC_CHAR_UUID   "b2c3d4e5-f6a7-8901-bcde-f12345678901"
#define RESILNET_NODE_INFO_CHAR_UUID   "c3d4e5f6-a7b8-9012-cdef-123456789012"

// ไฟล์เก็บคิวข้อความบน LittleFS (Standalone Node)
#define MESSAGE_INDEX_PATH "/messages.idx"
#define MESSAGE_DATA_PATH  "/messages.dat"
#define RECEIVED_IDS_PATH  "/received_ids.dat"

#define MESSAGE_TTL_MS (7LL * 24 * 60 * 60 * 1000)

// Public bulletin (type "bulletin") — ประกาศสาธารณะยามวิกฤต เก็บสั้นกว่า
// เพื่อไม่ให้ประกาศเก่าค้างบน node นานเกินความจำเป็น
#define BULLETIN_TTL_MS (3LL * 24 * 60 * 60 * 1000)

#if defined(NODE_TYPE_LORA_GATEWAY)
#define NODE_ADV_NAME "RN-GW"
#else
#define NODE_ADV_NAME "RN-MULE"
#endif

// ─── LoRa Gateway (NODE_TYPE_LORA_GATEWAY) ─────────────────────────────────
#if defined(NODE_TYPE_LORA_GATEWAY)

#ifndef LORA_FREQ_HZ
#define LORA_FREQ_HZ 923500000UL
#endif

#define LORA_BW_KHZ       125.0
#define LORA_SF           9
#define LORA_CR           7
#define LORA_SYNC_WORD    0x12
#define LORA_TX_POWER_DBM 17
#define LORA_PREAMBLE_LEN 8
#define LORA_CRC_ON       true

#define LORA_PIN_NSS   18
#define LORA_PIN_DIO1  26
#define LORA_PIN_RST   23
#define LORA_PIN_BUSY  33
#define LORA_PIN_SCK   5
#define LORA_PIN_MISO  19
#define LORA_PIN_MOSI  27

#define TASK_LORA_RX_STACK   4096
#define TASK_LORA_TX_STACK   4096
#define TASK_BLE_STACK       6144
#define TASK_LORA_RX_PRIO    2
#define TASK_LORA_TX_PRIO    2
#define TASK_BLE_PRIO        1
#define LORA_TX_QUEUE_LEN    8

// ขยาย cache กัน relay ซ้ำเมื่อมี chunked transfer หลายชิ้นค้างอยู่ในอากาศ
// (64 × 16 ไบต์ = 1KB RAM)
#ifndef DEDUP_CACHE_SIZE
#define DEDUP_CACHE_SIZE     64
#endif

// ─── LoRa mesh relay (multi-hop) ────────────────────────────────────────────
/// 1 = gateway relay แพ็กเก็ต LoRa ต่อ (multi-hop mesh)
/// 0 = พฤติกรรมเดิมก่อน relay: bridge BLE/UDP ↔ LoRa อย่างเดียว
#ifndef LORA_MESH_RELAY_ENABLE
#define LORA_MESH_RELAY_ENABLE 1
#endif

/// Random jitter ก่อน relay — ลดการชนคลื่นเมื่อหลาย gateway ได้ยินแพ็กเก็ตเดียวกัน
#define LORA_RELAY_JITTER_MIN_MS  50
#define LORA_RELAY_JITTER_SPAN_MS 151  // สุ่มช่วง 50–200 ms

// ─── Relay safety caps ──────────────────────────────────────────────────────
// ย่านไทย AS923 (920–925 MHz ตามประกาศ กสทช.) — ใช้ airtime อย่างประหยัด:
// จำกัดจำนวน relay ต่อหน้าต่างเวลา กัน broadcast storm ตอนโหลดหนัก
// หมายเหตุ: จำกัดเฉพาะ *relay* — ทราฟฟิกที่ phone/UDP ของ node นี้ส่งเอง
// ไม่ถูกจำกัด เพื่อไม่กระทบพฤติกรรมเดิม
#define LORA_RELAY_WINDOW_MS      10000UL
#define LORA_RELAY_MAX_PER_WINDOW 20

/// เพดาน TTL ของแพ็กเก็ตที่ relay — กันแพ็กเก็ต TTL สูงผิดปกติ (บั๊ก/ปลอม)
/// วนอยู่ใน mesh นานเกินนโยบาย (สอดคล้อง RESILNET_DEFAULT_TTL)
#define LORA_RELAY_TTL_CAP (RESILNET_DEFAULT_TTL - 1)

// ─── LoRa store-and-forward (คิว RAM บน gateway) ────────────────────────────
/// 1 = เก็บแพ็กเก็ตที่รับจาก LoRa ขณะไม่มี phone/UDP client แล้ว replay
///     เมื่อ client กลับมาเชื่อมต่อ (opaque — ไม่แตะ E2EE payload)
/// 0 = พฤติกรรมเดิม: client ไม่อยู่ = แพ็กเก็ตหาย (best-effort notify)
#ifndef LORA_SNF_ENABLE
#define LORA_SNF_ENABLE 1
#endif
#define LORA_SNF_MAX_ENTRIES  32  // 32 × ~250B ≈ 8KB RAM
#define LORA_SNF_ENTRY_TTL_MS (30UL * 60UL * 1000UL)  // เก็บสูงสุด 30 นาที
#define LORA_SNF_REPLAY_GAP_MS 30  // เว้นช่วงระหว่าง replay กัน BLE ล้น

// ─── Gateway heartbeat (opt-in) ─────────────────────────────────────────────
/// 1 = ส่ง heartbeat "HB|<bat>" ทุก LORA_HEARTBEAT_INTERVAL_MS สำหรับดูสถานะ
/// mesh ผ่าน Serial ของ node ข้างเคียง — ปิดเป็นค่าเริ่มต้นเพื่อไม่กิน airtime
/// (heartbeat ไม่ถูก relay และแอปมองข้าม payload ที่ไม่รู้จักอยู่แล้ว)
#ifndef LORA_HEARTBEAT_ENABLE
#define LORA_HEARTBEAT_ENABLE 0
#endif
#define LORA_HEARTBEAT_INTERVAL_MS (5UL * 60UL * 1000UL)
#define TASK_HEARTBEAT_STACK 3072
#define TASK_HEARTBEAT_PRIO  1

#define RESILNET_LORA_SERVICE_UUID "d4e5f6a7-b8c9-4012-def0-123456789abc"
#define RESILNET_LORA_RX_CHAR_UUID "e5f6a7b8-c9d0-4123-ef01-23456789abcd"
#define RESILNET_LORA_TX_CHAR_UUID "f6a7b8c9-d0e1-4234-f012-3456789abcde"
#define RESILNET_LORA_INFO_CHAR_UUID "a7b8c9d0-e1f2-4345-0123-456789abcdef"

#define RESILNET_RADIO_MAGIC_HI 0x52
#define RESILNET_RADIO_MAGIC_LO 0x4E
#define RESILNET_DEFAULT_TTL 5

// ─── Wi-Fi SoftAP + UDP (Gateway) ───────────────────────────────────────────
#define WIFI_UDP_PORT 4210

/// ปิด SoftAP หลังไม่มีสถานีเกาะ Wi-Fi ต่อเนื่อง (มิลลิวินาที)
#define WIFI_AP_IDLE_TIMEOUT_MS (5UL * 60UL * 1000UL)

/// 1 = เปิด SoftAP ตลอด, 0 = ปิดอัตโนมัติเมื่อ idle (ดู WIFI_AP_IDLE_TIMEOUT_MS)
#ifndef WIFI_AP_ALWAYS_ON
#define WIFI_AP_ALWAYS_ON 0
#endif

/// รหัสผ่าน SoftAP (ว่าง = เปิด AP ไม่มีรหัสผ่าน)
#ifndef WIFI_AP_PASSWORD
#define WIFI_AP_PASSWORD ""
#endif

#define TASK_WIFI_UDP_STACK 4096
#define TASK_WIFI_UDP_PRIO  1

// ─── Wi‑Fi HaLow (optional gateway RF) ───────────────────────────────────────
/// 1 = compile HaLow manager + RN_CAPS bit; 0 = LoRa-only gateway (default)
#ifndef HALOW_ENABLE
#define HALOW_ENABLE 0
#endif

/// 1 = stub driver loopbacks TX→RX for switch testing without RF module
#ifndef HALOW_STUB_LOOPBACK
#define HALOW_STUB_LOOPBACK 1
#endif

#endif  // NODE_TYPE_LORA_GATEWAY

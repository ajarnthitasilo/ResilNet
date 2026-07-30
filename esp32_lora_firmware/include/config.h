#pragma once

#include <Arduino.h>

// Keep in sync with mobile_app pubspec version when cutting a firmware release.
#define RESILNET_FW_VERSION "1.9.44"

// ─── โหมดโหนด (กำหนดจาก platformio.ini) ───────────────────────────────────
// NODE_TYPE_LORA_GATEWAY      → Role A: BLE Server + LoRa Bridge
// NODE_TYPE_STANDALONE_REPEATER → Role B: LoRa Relay เท่านั้น

#if !defined(NODE_TYPE_LORA_GATEWAY) && !defined(NODE_TYPE_STANDALONE_REPEATER)
#error "กำหนด NODE_TYPE_LORA_GATEWAY หรือ NODE_TYPE_STANDALONE_REPEATER ใน build_flags"
#endif

// ─── LoRa Radio (RadioLib / SX1262 — ปรับขาได้ตามบอร์ดจริง) ───────────────
#ifndef LORA_FREQ_HZ
#define LORA_FREQ_HZ 923500000UL  // AS923 ช่วง 920–925 MHz (ค่าเริ่มต้น)
#endif

#define LORA_BW_KHZ       125.0
#define LORA_SF           9
#define LORA_CR           7       // 4/7
#define LORA_SYNC_WORD    0x12
#define LORA_TX_POWER_DBM 17
#define LORA_PREAMBLE_LEN 8
#define LORA_CRC_ON       true

// ขา SPI สำหรับโมดูล SX1262 (TTGO / Heltec — ปรับตามบอร์ด)
#define LORA_PIN_NSS   18
#define LORA_PIN_DIO1  26
#define LORA_PIN_RST   23
#define LORA_PIN_BUSY  33
#define LORA_PIN_SCK   5
#define LORA_PIN_MISO  19
#define LORA_PIN_MOSI  27

// ─── FreeRTOS Tasks ───────────────────────────────────────────────────────
#define TASK_LORA_RX_STACK   4096
#define TASK_LORA_TX_STACK   4096
#define TASK_BLE_STACK       6144
#define TASK_HEARTBEAT_STACK 2048

#define TASK_LORA_RX_PRIO    2
#define TASK_LORA_TX_PRIO    2
#define TASK_BLE_PRIO        1
#define TASK_HEARTBEAT_PRIO  1

#define LORA_TX_QUEUE_LEN    8

// ─── Deduplication ────────────────────────────────────────────────────────
#define DEDUP_CACHE_SIZE     20

// ─── Repeater Heartbeat ───────────────────────────────────────────────────
#define HEARTBEAT_INTERVAL_MS (5UL * 60UL * 1000UL)  // ทุก 5 นาที

// ─── BLE UUID (Gateway — แยกจาก ESP32 Mule เดิม) ─────────────────────────
#define RESILNET_LORA_SERVICE_UUID "d4e5f6a7-b8c9-4012-def0-123456789abc"
#define RESILNET_LORA_RX_CHAR_UUID "e5f6a7b8-c9d0-4123-ef01-23456789abcd"
#define RESILNET_LORA_TX_CHAR_UUID "f6a7b8c9-d0e1-4234-f012-3456789abcde"
#define RESILNET_LORA_INFO_CHAR_UUID "a7b8c9d0-e1f2-4345-0123-456789abcdef"

// Magic นำหน้าเฟรม LoRa เพื่อกรองสัญญาณขยะ
#define RESILNET_RADIO_MAGIC_HI 0x52  // 'R'
#define RESILNET_RADIO_MAGIC_LO 0x4E  // 'N'

// ค่า TTL เริ่มต้น (สอดคล้อง Rust / Flutter mesh)
#define RESILNET_DEFAULT_TTL 5

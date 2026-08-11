# เกตเวย์ Wi‑Fi HaLow (สวิตช์วิทยุได้)

ResilNet รองรับ **Wi‑Fi HaLow (802.11ah)** เป็นช่องทางเกตเวย์ระยะกลาง **ทางเลือก** คู่กับ LoRa โทรศัพท์**ไม่ต้องมี**วิทยุ HaLow — ยังคุยกับ ESP32 ผ่าน **BLE** และ **SoftAP UDP** (`192.168.4.1:4210) เหมือน [เกตเวย์ LoRa](esp32-lora.md)

## สถาปัตยกรรม

```text
มือถือ  →  BLE / SoftAP UDP  →  เกตเวย์ ESP32  →  LoRa  หรือ  HaLow
```

ซอง E2EE ยังเหมือนเดิม — เกตเวย์สวิตช์เฉพาะ RF

## สวิตช์จากแอป

**Settings → วิทยุเกตเวย์**

| โหมด | พฤติกรรม |
|------|----------|
| **LoRa** | ส่ง/รับบน LoRa เสมอ |
| **HaLow** | ใช้ HaLow เมื่อเกตเวย์รายงานว่ามี (stub หรือโมดูลจริง) |
| **อัตโนมัติ** | HaLow เมื่อลิงก์ขึ้น มิฉะนั้น LoRa |

เกตเวย์ประกาศความสามารถด้วย **RN_CAPS**; แอปส่ง **RN_RADIO** เมื่อเปลี่ยนโหมด ดู [`esp32_firmware/docs/halow_control.md`](https://github.com/AjarnThitasilo/ResilNet/blob/main/esp32_firmware/docs/halow_control.md)

## การ build เฟิร์มแวร์

| Build | ผลลัพธ์ |
|-------|---------|
| ค่าเริ่มต้น (`HALOW_ENABLE=0`) | เกตเวย์ LoRa อย่างเดียว — พฤติกรรมเดิม |
| `-DHALOW_ENABLE=1` | HaLow manager + RN_CAPS; **stub driver** ทดสอบโปรtokol |
| `-DHALOW_ENABLE=1` + โมดูล Morse Micro (อนาคต) | แทน stub ด้วย SPI driver จริง — API แอปไม่เปลี่ยน |

โหมด stub (`HALOW_STUB_LOOPBACK=1`) วน TX→RX ในเฟิร์มแวร์เพื่อทดสอบสวิตช์โดยไม่ต้องมี RF

## RF / กำกับคลื่น (ไทย)

- LoRa: **AS923 ~920–925 MHz** ([esp32-lora.md](esp32-lora.md))
- HaLow: มักอยู่ **Sub‑1 GHz** ใกล้ย่านเดียวกันตามโมดูล/ประเทศ
- **อย่า TX LoRa กับ HaLow พร้อมกัน** บนบอร์ดเดียวโดยไม่ออกแบบ RF แยกเสา/ฟิลเตอร์ และให้สอดคล้อง กสทช.
- ใช้เสา/ฟิลเตอร์แยกหรือฮาร์ดแวร์เฉพาะเมื่อใช้ทั้งสอง path ในภาคสนาม

## สิ่งที่ยังไม่มีในรอบนี้

- mesh HaLow หลายฮอป (โทโพโลยี AP/STA)
- payload บนอากาศใหญ่กว่า 230 B ของ `ResilNetRadioPacket`
- วิทยุ HaLow ใน iPhone/Android (เฉพาะ path เกตเวย์)

## ที่เกี่ยวข้อง

- [เกตเวย์ ESP32 LoRa](esp32-lora.md)
- [Local Wi‑Fi (มือถือ↔มือถือ LAN)](local-wifi.md) — คนละ path ไม่ใช่ SoftAP เกตเวย์

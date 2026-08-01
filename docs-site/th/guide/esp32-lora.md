# ESP32 LoRa Gateway

เกตเวย์เชื่อมมือถือกับวิทยุ **LoRa ของ ResilNet** และทำ multi-hop ระหว่างเกตเวย์ด้วยกัน

## ความปลอดภัยและกฎหมายคลื่น (ไทย)

- ย่านที่ใช้ในเฟิร์มแวร์หลักประมาณ **920–925 MHz (AS923)** เช่น ~923.5 MHz
- **ต้องต่อเสาอากาศก่อนเปิดส่ง** — อย่า TX โดยไม่มีเสา
- ปฏิบัติตามประกาศ กสทช. / ข้อจำกัดกำลังและ duty cycle ในพื้นที่ของคุณ
- **ไม่** เข้ากันกับ Meshtastic ที่ชั้น LoRa และไม่ได้ตั้งใจให้คุยข้ามระบบนั้นบน RF — แอปอาจมี **สะพานข้อความแยก** (plaintext ไม่ใช่ E2EE) ดู [`meshtastic_bridge/README.md`](https://github.com/AjarnThitasilo/ResilNet/blob/main/meshtastic_bridge/README.md)

## เชื่อมมือถือกับเกตเวย์

มีสองทางหลัก:

1. **BLE** — แอปคุยกับบริการ LoRa gateway โดยตรง
2. **Wi‑Fi SoftAP + UDP** — เกตเวย์เปิด AP ประมาณ `ResilNet-Node-XXXX` ที่ `192.168.4.1` พอร์ต UDP `4210`

(SoftAP อาจปิดเองเมื่อไม่มีสถานีเกาะ — ขึ้นกับการตั้งค่า build)

## Multi-hop mesh (ResilNet)

ตั้งแต่เฟิร์มแวร์ **1.9.49**:

- รับแพ็กเก็ตจาก LoRa → ส่งเข้ามือถือ (BLE/UDP) ตามเดิม
- ถ้า TTL ยังเหลือ → **relay ต่อบน LoRa** (ลด TTL, dedupe, จำกัดอัตรา)
- ถ้าไม่มีมือถือต่ออยู่ เกตเวย์ยัง relay ได้
- มี **store-and-forward ใน RAM** เมื่อไม่มี client แล้ว replay เมื่อมือถือกลับมา

ปิด relay ได้ตอน build: `-DLORA_MESH_RELAY_ENABLE=0`

## แฟลช

ใช้ `resilnet_esp32_lora_gateway.bin` — ดู [เฟิร์มแวร์](../firmware/) · [แฟลช / BLE OTA](esp32-ota.md)

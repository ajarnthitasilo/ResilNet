# ResilNet — สื่อสารไร้ศูนย์กลาง (Decentralized Offline & Online Mesh)

**ResilNet** เป็นระบบสื่อสารทางเลือกในยามวิกฤต ออกแบบมาให้ทำงานแบบไร้ศูนย์กลางอย่างแท้จริง (Decentralized & Account-less) โดยไม่ต้องพึ่งพาสัญญาณโทรศัพท์หรือเซิร์ฟเวอร์กลาง รองรับการสื่อสารครอบคลุมตั้งแต่ระยะใกล้จนถึงระดับสากล

## สถาปัตยกรรมโปรเจกต์

โปรเจกต์แบ่งออกเป็น 3 ส่วนหลัก:
ResilNet/
├── esp32_firmware/   # โค้ด C++ สำหรับ ESP32 LoRa / Data Mule Node (PlatformIO + NimBLE)
├── resilnet_core/    # โค้ด Rust Core (จัดการ Network Routing, Cryptography, SQLite & Nostr Client)
└── mobile_app/       # แอปพลิเคชัน Flutter (Frontend UI, FFI Bridge, BLE & Nostr Sync)

---

## 1. จุดเด่นทางสถาปัตยกรรม (v1.4.0)

- **True Decentralization (No Cloud):** ถอดการพึ่งพา Supabase และเซิร์ฟเวอร์รวมศูนย์ทั้งหมด เปลี่ยนมาใช้โปรโตคอล **Nostr** ผ่านเครือข่าย Public Relays สำหรับการซิงค์ข้อมูลระยะไกล
- **Account-less & Cryptographic Identity:** ไม่ใช้อีเมลหรือเบอร์โทรศัพท์ในการสมัครใช้งาน แอปสร้างคู่กุญแจเข้ารหัสส่วนตัว (`secp256k1` / `npub` / `nsec`) บนเครื่องของผู้ใช้โดยอัตโนมัติในครั้งแรก
- **Hybrid Multi-Tier Transport:**
  - **ระยะใกล้:** Bluetooth Low Energy (BLE) Mesh
  - **ระยะกลาง:** LoRa (ผ่าน ESP32 Data Mule)
  - **ระยะไกล / อินเทอร์เน็ต:** Nostr Relays (พร้อมระบบ Offline Queue พักข้อมูลไว้ในเครื่องอัตโนมัติเมื่อไม่มีเน็ต และส่งออกทันทีเมื่อเชื่อมต่อได้)
- **Rust-powered Core:** ใช้ Rust จัดการตรรกะเบื้องหลัง ทั้งเรื่อง Packet Deduplication, Hybrid Fan-out Router และการจัดการคิวข้อมูล เพื่อความปลอดภัยและประสิทธิภาพสูงสุด

---

## 2. ESP32 Firmware (LoRa & BLE Mule)

โค้ดสำหรับแฟกเตอร์ลงชิป ESP32 เพื่อทำหน้าที่เป็น Node รับส่งสัญญาณวิทยุและสื่อสารกับมือถือ

```bash
cd esp32_firmware
pio run -t upload
ทำงานเป็น BLE Server / LoRa Transceiver
เก็บคิวข้อมูลบน LittleFS
ทำการ Handshake และซิงก์ข้อมูลระหว่างฮาร์ดแวร์กับแอปมือถือ
3. Mobile App (Flutter & Rust Core)
วิธีรันและพัฒนาแอปพลิเคชันฝั่งมือถือ:
Bash
cd mobile_app
flutter pub get
flutter run
คำสั่งสำหรับ Build แพ็กเกจติดตั้ง (Android):
Bash
flutter build apk --release
(ดูรายละเอียดเชิงลึกเกี่ยวกับการย้ายระบบใน mobile_app/NOSTR_MIGRATION.md)
4. โปรโตคอลการเชื่อมต่อ (BLE UUIDs)
ประเภท	UUID
Node Service	a1b2c3d4-e5f6-7890-abcd-ef1234567890
Sync Characteristic	b2c3d4e5-f6a7-8901-bcde-f12345678901
Node Info	c3d4e5f6-a7b8-9012-cdef-123456789012

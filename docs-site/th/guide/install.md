# ติดตั้งแอป

## แพลตฟอร์มที่รองรับ

| แพลตฟอร์ม | หมายเหตุ |
|-----------|----------|
| **Android** | API 24+ (Android 7+) จนถึง target ปัจจุบัน — รองรับ Android 12+ พร้อมสิทธิ์ BLE แบบใหม่ |
| **iPhone / iPad** | ติดตั้งผ่าน Xcode / TestFlight / เครื่องที่ลงแล้วจากทีมพัฒนา |
| **Apple Watch** | คู่กับ iPhone บน build ที่ฝัง Watch app — ดู [Apple Watch](apple-watch.md) |

## Android

1. ติดตั้งไฟล์ APK จากทีมพัฒนา (หรือ build เองจาก repo)
2. อนุญาตติดตั้งจากแหล่งที่ไม่รู้จักถ้าเครื่องถาม
3. เปิดแอปครั้งแรก → สร้างคีย์บนเครื่องอัตโนมัติ และตาม onboarding

### สิทธิ์ที่มักต้องเปิด

- **Bluetooth** — สแกน / เชื่อมต่อ / โฆษณา (Android 12+: `BLUETOOTH_SCAN`, `CONNECT`, `ADVERTISE`)
- **Location** — บางเวอร์ชัน Android บังคับสำหรับ BLE scan; ใช้กับ Area / geohash ด้วย
- **Notifications** — แจ้งเตือนข้อความเข้า
- **Microphone** — ข้อความเสียง (เมื่อใช้ฟีเจอร์นั้น)
- **Camera** — สแกน QR เชิญกระดาน / นำเข้าเพื่อน (เมื่อใช้ฟีเจอร์นั้น)

## iOS

1. ติดตั้งจากเครื่องที่ลงแล้ว หรือผ่านช่องทางของทีม
2. ครั้งแรกระบบจะขอ Bluetooth (และ Camera / Microphone / Location ถ้าใช้ฟีเจอร์นั้น)
3. **Local Network** — จำเป็นสำหรับ [Local Wi‑Fi](local-wifi.md) บน LAN
4. ตรวจใน **Settings → ResilNet** ว่าสิทธิ์เปิดครบ
5. (ทางเลือก) ติดตั้งแอป Watch คู่กัน แล้วเปิด ResilNet บน iPhone อย่างน้อยครั้งหนึ่ง — [Apple Watch](apple-watch.md)

## หลังติดตั้ง — สิ่งที่ควรเห็น

- Onboarding แนะนำ Identity, ช่องทาง, Toolbar, ความปลอดภัย ฯลฯ
- ชื่อแสดงผลตั้งเองได้ในตั้งค่า
- เวอร์ชันแอปในตั้งค่าควรเป็น **1.9.75** (หรือใหม่กว่า)
- ไม่มีหน้า “สมัครสมาชิก / ล็อกอินอีเมล”
- (ทางเลือก) ถ้าทีมใช้โหนดบ้าน: ดู [Home node / Reticulum](reticulum-home-node.md)
- (ทางเลือก) Tor สำหรับ Nostr: Settings → เชื่อม Nostr ผ่าน Tor (ต้องเปิด Orbot/Tor เอง)

## ถัดไป

- [มีอะไรใหม่](whats-new.md)
- [แชต 1:1](chat.md)
- [เฟิร์มแวร์ ESP32](../firmware/)

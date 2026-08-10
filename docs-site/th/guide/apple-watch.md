# Apple Watch

แอปคู่หู **ResilNet** บน Apple Watch ใช้ดูสถานะ mesh และส่งข้อความ Direct สั้นๆ โดย **เข้ารหัสและส่งผ่าน iPhone**

รองรับบน build iOS ที่ฝัง Watch target แล้ว — Android ไม่มีแอป Watch นี้

## สิ่งที่ทำได้

| แท็บ | ใช้ทำอะไร |
|------|-----------|
| **Status** | ชื่อแสดงผล, รหัสสั้น, โหมดขนส่ง, จำนวนออนไลน์, unread, สถานะ iPhone (Reachable / Away), เวลา sync ล่าสุด |
| **Chats** | รายการ Direct ล่าสุด, ข้อความล่าสุดในเธรด, ส่งข้อความสั้น / quick reply, เปิดแชตบน iPhone |

ขีดจำกัดส่งจาก Watch: ประมาณ **160 ตัวอักษร** ต่อข้อความ (iPhone เป็นฝ่ายปิดผนึก E2EE และเลือกเส้นทางส่ง)

## ข้อกำหนด

1. ติดตั้งแอป ResilNet บน **iPhone** ที่จับคู่กับ Watch
2. เปิดแอปบน iPhone **อย่างน้อยครั้งหนึ่ง** หลังติดตั้ง / อัปเดต
3. ให้ iPhone **Reachable** (แอปเปิดอยู่หรือระบบยังเชื่อม WatchConnectivity ได้)
4. มี Direct chat บน iPhone ก่อน — Watch ไม่สร้างเพื่อนใหม่เอง

## ขั้นตอนใช้งานสั้นๆ

1. เปิด ResilNet บน iPhone
2. เปิดแอป ResilNet บน Watch
3. ถ้าขึ้น “waiting…” / “Waiting for iPhone…” → กด **Refresh**
4. ดู Status หรือเลือกแชตแล้วพิมพ์สั้นๆ / ใช้ quick reply (OK, On my way, …)

## สิ่งที่ Watch **ไม่** ทำ

- ไม่เก็บคีย์ส่วนตัวแยกจาก iPhone
- ไม่แฟลชเฟิร์มแวร์ ESP32
- ไม่ตั้งค่า Home node / Local Wi‑Fi / Tor
- ไม่โพสต์ public mesh bulletin จาก Watch

## แก้ปัญหา

| อาการ | ลองทำ |
|--------|--------|
| Waiting for iPhone | เปิด ResilNet บน iPhone ไว้ foreground แล้ว Refresh บน Watch |
| iPhone Away | พก iPhone ใกล้ๆ / ปลดล็อก / เปิดแอปอีกครั้ง |
| No Direct chats yet | สร้างแชตบน iPhone ก่อน |
| ส่งไม่สำเร็จ | ตรวจว่า iPhone Reachable และมีทางส่ง (BLE / เน็ต / gateway) |

ดูเพิ่มใน onboarding หน้า **Apple Watch** ในแอป

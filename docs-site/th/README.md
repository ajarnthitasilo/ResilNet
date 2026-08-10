# ResilNet

**ระบบส่งข้อความฉุกเฉินแบบไร้บัญชี** — ใช้ได้ทั้งตอนมีเน็ตและไม่มีเน็ต ผ่าน Bluetooth ใกล้ตัว, ESP32 / LoRa ระยะกลาง, Nostr เมื่อออนไลน์ และทางเลือก **Local Wi‑Fi** / **Home node (Reticulum)** บน LAN รวมถึง **Apple Watch** (คู่กับ iPhone)

แอปเวอร์ชันปัจจุบัน: **1.9.75**  
เฟิร์มแวร์ ESP32: **1.9.49** (ดูในแอป / หน้าเฟิร์มแวร์ — แอปอาจนำหน้าเฟิร์มแวร์)

## เหมาะกับใคร

- ทีมภาคสนาม / ชุมชนที่เน็ตหลุดบ่อย
- ผู้ที่ต้องการแชตเข้ารหัสปลายทางถึงปลายทาง โดยไม่สมัครอีเมลหรือเบอร์โทร
- ผู้ติดตั้งโหนด ESP32 เป็น “ล่อข้อความ” หรือเกตเวย์ LoRa
- (ทางเลือก) ผู้มี Mac/Pi เป็น **Home node** บน Wi‑Fi บ้าน/ฐานปฏิบัติการ
- (ทางเลือก) ผู้ใช้ iPhone + Apple Watch ที่ต้องการดูสถานะ / ส่ง Direct สั้นๆ จากข้อมือ

## ชั้นการสื่อสาร

| ชั้น | ช่องทาง | ใช้เมื่อ |
|------|---------|----------|
| ใกล้ | BLE ระหว่างมือถือ | ค้นหาเพื่อนใกล้ตัว / mesh |
| ข้อมือ | Apple Watch ↔ iPhone | สถานะ + Direct สั้น (เข้ารหัสบน iPhone) |
| LAN | Local Wi‑Fi (มือถือ↔มือถือ) | ฮอตสปอตหรือเราเตอร์เดียวกัน |
| กลาง | ESP32 mule หรือ LoRa gateway | ออฟไลน์ระยะไกลขึ้น / เก็บส่งต่อ |
| บ้าน | Home node (Reticulum / LXMF) | มี Mac/Pi bridge บน Wi‑Fi |
| ไกล | Nostr (สาธารณะ) | มีอินเทอร์เน็ต (ทางเลือก: ผ่าน Tor) |

## เริ่มต้นเร็ว

1. [ติดตั้งแอป](guide/install.md) และเปิดสิทธิ์ Bluetooth (และ Location ตามที่ระบบขอ)
2. สร้างเอกลักษณ์บนเครื่อง — **ไม่ต้องสมัครบัญชี** (ตาม onboarding ในแอป)
3. ส่ง [แชต 1:1](guide/chat.md) หรือโพสต์ [ประกาศสาธารณะบน mesh](guide/mesh.md) / ใช้ [Area](guide/area.md)
4. (ถ้ามีฮาร์ดแวร์) ตั้ง [ESP32 Mule](guide/esp32-mule.md) หรือ [LoRa Gateway](guide/esp32-lora.md)
5. (ทางเลือก LAN) [Local Wi‑Fi](guide/local-wifi.md) หรือ [Home node / Reticulum](guide/reticulum-home-node.md)
6. (ทางเลือก iOS) [Apple Watch](guide/apple-watch.md)

ดูสิ่งที่เปลี่ยนจากคู่มือรอบ 1.9.64: **[มีอะไรใหม่](guide/whats-new.md)**

> **สำคัญ:** ResilNet LoRa เป็นโปรโตคอลของ ResilNet เอง — **ไม่** เข้ากันกับ Meshtastic บน RF  
> Home node ใช้ Reticulum/LXMF บนคอมพิวเตอร์ — **ไม่** ใส่สแต็ก LXMF เต็มบน Heltec

[English version →](/en/)

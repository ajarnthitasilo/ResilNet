# ResilNet — สื่อสารชุมชนบ้านปู่คำ (Offline Mesh)

โปรเจกต์แบ่งเป็น 2 ส่วนหลัก:

```
ResilNet/
├── esp32_firmware/   # โค้ด C++ สำหรับ ESP32 Data Mule Node (PlatformIO + NimBLE)
└── mobile_app/       # แอป Flutter สำหรับมือถือ (BLE + SQLite + Cloud Sync)
```

## ESP32 Firmware

```bash
cd esp32_firmware
pio run -t upload
```

- BLE Server โฆษณาตลอเวลา (ไม่ต้อง Pairing)
- เก็บคิวข้อความ JSON บน LittleFS
- ซิงก์ Handshake → Push → Pull → Disconnect

## Mobile App

```bash
cd mobile_app
flutter pub get
flutter run
```

```bash
# Build APK
flutter build apk --release
```

## โปรโตคอล BLE (UUID ร่วมกัน)

| ส่วน | UUID |
|------|------|
| Node Service | `a1b2c3d4-e5f6-7890-abcd-ef1234567890` |
| Sync Characteristic | `b2c3d4e5-f6a7-8901-bcde-f12345678901` |
| Node Info | `c3d4e5f6-a7b8-9012-cdef-123456789012` |

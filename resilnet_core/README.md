# ResilNet Core (Rust)

สมองส่วนหลังสำหรับระบบสื่อสาร Offline-First — เตรียมเชื่อมต่อ Flutter ผ่าน FFI

## โมดูล `hybrid_router`

ตัวตัดสินใจเส้นทางแบบไฮบริด:

| สถานะเครือข่าย | ช่องทางที่เลือก |
|----------------|----------------|
| Internet พร้อม | `Internet` (รีเซ็ต TTL) |
| Internet ล่ม + มี BLE peers | `BluetoothMesh` (TTL -= 1) |
| ล่มทั้งคู่ | `OfflineQueue` |

## Build & Test

```bash
cd resilnet_core
cargo test
cargo build --release
```

## การใช้งานเบื้องต้น

```rust
use resilnet_core::{MessagePacket, NetworkStatus, ResilNetRouter, RouterConfig};

#[tokio::main]
async fn main() {
    let (router, handle, mut incoming) = ResilNetRouter::new(RouterConfig::default());

    handle.update_network_status(NetworkStatus::new(true, 2));

    let pkt = MessagePacket::new("sender", "receiver", vec![1, 2, 3], 0, 5);
    let routed = handle.route_packet(pkt).await.unwrap();
    println!("sent via {}", routed.transport);

    // ข้อความเข้า (ผ่าน dedup)
    let _ = router; // เก็บ router ไว้ตลอดอายุ process
}
```

## Channels สำหรับ Flutter FFI

- **Broadcast** `subscribe_events()` — สถานะเครือข่าย, ข้อความเข้า, routing events
- **MPSC** `incoming_rx` จาก `ResilNetRouter::new()` — consumer เดียวสำหรับ isolate หลัก

## โครงสร้าง

```
resilnet_core/
├── Cargo.toml
└── src/
    ├── lib.rs
    └── hybrid_router/
        ├── mod.rs
        ├── types.rs      # TransportType, NetworkStatus, MessagePacket
        ├── dedup.rs      # LRU + TTL deduplication
        └── router.rs     # ResilNetRouter + channels
```

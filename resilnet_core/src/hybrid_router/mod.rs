//! โมดูล `hybrid_router` — ตัวตัดสินใจเส้นทางแบบไฮบริด (Internet / BLE Mesh / Offline Queue)
//!
//! State Machine หลัก:
//! ```text
//!                    ┌─────────────────┐
//!   Outbound ───────►│  route_packet   │
//!                    └────────┬────────┘
//!                             │
//!              ┌──────────────┼──────────────┐
//!              ▼              ▼              ▼
//!         Internet      BluetoothMesh   OfflineQueue
//!         (TTL reset)   (TTL -= 1)      (persist รอส่ง)
//!
//!   Inbound ───────► ingest_packet ──► Dedup LRU ──► Flutter channel
//! ```

mod dedup;
mod router;
mod types;

pub use dedup::DedupDecision;
pub use router::{
    HybridRouterHandle, ResilNetRouter, RoutedPacket, RouterConfig, RouterError, RouterEvent,
};
pub use types::{GatewayRadioPreference, MessagePacket, NetworkStatus, PayloadTag, TransportType};

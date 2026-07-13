//! ResilNet Core — สมองส่วนหลังสำหรับระบบสื่อสาร Offline-First
//!
//! โมดูล `api` ถูกสแกนโดย `flutter_rust_bridge_codegen` เพื่อสร้าง Dart bindings

pub mod api;
pub mod hybrid_router;

// Re-export เฉพาะสัญลักษณ์ที่ Flutter เรียกใช้ผ่าน FFI
pub use api::{
    check_chunk_dedup, clear_chunk_stream, get_network_status, init_resilnet_core, init_router,
    ingest_packet, is_router_initialized, offline_queue_len, payload_tag_from_u8, route_packet,
    subscribe_incoming_messages, update_network_status, MessagePacketDto, NetworkStatusDto,
    PayloadTagDto, RoutedPacketDto, RouterConfigDto, TransportTypeDto,
};
pub use hybrid_router::{
    DedupDecision, HybridRouterHandle, MessagePacket, NetworkStatus, PayloadTag, ResilNetRouter,
    RoutedPacket, RouterConfig, RouterError, RouterEvent, TransportType,
};

// ไฟล์นี้ถูกสร้างโดย `flutter_rust_bridge_codegen generate`
mod frb_generated;

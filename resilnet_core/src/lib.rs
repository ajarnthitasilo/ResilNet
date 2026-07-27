//! ResilNet Core — สมองส่วนหลังสำหรับระบบสื่อสาร Offline-First
//!
//! โมดูล `api` ถูกสแกนโดย `flutter_rust_bridge_codegen` เพื่อสร้าง Dart bindings

pub mod api;
pub mod hybrid_router;
pub mod nostr;

// Re-export เฉพาะสัญลักษณ์ที่ Flutter เรียกใช้ผ่าน FFI
pub use api::{
    check_chunk_dedup, clear_chunk_stream, clear_offline_queue, flush_offline_queue_to_nostr,
    get_network_status, get_nostr_status, ingest_nostr_envelope, ingest_packet, init_nostr,
    init_resilnet_core, init_router, is_router_initialized, nostr_publish, nostr_publish_packet,
    nostr_reconnect, offline_queue_len, payload_tag_from_u8, route_packet,
    subscribe_incoming_messages, update_network_status, MessagePacketDto, NetworkStatusDto,
    NostrInitResultDto, NostrPoolStatusDto, PayloadTagDto, RelayStatusDto, ResilNetEnvelopeDto,
    RoutedPacketDto, RouterConfigDto, TransportTypeDto,
};
pub use hybrid_router::{
    DedupDecision, HybridRouterHandle, MessagePacket, NetworkStatus, PayloadTag, ResilNetRouter,
    RoutedPacket, RouterConfig, RouterError, RouterEvent, TransportType,
};

// ไฟล์นี้ถูกสร้างโดย `flutter_rust_bridge_codegen generate`
mod frb_generated;

//! FFI API หลัก — เรียกจาก Flutter ผ่าน flutter_rust_bridge

use flutter_rust_bridge::frb;

use crate::api::dto::{
    MessagePacketDto, NetworkStatusDto, PayloadTagDto, RoutedPacketDto, RouterConfigDto,
};
use crate::hybrid_router::DedupDecision;
use crate::api::state::{
    get_network_status_mapped, get_handle, ingest_packet_async, init_router_state,
    offline_queue_len_async, route_packet_async_mapped, set_stream_task,
    update_network_status_mapped,
};
use crate::hybrid_router::{RouterError, RouterEvent};

/// เริ่มต้น FRB runtime (เรียกครั้งเดียวตอนเปิดแอป ก่อน `init_router`)
#[frb(init)]
pub fn init_resilnet_core() {
    // FRB จัดการ Tokio runtime ให้ `async fn` อัตโนมัติ
}

/// สร้าง `ResilNetRouter` และพร้อมรับคำสั่งจาก Flutter
#[frb]
pub fn init_router(config: RouterConfigDto) -> Result<(), String> {
    init_router_state(config.into())
}

/// อัปเดตสถานะเครือข่ายจาก Flutter (`connectivity_plus` + BLE + LoRa)
#[frb]
pub fn update_network_status(
    is_internet_available: bool,
    active_ble_peers_count: u32,
    lora_available: bool,
) -> Result<(), String> {
    update_network_status_mapped(is_internet_available, active_ble_peers_count, lora_available)
}

/// อ่านสถานะเครือข่ายล่าสุดที่ router เก็บไว้
#[frb]
pub fn get_network_status() -> Result<NetworkStatusDto, String> {
    get_network_status_mapped().map(NetworkStatusDto::from)
}

/// ส่งออกแพ็กเก็ตผ่าน Hybrid State Machine (Internet → BLE → Offline Queue)
#[frb]
pub async fn route_packet(packet: MessagePacketDto) -> Result<RoutedPacketDto, String> {
    let _ = get_handle()?;
    let routed = route_packet_async_mapped(packet.into())
        .await
        .map_err(map_router_error)?;
    Ok(routed.into())
}

/// รับแพ็กเก็ตขาเข้า — กรองซ้ำ LRU+TTL ก่อนส่งต่อ UI ผ่าน Stream
#[frb]
pub async fn ingest_packet(packet: MessagePacketDto) -> Result<(), String> {
    let _ = get_handle()?;
    ingest_packet_async(packet.into())
        .await
        .map_err(map_router_error)
}

/// จำนวนข้อความที่รอส่งใน offline queue
#[frb]
pub async fn offline_queue_len() -> Result<u32, String> {
    let len = offline_queue_len_async().await?;
    Ok(len as u32)
}

/// สร้าง Stream ข้อความเข้าแบบ real-time ไปยัง Flutter UI
///
/// ฟัง `RouterEvent::IncomingMessage` จาก broadcast channel — เรียกซ้ำได้เมื่อแอป resume
/// (abort task เก่าแล้วสมัครใหม่ ไม่ต้อง take MPSC receiver ครั้งเดียว)
#[frb]
pub async fn subscribe_incoming_messages(
    sink: crate::frb_generated::StreamSink<MessagePacketDto>,
) -> Result<(), String> {
    let handle = get_handle()?;
    let mut rx = handle.subscribe_events();

    let task = tokio::spawn(async move {
        loop {
            match rx.recv().await {
                Ok(RouterEvent::IncomingMessage(pkt)) => {
                    if sink.add(MessagePacketDto::from(pkt)).is_err() {
                        break;
                    }
                }
                Ok(_) => {}
                Err(tokio::sync::broadcast::error::RecvError::Lagged(_)) => {}
                Err(tokio::sync::broadcast::error::RecvError::Closed) => break,
            }
        }
    });

    set_stream_task(task)?;
    Ok(())
}

/// ตรวจว่า router ถูก init แล้วหรือยัง
#[frb(sync)]
pub fn is_router_initialized() -> bool {
    crate::api::state::is_initialized()
}

/// กรอง chunk frame ซ้ำระหว่าง reassembly (audio/firmware binary streams)
#[frb(sync)]
pub fn check_chunk_dedup(msg_id: u16, chunk_index: u8) -> bool {
    let Ok(handle) = get_handle() else {
        return true;
    };
    matches!(
        handle.check_and_record_chunk(msg_id, chunk_index),
        DedupDecision::Accept
    )
}

/// ล้าง chunk dedup cache เมื่อประกอบ binary stream เสร็จ
#[frb(sync)]
pub fn clear_chunk_stream(msg_id: u16) -> Result<(), String> {
    let handle = get_handle()?;
    handle.clear_chunk_stream(msg_id);
    Ok(())
}

/// แปลง wire tag (1–4) เป็น [PayloadTagDto]
#[frb(sync)]
pub fn payload_tag_from_u8(value: u8) -> Option<PayloadTagDto> {
    PayloadTagDto::from_u8(value)
}

/// แปลง `RouterError` → String สำหรับ Dart `Result`
fn map_router_error(err: RouterError) -> String {
    err.to_string()
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::api::dto::RouterConfigDto;

    fn sample_dto(id: &str, ttl: u8) -> MessagePacketDto {
        MessagePacketDto {
            id: id.to_string(),
            sender: "alice".to_string(),
            receiver: "bob".to_string(),
            payload: b"hello".to_vec(),
            timestamp: 1_700_000_000_000,
            ttl,
            payload_tag: crate::api::dto::PayloadTagDto::Text,
        }
    }

    /// ทดสอบ init + route + dedup ผ่านชั้น FFI API (รันในเทสต์เดียวเพราะ router init ได้ครั้งเดียว)
    #[tokio::test]
    async fn ffi_api_smoke_test() {
        init_router(RouterConfigDto::default()).unwrap();
        update_network_status(true, 0, false).unwrap();

        let routed = route_packet(sample_dto("pkt-1", 1)).await.unwrap();
        assert_eq!(
            routed.transport,
            crate::api::dto::TransportTypeDto::Nostr
        );
        assert_eq!(routed.packet.ttl, 5);

        let pkt = sample_dto("dup-id", 3);
        ingest_packet(pkt.clone()).await.unwrap();
        let err = ingest_packet(pkt).await.unwrap_err();
        assert!(err.contains("duplicate"));
    }
}

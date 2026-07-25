//! FFI API สำหรับ Nostr identity + relay pool

use base64::Engine as _;
use flutter_rust_bridge::frb;

use crate::api::dto::{
    MessagePacketDto, NostrInitResultDto, NostrPoolStatusDto, ResilNetEnvelopeDto,
};
use crate::api::state::{
    drain_offline_queue_async, get_handle, get_nostr_pool, ingest_packet_async,
};
use crate::hybrid_router::PayloadTag;
use crate::nostr::{ResilNetEnvelope, ResilNetEventKind};

/// เริ่ม Nostr identity (generate หรือ restore จาก secret hex) + เชื่อม relay pool
///
/// After connect, background task auto-ingests ResilNet envelopes into the hybrid router
/// (same dedup path as BLE / LoRa).
#[frb]
pub async fn init_nostr(
    secret_key_hex: Option<String>,
    relay_urls: Option<Vec<String>>,
) -> Result<NostrInitResultDto, String> {
    let pool = get_nostr_pool()?;
    let status = pool
        .init(secret_key_hex, relay_urls)
        .await
        .map_err(|e| e.to_string())?;
    let secret = pool.export_secret_hex().map_err(|e| e.to_string())?;

    // Bridge Nostr → router ingest (dedup by ResilNet message id)
    let mut rx = pool.subscribe_envelopes();
    tokio::spawn(async move {
        loop {
            match rx.recv().await {
                Ok(env) => {
                    let dto = ResilNetEnvelopeDto::from(env);
                    if let Err(e) = ingest_nostr_envelope(dto).await {
                        tracing::debug!("nostr ingest skip/fail: {e}");
                    }
                }
                Err(tokio::sync::broadcast::error::RecvError::Lagged(_)) => {}
                Err(tokio::sync::broadcast::error::RecvError::Closed) => break,
            }
        }
    });

    Ok(NostrInitResultDto {
        status: status.into(),
        secret_key_hex: secret,
    })
}

#[frb]
pub fn get_nostr_status() -> Result<NostrPoolStatusDto, String> {
    let pool = get_nostr_pool()?;
    Ok(pool.status().into())
}

#[frb]
pub async fn nostr_reconnect() -> Result<(), String> {
    let pool = get_nostr_pool()?;
    pool.reconnect().await.map_err(|e| e.to_string())
}

/// Publish ResilNet envelope to Nostr relays (kind = direct | broadcast | health)
#[frb]
pub async fn nostr_publish(
    envelope: ResilNetEnvelopeDto,
    kind: String,
) -> Result<String, String> {
    let pool = get_nostr_pool()?;
    let event_kind = match kind.as_str() {
        "broadcast" => ResilNetEventKind::Broadcast,
        "health" => ResilNetEventKind::NodeHealth,
        _ => ResilNetEventKind::Direct,
    };
    pool.publish_envelope(envelope.into(), event_kind)
        .await
        .map_err(|e| e.to_string())
}

/// Publish a routed MessagePacketDto as a Nostr direct/broadcast envelope
#[frb]
pub async fn nostr_publish_packet(packet: MessagePacketDto) -> Result<String, String> {
    let kind = if packet.receiver == "BROADCAST" {
        ResilNetEventKind::Broadcast
    } else {
        ResilNetEventKind::Direct
    };
    let envelope = ResilNetEnvelope {
        v: 1,
        id: packet.id.clone(),
        sender: packet.sender.clone(),
        receiver: packet.receiver.clone(),
        payload_b64: base64::engine::general_purpose::STANDARD.encode(&packet.payload),
        timestamp: packet.timestamp,
        ttl: packet.ttl,
        payload_tag: packet.payload_tag.as_u8(),
        kind: match kind {
            ResilNetEventKind::Broadcast => "broadcast".into(),
            ResilNetEventKind::NodeHealth => "health".into(),
            ResilNetEventKind::Direct => "direct".into(),
        },
    };
    let pool = get_nostr_pool()?;
    pool.publish_envelope(envelope, kind)
        .await
        .map_err(|e| e.to_string())
}

/// Flush offline queue: publish each queued packet to Nostr when online
#[frb]
pub async fn flush_offline_queue_to_nostr() -> Result<u32, String> {
    let packets = drain_offline_queue_async().await?;
    let mut published = 0u32;
    for pkt in packets {
        let dto = MessagePacketDto::from(pkt);
        match nostr_publish_packet(dto).await {
            Ok(_) => published += 1,
            Err(e) => tracing::warn!("flush nostr publish failed: {e}"),
        }
    }
    Ok(published)
}

/// Convert a Nostr envelope into a MessagePacket and ingest through router dedup
#[frb]
pub async fn ingest_nostr_envelope(envelope: ResilNetEnvelopeDto) -> Result<(), String> {
    let payload = base64::engine::general_purpose::STANDARD
        .decode(envelope.payload_b64.as_bytes())
        .map_err(|e| e.to_string())?;
    let tag = PayloadTag::from_u8(envelope.payload_tag).unwrap_or(PayloadTag::Text);
    let packet = crate::hybrid_router::MessagePacket::with_id_and_tag(
        envelope.id,
        envelope.sender,
        envelope.receiver,
        payload,
        envelope.timestamp,
        envelope.ttl,
        tag,
    );
    let _ = get_handle()?;
    match ingest_packet_async(packet).await {
        Ok(()) => Ok(()),
        Err(e) if e.to_string().contains("duplicate") => Ok(()),
        Err(e) => Err(e.to_string()),
    }
}

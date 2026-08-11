use std::sync::Arc;
use std::time::Duration;

use parking_lot::RwLock;
use tokio::sync::{broadcast, mpsc, Mutex};

use super::dedup::{DedupCache, DedupDecision};
use super::types::{MessagePacket, NetworkStatus, PayloadTag, TransportType};

/// ค่า TTL เริ่มต้นเมื่อส่งผ่าน Internet (สอดคล้องกับ Flutter BLE mesh)
pub const DEFAULT_MESH_TTL: u8 = 5;

/// การตั้งค่า Router
#[derive(Debug, Clone)]
pub struct RouterConfig {
    /// ความจุ cache กรองข้อความซ้ำ
    pub dedup_capacity: usize,
    /// ระยะเวลาจำ id ซ้ำ (วินาที)
    pub dedup_ttl_secs: u64,
    /// TTL ที่รีเซ็ตเมื่อส่งผ่าน Internet
    pub internet_ttl_reset: u8,
    /// ความจุสูงสุดของ offline queue ในหน่วยความจำ (จำลอง DB)
    pub offline_queue_capacity: usize,
    /// ขนาด broadcast channel สำหรับ event ไปยัง Flutter
    pub event_channel_capacity: usize,
    /// ขนาด MPSC สำหรับข้อความเข้า
    pub incoming_channel_capacity: usize,
}

impl Default for RouterConfig {
    fn default() -> Self {
        Self {
            dedup_capacity: 4_096,
            dedup_ttl_secs: 300,
            internet_ttl_reset: DEFAULT_MESH_TTL,
            offline_queue_capacity: 2_048,
            event_channel_capacity: 256,
            incoming_channel_capacity: 512,
        }
    }
}

/// ข้อผิดพลาดของ Router
#[derive(Debug, thiserror::Error)]
pub enum RouterError {
    #[error("message id is empty")]
    EmptyMessageId,

    #[error("duplicate message suppressed: {0}")]
    Duplicate(String),

    #[error("mesh ttl exhausted for packet {0}")]
    TtlExhausted(String),

    #[error("offline queue is full (capacity {0})")]
    OfflineQueueFull(usize),

    #[error("event channel closed")]
    EventChannelClosed,

    #[error("incoming channel closed")]
    IncomingChannelClosed,
}

/// เหตุการณ์สำหรับ Flutter UI / FFI (broadcast — multi-subscriber)
#[derive(Debug, Clone)]
pub enum RouterEvent {
    /// สถานะเครือข่ายเปลี่ยน
    NetworkStatusChanged(NetworkStatus),
    /// ข้อความเข้าใหม่ (ผ่าน dedup แล้ว)
    IncomingMessage(MessagePacket),
    /// ตัดสินใจเส้นทางส่งออกแล้ว
    PacketRouted {
        packet_id: String,
        transport: TransportType,
    },
    /// ทิ้งข้อความซ้ำ
    DuplicateSuppressed { packet_id: String },
    /// บันทึกลง offline queue
    QueuedOffline { packet_id: String, queue_len: usize },
}

/// ผลการ route — อาจมีหลายช่องทาง (fan-out: Nostr + BLE + LoRa)
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct RoutedPacket {
    /// Primary transport (first in list) — kept for backwards-compatible FFI field
    pub transport: TransportType,
    /// All selected transports for this outbound packet
    pub transports: Vec<TransportType>,
    pub packet: MessagePacket,
}

/// Handle สำหรับ FFI / Flutter — clone ได้ ปลอดภัยข้าม task
#[derive(Clone)]
pub struct HybridRouterHandle {
    inner: Arc<ResilNetRouterInner>,
}

impl HybridRouterHandle {
    pub fn update_network_status(&self, status: NetworkStatus) {
        self.inner.set_network_status(status);
    }

    pub fn network_status(&self) -> NetworkStatus {
        self.inner.network_status()
    }

    /// รับข้อความเข้า — กรองซ้ำก่อนส่งไป Flutter
    pub async fn ingest_packet(&self, packet: MessagePacket) -> Result<(), RouterError> {
        self.inner.ingest_packet(packet).await
    }

    /// ตัดสินใจเส้นทางส่งออก (fan-out เมื่อทำได้) — คืน transports + แพ็กเก็ตที่ปรับ TTL แล้ว
    pub async fn route_packet(
        &self,
        mut packet: MessagePacket,
    ) -> Result<RoutedPacket, RouterError> {
        let transports = self.inner.route_packet(&mut packet).await?;
        let transport = transports
            .first()
            .copied()
            .unwrap_or(TransportType::OfflineQueue);
        Ok(RoutedPacket {
            transport,
            transports,
            packet,
        })
    }

    /// Subscribe เหตุการณ์แบบ broadcast (หลาย consumer ได้)
    pub fn subscribe_events(&self) -> broadcast::Receiver<RouterEvent> {
        self.inner.event_tx.subscribe()
    }

    /// จำนวนข้อความใน offline queue
    pub async fn offline_queue_len(&self) -> usize {
        self.inner.offline_queue.lock().await.len()
    }

    /// ดึงข้อความจาก offline queue เพื่อส่งซ้ำเมื่อมีสัญญาณ
    ///
    /// เรียงตาม priority: Text/Alerts > Audio > Image > Firmware แล้วตาม timestamp
    pub async fn drain_offline_queue(&self) -> Vec<MessagePacket> {
        let mut q = self.inner.offline_queue.lock().await;
        let mut items = std::mem::take(&mut *q);
        items.sort_by(|a, b| {
            b.payload_tag
                .routing_weight()
                .cmp(&a.payload_tag.routing_weight())
                .then_with(|| a.timestamp.cmp(&b.timestamp))
        });
        items
    }

    /// Drop every pending offline-queue packet (panic wipe / identity reset).
    pub async fn clear_offline_queue(&self) -> usize {
        let mut q = self.inner.offline_queue.lock().await;
        let n = q.len();
        q.clear();
        n
    }

    /// กรอง chunk frame ซ้ำระหว่าง reassembly (audio/firmware streams)
    pub fn check_and_record_chunk(&self, msg_id: u16, chunk_index: u8) -> DedupDecision {
        self.inner.dedup.check_and_record_chunk(msg_id, chunk_index)
    }

    /// ล้าง chunk dedup cache เมื่อประกอบ binary stream เสร็จ
    pub fn clear_chunk_stream(&self, msg_id: u16) {
        self.inner.dedup.clear_chunk_stream(msg_id);
    }
}

/// Router หลัก — สร้างครั้งเดียวแล้วแจก `HybridRouterHandle`
pub struct ResilNetRouter {
    inner: Arc<ResilNetRouterInner>,
}

struct ResilNetRouterInner {
    config: RouterConfig,
    network: RwLock<NetworkStatus>,
    dedup: DedupCache,
    offline_queue: Mutex<Vec<MessagePacket>>,
    event_tx: broadcast::Sender<RouterEvent>,
    incoming_tx: mpsc::Sender<MessagePacket>,
}

impl ResilNetRouter {
    /// สร้าง Router พร้อม channel สำหรับ Flutter
    ///
    /// คืนค่า 3 ส่วน:
    /// - `ResilNetRouter` — ตัวควบคุมหลัก
    /// - `HybridRouterHandle` — clone ได้สำหรับหลาย async task / FFI
    /// - `mpsc::Receiver<MessagePacket>` — consumer เดียวสำหรับข้อความเข้า (Flutter isolate)
    pub fn new(
        config: RouterConfig,
    ) -> (Self, HybridRouterHandle, mpsc::Receiver<MessagePacket>) {
        let (event_tx, _) = broadcast::channel(config.event_channel_capacity);
        let (incoming_tx, incoming_rx) = mpsc::channel(config.incoming_channel_capacity);

        let dedup_capacity = config.dedup_capacity;
        let dedup_ttl_secs = config.dedup_ttl_secs;
        let inner = Arc::new(ResilNetRouterInner {
            config,
            network: RwLock::new(NetworkStatus::default()),
            dedup: DedupCache::new(dedup_capacity, Duration::from_secs(dedup_ttl_secs)),
            offline_queue: Mutex::new(Vec::new()),
            event_tx,
            incoming_tx,
        });

        let handle = HybridRouterHandle {
            inner: Arc::clone(&inner),
        };

        (Self { inner }, handle, incoming_rx)
    }

    pub fn handle(&self) -> HybridRouterHandle {
        HybridRouterHandle {
            inner: Arc::clone(&self.inner),
        }
    }
}

impl ResilNetRouterInner {
    fn set_network_status(&self, status: NetworkStatus) {
        {
            let mut net = self.network.write();
            *net = status;
        }
        let _ = self.event_tx.send(RouterEvent::NetworkStatusChanged(status));
    }

    fn network_status(&self) -> NetworkStatus {
        *self.network.read()
    }

    fn validate_id(packet: &MessagePacket) -> Result<(), RouterError> {
        if packet.id.trim().is_empty() {
            return Err(RouterError::EmptyMessageId);
        }
        Ok(())
    }

    /// ส่ง event ไปยัง subscriber (ถ้าไม่มี UI ฟังอยู่ จะข้ามเงียบๆ)
    fn emit(&self, event: RouterEvent) -> Result<(), RouterError> {
        let _ = self.event_tx.send(event);
        Ok(())
    }

    /// ขาเข้า: กรองซ้ำ → แจ้ง UI → ส่งต่อ MPSC
    async fn ingest_packet(&self, packet: MessagePacket) -> Result<(), RouterError> {
        Self::validate_id(&packet)?;

        match self.dedup.check_and_record(&packet.id) {
            DedupDecision::Duplicate => {
                self.emit(RouterEvent::DuplicateSuppressed {
                    packet_id: packet.id.clone(),
                })?;
                return Err(RouterError::Duplicate(packet.id));
            }
            DedupDecision::Accept => {}
        }

        // Broadcast event สำหรับ UI observers ทั้งหมด
        self.emit(RouterEvent::IncomingMessage(packet.clone()))?;

        // MPSC — consumer หลักของ Flutter (เช่น Dart isolate)
        self.incoming_tx
            .send(packet)
            .await
            .map_err(|_| RouterError::IncomingChannelClosed)?;

        Ok(())
    }

    /// ขาออก: fan-out ตามสถานะเครือข่าย
    ///
    /// ```text
    /// Internet? ──yes──► Nostr (+ TTL reset)
    /// BLE peers? ──yes──► BluetoothMesh (TTL -= 1)   // พร้อมกับ Nostr ได้
    /// LoRa?      ──yes──► LoRa
    /// ไม่มีช่องใดเลย ──► OfflineQueue
    /// ```
    async fn route_packet(
        &self,
        packet: &mut MessagePacket,
    ) -> Result<Vec<TransportType>, RouterError> {
        Self::validate_id(packet)?;

        let status = self.network_status();
        let mut transports = Vec::with_capacity(3);

        if status.is_internet_available {
            packet.ttl = self.config.internet_ttl_reset;
            transports.push(TransportType::Nostr);
        }

        if status.active_ble_peers_count > 0 && packet.ttl > 0 {
            // ลด TTL เฉพาะเมื่อส่ง mesh (ถ้า Nostr รีเซ็ตไว้แล้ว ใช้ค่าหลังรีเซ็ต)
            if !status.is_internet_available {
                packet.ttl = packet.ttl.saturating_sub(1);
            } else if packet.ttl > 0 {
                // มีทั้ง Nostr + BLE: เก็บ TTL สำหรับ mesh hop โดยไม่ลดซ้ำเกิน
                packet.ttl = packet.ttl.saturating_sub(1).max(1);
            }
            transports.push(TransportType::BluetoothMesh);
        }

        if let Some(gateway) = status.selected_gateway_transport() {
            transports.push(gateway);
        }

        if transports.is_empty() {
            return self.enqueue_offline(packet).await;
        }

        for &transport in &transports {
            self.emit(RouterEvent::PacketRouted {
                packet_id: packet.id.clone(),
                transport,
            })?;
        }

        Ok(transports)
    }

    /// คิวท้องถิ่นเมื่อไม่มี Nostr / BLE / LoRa
    async fn enqueue_offline(
        &self,
        packet: &MessagePacket,
    ) -> Result<Vec<TransportType>, RouterError> {
        let mut queue = self.offline_queue.lock().await;
        if queue.len() >= self.config.offline_queue_capacity {
            if let Some(lowest_idx) = queue
                .iter()
                .enumerate()
                .min_by_key(|(_, p)| {
                    (
                        p.payload_tag.routing_weight(),
                        std::cmp::Reverse(p.timestamp),
                    )
                })
                .map(|(i, _)| i)
            {
                queue.remove(lowest_idx);
            } else {
                return Err(RouterError::OfflineQueueFull(
                    self.config.offline_queue_capacity,
                ));
            }
        }
        queue.push(packet.clone());
        let queue_len = queue.len();

        self.emit(RouterEvent::QueuedOffline {
            packet_id: packet.id.clone(),
            queue_len,
        })?;

        self.emit(RouterEvent::PacketRouted {
            packet_id: packet.id.clone(),
            transport: TransportType::OfflineQueue,
        })?;

        Ok(vec![TransportType::OfflineQueue])
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn sample_packet(ttl: u8) -> MessagePacket {
        MessagePacket::with_id(
            "test-id",
            "sender-a",
            "receiver-b",
            b"encrypted".to_vec(),
            1_700_000_000_000,
            ttl,
        )
    }

    #[tokio::test]
    async fn routes_via_nostr_and_resets_ttl() {
        let (_router, handle, _incoming) = ResilNetRouter::new(RouterConfig::default());
        handle.update_network_status(NetworkStatus::new(true, 0));

        let pkt = sample_packet(1);
        let routed = handle.route_packet(pkt).await.unwrap();

        assert_eq!(routed.transport, TransportType::Nostr);
        assert_eq!(routed.transports, vec![TransportType::Nostr]);
        assert_eq!(routed.packet.ttl, DEFAULT_MESH_TTL);
    }

    #[tokio::test]
    async fn fan_out_nostr_and_ble() {
        let (_router, handle, _incoming) = ResilNetRouter::new(RouterConfig::default());
        handle.update_network_status(NetworkStatus::new(true, 2));

        let pkt = sample_packet(5);
        let routed = handle.route_packet(pkt).await.unwrap();

        assert!(routed.transports.contains(&TransportType::Nostr));
        assert!(routed.transports.contains(&TransportType::BluetoothMesh));
    }

    #[tokio::test]
    async fn routes_via_ble_when_internet_down() {
        let (_router, handle, _incoming) = ResilNetRouter::new(RouterConfig::default());
        handle.update_network_status(NetworkStatus::new(false, 3));

        let pkt = sample_packet(3);
        let routed = handle.route_packet(pkt).await.unwrap();

        assert_eq!(routed.transport, TransportType::BluetoothMesh);
        assert_eq!(routed.packet.ttl, 2);
    }

    #[tokio::test]
    async fn queues_when_fully_offline() {
        let (_router, handle, _incoming) = ResilNetRouter::new(RouterConfig::default());
        handle.update_network_status(NetworkStatus::new(false, 0));

        let pkt = sample_packet(5);
        let routed = handle.route_packet(pkt).await.unwrap();

        assert_eq!(routed.transport, TransportType::OfflineQueue);
        assert_eq!(handle.offline_queue_len().await, 1);
    }

    #[tokio::test]
    async fn dedup_blocks_second_ingest() {
        let (_router, handle, _incoming) = ResilNetRouter::new(RouterConfig::default());
        let pkt = sample_packet(5);

        assert!(handle.ingest_packet(pkt.clone()).await.is_ok());
        let err = handle.ingest_packet(pkt).await.unwrap_err();
        assert!(matches!(err, RouterError::Duplicate(_)));
    }

    #[tokio::test]
    async fn mesh_ttl_zero_goes_offline_queue() {
        let (_router, handle, _incoming) = ResilNetRouter::new(RouterConfig::default());
        handle.update_network_status(NetworkStatus::new(false, 2));

        let pkt = sample_packet(0);
        let routed = handle.route_packet(pkt).await.unwrap();
        assert_eq!(routed.transport, TransportType::OfflineQueue);
    }

    #[tokio::test]
    async fn routes_via_halow_when_preferred_and_available() {
        use crate::hybrid_router::{GatewayRadioPreference, NetworkStatus};

        let (_router, handle, _incoming) = ResilNetRouter::new(RouterConfig::default());
        handle.update_network_status(NetworkStatus::with_gateway(
            false,
            0,
            true,
            true,
            true,
            GatewayRadioPreference::HaLow,
        ));

        let pkt = sample_packet(3);
        let routed = handle.route_packet(pkt).await.unwrap();

        assert_eq!(routed.transport, TransportType::HaLow);
        assert_eq!(routed.transports, vec![TransportType::HaLow]);
    }

    #[tokio::test]
    async fn auto_prefers_halow_when_link_up() {
        use crate::hybrid_router::{GatewayRadioPreference, NetworkStatus};

        let (_router, handle, _incoming) = ResilNetRouter::new(RouterConfig::default());
        handle.update_network_status(NetworkStatus::with_gateway(
            false,
            0,
            true,
            true,
            true,
            GatewayRadioPreference::Auto,
        ));

        let routed = handle.route_packet(sample_packet(3)).await.unwrap();
        assert!(routed.transports.contains(&TransportType::HaLow));
        assert!(!routed.transports.contains(&TransportType::LoRa));
    }

    #[tokio::test]
    async fn broadcast_events_reach_subscriber() {
        let (_router, handle, _incoming) = ResilNetRouter::new(RouterConfig::default());
        let mut rx = handle.subscribe_events();

        handle.update_network_status(NetworkStatus::new(true, 1));

        let event = rx.recv().await.unwrap();
        assert!(matches!(event, RouterEvent::NetworkStatusChanged(_)));
    }

    #[tokio::test]
    async fn incoming_mpsc_delivers_after_ingest() {
        let (_router, handle, mut incoming) = ResilNetRouter::new(RouterConfig::default());
        let pkt = sample_packet(5);

        handle.ingest_packet(pkt.clone()).await.unwrap();
        let received = incoming.recv().await.unwrap();
        assert_eq!(received.id, pkt.id);
    }

    fn tagged_packet(id: &str, tag: PayloadTag, ts: u64) -> MessagePacket {
        MessagePacket::with_id_and_tag(
            id,
            "sender",
            "receiver",
            b"chunked-binary".to_vec(),
            ts,
            5,
            tag,
        )
    }

    #[tokio::test]
    async fn offline_queue_drains_by_payload_priority() {
        let (_router, handle, _incoming) = ResilNetRouter::new(RouterConfig::default());
        handle.update_network_status(NetworkStatus::new(false, 0));

        for (id, tag, ts) in [
            ("fw-1", PayloadTag::Firmware, 100),
            ("audio-1", PayloadTag::Audio, 200),
            ("text-1", PayloadTag::Text, 300),
            ("img-1", PayloadTag::Image, 400),
        ] {
            handle
                .route_packet(tagged_packet(id, tag, ts))
                .await
                .unwrap();
        }

        let drained = handle.drain_offline_queue().await;
        let ids: Vec<_> = drained.iter().map(|p| p.id.as_str()).collect();
        assert_eq!(ids, vec!["text-1", "audio-1", "img-1", "fw-1"]);
    }

    #[tokio::test]
    async fn multi_chunk_stream_dedup_and_routing() {
        let (_router, handle, _incoming) = ResilNetRouter::new(RouterConfig::default());
        handle.update_network_status(NetworkStatus::new(false, 0));

        let msg_id = 0xBEEF_u16;
        for i in 0..12u8 {
            assert_eq!(
                handle.check_and_record_chunk(msg_id, i),
                DedupDecision::Accept
            );
            assert_eq!(
                handle.check_and_record_chunk(msg_id, i),
                DedupDecision::Duplicate
            );
        }

        let audio_pkt = tagged_packet("voice-note", PayloadTag::Audio, 1);
        let fw_pkt = tagged_packet("ota-bin", PayloadTag::Firmware, 2);
        handle.route_packet(audio_pkt).await.unwrap();
        handle.route_packet(fw_pkt).await.unwrap();

        let drained = handle.drain_offline_queue().await;
        assert_eq!(drained.len(), 2);
        assert_eq!(drained[0].payload_tag, PayloadTag::Audio);
        assert_eq!(drained[1].payload_tag, PayloadTag::Firmware);

        handle.clear_chunk_stream(msg_id);
        assert_eq!(
            handle.check_and_record_chunk(msg_id, 0),
            DedupDecision::Accept
        );
    }
}

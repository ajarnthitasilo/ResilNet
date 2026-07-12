use std::sync::Arc;
use std::time::Duration;

use parking_lot::RwLock;
use tokio::sync::{broadcast, mpsc, Mutex};

use super::dedup::{DedupCache, DedupDecision};
use super::types::{MessagePacket, NetworkStatus, TransportType};

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

/// ผลการ route — รวมแพ็กเก็ตที่อาจถูกปรับ TTL แล้ว
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct RoutedPacket {
    pub transport: TransportType,
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

    /// ตัดสินใจเส้นทางส่งออก (Hybrid Logic) — คืน transport + แพ็กเก็ตที่ปรับ TTL แล้ว
    pub async fn route_packet(
        &self,
        mut packet: MessagePacket,
    ) -> Result<RoutedPacket, RouterError> {
        let transport = self.inner.route_packet(&mut packet).await?;
        Ok(RoutedPacket { transport, packet })
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
    pub async fn drain_offline_queue(&self) -> Vec<MessagePacket> {
        let mut q = self.inner.offline_queue.lock().await;
        std::mem::take(&mut *q)
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

    /// ขาออก: State Machine เลือกช่องทางตามสถานะเครือข่าย
    ///
    /// ```text
    /// Internet OK?  ──yes──► Internet (TTL := internet_ttl_reset)
    ///      │
    ///      no
    ///      ▼
    /// BLE peers > 0? ──yes──► TTL > 0? ──yes──► BluetoothMesh (TTL -= 1)
    ///      │                      no ──► OfflineQueue หรือ error
    ///      no
    ///      ▼
    /// OfflineQueue
    /// ```
    async fn route_packet(
        &self,
        packet: &mut MessagePacket,
    ) -> Result<TransportType, RouterError> {
        Self::validate_id(packet)?;

        let status = self.network_status();

        // ลำดับที่ 1: Internet — เร็วและครอบคลุม
        if status.is_internet_available {
            packet.ttl = self.config.internet_ttl_reset;
            let transport = TransportType::Internet;
            self.emit(RouterEvent::PacketRouted {
                packet_id: packet.id.clone(),
                transport,
            })?;
            return Ok(transport);
        }

        // ลำดับที่ 2: BLE Mesh — ลด TTL ป้องกันวนลูป
        if status.active_ble_peers_count > 0 {
            if packet.ttl == 0 {
                // TTL หมดแล้ว — ไม่ส่งต่อ mesh อีก เก็บลงคิวแทน
                return self.enqueue_offline(packet).await;
            }

            packet.ttl = packet.ttl.saturating_sub(1);
            let transport = TransportType::BluetoothMesh;
            self.emit(RouterEvent::PacketRouted {
                packet_id: packet.id.clone(),
                transport,
            })?;
            return Ok(transport);
        }

        // ลำดับที่ 3: ไม่มีสัญญาณ — คิวท้องถิ่น
        self.enqueue_offline(packet).await
    }

    /// จำลองการบันทึกลง SQLite/RocksDB ฝั่ง Flutter
    async fn enqueue_offline(
        &self,
        packet: &MessagePacket,
    ) -> Result<TransportType, RouterError> {
        let mut queue = self.offline_queue.lock().await;
        if queue.len() >= self.config.offline_queue_capacity {
            return Err(RouterError::OfflineQueueFull(
                self.config.offline_queue_capacity,
            ));
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

        Ok(TransportType::OfflineQueue)
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
    async fn routes_via_internet_and_resets_ttl() {
        let (_router, handle, _incoming) = ResilNetRouter::new(RouterConfig::default());
        handle.update_network_status(NetworkStatus::new(true, 0));

        let pkt = sample_packet(1);
        let routed = handle.route_packet(pkt).await.unwrap();

        assert_eq!(routed.transport, TransportType::Internet);
        assert_eq!(routed.packet.ttl, DEFAULT_MESH_TTL);
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
}

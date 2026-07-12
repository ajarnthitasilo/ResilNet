//! Data Transfer Objects — mirror types สำหรับ Dart/FFI

use flutter_rust_bridge::frb;

use crate::hybrid_router::{
    MessagePacket, NetworkStatus, RoutedPacket, RouterConfig, TransportType,
};

/// ช่องทางส่งข้อมูล (mirror ของ `TransportType`)
#[frb]
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum TransportTypeDto {
    Internet,
    BluetoothMesh,
    OfflineQueue,
}

impl From<TransportType> for TransportTypeDto {
    fn from(t: TransportType) -> Self {
        match t {
            TransportType::Internet => Self::Internet,
            TransportType::BluetoothMesh => Self::BluetoothMesh,
            TransportType::OfflineQueue => Self::OfflineQueue,
        }
    }
}

/// สถานะเครือข่ายจาก Flutter (`connectivity_plus` + BLE scan)
#[frb]
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct NetworkStatusDto {
    pub is_internet_available: bool,
    pub active_ble_peers_count: u32,
}

impl From<NetworkStatusDto> for NetworkStatus {
    fn from(d: NetworkStatusDto) -> Self {
        NetworkStatus::new(d.is_internet_available, d.active_ble_peers_count as usize)
    }
}

impl From<NetworkStatus> for NetworkStatusDto {
    fn from(s: NetworkStatus) -> Self {
        Self {
            is_internet_available: s.is_internet_available,
            active_ble_peers_count: s.active_ble_peers_count as u32,
        }
    }
}

/// แพ็กเก็ตข้อความข้าม FFI (mirror ของ `MessagePacket`)
#[frb]
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct MessagePacketDto {
    pub id: String,
    pub sender: String,
    pub receiver: String,
    pub payload: Vec<u8>,
    pub timestamp: u64,
    pub ttl: u8,
}

impl From<MessagePacket> for MessagePacketDto {
    fn from(p: MessagePacket) -> Self {
        Self {
            id: p.id,
            sender: p.sender,
            receiver: p.receiver,
            payload: p.payload,
            timestamp: p.timestamp,
            ttl: p.ttl,
        }
    }
}

impl From<MessagePacketDto> for MessagePacket {
    fn from(d: MessagePacketDto) -> Self {
        MessagePacket::with_id(
            d.id,
            d.sender,
            d.receiver,
            d.payload,
            d.timestamp,
            d.ttl,
        )
    }
}

/// ผลการ route ส่งกลับไปยัง Flutter
#[frb]
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct RoutedPacketDto {
    pub transport: TransportTypeDto,
    pub packet: MessagePacketDto,
}

impl From<RoutedPacket> for RoutedPacketDto {
    fn from(r: RoutedPacket) -> Self {
        Self {
            transport: r.transport.into(),
            packet: r.packet.into(),
        }
    }
}

/// การตั้งค่า Router จาก Flutter
#[frb]
#[derive(Debug, Clone)]
pub struct RouterConfigDto {
    pub dedup_capacity: u32,
    pub dedup_ttl_secs: u64,
    pub internet_ttl_reset: u8,
    pub offline_queue_capacity: u32,
    pub event_channel_capacity: u32,
    pub incoming_channel_capacity: u32,
}

impl Default for RouterConfigDto {
    fn default() -> Self {
        let c = RouterConfig::default();
        Self {
            dedup_capacity: c.dedup_capacity as u32,
            dedup_ttl_secs: c.dedup_ttl_secs,
            internet_ttl_reset: c.internet_ttl_reset,
            offline_queue_capacity: c.offline_queue_capacity as u32,
            event_channel_capacity: c.event_channel_capacity as u32,
            incoming_channel_capacity: c.incoming_channel_capacity as u32,
        }
    }
}

impl From<RouterConfigDto> for RouterConfig {
    fn from(d: RouterConfigDto) -> Self {
        Self {
            dedup_capacity: d.dedup_capacity as usize,
            dedup_ttl_secs: d.dedup_ttl_secs,
            internet_ttl_reset: d.internet_ttl_reset,
            offline_queue_capacity: d.offline_queue_capacity as usize,
            event_channel_capacity: d.event_channel_capacity as usize,
            incoming_channel_capacity: d.incoming_channel_capacity as usize,
        }
    }
}

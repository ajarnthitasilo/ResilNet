//! Data Transfer Objects — mirror types สำหรับ Dart/FFI

use flutter_rust_bridge::frb;

use crate::hybrid_router::{
    MessagePacket, NetworkStatus, PayloadTag, RoutedPacket, RouterConfig, TransportType,
};
use crate::nostr::{NostrPoolStatus, RelayStatus, ResilNetEnvelope};

/// ช่องทางส่งข้อมูล (mirror ของ `TransportType`)
#[frb]
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum TransportTypeDto {
    Nostr,
    BluetoothMesh,
    LoRa,
    OfflineQueue,
}

impl From<TransportType> for TransportTypeDto {
    fn from(t: TransportType) -> Self {
        match t {
            TransportType::Nostr => Self::Nostr,
            TransportType::BluetoothMesh => Self::BluetoothMesh,
            TransportType::LoRa => Self::LoRa,
            TransportType::OfflineQueue => Self::OfflineQueue,
        }
    }
}

/// ประเภท payload (wire tag: Text=1, Image=2, Audio=3, Firmware=4, Ack=5)
#[frb]
#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
pub enum PayloadTagDto {
    #[default]
    Text,
    Image,
    Audio,
    Firmware,
    Ack,
}

impl From<PayloadTag> for PayloadTagDto {
    fn from(t: PayloadTag) -> Self {
        match t {
            PayloadTag::Text => Self::Text,
            PayloadTag::Image => Self::Image,
            PayloadTag::Audio => Self::Audio,
            PayloadTag::Firmware => Self::Firmware,
            PayloadTag::Ack => Self::Ack,
        }
    }
}

impl From<PayloadTagDto> for PayloadTag {
    fn from(d: PayloadTagDto) -> Self {
        match d {
            PayloadTagDto::Text => Self::Text,
            PayloadTagDto::Image => Self::Image,
            PayloadTagDto::Audio => Self::Audio,
            PayloadTagDto::Firmware => Self::Firmware,
            PayloadTagDto::Ack => Self::Ack,
        }
    }
}

impl PayloadTagDto {
    pub const fn from_u8(value: u8) -> Option<Self> {
        match value {
            1 => Some(Self::Text),
            2 => Some(Self::Image),
            3 => Some(Self::Audio),
            4 => Some(Self::Firmware),
            5 => Some(Self::Ack),
            _ => None,
        }
    }

    pub const fn as_u8(self) -> u8 {
        match self {
            Self::Text => 1,
            Self::Image => 2,
            Self::Audio => 3,
            Self::Firmware => 4,
            Self::Ack => 5,
        }
    }
}

/// สถานะเครือข่ายจาก Flutter (`connectivity_plus` + BLE + LoRa)
#[frb]
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct NetworkStatusDto {
    pub is_internet_available: bool,
    pub active_ble_peers_count: u32,
    pub lora_available: bool,
}

impl From<NetworkStatusDto> for NetworkStatus {
    fn from(d: NetworkStatusDto) -> Self {
        NetworkStatus::with_lora(
            d.is_internet_available,
            d.active_ble_peers_count as usize,
            d.lora_available,
        )
    }
}

impl From<NetworkStatus> for NetworkStatusDto {
    fn from(s: NetworkStatus) -> Self {
        Self {
            is_internet_available: s.is_internet_available,
            active_ble_peers_count: s.active_ble_peers_count as u32,
            lora_available: s.lora_available,
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
    pub payload_tag: PayloadTagDto,
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
            payload_tag: p.payload_tag.into(),
        }
    }
}

impl From<MessagePacketDto> for MessagePacket {
    fn from(d: MessagePacketDto) -> Self {
        MessagePacket::with_id_and_tag(
            d.id,
            d.sender,
            d.receiver,
            d.payload,
            d.timestamp,
            d.ttl,
            d.payload_tag.into(),
        )
    }
}

/// ผลการ route ส่งกลับไปยัง Flutter
#[frb]
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct RoutedPacketDto {
    pub transport: TransportTypeDto,
    pub transports: Vec<TransportTypeDto>,
    pub packet: MessagePacketDto,
}

impl From<RoutedPacket> for RoutedPacketDto {
    fn from(r: RoutedPacket) -> Self {
        Self {
            transport: r.transport.into(),
            transports: r.transports.into_iter().map(Into::into).collect(),
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

#[frb]
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct RelayStatusDto {
    pub url: String,
    pub connected: bool,
}

impl From<RelayStatus> for RelayStatusDto {
    fn from(r: RelayStatus) -> Self {
        Self {
            url: r.url,
            connected: r.connected,
        }
    }
}

#[frb]
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct NostrPoolStatusDto {
    pub initialized: bool,
    pub pubkey_hex: String,
    pub npub: String,
    pub connected_relays: u32,
    pub total_relays: u32,
    pub relays: Vec<RelayStatusDto>,
}

impl From<NostrPoolStatus> for NostrPoolStatusDto {
    fn from(s: NostrPoolStatus) -> Self {
        Self {
            initialized: s.initialized,
            pubkey_hex: s.pubkey_hex,
            npub: s.npub,
            connected_relays: s.connected_relays,
            total_relays: s.total_relays,
            relays: s.relays.into_iter().map(Into::into).collect(),
        }
    }
}

/// Result of first-time / restore Nostr identity init
#[frb]
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct NostrInitResultDto {
    pub status: NostrPoolStatusDto,
    /// Persist in Flutter secure storage; empty if restore failed mid-flight
    pub secret_key_hex: String,
}

#[frb]
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct ResilNetEnvelopeDto {
    pub id: String,
    pub sender: String,
    pub receiver: String,
    pub payload_b64: String,
    pub timestamp: u64,
    pub ttl: u8,
    pub payload_tag: u8,
    pub kind: String,
}

impl From<ResilNetEnvelope> for ResilNetEnvelopeDto {
    fn from(e: ResilNetEnvelope) -> Self {
        Self {
            id: e.id,
            sender: e.sender,
            receiver: e.receiver,
            payload_b64: e.payload_b64,
            timestamp: e.timestamp,
            ttl: e.ttl,
            payload_tag: e.payload_tag,
            kind: e.kind,
        }
    }
}

impl From<ResilNetEnvelopeDto> for ResilNetEnvelope {
    fn from(d: ResilNetEnvelopeDto) -> Self {
        Self {
            v: 1,
            id: d.id,
            sender: d.sender,
            receiver: d.receiver,
            payload_b64: d.payload_b64,
            timestamp: d.timestamp,
            ttl: d.ttl,
            payload_tag: d.payload_tag,
            kind: d.kind,
        }
    }
}

/// Anonymous geohash presence seen on Nostr (not a chat peer).
#[frb]
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct GeoPresenceDto {
    pub event_id: String,
    pub pubkey_hex: String,
    pub geohash: String,
    pub nick: String,
    pub created_at: u64,
}

impl From<crate::nostr::GeoPresenceEvent> for GeoPresenceDto {
    fn from(e: crate::nostr::GeoPresenceEvent) -> Self {
        Self {
            event_id: e.event_id,
            pubkey_hex: e.pubkey_hex,
            geohash: e.geohash,
            nick: e.nick,
            created_at: e.created_at,
        }
    }
}

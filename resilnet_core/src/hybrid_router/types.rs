use uuid::Uuid;

/// ช่องทางส่งข้อมูลที่ Router เลือกใช้ (อาจเลือกหลายช่องพร้อมกัน)
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum TransportType {
    /// Nostr relays (decentralized cloud replacement)
    Nostr,
    /// BLE Mesh store-and-forward — ทนทานเมื่อเน็ตล่ม
    BluetoothMesh,
    /// LoRa via ESP32 mule / radio bridge
    LoRa,
    /// Wi‑Fi HaLow via ESP32 gateway (Sub‑1 GHz, switchable with LoRa)
    HaLow,
    /// คิวท้องถิ่น รอ Nostr/mesh กลับมา
    OfflineQueue,
}

impl std::fmt::Display for TransportType {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Self::Nostr => write!(f, "Nostr"),
            Self::BluetoothMesh => write!(f, "BluetoothMesh"),
            Self::LoRa => write!(f, "LoRa"),
            Self::HaLow => write!(f, "HaLow"),
            Self::OfflineQueue => write!(f, "OfflineQueue"),
        }
    }
}

/// โหมดวิทยุที่ผู้ใช้เลือกบนเกตเวย์ (LoRa / HaLow / Auto)
#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
pub enum GatewayRadioPreference {
    LoRa,
    HaLow,
    #[default]
    Auto,
}

/// สถานะเครือข่ายปัจจุบัน — อัปเดตจาก Flutter (connectivity + BLE + gateway radios)
#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
pub struct NetworkStatus {
    pub is_internet_available: bool,
    pub active_ble_peers_count: usize,
    pub lora_available: bool,
    pub halow_available: bool,
    pub halow_link_up: bool,
    pub gateway_radio_preference: GatewayRadioPreference,
}

impl NetworkStatus {
    pub const fn new(is_internet_available: bool, active_ble_peers_count: usize) -> Self {
        Self {
            is_internet_available,
            active_ble_peers_count,
            lora_available: false,
            halow_available: false,
            halow_link_up: false,
            gateway_radio_preference: GatewayRadioPreference::Auto,
        }
    }

    pub const fn with_lora(
        is_internet_available: bool,
        active_ble_peers_count: usize,
        lora_available: bool,
    ) -> Self {
        Self {
            is_internet_available,
            active_ble_peers_count,
            lora_available,
            halow_available: false,
            halow_link_up: false,
            gateway_radio_preference: GatewayRadioPreference::Auto,
        }
    }

    pub const fn with_gateway(
        is_internet_available: bool,
        active_ble_peers_count: usize,
        lora_available: bool,
        halow_available: bool,
        halow_link_up: bool,
        gateway_radio_preference: GatewayRadioPreference,
    ) -> Self {
        Self {
            is_internet_available,
            active_ble_peers_count,
            lora_available,
            halow_available,
            halow_link_up,
            gateway_radio_preference,
        }
    }

    /// มีช่องทางส่งออกอย่างน้อยหนึ่งช่องทาง (ไม่รวม offline queue)
    pub const fn has_live_transport(&self) -> bool {
        self.is_internet_available
            || self.active_ble_peers_count > 0
            || self.lora_available
            || self.halow_available
    }

    /// เลือกวิทยุเกตเวย์เดียว (LoRa หรือ HaLow) — ไม่ fan-out ทั้งสองบน RF
    pub const fn selected_gateway_transport(&self) -> Option<TransportType> {
        match self.gateway_radio_preference {
            GatewayRadioPreference::LoRa => {
                if self.lora_available {
                    Some(TransportType::LoRa)
                } else if self.halow_available {
                    Some(TransportType::HaLow)
                } else {
                    None
                }
            }
            GatewayRadioPreference::HaLow => {
                if self.halow_available {
                    Some(TransportType::HaLow)
                } else if self.lora_available {
                    Some(TransportType::LoRa)
                } else {
                    None
                }
            }
            GatewayRadioPreference::Auto => {
                if self.halow_available && self.halow_link_up {
                    Some(TransportType::HaLow)
                } else if self.lora_available {
                    Some(TransportType::LoRa)
                } else if self.halow_available {
                    Some(TransportType::HaLow)
                } else {
                    None
                }
            }
        }
    }
}

/// ประเภท payload สำหรับ routing priority (ค่าตัวเลขสอดคล้อง wire tag)
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, Default)]
#[repr(u8)]
pub enum PayloadTag {
    #[default]
    Text = 1,
    Image = 2,
    Audio = 3,
    Firmware = 4,
    Ack = 5,
}

impl PayloadTag {
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
        self as u8
    }

    /// น้ำหนักสำหรับ priority queue (สูง = ส่งก่อน)
    /// Emergency Text/Alerts > ACK > Audio > Image > Firmware
    pub const fn routing_weight(self) -> u8 {
        match self {
            Self::Text => 4,
            Self::Ack => 4,
            Self::Audio => 3,
            Self::Image => 2,
            Self::Firmware => 1,
        }
    }
}

/// แพ็กเก็ตข้อความมาตรฐานของ ResilNet
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct MessagePacket {
    pub id: String,
    pub sender: String,
    pub receiver: String,
    pub payload: Vec<u8>,
    pub timestamp: u64,
    pub ttl: u8,
    pub payload_tag: PayloadTag,
}

impl MessagePacket {
    /// สร้างแพ็กเก็ตใหม่พร้อม UUID v4
    pub fn new(
        sender: impl Into<String>,
        receiver: impl Into<String>,
        payload: Vec<u8>,
        timestamp: u64,
        ttl: u8,
    ) -> Self {
        Self::with_tag(
            sender,
            receiver,
            payload,
            timestamp,
            ttl,
            PayloadTag::Text,
        )
    }

    /// สร้างแพ็กเก็ตใหม่พร้อมระบุ payload tag
    pub fn with_tag(
        sender: impl Into<String>,
        receiver: impl Into<String>,
        payload: Vec<u8>,
        timestamp: u64,
        ttl: u8,
        payload_tag: PayloadTag,
    ) -> Self {
        Self {
            id: Uuid::new_v4().to_string(),
            sender: sender.into(),
            receiver: receiver.into(),
            payload,
            timestamp,
            ttl,
            payload_tag,
        }
    }

    /// สร้างจากข้อมูลที่มี id อยู่แล้ว (เช่น ซิงก์จาก SQLite ฝั่ง Flutter)
    pub fn with_id(
        id: impl Into<String>,
        sender: impl Into<String>,
        receiver: impl Into<String>,
        payload: Vec<u8>,
        timestamp: u64,
        ttl: u8,
    ) -> Self {
        Self::with_id_and_tag(
            id,
            sender,
            receiver,
            payload,
            timestamp,
            ttl,
            PayloadTag::Text,
        )
    }

    /// สร้างจากข้อมูลที่มี id และ payload tag
    pub fn with_id_and_tag(
        id: impl Into<String>,
        sender: impl Into<String>,
        receiver: impl Into<String>,
        payload: Vec<u8>,
        timestamp: u64,
        ttl: u8,
        payload_tag: PayloadTag,
    ) -> Self {
        Self {
            id: id.into(),
            sender: sender.into(),
            receiver: receiver.into(),
            payload,
            timestamp,
            ttl,
            payload_tag,
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn payload_tag_round_trip() {
        assert_eq!(PayloadTag::from_u8(1), Some(PayloadTag::Text));
        assert_eq!(PayloadTag::from_u8(3), Some(PayloadTag::Audio));
        assert_eq!(PayloadTag::from_u8(99), None);
        assert_eq!(PayloadTag::Firmware.as_u8(), 4);
        assert_eq!(PayloadTag::Ack.as_u8(), 5);
    }

    #[test]
    fn routing_weight_ordering() {
        assert!(PayloadTag::Text.routing_weight() > PayloadTag::Audio.routing_weight());
        assert!(PayloadTag::Audio.routing_weight() > PayloadTag::Image.routing_weight());
        assert!(PayloadTag::Image.routing_weight() > PayloadTag::Firmware.routing_weight());
    }
}

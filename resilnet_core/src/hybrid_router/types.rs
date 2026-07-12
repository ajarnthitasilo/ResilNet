use uuid::Uuid;

/// ช่องทางส่งข้อมูลที่ Router เลือกใช้
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum TransportType {
    /// Supabase / TCP — ความเร็วสูง ครอบคลุมกว้าง
    Internet,
    /// BLE Mesh store-and-forward — ทนทานเมื่อเน็ตล่ม
    BluetoothMesh,
    /// คิวท้องถิ่น (SQLite/RocksDB ฝั่ง Flutter) รอสัญญาณกลับมา
    OfflineQueue,
}

impl std::fmt::Display for TransportType {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Self::Internet => write!(f, "Internet"),
            Self::BluetoothMesh => write!(f, "BluetoothMesh"),
            Self::OfflineQueue => write!(f, "OfflineQueue"),
        }
    }
}

/// สถานะเครือข่ายปัจจุบัน — อัปเดตจาก Flutter (connectivity + BLE scan)
#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
pub struct NetworkStatus {
    pub is_internet_available: bool,
    pub active_ble_peers_count: usize,
}

impl NetworkStatus {
    pub const fn new(is_internet_available: bool, active_ble_peers_count: usize) -> Self {
        Self {
            is_internet_available,
            active_ble_peers_count,
        }
    }

    /// มีช่องทางส่งออกอย่างน้อยหนึ่งช่องทาง (ไม่รวม offline queue)
    pub const fn has_live_transport(&self) -> bool {
        self.is_internet_available || self.active_ble_peers_count > 0
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
        Self {
            id: Uuid::new_v4().to_string(),
            sender: sender.into(),
            receiver: receiver.into(),
            payload,
            timestamp,
            ttl,
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
        Self {
            id: id.into(),
            sender: sender.into(),
            receiver: receiver.into(),
            payload,
            timestamp,
            ttl,
        }
    }
}

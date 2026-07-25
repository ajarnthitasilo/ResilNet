//! ResilNet application-specific Nostr event kinds and JSON envelopes.

use serde::{Deserialize, Serialize};

/// Encrypted direct message (ciphertext already E2EE'd by Flutter RSA/AES layer).
pub const KIND_DIRECT: u16 = 31_234;
/// Signed emergency / community broadcast (legacy; no longer published).
pub const KIND_BROADCAST: u16 = 31_235;
/// Optional node health / geo heartbeat.
pub const KIND_NODE_HEALTH: u16 = 31_236;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ResilNetEventKind {
    Direct,
    Broadcast,
    NodeHealth,
}

impl ResilNetEventKind {
    pub const fn as_u16(self) -> u16 {
        match self {
            Self::Direct => KIND_DIRECT,
            Self::Broadcast => KIND_BROADCAST,
            Self::NodeHealth => KIND_NODE_HEALTH,
        }
    }

    pub const fn from_u16(v: u16) -> Option<Self> {
        match v {
            KIND_DIRECT => Some(Self::Direct),
            KIND_BROADCAST => Some(Self::Broadcast),
            KIND_NODE_HEALTH => Some(Self::NodeHealth),
            _ => None,
        }
    }
}

/// Wire envelope published as Nostr event `content` (JSON string).
///
/// `id` is the ResilNet message id used for cross-transport dedup
/// (BLE / LoRa / Nostr).
#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq)]
pub struct ResilNetEnvelope {
    pub v: u8,
    pub id: String,
    pub sender: String,
    pub receiver: String,
    /// Base64 ciphertext / signed payload (same bytes as mesh wire when possible).
    pub payload_b64: String,
    pub timestamp: u64,
    pub ttl: u8,
    pub payload_tag: u8,
    #[serde(default)]
    pub kind: String,
}

impl ResilNetEnvelope {
    pub fn to_json(&self) -> Result<String, serde_json::Error> {
        serde_json::to_string(self)
    }

    pub fn from_json(s: &str) -> Result<Self, serde_json::Error> {
        serde_json::from_str(s)
    }
}

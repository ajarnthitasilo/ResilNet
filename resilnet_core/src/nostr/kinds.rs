//! ResilNet application-specific Nostr event kinds and JSON envelopes.

use serde::{Deserialize, Serialize};

/// Encrypted direct message (ciphertext already E2EE'd by Flutter RSA/AES layer).
pub const KIND_DIRECT: u16 = 31_234;
/// Signed emergency / community broadcast (legacy; no longer published).
pub const KIND_BROADCAST: u16 = 31_235;
/// Optional node health / geo heartbeat.
pub const KIND_NODE_HEALTH: u16 = 31_236;
/// Bitchat-style geohash presence (NIP-16 ephemeral range).
///
/// Signed with a throwaway secp256k1 key — not the long-lived Nostr messaging key.
/// Tags: `g` = geohash cell, `client` = resilnet, optional `expiration` (NIP-40).
///
/// Content may include ResilNet RSA `rid` + `pk` so Area peers become messageable
/// without QR. Publishing `pk` on public relays makes the Area identity linkable
/// while present (acceptable product tradeoff; keep events ephemeral).
pub const KIND_GEO_PRESENCE: u16 = 20_050;

/// How long presence events remain valid (seconds) for subscribe window / NIP-40.
pub const GEO_PRESENCE_TTL_SECS: u64 = 180;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ResilNetEventKind {
    Direct,
    Broadcast,
    NodeHealth,
    GeoPresence,
}

impl ResilNetEventKind {
    pub const fn as_u16(self) -> u16 {
        match self {
            Self::Direct => KIND_DIRECT,
            Self::Broadcast => KIND_BROADCAST,
            Self::NodeHealth => KIND_NODE_HEALTH,
            Self::GeoPresence => KIND_GEO_PRESENCE,
        }
    }

    pub const fn from_u16(v: u16) -> Option<Self> {
        match v {
            KIND_DIRECT => Some(Self::Direct),
            KIND_BROADCAST => Some(Self::Broadcast),
            KIND_NODE_HEALTH => Some(Self::NodeHealth),
            KIND_GEO_PRESENCE => Some(Self::GeoPresence),
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

/// Compact geohash presence payload (event content).
///
/// v1 = anon nick only. v2+ may include ResilNet RSA binding (`rid` + `pk`).
#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq)]
pub struct GeoPresenceContent {
    pub v: u8,
    pub geohash: String,
    /// Display nick (may be real display name when rid/pk present).
    pub nick: String,
    /// ResilNet user id = hash(public PEM). Empty on legacy anon events.
    #[serde(default)]
    pub rid: String,
    /// Compact or PEM RSA public key. Empty on legacy anon events.
    #[serde(default)]
    pub pk: String,
}

impl GeoPresenceContent {
    pub fn to_json(&self) -> Result<String, serde_json::Error> {
        serde_json::to_string(self)
    }

    pub fn from_json(s: &str) -> Result<Self, serde_json::Error> {
        serde_json::from_str(s)
    }
}

/// Parsed inbound geohash presence for Flutter.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct GeoPresenceEvent {
    pub event_id: String,
    pub pubkey_hex: String,
    pub geohash: String,
    pub nick: String,
    pub created_at: u64,
    /// ResilNet id when present (may be empty for legacy anon).
    pub rid: String,
    /// RSA public key material when present (may be empty).
    pub pk: String,
}

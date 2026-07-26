//! Nostr protocol layer — identity, relay pool, ResilNet event kinds.
//!
//! Replaces the former Supabase/cloud sync path with decentralized relays.

mod identity;
mod kinds;
mod relay_pool;

pub use identity::{NostrIdentity, NostrIdentityInfo};
pub use kinds::{
    GeoPresenceContent, GeoPresenceEvent, ResilNetEnvelope, ResilNetEventKind,
    GEO_PRESENCE_TTL_SECS, KIND_BROADCAST, KIND_DIRECT, KIND_GEO_PRESENCE, KIND_NODE_HEALTH,
};
pub use relay_pool::{NostrPoolHandle, NostrPoolStatus, RelayStatus, DEFAULT_RELAYS};

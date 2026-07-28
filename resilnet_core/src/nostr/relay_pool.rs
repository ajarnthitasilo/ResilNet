//! Relay pool manager — multi-relay WebSocket connect, publish, subscribe.

use std::sync::Arc;
use std::time::Duration;

use nostr_sdk::prelude::*;
use parking_lot::RwLock;
use thiserror::Error;
use tokio::sync::broadcast;

use super::identity::NostrIdentity;
use super::kinds::{
    GeoNoticeEvent, GeoPresenceContent, GeoPresenceEvent, ResilNetEnvelope, ResilNetEventKind,
    GEO_NOTICE_BACKFILL_SECS, GEO_PRESENCE_TTL_SECS, KIND_BROADCAST, KIND_DIRECT,
    KIND_GEO_NOTICE, KIND_GEO_PRESENCE,
};

/// Default public relays (can be overridden from Flutter).
/// Diversified list — some regions block or throttle a subset of these.
pub const DEFAULT_RELAYS: &[&str] = &[
    "wss://relay.damus.io",
    "wss://nos.lol",
    "wss://relay.nostr.band",
    "wss://nostr.mom",
    "wss://relay.primal.net",
    "wss://offchain.pub",
    "wss://nostr.bitcoiner.social",
    "wss://eden.nostr.land",
];

/// How long to wait for at least one relay after connect/reconnect.
const CONNECT_WAIT: Duration = Duration::from_secs(12);
const CONNECT_POLL: Duration = Duration::from_millis(400);
const GEO_NOTICE_FETCH_TIMEOUT: Duration = Duration::from_secs(12);

#[derive(Debug, Error)]
pub enum PoolError {
    #[error("nostr client not initialized")]
    NotInitialized,
    #[error("relay error: {0}")]
    Relay(String),
    #[error("event build error: {0}")]
    Event(String),
    #[error("identity error: {0}")]
    Identity(String),
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct RelayStatus {
    pub url: String,
    pub connected: bool,
}

#[derive(Debug, Clone, PartialEq, Eq, Default)]
pub struct NostrPoolStatus {
    pub initialized: bool,
    pub pubkey_hex: String,
    pub npub: String,
    pub connected_relays: u32,
    pub total_relays: u32,
    pub relays: Vec<RelayStatus>,
}

/// Handle cloneable across FFI tasks.
#[derive(Clone)]
pub struct NostrPoolHandle {
    inner: Arc<NostrPoolInner>,
}

struct NostrPoolInner {
    identity: RwLock<Option<NostrIdentity>>,
    client: RwLock<Option<Client>>,
    relay_urls: RwLock<Vec<String>>,
    /// Incoming ResilNet envelopes (after parse) for Flutter / router ingest.
    event_tx: broadcast::Sender<ResilNetEnvelope>,
    /// Anonymous geohash presence (never routed as chat).
    presence_tx: broadcast::Sender<GeoPresenceEvent>,
    /// Public geohash notices (plaintext bulletin board).
    notice_tx: broadcast::Sender<GeoNoticeEvent>,
    /// Active geo presence subscription id (if any).
    geo_sub_id: RwLock<Option<SubscriptionId>>,
    /// Active geo notice subscription id (if any).
    geo_notice_sub_id: RwLock<Option<SubscriptionId>>,
    status: RwLock<NostrPoolStatus>,
}

impl NostrPoolHandle {
    pub fn new() -> Self {
        let (event_tx, _) = broadcast::channel(256);
        let (presence_tx, _) = broadcast::channel(256);
        let (notice_tx, _) = broadcast::channel(256);
        Self {
            inner: Arc::new(NostrPoolInner {
                identity: RwLock::new(None),
                client: RwLock::new(None),
                relay_urls: RwLock::new(
                    DEFAULT_RELAYS.iter().map(|s| (*s).to_string()).collect(),
                ),
                event_tx,
                presence_tx,
                notice_tx,
                geo_sub_id: RwLock::new(None),
                geo_notice_sub_id: RwLock::new(None),
                status: RwLock::new(NostrPoolStatus::default()),
            }),
        }
    }

    pub fn subscribe_envelopes(&self) -> broadcast::Receiver<ResilNetEnvelope> {
        self.inner.event_tx.subscribe()
    }

    pub fn subscribe_geo_presence_events(&self) -> broadcast::Receiver<GeoPresenceEvent> {
        self.inner.presence_tx.subscribe()
    }

    pub fn subscribe_geo_notice_events(&self) -> broadcast::Receiver<GeoNoticeEvent> {
        self.inner.notice_tx.subscribe()
    }

    pub fn status(&self) -> NostrPoolStatus {
        self.inner.status.read().clone()
    }

    /// Init or restore identity and connect to relays.
    pub async fn init(
        &self,
        secret_key_hex: Option<String>,
        relay_urls: Option<Vec<String>>,
    ) -> Result<NostrPoolStatus, PoolError> {
        if let Some(urls) = relay_urls {
            if !urls.is_empty() {
                *self.inner.relay_urls.write() = urls;
            }
        }

        // Already initialized (e.g. Flutter retry after soft failure) — reconnect.
        if self.inner.client.read().is_some() {
            self.reconnect().await?;
            let mut st = self.inner.status.read().clone();
            st.initialized = true;
            if let Ok(info) = self
                .inner
                .identity
                .read()
                .as_ref()
                .ok_or(PoolError::NotInitialized)
                .and_then(|id| id.info().map_err(|e| PoolError::Identity(e.to_string())))
            {
                st.pubkey_hex = info.pubkey_hex;
                st.npub = info.npub;
            }
            *self.inner.status.write() = st.clone();
            return Ok(st);
        }

        let identity = match secret_key_hex {
            Some(hex) if !hex.trim().is_empty() => NostrIdentity::from_secret_hex(&hex)
                .map_err(|e| PoolError::Identity(e.to_string()))?,
            _ => NostrIdentity::generate(),
        };

        let info = identity
            .info()
            .map_err(|e| PoolError::Identity(e.to_string()))?;

        let client = Client::new(identity.keys().clone());
        let urls = self.inner.relay_urls.read().clone();
        for url in &urls {
            // Don't abort entire init if one relay URL fails to add.
            if let Err(e) = client.add_relay(url.clone()).await {
                tracing::warn!(%url, error = %e, "nostr add_relay failed");
            }
        }
        client.connect().await;

        // Persist client before subscribe so status can report total relays
        // even when no relay is up yet (avoids Flutter UI stuck at 0/0).
        *self.inner.identity.write() = Some(identity);
        *self.inner.client.write() = Some(client.clone());
        self.refresh_status_from_client().await;

        self.ensure_direct_subscription(&client).await;

        // Background notification listener (once per process pool)
        let handle = self.clone();
        tokio::spawn(async move {
            handle.run_notifications_loop().await;
        });

        // Wait until ≥1 relay is up (or timeout) — 400ms was too short on mobile.
        self.wait_for_relay_connection().await;

        let mut st = self.inner.status.read().clone();
        st.initialized = true;
        st.pubkey_hex = info.pubkey_hex;
        st.npub = info.npub;
        // secret is returned once via FFI init response — not stored in status
        *self.inner.status.write() = st.clone();
        Ok(st)
    }

    /// Returns secret hex for Flutter secure storage (only after init).
    pub fn export_secret_hex(&self) -> Result<String, PoolError> {
        let guard = self.inner.identity.read();
        let id = guard.as_ref().ok_or(PoolError::NotInitialized)?;
        let info = id
            .info()
            .map_err(|e| PoolError::Identity(e.to_string()))?;
        Ok(info.secret_key_hex)
    }

    pub async fn publish_envelope(
        &self,
        envelope: ResilNetEnvelope,
        kind: ResilNetEventKind,
    ) -> Result<String, PoolError> {
        let client = {
            let guard = self.inner.client.read();
            guard.clone().ok_or(PoolError::NotInitialized)?
        };
        let identity = {
            let guard = self.inner.identity.read();
            guard.clone().ok_or(PoolError::NotInitialized)?
        };

        let content = envelope
            .to_json()
            .map_err(|e| PoolError::Event(e.to_string()))?;

        let mut tags = vec![
            Tag::custom(TagKind::Custom("client".into()), ["resilnet"]),
            Tag::custom(TagKind::Custom("rid".into()), [envelope.id.clone()]),
        ];
        if !envelope.receiver.is_empty() && envelope.receiver != "BROADCAST" {
            tags.push(Tag::custom(
                TagKind::Custom("p_resil".into()),
                [envelope.receiver.clone()],
            ));
        }

        let mut builder = EventBuilder::new(Kind::Custom(kind.as_u16()), content);
        for tag in tags {
            builder = builder.tag(tag);
        }
        let event = builder
            .sign_with_keys(identity.keys())
            .map_err(|e| PoolError::Event(e.to_string()))?;
        let event_id = client
            .send_event(event)
            .await
            .map_err(|e| PoolError::Relay(e.to_string()))?;

        self.refresh_status_from_client().await;
        Ok(event_id.to_hex())
    }

    /// Publish geohash presence signed with a fresh ephemeral Nostr key.
    ///
    /// When `rid`/`pk` are non-empty, content carries ResilNet RSA binding so
    /// receivers can upsert a messageable peer without QR. Private keys never leave the device.
    pub async fn publish_geo_presence(
        &self,
        geohash: &str,
        nick: &str,
        rid: &str,
        pk: &str,
    ) -> Result<String, PoolError> {
        let geo = geohash.trim().to_lowercase();
        if geo.is_empty() || geo.len() > 12 {
            return Err(PoolError::Event("invalid geohash".into()));
        }

        let client = {
            let guard = self.inner.client.read();
            guard.clone().ok_or(PoolError::NotInitialized)?
        };

        let ephemeral = Keys::generate();
        let pubkey_hex = ephemeral.public_key().to_hex();
        let rid = rid.trim().to_string();
        let pk = pk.trim().to_string();
        let nick_trim = nick.trim().to_string();
        let nick = if !nick_trim.is_empty() {
            nick_trim
        } else if !rid.is_empty() {
            rid.chars().take(10).collect::<String>()
        } else {
            anon_nick_from_pubkey(&pubkey_hex)
        };
        let v = if !rid.is_empty() && !pk.is_empty() { 2 } else { 1 };
        let content = GeoPresenceContent {
            v,
            geohash: geo.clone(),
            nick,
            rid,
            pk,
        }
        .to_json()
        .map_err(|e| PoolError::Event(e.to_string()))?;

        let expires = Timestamp::now().as_u64() + GEO_PRESENCE_TTL_SECS;
        let tags = vec![
            Tag::custom(
                TagKind::SingleLetter(SingleLetterTag::lowercase(Alphabet::G)),
                [geo.clone()],
            ),
            Tag::custom(TagKind::Custom("client".into()), ["resilnet"]),
            Tag::custom(
                TagKind::Custom("expiration".into()),
                [expires.to_string()],
            ),
        ];

        let mut builder = EventBuilder::new(Kind::Custom(KIND_GEO_PRESENCE), content);
        for tag in tags {
            builder = builder.tag(tag);
        }
        let event = builder
            .sign_with_keys(&ephemeral)
            .map_err(|e| PoolError::Event(e.to_string()))?;
        let event_id = client
            .send_event(event)
            .await
            .map_err(|e| PoolError::Relay(e.to_string()))?;

        Ok(event_id.to_hex())
    }

    /// Replace the active geohash presence filter (empty = unsubscribe).
    pub async fn set_geo_presence_subscription(
        &self,
        geohashes: Vec<String>,
    ) -> Result<(), PoolError> {
        let client = {
            let guard = self.inner.client.read();
            guard.clone().ok_or(PoolError::NotInitialized)?
        };

        let old_sub = self.inner.geo_sub_id.write().take();
        if let Some(old) = old_sub {
            let _ = client.unsubscribe(old).await;
        }

        let cleaned: Vec<String> = geohashes
            .into_iter()
            .map(|g| g.trim().to_lowercase())
            .filter(|g| !g.is_empty() && g.len() <= 12)
            .collect();
        if cleaned.is_empty() {
            return Ok(());
        }

        let since = Timestamp::now() - GEO_PRESENCE_TTL_SECS;
        let filter = Filter::new()
            .kind(Kind::Custom(KIND_GEO_PRESENCE))
            .custom_tags(SingleLetterTag::lowercase(Alphabet::G), cleaned)
            .since(since);

        let output = client
            .subscribe(filter, None)
            .await
            .map_err(|e| PoolError::Relay(e.to_string()))?;
        *self.inner.geo_sub_id.write() = Some(output.val);
        Ok(())
    }

    /// Publish a public geohash notice (plaintext JSON content).
    pub async fn publish_geo_notice(
        &self,
        geohash: &str,
        content_json: &str,
        expires_at: Option<u64>,
    ) -> Result<String, PoolError> {
        let geo = geohash.trim().to_lowercase();
        if geo.is_empty() || geo.len() > 12 {
            return Err(PoolError::Event("invalid geohash".into()));
        }
        let content = content_json.trim();
        if content.is_empty() {
            return Err(PoolError::Event("empty notice content".into()));
        }

        let client = {
            let guard = self.inner.client.read();
            guard.clone().ok_or(PoolError::NotInitialized)?
        };

        let ephemeral = Keys::generate();
        let mut tags = vec![
            Tag::custom(
                TagKind::SingleLetter(SingleLetterTag::lowercase(Alphabet::G)),
                [geo.clone()],
            ),
            Tag::custom(TagKind::Custom("client".into()), ["resilnet"]),
        ];
        if let Some(exp) = expires_at {
            if exp > Timestamp::now().as_u64() {
                tags.push(Tag::custom(
                    TagKind::Custom("expiration".into()),
                    [exp.to_string()],
                ));
            }
        }

        let mut builder = EventBuilder::new(Kind::Custom(KIND_GEO_NOTICE), content);
        for tag in tags {
            builder = builder.tag(tag);
        }
        let event = builder
            .sign_with_keys(&ephemeral)
            .map_err(|e| PoolError::Event(e.to_string()))?;
        let event_id = client
            .send_event(event)
            .await
            .map_err(|e| PoolError::Relay(e.to_string()))?;

        Ok(event_id.to_hex())
    }

    /// Replace the active geohash notice filter (empty = unsubscribe).
    pub async fn set_geo_notice_subscription(
        &self,
        geohashes: Vec<String>,
        since_secs_ago: Option<u64>,
    ) -> Result<(), PoolError> {
        let client = {
            let guard = self.inner.client.read();
            guard.clone().ok_or(PoolError::NotInitialized)?
        };

        let old_sub = self.inner.geo_notice_sub_id.write().take();
        if let Some(old) = old_sub {
            let _ = client.unsubscribe(old).await;
        }

        let cleaned: Vec<String> = geohashes
            .into_iter()
            .map(|g| g.trim().to_lowercase())
            .filter(|g| !g.is_empty() && g.len() <= 12)
            .collect();
        if cleaned.is_empty() {
            return Ok(());
        }

        let backfill = since_secs_ago.unwrap_or(GEO_NOTICE_BACKFILL_SECS);
        let since = Timestamp::now() - backfill;
        let filter = Filter::new()
            .kind(Kind::Custom(KIND_GEO_NOTICE))
            .custom_tags(SingleLetterTag::lowercase(Alphabet::G), cleaned)
            .since(since);

        let output = client
            .subscribe(filter, None)
            .await
            .map_err(|e| PoolError::Relay(e.to_string()))?;
        *self.inner.geo_notice_sub_id.write() = Some(output.val);
        Ok(())
    }

    /// One-shot fetch of geo notice events (historical backfill).
    pub async fn fetch_geo_notices(
        &self,
        geohashes: Vec<String>,
        since_secs_ago: Option<u64>,
    ) -> Result<Vec<GeoNoticeEvent>, PoolError> {
        let client = {
            let guard = self.inner.client.read();
            guard.clone().ok_or(PoolError::NotInitialized)?
        };

        let cleaned: Vec<String> = geohashes
            .into_iter()
            .map(|g| g.trim().to_lowercase())
            .filter(|g| !g.is_empty() && g.len() <= 12)
            .collect();
        if cleaned.is_empty() {
            return Ok(Vec::new());
        }

        let backfill = since_secs_ago.unwrap_or(GEO_NOTICE_BACKFILL_SECS);
        let since = Timestamp::now() - backfill;
        let filter = Filter::new()
            .kind(Kind::Custom(KIND_GEO_NOTICE))
            .custom_tags(SingleLetterTag::lowercase(Alphabet::G), cleaned.clone())
            .since(since)
            .limit(200);

        tracing::info!(
            cells = ?cleaned,
            since_secs = backfill,
            "nostr fetch geo notices"
        );

        let events = client
            .fetch_events(filter, GEO_NOTICE_FETCH_TIMEOUT)
            .await
            .map_err(|e| PoolError::Relay(e.to_string()))?;

        let mut out = Vec::new();
        for event in events.into_iter() {
            if let Some(parsed) = parse_geo_notice_event(&event) {
                out.push(parsed);
            }
        }
        tracing::info!(count = out.len(), "nostr fetch geo notices done");
        Ok(out)
    }

    pub async fn reconnect(&self) -> Result<(), PoolError> {
        let client = {
            let guard = self.inner.client.read();
            guard.clone().ok_or(PoolError::NotInitialized)?
        };
        // Re-assert relays in case some were dropped, then connect again.
        let urls = self.inner.relay_urls.read().clone();
        for url in &urls {
            let _ = client.add_relay(url.clone()).await;
        }
        client.connect().await;
        self.ensure_direct_subscription(&client).await;
        self.wait_for_relay_connection().await;
        Ok(())
    }

    async fn ensure_direct_subscription(&self, client: &Client) {
        let filter = Filter::new()
            .kinds([
                Kind::Custom(KIND_DIRECT),
                Kind::Custom(KIND_BROADCAST),
            ])
            .since(Timestamp::now() - 60 * 60 * 24);
        if let Err(e) = client.subscribe(filter, None).await {
            tracing::warn!(error = %e, "nostr subscribe failed (will retry on reconnect)");
        }
    }

    /// Poll until at least one relay reports connected, or [CONNECT_WAIT] elapses.
    async fn wait_for_relay_connection(&self) {
        let deadline = tokio::time::Instant::now() + CONNECT_WAIT;
        loop {
            self.refresh_status_from_client().await;
            let connected = self.inner.status.read().connected_relays;
            if connected > 0 {
                tracing::info!(
                    connected,
                    total = self.inner.status.read().total_relays,
                    "nostr relays connected"
                );
                return;
            }
            if tokio::time::Instant::now() >= deadline {
                tracing::warn!(
                    total = self.inner.status.read().total_relays,
                    "nostr: no relays connected after {:?}",
                    CONNECT_WAIT
                );
                return;
            }
            tokio::time::sleep(CONNECT_POLL).await;
        }
    }

    async fn refresh_status_from_client(&self) {
        let client = {
            let guard = self.inner.client.read();
            match guard.clone() {
                Some(c) => c,
                None => return,
            }
        };
        let relays = client.relays().await;
        let mut list = Vec::with_capacity(relays.len());
        let mut connected = 0u32;
        for (url, relay) in relays {
            let is_connected = relay.is_connected();
            if is_connected {
                connected += 1;
            }
            list.push(RelayStatus {
                url: url.to_string(),
                connected: is_connected,
            });
        }
        let mut st = self.inner.status.write();
        st.connected_relays = connected;
        st.total_relays = list.len() as u32;
        st.relays = list;
    }

    async fn run_notifications_loop(&self) {
        let client = {
            let guard = self.inner.client.read();
            match guard.clone() {
                Some(c) => c,
                None => return,
            }
        };

        let mut notifications = client.notifications();
        while let Ok(notification) = notifications.recv().await {
            match notification {
                RelayPoolNotification::Event { event, .. } => {
                    let kind_u16 = event.kind.as_u16();
                    if kind_u16 == KIND_GEO_PRESENCE {
                        if let Some(parsed) = parse_geo_presence_event(&event) {
                            let _ = self.inner.presence_tx.send(parsed);
                        }
                        continue;
                    }
                    if kind_u16 == KIND_GEO_NOTICE {
                        if let Some(parsed) = parse_geo_notice_event(&event) {
                            let _ = self.inner.notice_tx.send(parsed);
                        }
                        continue;
                    }
                    if ResilNetEventKind::from_u16(kind_u16).is_none() {
                        continue;
                    }
                    if kind_u16 == KIND_GEO_PRESENCE || kind_u16 == KIND_GEO_NOTICE {
                        continue;
                    }
                    match ResilNetEnvelope::from_json(&event.content) {
                        Ok(env) => {
                            let _ = self.inner.event_tx.send(env);
                        }
                        Err(e) => {
                            tracing::debug!("skip non-ResilNet nostr content: {e}");
                        }
                    }
                }
                _ => {
                    self.refresh_status_from_client().await;
                }
            }
        }
    }
}

fn anon_nick_from_pubkey(pubkey_hex: &str) -> String {
    let prefix: String = pubkey_hex
        .chars()
        .filter(|c| c.is_ascii_hexdigit())
        .take(4)
        .collect();
    if prefix.is_empty() {
        "anon".into()
    } else {
        format!("anon·{prefix}")
    }
}

fn parse_geo_presence_event(event: &Event) -> Option<GeoPresenceEvent> {
    let geohash = event
        .tags
        .iter()
        .find_map(|t| {
            let s = t.as_slice();
            if s.len() >= 2 && s[0] == "g" {
                Some(s[1].to_lowercase())
            } else {
                None
            }
        })
        .filter(|g| !g.is_empty())?;

    let (nick, content_geo, rid, pk) = match GeoPresenceContent::from_json(&event.content) {
        Ok(c) => (
            c.nick,
            Some(c.geohash.to_lowercase()),
            c.rid,
            c.pk,
        ),
        Err(_) => (
            anon_nick_from_pubkey(&event.pubkey.to_hex()),
            None,
            String::new(),
            String::new(),
        ),
    };
    let geohash = content_geo
        .filter(|g| !g.is_empty())
        .unwrap_or(geohash);

    Some(GeoPresenceEvent {
        event_id: event.id.to_hex(),
        pubkey_hex: event.pubkey.to_hex(),
        geohash,
        nick,
        created_at: event.created_at.as_u64(),
        rid,
        pk,
    })
}

fn parse_geo_notice_event(event: &Event) -> Option<GeoNoticeEvent> {
    let geohash = event
        .tags
        .iter()
        .find_map(|t| {
            let s = t.as_slice();
            if s.len() >= 2 && s[0] == "g" {
                Some(s[1].to_lowercase())
            } else {
                None
            }
        })
        .filter(|g| !g.is_empty())?;

    let content = event.content.trim();
    if content.is_empty() {
        return None;
    }

    Some(GeoNoticeEvent {
        event_id: event.id.to_hex(),
        geohash,
        content_json: content.to_string(),
        created_at: event.created_at.as_u64(),
    })
}

impl Default for NostrPoolHandle {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn anon_nick_is_unlinkable_prefix() {
        let n = anon_nick_from_pubkey("a1b2c3d4e5");
        assert_eq!(n, "anon·a1b2");
    }
}

//! Relay pool manager — multi-relay WebSocket connect, publish, subscribe.

use std::sync::Arc;
use std::time::Duration;

use nostr_sdk::prelude::*;
use parking_lot::RwLock;
use thiserror::Error;
use tokio::sync::broadcast;

use super::identity::NostrIdentity;
use super::kinds::{ResilNetEnvelope, ResilNetEventKind, KIND_BROADCAST, KIND_DIRECT};

/// Default public relays (can be overridden from Flutter).
pub const DEFAULT_RELAYS: &[&str] = &[
    "wss://relay.damus.io",
    "wss://nos.lol",
    "wss://relay.nostr.band",
    "wss://nostr.mom",
];

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
    status: RwLock<NostrPoolStatus>,
}

impl NostrPoolHandle {
    pub fn new() -> Self {
        let (event_tx, _) = broadcast::channel(256);
        Self {
            inner: Arc::new(NostrPoolInner {
                identity: RwLock::new(None),
                client: RwLock::new(None),
                relay_urls: RwLock::new(
                    DEFAULT_RELAYS.iter().map(|s| (*s).to_string()).collect(),
                ),
                event_tx,
                status: RwLock::new(NostrPoolStatus::default()),
            }),
        }
    }

    pub fn subscribe_envelopes(&self) -> broadcast::Receiver<ResilNetEnvelope> {
        self.inner.event_tx.subscribe()
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
        let identity = match secret_key_hex {
            Some(hex) if !hex.trim().is_empty() => NostrIdentity::from_secret_hex(&hex)
                .map_err(|e| PoolError::Identity(e.to_string()))?,
            _ => NostrIdentity::generate(),
        };

        let info = identity
            .info()
            .map_err(|e| PoolError::Identity(e.to_string()))?;

        if let Some(urls) = relay_urls {
            if !urls.is_empty() {
                *self.inner.relay_urls.write() = urls;
            }
        }

        let client = Client::new(identity.keys().clone());
        let urls = self.inner.relay_urls.read().clone();
        for url in &urls {
            client
                .add_relay(url.clone())
                .await
                .map_err(|e| PoolError::Relay(e.to_string()))?;
        }
        client.connect().await;

        // Subscribe to ResilNet kinds (recent + future).
        let filter = Filter::new()
            .kinds([
                Kind::Custom(KIND_DIRECT),
                Kind::Custom(KIND_BROADCAST),
            ])
            .since(Timestamp::now() - 60 * 60 * 24); // last 24h

        client
            .subscribe(filter, None)
            .await
            .map_err(|e| PoolError::Relay(e.to_string()))?;

        *self.inner.identity.write() = Some(identity);
        *self.inner.client.write() = Some(client.clone());

        // Background notification listener
        let handle = self.clone();
        tokio::spawn(async move {
            handle.run_notifications_loop().await;
        });

        // Give relays a moment to connect, then refresh status
        tokio::time::sleep(Duration::from_millis(400)).await;
        self.refresh_status_from_client().await;

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

    pub async fn reconnect(&self) -> Result<(), PoolError> {
        let client = {
            let guard = self.inner.client.read();
            guard.clone().ok_or(PoolError::NotInitialized)?
        };
        client.connect().await;
        self.refresh_status_from_client().await;
        Ok(())
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
                    if ResilNetEventKind::from_u16(event.kind.as_u16()).is_none() {
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

impl Default for NostrPoolHandle {
    fn default() -> Self {
        Self::new()
    }
}

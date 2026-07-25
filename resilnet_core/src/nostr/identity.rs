//! Local secp256k1 Nostr keypair — account-less first-launch identity.

use nostr_sdk::prelude::*;
use thiserror::Error;

#[derive(Debug, Error)]
pub enum IdentityError {
    #[error("invalid secret key hex: {0}")]
    InvalidSecret(String),
    #[error("nostr keys error: {0}")]
    Keys(String),
}

#[derive(Debug, Clone)]
pub struct NostrIdentityInfo {
    pub pubkey_hex: String,
    pub npub: String,
    /// Hex-encoded secret — store only in platform secure storage (Flutter).
    pub secret_key_hex: String,
}

/// In-memory Nostr identity (secret stays in Rust process after init).
#[derive(Clone)]
pub struct NostrIdentity {
    keys: Keys,
}

impl NostrIdentity {
    /// Generate a fresh secp256k1 keypair.
    pub fn generate() -> Self {
        Self {
            keys: Keys::generate(),
        }
    }

    /// Restore from 64-char hex secret (or with optional `0x` prefix).
    pub fn from_secret_hex(hex_str: &str) -> Result<Self, IdentityError> {
        let cleaned = hex_str.trim().trim_start_matches("0x");
        let secret = SecretKey::from_hex(cleaned)
            .map_err(|e| IdentityError::InvalidSecret(e.to_string()))?;
        let keys = Keys::new(secret);
        Ok(Self { keys })
    }

    pub fn keys(&self) -> &Keys {
        &self.keys
    }

    pub fn info(&self) -> Result<NostrIdentityInfo, IdentityError> {
        let pubkey = self.keys.public_key();
        let npub = pubkey
            .to_bech32()
            .map_err(|e| IdentityError::Keys(e.to_string()))?;
        let secret_key_hex = self.keys.secret_key().to_secret_hex();
        Ok(NostrIdentityInfo {
            pubkey_hex: pubkey.to_hex(),
            npub,
            secret_key_hex,
        })
    }
}

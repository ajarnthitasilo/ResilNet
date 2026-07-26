# ResilNet 1.4 — Nostr migration notes

## What changed
- **Removed** Supabase (`supabase_flutter`), legacy cloud sync, SQS proxy path, and FCM/Supabase push plumbing.
- **Added** Nostr in `resilnet_core` (`nostr-sdk` 0.39): secp256k1 identity, relay pool, ResilNet event kinds `31234` (direct) / `31236` (health). Legacy kind `31235` (village broadcast) is no longer published; inbound envelopes of that kind are dropped quietly.
- **Router fan-out**: when online, packets can go **Nostr + BLE (+ LoRa)** together; offline → local queue → `flush_offline_queue_to_nostr`.
- **Flutter** `NostrSyncService` stores Nostr secret hex in Secure Storage and drives publish/status via FFI.
- **Removed** village community broadcast UI, trusted committee keys ACL, and broadcast notification filters. Messaging is direct E2EE chat over Nostr + BLE/LoRa mesh.

## Channels (Bitchat-inspired UX, v1.5+)
- Home feed switcher: **แชท** (direct E2EE) / **#mesh** (BLE proximity peers) / **พื้นที่** (geohash label + precision chips).
- Geohash is **on-device discovery UX only** — not a plaintext public room and not stamped onto ciphertext.
- Compose still seals with RSA-OAEP + AES-GCM per recipient; `hybrid_router` fans out sealed bytes across available transports.
- Sender history shows sealed placeholders only (cannot unwrap own outgoing AES key).

## Identity (important)
- **Nostr keys** (secp256k1 / npub): used for relay publish/subscribe (account-less).
- **RSA keys** (`CryptoService`): still used for **E2EE direct message payloads** and existing QR peer exchange.
- Long-term: migrate mesh identity to Nostr keys or NIP-44; dual-key is intentional for compatibility.

## Relays (default)
- `wss://relay.damus.io`
- `wss://nos.lol`
- `wss://relay.nostr.band`
- `wss://nostr.mom`

Override via `initNostr(relayUrls: [...])`.

## Remaining work
- Map LoRa ESP32 connection → `resilnet.setLoraAvailable(true)`.
- Optional: expose npub on Identity screen.
- ~~Optional: geohash-tagged Nostr presence~~ → implemented (see `docs/GEO_PRESENCE_NOSTR.md`).
- Push notifications without a central server (local-only / alternative wake path).

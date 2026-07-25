# ResilNet 1.4 — Nostr migration notes

## What changed
- **Removed** Supabase (`supabase_flutter`), legacy cloud sync, SQS proxy path, and FCM/Supabase push plumbing.
- **Added** Nostr in `resilnet_core` (`nostr-sdk` 0.39): secp256k1 identity, relay pool, ResilNet event kinds `31234` (direct) / `31236` (health). Legacy kind `31235` (village broadcast) is no longer published; inbound envelopes of that kind are dropped quietly.
- **Router fan-out**: when online, packets can go **Nostr + BLE (+ LoRa)** together; offline → local queue → `flush_offline_queue_to_nostr`.
- **Flutter** `NostrSyncService` stores Nostr secret hex in Secure Storage and drives publish/status via FFI.
- **Removed** village community broadcast UI, trusted committee keys ACL, and broadcast notification filters. Messaging is direct E2EE chat over Nostr + BLE/LoRa mesh.

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
- Push notifications without a central server (local-only / alternative wake path).

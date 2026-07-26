# Geohash presence on Nostr (bitchat-style)

## Kind
- **`20050`** (`KIND_GEO_PRESENCE`) — NIP-16 ephemeral range (relays should not store long-term).

## Signing
- Each publish uses a **fresh ephemeral secp256k1 key** (`Keys::generate()`).
- The long-lived ResilNet Nostr messaging identity is **not** used for presence.
- RSA peer id / display name are **never** included in the event.

## Tags
| Tag | Value |
|-----|--------|
| `g` | Truncated geohash cell (selected Area precision: 2/4/5/6/7) |
| `client` | `resilnet` |
| `expiration` | Unix timestamp (now + 180s) — NIP-40 |

## Content (JSON)
```json
{ "v": 1, "geohash": "w5jt8", "nick": "anon·a1b2" }
```
- `nick` is derived from the ephemeral pubkey hex prefix (`anon·` + 4 hex chars).
- No coordinates beyond the geohash cell.

## Subscribe
- Flutter calls `nostr_set_geo_presence_filter([geohash])` when Area + Internet/Auto.
- Filter: kind `20050`, `#g` = selected cell, `since` = now − 180s.
- Events stream via `nostr_subscribe_geo_presence` (not chat ingest).

## Transport mode
- **Mesh** — BLE presence only (existing sealed presence packets).
- **Internet** — Nostr anonymous presence only.
- **Auto** — both when available.

## Messaging
- Nostr-only sightings are **discovery only** (no sealed 1:1 until mesh/QR identity).
- Area public fan-out still targets peers with known RSA keys only.

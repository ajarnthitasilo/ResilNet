# Bridge ↔ App integration (design ADR)

Lab ADR for ResilNet **Mac/Pi LXMF bridge** as a future optional transport.
**Not implemented** in `hybrid_router`, Flutter `AppState`, or firmware.

Related: [overhead.md](overhead.md) (why LXMF stays off Heltec 230B), lab
`bridge/` HTTP API, `fake_app_client.py`.

## Status

| Item | State |
|------|--------|
| LXMF localhost + RNLB blob | done (lab) |
| Overhead vs LoRa 230B | done — do **not** put full LXMF on Heltec path |
| This ADR + HTTP contract + fake app | done (lab) |
| Flutter HTTP client + settings + opportunistic send | done |
| Usable Home node UI (no raw JSON) | **done** (`home_node_bridge_sheet.dart`) |
| `TransportType::LxmfBridge` in Rust | **not started** |
| Phone-side RNS | **not chosen for v1** (below) |

---

## A. Architecture (v1)

```
┌──────────────┐   localhost HTTP    ┌─────────────────┐
│ Flutter app  │ ─────────────────► │ Mac/Pi bridge   │
│ (future)     │   sealed bytes     │ rnsd + LXMF     │
│ already E2EE │ ◄─── inbox poll ── │ identity_map    │
└──────────────┘                    └────────┬────────┘
                                             │ LXMF over RNS
                                             ▼
                                    peer Mac/Pi bridge
                                    (or same LAN mesh)
```

Principles:

1. Bridge is a **transport egress on another host** (phone ↔ Mac over LAN/USB
   loopback in lab). It is **not** a replacement for ResilNet E2EE.
2. App sends **already sealed** opaque bytes. Bridge wraps RNLB + LXMF only.
3. ResilNet **peerId** (pubkey hash) remains identity source of truth; LXMF
   destination hash is addressing only (`identity_map.json` stub).
4. **No** `#mesh` / Area bulletin mapping onto Reticulum in v1.
5. **Heltec / ResilNet LoRa (230B payload)** keeps encrypt-then-chunk. LXMF
   stays on Mac/Pi TCP/Wi‑Fi (see overhead measurements).

Today’s live transports (read-only snapshot of production):

- Rust `TransportType`: `Nostr`, `BluetoothMesh`, `LoRa`, `OfflineQueue`
  (`resilnet_core/src/hybrid_router/types.rs`).
- Flutter `routeOutbound` also opportunistically uses **Local Wi‑Fi**
  (`LocalWifiLinkService`) — app-side, not a Rust enum value yet.

Proposed **future** name (doc only): `LxmfBridge` / `DesktopBridge`.

---

## B. Future `hybrid_router` gate (sketch only — do not implement)

### Proposed enum addition (illustrative)

```text
TransportType::LxmfBridge  // Mac/Pi LXMF home node via local HTTP
```

Also extend `NetworkStatus` with something like:

```text
lxmf_bridge_available: bool   // GET /status succeeds on configured base URL
```

### When to select `LxmfBridge`

Suggested conditions (all must pass for *primary* use; product can tune):

1. Bridge HTTP reachable (`GET /status` → `ok`).
2. Receiver has `lxmf_destination` in identity map (or send includes explicit
   `dest`).
3. Payload is already sealed; size is fine for LAN (not constrained by 230B).
4. Prefer when: Nostr down **or** operator opts into “home node” path **or**
   message too large / unsuitable for BLE/LoRa chunking and LAN-to-Mac exists.

### Suggested priority vs existing paths

| Situation | Prefer |
|-----------|--------|
| Same LAN phones (Local Wi‑Fi session active) | Local Wi‑Fi first (lowest latency, already in app) |
| Internet + Nostr OK | Nostr (wide reach) |
| Bridge up + peer mapped + Nostr flaky | **LxmfBridge** (store-and-forward via LXMF) |
| BLE peers nearby, no Mac | BluetoothMesh |
| Heltec radio path | LoRa (ResilNet frames only — **never** full LXMF) |
| Nothing live | OfflineQueue |

Local Wi‑Fi and LxmfBridge can both be LAN-ish; difference: Local Wi‑Fi is
phone↔phone UDP; LxmfBridge is phone→Mac→RNS fabric (can reach a remote home
node if RNS links exist later).

### App responsibility vs router

- **App:** seal message; HTTP to local bridge; poll inbox / push callback;
  maintain bridge base URL setting.
- **Router (future):** decide *whether* to attempt LxmfBridge alongside or
  instead of Nostr/BLE; must not decrypt.
- **Bridge:** RNLB wrap, LXMF send/receive, identity_map lookup.

**Do not implement this gate in the current spike.**

---

## C. HTTP contract (lab — stabilize for a future app)

Base URL (lab default): `http://127.0.0.1:8765` (Alice) /
`http://127.0.0.1:8766` (Bob). Bind localhost only.

### `GET /status`

**200**

```json
{
  "ok": true,
  "name": "bridge-a",
  "config": ".../config/a",
  "lxmf_destination": "<32-hex>",
  "http": "http://127.0.0.1:8765",
  "inbox_count": 0
}
```

### `GET /inbox`

**200** — newest last. RNLB messages include parsed `blob`:

```json
{
  "ok": true,
  "items": [
    {
      "ts": 0.0,
      "source": "<pretty hex>",
      "title": "resilnet-blob-v1",
      "bytes": 146,
      "hex_preview": "524e4c42…",
      "hex": "…",
      "blob": {
        "version": 1,
        "to_peer_id": "alice_lab_peer_aaaaaaaa",
        "from_peer_id": "bob_lab_peer_bbbbbbbb",
        "sealed_len": 90,
        "sealed_hex_preview": "…",
        "sealed_hex": "…"
      }
    }
  ]
}
```

Future app on Alice’s Mac would take `blob.sealed_hex`, decode, and ingest as
today’s sealed envelope (same fields the codec already understands).

### `GET /identity_map`

Returns the JSON stub file contents.

### `POST /announce`

**200** `{ "ok": true, "lxmf_destination": "…", "announced": true }`

### `POST /send`

Body (JSON), one of:

```json
{
  "to_peer_id": "alice_lab_peer_aaaaaaaa",
  "from_peer_id": "bob_lab_peer_bbbbbbbb",
  "sealed_hex": "<hex of opaque sealed stub>"
}
```

or

```json
{
  "dest": "<lxmf destination hex>",
  "sealed_hex": "…",
  "to_peer_id": "alice_…",
  "from_peer_id": "bob_…"
}
```

or pre-packed RNLB:

```json
{ "dest": "…", "blob_hex": "…" }
```

Optional: `"title": "resilnet-blob-v1"`.

**200** `{ "ok": true, "dest": "…", "bytes": N, "hex_preview": "…" }`  
**400** `{ "ok": false, "error": "<message>" }`

### Failure modes

| Symptom | Likely cause |
|---------|----------------|
| Connection refused | Bridge / `rnsd` not running |
| `need dest or to_peer_id in identity map` | Missing map entry and no `dest` |
| `No path to destination` | Peer bridge not announced / daemons down |
| `Could not recall Identity` | Peer never `announce()`d |
| Inbox empty after send | Wrong dest, send from wrong config, or race — wait & re-poll |
| Non-RNLB inbox item | Legacy text/`lxmf_node` traffic |

---

## D. Identity mapping

File: `config/identity_map.json` (gitignored; copy from
`config/identity_map.example.json`).

```json
{
  "version": 1,
  "entries": [
    {
      "resilnet_peer_id": "alice_lab_peer_aaaaaaaa",
      "lxmf_destination": "<from GET /status on Alice bridge>",
      "note": "bridge-a"
    }
  ]
}
```

Manual 2-node demo:

1. Start daemons + Alice `bridge listen --self-peer-id alice_…` (HTTP :8765)
2. Start Bob `bridge listen --self-peer-id bob_…` (HTTP :8766) — **use a
   separate identity map file** if both processes upsert (avoid concurrent
   writes to one JSON)
3. Put Alice `lxmf_destination` into Bob’s map (or pass `dest` on `/send`)
4. App (or `fake_app_client.py`) `POST` to Bob’s `/send`; poll Alice `/inbox`

**Not in v1:** auto-sync from Flutter contacts, DHT, or QR of LXMF hash
(though QR of dest hex is a fine later UX).

---

## E. Phone-side RNS (decision table — not implementing)

| Option | Pros | Cons |
|--------|------|------|
| **A. Mac/Pi bridge only (v1)** | Matches lab; avoids mobile RNS lifecycle; clearer license boundary; no LoRa conflict | Needs LAN/USB to home node; offline phone alone ≠ LXMF |
| B. Embed RNS/LXMF in Flutter | Phone is first-class RNS node | Battery, background limits, App Store + **Reticulum License** ethical clauses, large native deps, still shouldn’t dump LXMF on Heltec |
| C. Native RNS LoRa (RNode) later | Long-range RNS fabric | Different radio stack from ResilNet 230B frames; product split |

**v1 recommendation:** keep RNS on **Mac/Pi** (option A). Revisit B/C only after
counsel review of Reticulum License for store builds and a clear UX for “home
node required.”

---

## Lab + app verification

```bash
cd labs/reticulum_lxmf
.venv/bin/python fake_app_client.py demo
# Expect FAKE_APP_DEMO_OK
```

### Flutter (usable settings)

1. Run the Mac/Pi bridge on the LAN (see lab README).
2. In the app: **Settings → Home node settings**
3. Enable, enter Mac address (`IP:port`), **Check connection**
4. Copy this node’s address; on the other phone, **Link a friend** and paste
5. Send a sealed DM — opportunistic LXMF path runs in the background

Raw JSON identity map is no longer required in the UI (still stored in prefs).

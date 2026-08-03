# Reticulum + LXMF lab (localhost)

Isolated Mac lab for proving **LXMF over Reticulum** as a ResilNet **opaque transport** spike.

**Not production.** Does not touch Flutter, ESP32 firmware, `hybrid_router`, Local Wi‑Fi, or live mesh.

Verified with `rns==1.4.2` and `lxmf==1.1.1` on macOS (two `rnsd` processes linked by localhost TCP).

## Topology

```
bridge / lxmf_node A ──shared──► rnsd A (TCPServer 127.0.0.1:4242)
                                       ▲
                                       │ TCP
bridge / lxmf_node B ──shared──► rnsd B (TCPClient → :4242)
```

| Node | Config | Shared ports | Interface |
|------|--------|--------------|-----------|
| A | `config/a` | 37428 / 37429 | TCP server `:4242` |
| B | `config/b` | 37438 / 37439 | TCP client → A |

## Setup

```bash
cd labs/reticulum_lxmf
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
```

## Blob contract (RNLB v1)

LXMF **content** carries a ResilNet lab blob. Reticulum/LXMF never see plaintext chat — only opaque sealed bytes.

| Field | Size | Notes |
|-------|------|--------|
| magic | 4 | `RNLB` |
| version | 1 | `0x01` |
| flags | 1 | bit0 = has sender id |
| to_len + to | 1 + N | ResilNet receiver peer id (UTF-8) |
| from_len + from | 1 + M | optional sender peer id |
| sealed_len | 4 | big-endian |
| sealed | L | opaque sealed envelope bytes |

LXMF title used by the bridge: `resilnet-blob-v1`.

**Sealed region (conceptual):** same idea as the app’s E2EE wire (`ChatMessage.toMap` / `ResilNetPacketCodec`) — ids + `encryptedPayload` / `encryptedKey` / `signature` / type metadata — **without** importing Flutter into this lab. Demos use a stub `.bin` / hex stand-in.

Encode/decode: `bridge/blob.py`. Pack CLI:

```bash
.venv/bin/python -m bridge pack \
  --to-peer-id alice_lab_peer_aaaaaaaa \
  --from-peer-id bob_lab_peer_bbbbbbbb \
  --sealed-hex 'cafe' --out /tmp/rnlb.bin
```

## Identity map (stub)

File: `config/identity_map.json` (gitignored; start from `config/identity_map.example.json`).

Maps **ResilNet `peerId`** ↔ **LXMF destination hash**. Manual / file only for this spike — not synced with the app.

```json
{
  "version": 1,
  "entries": [
    {
      "resilnet_peer_id": "alice_lab_peer_aaaaaaaa",
      "lxmf_destination": "<hex from bridge A /status>"
    }
  ]
}
```

`--self-peer-id` on `bridge listen` upserts the local mapping after announce.

## Bridge daemon (Mac)

Package: `bridge/` — attaches to shared `rnsd` with `require_shared_instance=True`.

### Listen + HTTP (node A)

```bash
./start_daemons.sh

.venv/bin/python -u -m bridge listen \
  --config config/a \
  --name bridge-a \
  --http-port 8765 \
  --identity-map config/identity_map.json \
  --inbox-dir inbox_a \
  --self-peer-id alice_lab_peer_aaaaaaaa
```

| Method | Path | Role |
|--------|------|------|
| GET | `/status` | name, `lxmf_destination`, inbox count |
| GET | `/inbox` | delivered messages (parsed RNLB when magic matches) |
| GET | `/identity_map` | current stub map |
| POST | `/announce` | re-announce LXMF destination |
| POST | `/send` | JSON: `dest` or `to_peer_id`, plus `blob_hex` **or** `sealed_hex` (+ optional `from_peer_id`) |

Example send via curl (from another shell, after A is up):

```bash
DEST=$(curl -s http://127.0.0.1:8765/status | python3 -c 'import sys,json;print(json.load(sys.stdin)["lxmf_destination"])')

# One-shot from B (CLI; preferred for demo)
.venv/bin/python -u -m bridge send \
  --config config/b --name bridge-b \
  --dest "$DEST" \
  --to-peer-id alice_lab_peer_aaaaaaaa \
  --from-peer-id bob_lab_peer_bbbbbbbb \
  --sealed-hex '7b226964223a226d31227d'
```

On A, expect log lines `RNLB DELIVERED` with `sealed=…B hex=…`, and `GET /inbox` showing full hex + preview.

### Automated demo

```bash
chmod +x demo_bridge.sh
./demo_bridge.sh
# Expect DEMO_OK
```

## Original text demo (`lxmf_node.py`)

Still valid for plain LXMF text / raw `--payload-hex` / `--payload-file`:

```bash
./start_daemons.sh
.venv/bin/python -u lxmf_node.py --config config/a --name lab-a --listen
# other terminal:
.venv/bin/python -u lxmf_node.py --config config/b --name lab-b \
  --send-to "$DEST" --payload-hex deadbeef
```

**Stop**

```bash
./stop_daemons.sh
```

## Design principles

- LXMF carries **opaque ResilNet sealed blobs** — does not replace ResilNet E2EE.
- ResilNet RID / public-key identity remains source of truth; RNS destination hash is transport addressing.
- No `#mesh` / Area bulletin mapping on Reticulum in v1 of this bridge.
- Desktop/Mac (or Pi) bridge first; phone-side RNS is a separate decision.
- Do not flash Heltec / RNode from this lab.

## Overhead vs LoRa (done in lab)

```bash
.venv/bin/python measure_overhead.py --out docs/overhead_results.csv
```

Details: [`docs/overhead.md`](docs/overhead.md). Headline: ResilNet radio
payload is **230B** (app/firmware); LXMF-packed RNLB is already **~215B** for a
32B sealed stub and **does not** fit realistic DMs or the **200B** chunk budget.
**Keep LXMF on Mac/Pi TCP/Wi‑Fi; do not put full LXMF on Heltec 230B path.**

License note for `rns`/`lxmf` (Reticulum License + ethical clauses): see
`docs/overhead.md` — counsel review before any App Store embed.

## App ↔ bridge design + fake client (done in lab)

ADR: [`docs/bridge_app_integration.md`](docs/bridge_app_integration.md)
(architecture, HTTP contract, future `LxmfBridge` sketch, phone-RNS decision).

Simulate Flutter without touching the app:

```bash
.venv/bin/python fake_app_client.py demo
# Expect FAKE_APP_DEMO_OK
```

## Flutter home-node UI (done in mobile_app)

- Settings → **Home node settings** sheet (no raw JSON)
- Link friends from contacts + paste their node address
- Opportunistic sealed send + inbox ingest unchanged

## Next steps (not implemented here)

- `TransportType::LxmfBridge` in `resilnet_core` — optional later
- Phone-side RNS embed — **not chosen for v1**
- Auto discovery of the Mac on LAN
- App Store counsel if embedding RNS later

## Files

| Path | Role |
|------|------|
| `config/a`, `config/b` | Isolated Reticulum configs |
| `config/identity_map.example.json` | peerId ↔ LXMF dest stub template |
| `start_daemons.sh` / `stop_daemons.sh` | Two localhost `rnsd` processes |
| `lxmf_node.py` | Minimal announce / listen / send |
| `bridge/` | Blob codec, identity map, HTTP/CLI bridge |
| `demo_bridge.sh` | Opaque B→A demo (CLI send) |
| `fake_app_client.py` | Fake Flutter → HTTP `/send` E2E demo |
| `measure_overhead.py` | RNLB/LXMF size table vs 230B radio |
| `docs/overhead.md` / `docs/overhead_results.csv` | Overhead + license notes |
| `docs/bridge_app_integration.md` | App↔bridge ADR + HTTP contract |
| `requirements.txt` | Pinned `rns` + `lxmf` (stdlib HTTP only) |
| `logs/`, `inbox_a/` | Local demo artifacts (gitignored) |

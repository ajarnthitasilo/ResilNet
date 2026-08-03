# LXMF + RNS overhead vs ResilNet LoRa MTU

Lab notes for the ResilNet Reticulum spike. **No radio hardware** was used;
LXMF packed sizes are **measured** offline via `LXMessage.pack()`. Native RNS
on-air framing beyond the packed LXMF blob is only compared to library MDUs
(**estimated / compare-only**).

## Budgets (from ResilNet sources)

| Budget | Bytes | Source |
|--------|------:|--------|
| ResilNet radio **payload** max | **230** | `mobile_app/lib/core/resilnet_protocol.dart` (`radioMaxPayloadLen`); `esp32_firmware/include/packet.h` (`payload[230]`) |
| ResilNet chunk data max | **200** | `mobile_app/lib/core/resilnet_chunk_codec.dart` (`maxChunkDataLen`) |
| Full ResilNet radio **frame** max | 253 | magic(2) + struct(249) + CRC(2) — still ~230B app payload |

## Library constants (installed lab venv)

| Constant | Value | Kind |
|----------|------:|------|
| `RNS.Reticulum.MTU` | 500 | library |
| `RNS.Reticulum.MDU` | 464 | library |
| `LXMessage.LXMF_OVERHEAD` | 112 | library (`2*dest + sig + timestamp + struct`) |
| `PLAIN_PACKET_MDU` | 464 | library |
| `ENCRYPTED_PACKET_MAX_CONTENT` | 295 | library |

## How to reproduce

```bash
cd labs/reticulum_lxmf
.venv/bin/python measure_overhead.py --out docs/overhead_results.csv
```

Does **not** require `./start_daemons.sh`. Uses a throwaway Reticulum config
only so `LXMessage.pack()` can run.

Peer ids in the default run match the bridge demo
(`alice_lab_peer_aaaaaaaa` / `bob_lab_peer_bbbbbbbb`); RNLB header size scales
with UTF-8 peer id length.

## Results (default run)

Machine-readable: `docs/overhead_results.csv` (regenerate with the command above).

Measured with peer ids `alice_lab_peer_aaaaaaaa` / `bob_lab_peer_bbbbbbbb` and
title `resilnet-blob-v1` (RNLB overhead fixed at **56B** in this run):

| sealed | RNLB | LXMF packed | total oh | ≤230 radio? | ≤200 chunk? | ≤464 RNS MDU? |
|-------:|-----:|------------:|---------:|:-----------:|:-----------:|:-------------:|
| 32 | 88 | 215 | 183 | yes* | **NO** | yes |
| 64 | 120 | 247 | 183 | **NO** | **NO** | yes |
| 128 | 184 | 311 | 183 | **NO** | **NO** | yes |
| 200 | 256 | 384 | 184 | **NO** | **NO** | yes |
| 230 | 286 | 414 | 184 | **NO** | **NO** | yes |
| 256 | 312 | 440 | 184 | **NO** | **NO** | yes |
| 512 | 568 | 696 | 184 | **NO** | **NO** | **NO** (resource) |
| 1024 | 1080 | 1208 | 184 | **NO** | **NO** | **NO** (resource) |

\*32B sealed → 215B packed is ≤230 only with **no** room for ResilNet
magic/CRC/chunk headers and is useless for real sealed DMs. It already fails
the **200B** chunk-data budget.

Total overhead sealed→LXMF packed stays ~**183–184B** across sizes (≈56B RNLB
+ ≈127–128B LXMF framing/title/msgpack relative to RNLB).

## Product conclusions

1. **Mac / Pi bridge over TCP or Wi‑Fi:** fine for medium sealed blobs; LXMF
   single-packet path works until packed size exceeds RNS plain MDU (~464B),
   then RNS **resources** apply (still OK on LAN).
2. **ResilNet Heltec / current LoRa path (230B payload):** **do not** place a
   full LXMF envelope on this wire in v1. Keep using ResilNet’s own
   encrypt-then-chunk protocol on radio; use LXMF only on the desktop bridge
   (or a future native RNS radio stack — separate decision).
3. If a future design ever wanted LXMF-on-LoRa, it would need either native
   RNS LoRa (MDU 464, still tight) **or** a much smaller addressing wrapper
   than full LXMF — out of scope here.

## Limitations of this measurement

- Does **not** count SX1262 / RadioLib airtime, preamble, or CR.
- Does **not** count ResilNet radio magic/CRC around a hypothetical LXMF body.
- Live localhost delivery (`demo_bridge.sh`) confirms content bytes survive;
  on-wire TCP/RNS interface framing is not sniffed here.
- `#mesh` / Area / phone-side RNS not evaluated.

## License note (rns 1.4.2 / lxmf 1.1.1)

Both packages declare **“Reticulum License”** (MIT-shaped with extra
conditions). Upstream LICENSE text includes restrictions such as:

- Must not be used in systems whose functions include purposefully harming
  human beings.
- Must not be used to create AI / ML / language-model training datasets.

**Before App Store / Play shipping** anything that embeds or redistributes
RNS/LXMF: re-read the current LICENSE upstream, confirm redistribution and
attribution, and have counsel review the ethical-use clauses vs store
policies. This lab does **not** decide to ship.

## hybrid_router (design note only — not implemented)

A future optional transport gate could treat “Mac bridge via LXMF HTTP” like
another egress next to Internet / BLE / Local Wi‑Fi: app hands **already
sealed** bytes to the bridge; router never replaces E2EE. **Do not implement
in this spike.**

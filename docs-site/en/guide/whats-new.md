# What’s new since the previous guide

The previous docs-site snapshot referenced app **1.9.64** (Home node / Local Wi‑Fi).  
This update aligns the guide with app **1.9.75** (+93) and features added after that.

ESP32 firmware on the CDN / in-app baseline remains **1.9.49** (the app may be ahead of firmware — trust `manifest.json` for `.bin` hashes).

---

## User-facing highlights

| Topic | In 1.9.75 |
|-------|-----------|
| **Apple Watch** | Companion: status, recent Directs, short sealed texts (~160 chars) via iPhone |
| **Onboarding** | Interactive first-run walkthrough (Identity, channels, toolbar, boards, Wi‑Fi, safety, Watch, …) |
| **Nostr via Tor** | Settings — relays through local SOCKS (Orbot/Tor); no clearnet fallback |
| **Home node / Local Wi‑Fi** | Unchanged from the 1.9.64 guides |
| **ESP32 firmware** | Still **1.9.49** |

New / updated pages:

- [Apple Watch](apple-watch.md)
- [Area / geohash](area.md) *(short)*
- [What’s new](whats-new.md) (this page)

---

## 1) Apple Watch — major addition

- Ships with the iPhone app (Watch target `ResilNetWatch`)
- **Status** tab: transport, online count, unread, iPhone reachability
- **Chats** tab: recent Directs, short text / quick replies
- **Crypto and mesh routing stay on the iPhone** — the Watch has no separate keys
- Open ResilNet on the iPhone at least once and keep it reachable

Full guide: [apple-watch.md](apple-watch.md)

---

## 2) Interactive onboarding

First launch (or after resetting onboarding) walks through:

Welcome → Identity → Channels → Toolbar → Compose → Direct → Boards → Local Wi‑Fi → Transport → Area → Bridges/hardware → Safety → **Apple Watch** → Ready

Short demo chips help remember main icons and menus.

---

## 3) Route Nostr via Tor

- **Settings → Route Nostr via Tor**
- Uses SOCKS `127.0.0.1:9050` (Orbot or system Tor)
- Slower, but hides your IP from relays
- **Tor must be running** — the app will not fall back to clearnet if SOCKS is unavailable

---

## 4) Unchanged from 1.9.64

- Home node (Reticulum / LXMF) and Local Wi‑Fi as documented before
- Double-tap ResilNet title = soft refresh; long-press = hard recover; triple-tap = panic wipe
- Still account-less
- 1:1 remains E2EE; **public mesh bulletins** remain plaintext + signature
- ResilNet LoRa is still **not** Meshtastic-compatible on RF (optional in-app text bridge — plaintext)

---

## 5) Area vs #mesh (do not conflate)

| | #mesh (peer list) | Public bulletin (Notices) | Area (geohash) |
|--|-------------------|---------------------------|----------------|
| Role | Tap nearby peer → 1:1 | Local public announcement | People in cell + public fan-out |
| Content encryption | 1:1 = E2EE | **No** (plaintext + signature) | Public fan-out = **sealed per peer** (not plaintext) |

Details: [mesh.md](mesh.md) · [area.md](area.md)

---

## 6) Doc version table

| Item | Previous guide | This update |
|------|----------------|-------------|
| Version on home page | 1.9.64 | **1.9.75** |
| Apple Watch | — | Guide page |
| Nostr via Tor | — | Settings / FAQ |
| CDN firmware | 1.9.49 | **1.9.49** (unchanged) |

If your build is newer than the number in the docs, trust **Settings → version** in the app.

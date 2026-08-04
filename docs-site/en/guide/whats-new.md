# What’s new since the previous guide

The previous docs-site snapshot referenced app/firmware around **1.9.49**.  
This update aligns the guide with app **1.9.64** (+82) and features added after that.

---

## User-facing highlights

| Topic | In 1.9.64 |
|-------|-----------|
| **Home node (Reticulum / LXMF)** | Settings — optional Mac/Pi on Wi‑Fi |
| **Local Wi‑Fi** | Settings — phone LAN discovery/chat |
| **Languages** | Follow system + picker; many locales shipped |
| **Stuck-app refresh** | Double-tap ResilNet = soft refresh; long-press = hard recover; triple-tap = panic wipe |
| **Area / online people** | Better geohash + Nostr presence behavior |
| **Voice / mic** | Clearer permission + recorder UI |
| **BLE status** | Clearer permission / paused / scanning copy |

New pages:

- [Home node — Reticulum / LXMF](reticulum-home-node.md) *(detailed)*
- [Local Wi‑Fi](local-wifi.md)

---

## 1) Home node (Reticulum / LXMF) — major addition

**Previously (1.9.49 guide):** transports documented as BLE → ESP32/LoRa → Nostr only.

**Now (1.9.64):**

- **Settings → Home node**
- Configure Mac/Pi bridge URL, check online, copy node address, link friends
- App opportunistically sends/polls **sealed** chat bytes over HTTP to an LXMF/Reticulum bridge
- Operator lab: `labs/reticulum_lxmf/`

Full guide: [reticulum-home-node.md](reticulum-home-node.md)

Remember: does not replace E2EE; not for Heltec LXMF; different from Local Wi‑Fi.

---

## 2) Local Wi‑Fi

**Added after 1.9.49** — missing from the old guide.

- Settings → Local Wi‑Fi  
- Hotspot / router modes  
- LAN discovery + 1:1 when keys exist  

See [local-wifi.md](local-wifi.md).

---

## 3) Languages

- Default: **follow device** when shipped; else English  
- Settings language picker  
- Broad locale set; Thai remains the curated primary non-English pack; some locales are machine drafts  

---

## 4) Soft refresh / recover / wipe

- **Double-tap** title = soft refresh radios/discovery  
- **Long-press** = harder recover  
- **Triple-tap** = emergency wipe — do not confuse with double-tap  
- In-app tips / Info copy  

---

## 5) Area, voice, BLE

- Area: refresh geohash on launch when needed; clearer empty states  
- Voice notes: mic permission + recorder sheet improvements  
- BLE status bar: permission vs paused vs scanning  

---

## 6) Unchanged expectations

- Still account-less  
- 1:1 E2EE; public #mesh bulletins are not content-encrypted  
- ResilNet LoRa ≠ Meshtastic  
- Community boards Open/Locked model unchanged  

---

## 7) Doc version table

| Item | Previous guide | This update |
|------|----------------|-------------|
| Version on home page | 1.9.49 | **1.9.64** |
| Home node / Reticulum | — | Full page |
| Local Wi‑Fi | — | Short page |
| What’s new | — | This page |

If your build is newer than the number in the docs, trust **Settings → version** in the app and use the feature table above.

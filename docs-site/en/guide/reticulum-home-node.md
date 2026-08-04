# Home node — Reticulum / LXMF

**Home node** lets a Mac or Raspberry Pi on the same Wi‑Fi relay **already sealed** 1:1 chats over **Reticulum** using **LXMF**.

In the app: **Settings → Home node**  
Default = **off**. Turn on only when the bridge is running on a Mac/Pi.

---

## Concepts

| Term | Meaning in ResilNet |
|------|---------------------|
| **Reticulum (RNS)** | Overlay network for packet delivery (usually on a computer — not on Heltec LoRa radios) |
| **LXMF** | Message format on Reticulum |
| **Home node / bridge** | Mac/Pi program that accepts sealed bytes from the app over HTTP and forwards via LXMF |
| **Node address (destination)** | ~32-character LXMF destination — linked to a friend in the app |

```text
Phone A (ResilNet)          Home Mac/Pi A              Home Mac/Pi B          Phone B
   │  HTTP (LAN)               │  LXMF on Reticulum         │  HTTP (LAN)            │
   │  sealed E2EE ─────────────►│ ──────────────────────────►│◄─────────────── sealed │
   │  (bridge cannot decrypt)  │                            │                        │
```

### What it does

- Extra path when phones can reach a Mac/Pi on the LAN
- Forwards **opaque sealed** envelopes only
- Can store-and-forward across Reticulum-linked home nodes

### What it is not

- **Not** a replacement for ResilNet end-to-end encryption
- **Not** LoRa — full LXMF does **not** belong on Heltec 230B payloads
- **Not** the same as **Local Wi‑Fi** (phone↔phone UDP in the app)
- **Not** used for #mesh / Area bulletins in this version
- **Optional** — BLE / Nostr / ESP32 work without it

---

## Compare transports

| Path | Devices | Best when | 1:1 E2EE |
|------|---------|-----------|----------|
| Bluetooth mesh | Nearby phones | Offline, close range | Yes |
| Local Wi‑Fi | Phones on same LAN/hotspot | Fast LAN, no Mac required | Yes |
| ESP32 / LoRa | ResilNet boards | Mid-range offline | Yes (opaque) |
| Nostr | Internet | Distance / no shared LAN | Yes |
| **Home node (LXMF)** | Phone + Mac/Pi | Home bridge on Wi‑Fi / RNS relay | Yes (opaque on bridge) |

Typical preference when several paths exist: Local Wi‑Fi (if session active) → Nostr (if online) → Home node (if enabled and friend linked) → BLE / LoRa as available.

---

## Requirements

### Mac or Raspberry Pi

1. Same Wi‑Fi as the phones (or routable IP)
2. Run the bridge + Reticulum stack from `labs/reticulum_lxmf/` in the repo  
   (`rnsd`, `bridge listen` — see that README)
3. HTTP listening (lab examples: ports **8765 / 8766**)
4. Know the Mac/Pi LAN IP (e.g. `192.168.1.10`)

> The lab proves the design and HTTP API. Operators run the bridge themselves. Phones do **not** embed a full Reticulum stack in this app version.

### Phone (ResilNet **1.9.64+**)

1. A messageable friend already added (keys / QR as usual)
2. **Settings → Home node**
3. Enter address, e.g. `192.168.1.10:8766` or `http://192.168.1.10:8766`
4. Save & check connection — should show online + node address
5. Enable **Use home node**
6. **Link a friend** with their home-node address (from their Home node screen)

---

## In-app steps

### Open Home node

**Settings → Home node**

You’ll see: address field, connection check, this node’s shareable address, linked friends, add link.

### Connect

1. Enter the bridge IP/URL  
2. Save & refresh  
3. If offline: bridge running? same network? firewall allowing the port?

### Share and link

1. Copy **this node’s address**  
2. Friend pastes it under **Link a friend** (and you link theirs)  
3. Linking is **routing only** — it does **not** replace ResilNet E2EE key exchange

### Chat

Use 1:1 chat as usual. When Home node is on, reachable, and the peer is linked, the app may **opportunistically** send sealed bytes via the bridge and poll the inbox.

---

## Operator overview (Mac/Pi)

See `labs/reticulum_lxmf/README.md`. Roles:

| Piece | Role |
|-------|------|
| `rnsd` | Reticulum daemon |
| `bridge listen` | LXMF + HTTP `/status` `/send` `/inbox` `/announce` |
| `identity_map` | ResilNet peerId ↔ LXMF destination |
| **RNLB** blob | Wraps sealed ResilNet bytes inside LXMF content |

---

## Limits & safety

- Bridge may see metadata (timing, size) but not plaintext if E2EE is correct  
- Wrong linked address → sealed mail goes to the wrong LXMF dest  
- Do not expose the bridge port to the public internet without hardening  
- ResilNet LoRa ≠ Reticulum/LXMF  
- App UX is Settings + HTTP send/poll; a dedicated Rust `TransportType::LxmfBridge` may still be incomplete versus the Flutter path

---

## Troubleshooting

| Symptom | Check |
|---------|--------|
| Offline status | Bridge up? Correct IP? Same LAN? |
| Friend never receives | Both sides linked? RNS path between the two bridges? |
| Confused with Local Wi‑Fi | Local Wi‑Fi = phone↔phone LAN; Home node = via Mac/Pi + LXMF |
| No Home node menu | Update to **1.9.64+** |

---

## Related

- [What’s new since the previous guide](whats-new.md)
- [1:1 chat](chat.md)
- [Local Wi‑Fi](local-wifi.md)
- Repo: `labs/reticulum_lxmf/` and `labs/reticulum_lxmf/docs/bridge_app_integration.md`

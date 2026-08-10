# Local Wi‑Fi (phone LAN)

**Local Wi‑Fi** lets phones on the same network discover each other and exchange sealed chats over LAN (UDP). No Mac/Pi required. This is **not** the ESP32 SoftAP path.

Open **Settings → Local Wi‑Fi**.

## Modes

| Mode | Meaning |
|------|---------|
| **Nearby / hotspot** | One phone shares a Personal Hotspot; others join; the app discovers on that network |
| **Router** | All phones join the same Wi‑Fi AP (internet on the router is optional) |

## Notes

- For LAN discovery and sealed chat once keys exist  
- **Not** a substitute for Home node (Reticulum) or for Nostr across different networks  
- **iOS:** allow **Local Network** for ResilNet (Settings → ResilNet) or LAN discovery will fail  
- Some routers enable **client isolation** — same SSID but phones cannot see each other; disable isolation or use hotspot mode  
- If a peer is found without keys, scan QR / add contact as usual  
- Not the ESP32 SoftAP (`ResilNet-Node-XXXX`) — a different path  

## vs Home node

| | Local Wi‑Fi | Home node |
|--|-------------|-----------|
| Extra hardware | None | Mac/Pi + bridge |
| Protocol | In-app UDP | HTTP → LXMF / Reticulum |
| Reach | Same LAN only | LAN + RNS paths between home nodes |

See [Reticulum / Home node](reticulum-home-node.md).

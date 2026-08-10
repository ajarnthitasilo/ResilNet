# Apple Watch

The **ResilNet** Apple Watch companion shows mesh status and lets you send short Direct texts. **Crypto and routing always run on the iPhone.**

Available on iOS builds that embed the Watch target — there is no Android Watch app.

## What you can do

| Tab | Purpose |
|-----|---------|
| **Status** | Display name, short id, transport, online count, unread, iPhone Reachable/Away, last sync |
| **Chats** | Recent Directs, recent messages, short text / quick reply, open chat on iPhone |

Send limit from the Watch: about **160 characters** per message (the iPhone seals E2EE and chooses the transport path).

## Requirements

1. ResilNet installed on the paired **iPhone**
2. Open the iPhone app **at least once** after install/update
3. Keep the iPhone **Reachable** (app open or WatchConnectivity still live)
4. Have Direct chats on the iPhone first — the Watch does not add peers by itself

## Quick start

1. Open ResilNet on iPhone
2. Open ResilNet on Watch
3. If you see “waiting…” / “Waiting for iPhone…” → tap **Refresh**
4. Check Status, or open a chat and send a short message / quick reply

## What the Watch does **not** do

- No separate private keys on the Watch
- No ESP32 firmware flashing
- No Home node / Local Wi‑Fi / Tor settings
- No public mesh bulletins from the Watch

## Troubleshooting

| Symptom | Try |
|---------|-----|
| Waiting for iPhone | Open ResilNet on iPhone in the foreground, then Refresh on Watch |
| iPhone Away | Keep the phone nearby / unlock / reopen the app |
| No Direct chats yet | Start a chat on iPhone first |
| Send failed | Ensure iPhone is Reachable and a path exists (BLE / internet / gateway) |

Also covered on the in-app **Apple Watch** onboarding page.

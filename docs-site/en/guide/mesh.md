# #mesh and public bulletins

## Channel differences (important)

| Channel | Encrypted? | Who can read | ESP32 mule store? |
|---------|------------|--------------|-------------------|
| **#mesh peer list** | — (not a compose feed) | Nearby BLE peers — tap for 1:1 E2EE | — |
| **Public mesh bulletin** (Notices) | No (plaintext + embedded signature) | Anyone in mesh range | Yes (~3-day TTL) |
| **Area (geohash)** | Public fan-out sealed per peer | People in the geohash cell | Not mule-bulletin role |
| **Private 1:1** | Yes (E2EE) | The two parties | Normal message queue |
| **Board Open** | No | Board followers | Not mule-bulletin role |
| **Board Locked** | Yes | Key holders | Same as boards |

In the app, **#mesh** is a nearby-peer list (**no public compose on that feed**). Public announcements are posted via **Notices** with mesh scope.

Public mesh bulletins are for **disaster / offline** use — late joiners in radio range should still see what mule nodes retained.

## How to post a bulletin

1. Open **Notices** in the app
2. Choose **mesh** scope when you want a local radio broadcast
3. Post a short message — it is marked as a public bulletin

For geohash-scoped feeds see [Area](area.md).

## Remember

- No prior key exchange with every listener for bulletins
- UI marks content as public / not content-encrypted
- Do not put secrets in a bulletin
- Delivery can use the hybrid router (BLE + LoRa + Nostr when online) depending on app status

## Next

- [Area / geohash](area.md)
- [Community boards](boards.md) for owned Open/Locked announcement boards

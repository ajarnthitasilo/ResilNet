# #mesh and public bulletins

## Channel differences (important)

| Channel | Encrypted? | Who can read | ESP32 mule store? |
|---------|------------|--------------|-------------------|
| **Public mesh bulletin** | No (plaintext + embedded signature) | Anyone in mesh range | Yes (~3-day TTL) |
| **Private 1:1** | Yes (E2EE) | The two parties | Normal message queue |
| **Board Open** | No | Board followers | Not mule-bulletin role |
| **Board Locked** | Yes | Key holders | Same as boards |

Public mesh bulletins are for **disaster / offline** use — late joiners in radio range should still see what mule nodes retained.

## How to post

1. Open Notices / #mesh in the app
2. Choose **mesh** scope when you want a local radio broadcast
3. Post a short message — it is marked as a public bulletin

## Remember

- No prior key exchange with every listener
- UI marks content as public / not content-encrypted
- Do not put secrets in a bulletin

## Next

- [Community boards](boards.md) for owned Open/Locked announcement boards

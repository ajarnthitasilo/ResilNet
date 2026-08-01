# Meshtastic ↔ ResilNet bridge (text)

Separate side project / in-app service. **Does not** make Meshtastic a transport for ResilNet E2EE DMs.

## Modes (mutex — never both active)

| Mode | Direction | Behavior |
|------|-----------|----------|
| **Off** | — | Bridge idle |
| **A — Ingest** | Meshtastic → ResilNet | Demo simulate and/or MQTT JSON uplink → `#meshtastic` notices |
| **B — Egress** | ResilNet → Meshtastic | Compose → demo log or MQTT `sendtext` JSON |

**Simultaneous Mode A + Mode B is intentionally unsupported.**

### Mode A relay (default **OFF**)

- **Off:** local Notices only
- **On:** also signed public mesh bulletin (`[via:mt]`)

## Transports

| Transport | Status |
|-----------|--------|
| Logging | Demo ingest + egress history |
| MQTT JSON | TLS optional, auto-reconnect optional, Meshtastic `sendtext` / uplink `type:text` |

When **Use MQTT** is off, MQTT inbound is ignored.

## Manual MQTT test (Phase 2b)

Prerequisites on the Meshtastic gateway:

1. MQTT module enabled, **JSON output** on
2. Channel named **`mqtt`** (or match your downlink name) with **downlink** enabled
3. Know the gateway **node id** (decimal or `!hex`) for the downlink `from` field

App settings (Devices → Meshtastic bridge):

1. Enable **Use MQTT**
2. Host / port (1883 or **8883 + TLS**)
3. Set **Gateway node id (from)** — Mode B Send stays disabled until this is valid
4. Optional region → **Apply root → topics**: when Region is set, Apply rebuilds root as `msh/<region>/2/json` (overrides a stale `msh/2/json` root), then fills subscribe `#` / publish `…/mqtt/`
5. Advanced MQTT (TLS, reconnect, credentials) is folded under **Advanced MQTT**
6. Save → Connect (status must show connected — never faked)
7. Mode **A**: wait for mesh text → Notices `#meshtastic` with Meshtastic badge
8. Mode **B**: send short text → Recent egress shows `[via:rn] …`; gateway should TX on mesh

Public broker example (if you use Meshtastic’s public MQTT, follow their current host/credentials docs): same topic pattern `msh/<region>/2/json/...`.

Unit tests (no broker):

```bash
cd mobile_app
flutter test test/meshtastic_mqtt_json_test.dart test/meshtastic_bridge_test.dart
```

## Schema (documented)

See [`protocol.md`](protocol.md) for uplink parse + downlink `sendtext` JSON.

## Not supported

- Simultaneous A+B
- Full protobuf codec
- Dual-radio RF bridge / media

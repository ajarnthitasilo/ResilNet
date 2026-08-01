# Bridge protocol notes

## ResilNet side (ingest / display)

Preferred path: **in-app** → `LocalNotice` with:

- `scope`: `mesh`
- `channelLabel`: `#meshtastic`
- optional mesh rebroadcast: **default OFF** — when enabled, signed bulletin tagged `[via:mt]`

Do **not** inject into sealed DM / `area_public`.

## Tags (loop prevention)

| Tag | Meaning |
|-----|---------|
| `[via:mt]` | Originated from Meshtastic (ingest into ResilNet) |
| `[via:rn]` | Originated from ResilNet (egress toward Meshtastic) |

Drop rules:

- Mode A: ignore inbound if body already contains `[via:rn]`
- Mode B: do not egress if body already contains `[via:mt]`

## Limits

- Max text: 180 Unicode scalars (tag reserved inside budget)
- Dedupe: normalized text + minute bucket, TTL ~5 minutes
- Rate: ~1 message / 2 seconds per direction

## Meshtastic MQTT JSON (Phase 2b)

Helpers: `mobile_app/lib/core/meshtastic_mqtt_json.dart`  
Transport: `MqttMeshtasticTransport` (`mqtt_client`)

### Connection

- Optional **TLS** (`useTls`, typical port **8883**) via `SecurityContext.defaultContext` — handshake failures → `connect_failed_tls`, never fake connected
- Optional **auto-reconnect** (default off): status → Connecting on drop, Connected after `onAutoReconnected` + resubscribe
- When **Use MQTT** is off, MQTT inbound is ignored

### Topic helpers

- Root: `msh/2/json` or `msh/{region}/2/json`
- Subscribe: `{root}/#`
- Publish (downlink): `{root}/{downlinkChannel}/` (default channel name `mqtt`)

### Uplink ingest (Mode A)

Accept:

- Plaintext UTF-8
- JSON with `type` omitted or `text` (and similar), text from:
  - `payload` string, or
  - `payload.text` / `payload.message`, or
  - top-level `text` / `message`

`fromId` preference: `sender` → `from` → MQTT topic.

Ignore: `telemetry`, `position`, `nodeinfo`, … and downlink types `sendtext` / `sendposition` (do not re-ingest our own publishes).

Example uplink:

```json
{
  "channel": 0,
  "from": 2711401735,
  "payload": { "text": "hello" },
  "sender": "!00000004",
  "type": "text",
  "to": 4294967295
}
```

### Downlink egress (Mode B)

Publish JSON (not protobuf) to the publish topic:

```json
{
  "from": 2130636288,
  "type": "sendtext",
  "payload": "[via:rn] hello",
  "channel": 0
}
```

- `from` = decimal node id of the **gateway** that will transmit (required; UI accepts `!hex` or decimal)
- `payload` = string (Meshtastic firmware expects string for `sendtext`)
- `channel` = optional index 0–7
- `to` = optional DM target (not exposed in UI yet)

Gateway must have a channel named like the downlink topic segment (usually `mqtt`) with downlink enabled and JSON MQTT on.

### Protobuf

Out of scope for this phase.

## External UDP SoftAP (future)

Only if the bridge holds a ResilNet identity and can build signed `mesh_bulletin` + RN frames to SoftAP UDP. See firmware `packet.h` / `resilnet_radio_codec.dart`.

# Area (geohash)

**Area** is a geohash-cell feed — people online in the same cell, plus public posts scoped to that area.

Open it from the Location icon / switch to Area in Community (labels follow UI language).

## How it differs from #mesh bulletins

| | Area | Public mesh bulletin |
|--|------|----------------------|
| Scope | Geohash cell (precision / pin / teleport) | Nearby mesh radios / peers |
| Public posts | Per-peer **sealed E2EE** fan-out — not plaintext | **Plaintext + signature** |
| 1:1 | Tap someone online in the cell | Tap a peer in the #mesh list |

Do not put secrets in mesh bulletins. Area public fan-out is still sealed per recipient (peer keys required).

## Quick use

1. Allow Location when prompted (used to compute geohash)
2. Open the Area sheet: adjust precision, pin a cell, or enter a geohash (teleport)
3. Refresh GPS if the cell is empty or wrong
4. Send 1:1 or an area public post from the UI

## Transport mode

In Community you can pick roughly **Mesh / Internet / Auto** for how public traffic prefers radios vs Nostr — see the Transport icon in the toolbar.

## Next

- [#mesh / public bulletin](mesh.md)
- [1:1 chat](chat.md)

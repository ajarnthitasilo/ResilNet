#!/usr/bin/env bash
# Demo: opaque ResilNet RNLB blob B → bridge A over LXMF (localhost).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT"
PY="${ROOT}/.venv/bin/python"
CURL=(curl -sS)

if [[ ! -x "$PY" ]]; then
  echo "Missing .venv — run: python3 -m venv .venv && .venv/bin/pip install -r requirements.txt"
  exit 1
fi

mkdir -p logs inbox_a
./stop_daemons.sh >/dev/null 2>&1 || true
./start_daemons.sh
sleep 1

# Fresh identity map for this demo run
MAP="$ROOT/config/identity_map.json"
cp "$ROOT/config/identity_map.example.json" "$MAP"

echo "== Start bridge A (listen + HTTP :8765) =="
"$PY" -u -m bridge listen \
  --config config/a \
  --name bridge-a \
  --http-port 8765 \
  --identity-map "$MAP" \
  --inbox-dir "$ROOT/inbox_a" \
  --self-peer-id alice_lab_peer_aaaaaaaa \
  >logs/bridge_a.log 2>&1 &
BRIDGE_A_PID=$!
cleanup() {
  kill "$BRIDGE_A_PID" 2>/dev/null || true
}
trap cleanup EXIT

# Wait until HTTP is up
for _ in $(seq 1 40); do
  if "${CURL[@]}" http://127.0.0.1:8765/status >/dev/null 2>&1; then
    break
  fi
  sleep 0.25
done

STATUS="$("${CURL[@]}" http://127.0.0.1:8765/status)"
echo "$STATUS"
DEST="$(printf '%s' "$STATUS" | "$PY" -c 'import sys,json; print(json.load(sys.stdin)["lxmf_destination"])')"
echo "A lxmf_destination=$DEST"

# Ensure map has A (listen already upserts; refresh example placeholders)
"$PY" - <<PY
from bridge import identity_map as idmap
from pathlib import Path
p = Path("$MAP")
data = idmap.load_map(p)
idmap.upsert_entry(data, resilnet_peer_id="alice_lab_peer_aaaaaaaa", lxmf_destination="$DEST", note="demo bridge-a")
idmap.save_map(p, data)
print("identity_map updated")
PY

sleep 2

echo "== Pack + send opaque sealed stub from B =="
# Stub sealed envelope (not real crypto) — stands in for ChatMessage sealed fields
SEALED_HEX="7b226964223a226d31222c2273656e6465724964223a22626f62222c2272656365697665724964223a22616c696365222c22656e637279707465645061796c6f6164223a22616263222c227369676e6174757265223a2278227d"

"$PY" -u -m bridge send \
  --config config/b \
  --name bridge-b \
  --dest "$DEST" \
  --to-peer-id alice_lab_peer_aaaaaaaa \
  --from-peer-id bob_lab_peer_bbbbbbbb \
  --sealed-hex "$SEALED_HEX" \
  --identity-map "$MAP" \
  --wait 5 \
  >logs/bridge_b_send.log 2>&1

echo "== Bridge A inbox =="
INBOX="$("${CURL[@]}" http://127.0.0.1:8765/inbox)"
echo "$INBOX" | "$PY" -c '
import sys, json
d = json.load(sys.stdin)
items = d.get("items") or []
assert items, "inbox empty — delivery failed"
last = items[-1]
print("inbox_count", len(items))
print("bytes", last.get("bytes"))
print("hex_preview", last.get("hex_preview"))
blob = last.get("blob") or {}
print("to_peer_id", blob.get("to_peer_id"))
print("from_peer_id", blob.get("from_peer_id"))
print("sealed_len", blob.get("sealed_len"))
print("sealed_hex_preview", blob.get("sealed_hex_preview"))
assert blob.get("to_peer_id") == "alice_lab_peer_aaaaaaaa"
assert blob.get("sealed_len", 0) > 0
print("DEMO_OK")
'

echo
echo "Also see logs/bridge_a.log and inbox_a/"
echo "HTTP still up until script exits (Ctrl+C if you sourced; trap kills bridge A)."

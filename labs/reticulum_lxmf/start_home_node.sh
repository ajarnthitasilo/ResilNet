#!/usr/bin/env bash
# Start Mac Home-node bridge for ResilNet (LAN-facing HTTP).
# Usage: ./start_home_node.sh
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
# Prefer real path (symlink under ~/ResilNet can confuse RNS shared instance)
ROOT="$(cd "$ROOT" && pwd -P)"
cd "$ROOT"
PY="$ROOT/.venv/bin/python"
CFG_A="$ROOT/config/a"
CFG_B="$ROOT/config/b"
export PYTHONUNBUFFERED=1

if [[ ! -x "$PY" ]]; then
  echo "Missing .venv — run: python3 -m venv .venv && .venv/bin/pip install -r requirements.txt"
  exit 1
fi

mkdir -p logs inbox_a
if [[ ! -f config/identity_map.json ]]; then
  cp config/identity_map.example.json config/identity_map.json
fi

# Kill previous lab listeners (keep other system processes)
pkill -f "rnsd --config $CFG_A" 2>/dev/null || true
pkill -f "rnsd --config $CFG_B" 2>/dev/null || true
pkill -f " -m bridge listen" 2>/dev/null || true
sleep 0.8

"$PY" -u "$ROOT/.venv/bin/rnsd" --config "$CFG_A" -q >logs/rnsd-a.log 2>&1 &
echo $! >logs/rnsd-a.pid
"$PY" -u "$ROOT/.venv/bin/rnsd" --config "$CFG_B" -q >logs/rnsd-b.log 2>&1 &
echo $! >logs/rnsd-b.pid
sleep 2

"$PY" -u -m bridge listen \
  --config "$CFG_A" \
  --name home-mac \
  --http-host 0.0.0.0 \
  --http-port 8765 \
  --identity-map "$ROOT/config/identity_map.json" \
  --inbox-dir "$ROOT/inbox_a" \
  --self-peer-id home_mac_peer \
  >logs/bridge_home.log 2>&1 &
echo $! >logs/bridge_home.pid

for _ in $(seq 1 60); do
  if curl -sS http://127.0.0.1:8765/status >/dev/null 2>&1; then
    break
  fi
  sleep 0.25
done

MAC_IP="$(ipconfig getifaddr en0 2>/dev/null || true)"
[[ -z "${MAC_IP}" ]] && MAC_IP="$(ipconfig getifaddr en1 2>/dev/null || true)"
STATUS="$(curl -sS http://127.0.0.1:8765/status)"
DEST="$(printf '%s' "$STATUS" | "$PY" -c 'import sys,json; print(json.load(sys.stdin).get("lxmf_destination",""))')"

echo "Home node bridge is UP"
echo "  status:   http://127.0.0.1:8765/status"
if [[ -n "${MAC_IP}" ]]; then
  echo "  phone URL: ${MAC_IP}:8765   (or http://${MAC_IP}:8765)"
fi
echo "  LXMF dest: ${DEST}"
echo "  logs:      $ROOT/logs/bridge_home.log"
echo "Stop with:   $ROOT/stop_home_node.sh"

#!/usr/bin/env bash
# Start ResilNet Home-node bridge on a Raspberry Pi with an RNode (LoRa).
#
# One Pi = one rnsd (config/pi_home) + one bridge HTTP for the phone.
# The Pi<->Pi hop happens over the RNode LoRa link defined in
# config/pi_home/config (must match the peer Pi). See docs/pi_rnode_mesh.md.
#
# Usage:
#   ./start_home_node_pi.sh              # start rnsd + bridge (needs RNode)
#   DRY_RUN=1 ./start_home_node_pi.sh    # validate venv/config only, no radio
#   HTTP_PORT=8765 NAME=pi-home ./start_home_node_pi.sh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
# Real path — a ~/ResilNet symlink can confuse the RNS shared instance.
ROOT="$(cd "$ROOT" && pwd -P)"
cd "$ROOT"

PY="$ROOT/.venv/bin/python"
CFG="$ROOT/config/pi_home"
HTTP_PORT="${HTTP_PORT:-8765}"
NAME="${NAME:-pi-home}"
SELF_PEER="${SELF_PEER:-pi_home_peer}"
DRY_RUN="${DRY_RUN:-0}"
export PYTHONUNBUFFERED=1

if [[ ! -x "$PY" ]]; then
  echo "Missing .venv — run:"
  echo "  python3 -m venv .venv && .venv/bin/pip install -r requirements.txt"
  exit 1
fi
if [[ ! -f "$CFG/config" ]]; then
  echo "Missing $CFG/config — copy/edit the RNode template first."
  exit 1
fi

mkdir -p logs inbox_pi
if [[ ! -f config/identity_map.json ]]; then
  cp config/identity_map.example.json config/identity_map.json
fi

if [[ "$DRY_RUN" == "1" ]]; then
  echo "DRY_RUN: venv OK, config present at $CFG/config"
  echo "DRY_RUN: not starting rnsd/bridge (no radio needed)."
  echo "Edit RNode port/frequency in $CFG/config, then run without DRY_RUN."
  exit 0
fi

# Warn (do not fail) if the configured serial port is absent.
PORT_LINE="$(grep -E '^\s*port\s*=\s*/dev/' "$CFG/config" | head -n1 || true)"
if [[ -n "$PORT_LINE" ]]; then
  DEV="$(printf '%s' "$PORT_LINE" | sed -E 's/.*=\s*//')"
  if [[ ! -e "$DEV" ]]; then
    echo "WARNING: RNode serial device '$DEV' not found."
    echo "         Plug in the RNode or fix 'port =' in $CFG/config."
    echo "         (rnsd will keep retrying; check logs/rnsd-pi.log)"
  fi
fi

# Restart only our own processes.
pkill -f "rnsd --config $CFG" 2>/dev/null || true
pkill -f " -m bridge listen" 2>/dev/null || true
sleep 0.8

"$PY" -u "$ROOT/.venv/bin/rnsd" --config "$CFG" -q >logs/rnsd-pi.log 2>&1 &
echo $! >logs/rnsd-pi.pid
sleep 2

"$PY" -u -m bridge listen \
  --config "$CFG" \
  --name "$NAME" \
  --http-host 0.0.0.0 \
  --http-port "$HTTP_PORT" \
  --identity-map "$ROOT/config/identity_map.json" \
  --inbox-dir "$ROOT/inbox_pi" \
  --self-peer-id "$SELF_PEER" \
  >logs/bridge_pi.log 2>&1 &
echo $! >logs/bridge_pi.pid

for _ in $(seq 1 60); do
  if curl -sS "http://127.0.0.1:${HTTP_PORT}/status" >/dev/null 2>&1; then
    break
  fi
  sleep 0.25
done

PI_IP="$(hostname -I 2>/dev/null | awk '{print $1}')"
[[ -z "${PI_IP:-}" ]] && PI_IP="$(ipconfig getifaddr en0 2>/dev/null || true)"
STATUS="$(curl -sS "http://127.0.0.1:${HTTP_PORT}/status" 2>/dev/null || true)"
DEST="$(printf '%s' "$STATUS" | "$PY" -c 'import sys,json;
try: print(json.load(sys.stdin).get("lxmf_destination",""))
except Exception: print("")' 2>/dev/null || true)"

echo "ResilNet Pi Home node is UP"
echo "  status:    http://127.0.0.1:${HTTP_PORT}/status"
[[ -n "${PI_IP:-}" ]] && echo "  phone URL: ${PI_IP}:${HTTP_PORT}   (or http://${PI_IP}:${HTTP_PORT})"
echo "  LXMF dest: ${DEST:-<pending — check logs/bridge_pi.log>}"
echo "  radio log: $ROOT/logs/rnsd-pi.log"
echo "  bridge log:$ROOT/logs/bridge_pi.log"
echo "Share the LXMF dest with the peer Pi, link it in each app."
echo "Stop with: $ROOT/stop_home_node_pi.sh"

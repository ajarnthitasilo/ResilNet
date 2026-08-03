#!/usr/bin/env bash
# Start both lab rnsd processes (localhost TCP A←B).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
VENV="$ROOT/.venv/bin"
LOG="$ROOT/logs"
mkdir -p "$LOG"

if [[ ! -x "$VENV/rnsd" ]]; then
  echo "Missing venv. Run: python3 -m venv .venv && .venv/bin/pip install rns lxmf"
  exit 1
fi

pkill -f "rnsd --config $ROOT/config/a" 2>/dev/null || true
pkill -f "rnsd --config $ROOT/config/b" 2>/dev/null || true
sleep 0.5

"$VENV/rnsd" --config "$ROOT/config/a" -q >"$LOG/rnsd-a.log" 2>&1 &
echo $! >"$LOG/rnsd-a.pid"
"$VENV/rnsd" --config "$ROOT/config/b" -q >"$LOG/rnsd-b.log" 2>&1 &
echo $! >"$LOG/rnsd-b.pid"
sleep 1.5

echo "rnsd A pid=$(cat "$LOG/rnsd-a.pid")  B pid=$(cat "$LOG/rnsd-b.pid")"
"$VENV/rnstatus" --config "$ROOT/config/a" || true
echo "----"
"$VENV/rnstatus" --config "$ROOT/config/b" || true

#!/usr/bin/env bash
# Stop the ResilNet Pi Home-node bridge + its rnsd.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$ROOT" && pwd -P)"
cd "$ROOT"

CFG="$ROOT/config/pi_home"

pkill -f " -m bridge listen" 2>/dev/null || true
pkill -f "rnsd --config $CFG" 2>/dev/null || true
rm -f logs/bridge_pi.pid logs/rnsd-pi.pid 2>/dev/null || true
echo "Pi Home node bridge stopped."

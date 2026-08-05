#!/usr/bin/env bash
# Stop Mac Home-node bridge + lab rnsd.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$ROOT" && pwd -P)"
cd "$ROOT"

pkill -f " -m bridge listen" 2>/dev/null || true
./stop_daemons.sh >/dev/null 2>&1 || true
echo "Home node bridge stopped."

#!/usr/bin/env bash
# Stop lab rnsd / lxmf_node processes for this directory.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"

pkill -f "lxmf_node.py --config $ROOT/config" 2>/dev/null || true
pkill -f "rnsd --config $ROOT/config/a" 2>/dev/null || true
pkill -f "rnsd --config $ROOT/config/b" 2>/dev/null || true
sleep 0.3
echo "Stopped lab processes under $ROOT"

#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../mobile_app"
flutter clean
rm -rf build .dart_tool
echo "Cleaned ResilNet mobile_app build artifacts."
df -h /

#!/bin/sh
# Install ResilNet Watch app directly to a paired Apple Watch (dev builds).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
WATCH_APP="$ROOT/build/ios/iphoneos/Runner.app/Watch/ResilNetWatch.app"
WATCH_ID="${1:-00008301-609229922640202E}"

if [ ! -d "$WATCH_APP" ]; then
  echo "Missing $WATCH_APP — run: flutter build ios --release" >&2
  exit 1
fi

echo "Installing Watch app to $WATCH_ID ..."
xcrun devicectl device install app --device "$WATCH_ID" "$WATCH_APP"
echo "Done. Open ResilNet on Apple Watch home screen."

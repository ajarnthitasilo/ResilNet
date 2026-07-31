#!/usr/bin/env bash
# Publish releases/firmware into docs-site/firmware for the docs CDN layout
# that mobile_app FirmwareConfig expects:
#   {BASE}/esp32_standalone/latest.bin
#   {BASE}/esp32_lora_gateway/latest.bin
#   {BASE}/manifest.json
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/releases/firmware"
DST="$ROOT/docs-site/firmware"

STANDALONE_NAME="resilnet_esp32_standalone.bin"
LORA_NAME="resilnet_esp32_lora_gateway.bin"

if [[ ! -f "$SRC/$STANDALONE_NAME" || ! -f "$SRC/$LORA_NAME" || ! -f "$SRC/manifest.json" ]]; then
  echo "Missing $SRC artifacts. Run ./tool/sync_firmware_release.sh first." >&2
  exit 1
fi

mkdir -p "$DST/esp32_standalone" "$DST/esp32_lora_gateway"

cp "$SRC/manifest.json" "$DST/manifest.json"
cp "$SRC/$STANDALONE_NAME" "$DST/$STANDALONE_NAME"
cp "$SRC/$LORA_NAME" "$DST/$LORA_NAME"
cp "$SRC/$STANDALONE_NAME" "$DST/esp32_standalone/latest.bin"
cp "$SRC/$LORA_NAME" "$DST/esp32_lora_gateway/latest.bin"

# Verify SHA-256 against manifest
python3 - "$DST/manifest.json" "$DST" <<'PY'
import hashlib, json, sys
from pathlib import Path

manifest_path = Path(sys.argv[1])
root = Path(sys.argv[2])
m = json.loads(manifest_path.read_text())
artifacts = m["artifacts"]

checks = [
    ("standaloneNode", root / "resilnet_esp32_standalone.bin"),
    ("standaloneNode", root / "esp32_standalone" / "latest.bin"),
    ("loraGateway", root / "resilnet_esp32_lora_gateway.bin"),
    ("loraGateway", root / "esp32_lora_gateway" / "latest.bin"),
]

for key, path in checks:
    expected = artifacts[key]["sha256"].lower()
    actual = hashlib.sha256(path.read_bytes()).hexdigest()
    if actual != expected:
        raise SystemExit(f"SHA mismatch {path}: {actual} != {expected}")
    size = path.stat().st_size
    if size != int(artifacts[key]["sizeBytes"]):
        raise SystemExit(f"Size mismatch {path}: {size} != {artifacts[key]['sizeBytes']}")

print(
    f"OK docs firmware hub v{m.get('appVersion')} "
    f"updatedAt={m.get('updatedAt')} → {root}"
)
PY

echo "Synced docs-site firmware hub → $DST"
echo "App BASE_URL paths:"
echo "  $DST/esp32_standalone/latest.bin"
echo "  $DST/esp32_lora_gateway/latest.bin"
echo "  $DST/manifest.json"

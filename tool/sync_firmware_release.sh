#!/usr/bin/env bash
# Copy PlatformIO build outputs into releases/firmware/ and refresh manifest hashes.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
VER="${1:-}"
FW_DIR="$ROOT/releases/firmware"
STANDALONE_SRC="$ROOT/esp32_firmware/.pio/build/standalone/firmware.bin"
LORA_SRC="$ROOT/esp32_firmware/.pio/build/lora_gateway/firmware.bin"

if [[ ! -f "$STANDALONE_SRC" || ! -f "$LORA_SRC" ]]; then
  echo "Missing build artifacts. Run:" >&2
  echo "  cd esp32_firmware && pio run -e standalone && pio run -e lora_gateway" >&2
  exit 1
fi

mkdir -p "$FW_DIR"
cp "$STANDALONE_SRC" "$FW_DIR/resilnet_esp32_standalone.bin"
cp "$LORA_SRC" "$FW_DIR/resilnet_esp32_lora_gateway.bin"

STANDALONE_SHA=$(shasum -a 256 "$FW_DIR/resilnet_esp32_standalone.bin" | awk '{print $1}')
LORA_SHA=$(shasum -a 256 "$FW_DIR/resilnet_esp32_lora_gateway.bin" | awk '{print $1}')
STANDALONE_SIZE=$(stat -f%z "$FW_DIR/resilnet_esp32_standalone.bin")
LORA_SIZE=$(stat -f%z "$FW_DIR/resilnet_esp32_lora_gateway.bin")
DATE=$(date +%Y-%m-%d)

if [[ -z "$VER" ]]; then
  VER=$(grep '^version:' "$ROOT/mobile_app/pubspec.yaml" | sed 's/version: //; s/+.*//')
fi

python3 - "$FW_DIR/manifest.json" "$VER" "$DATE" "$STANDALONE_SHA" "$LORA_SHA" "$STANDALONE_SIZE" "$LORA_SIZE" <<'PY'
import json, sys
path, ver, date, s_sha, l_sha, s_sz, l_sz = sys.argv[1:8]
with open(path) as f:
    m = json.load(f)
m["appVersion"] = ver
m["updatedAt"] = date
m["artifacts"]["standaloneNode"].update(
    {"sha256": s_sha, "sizeBytes": int(s_sz)}
)
m["artifacts"]["loraGateway"].update(
    {"sha256": l_sha, "sizeBytes": int(l_sz)}
)
with open(path, "w") as f:
    json.dump(m, f, indent=2)
    f.write("\n")
print(f"Updated {path} appVersion={ver}")
PY

echo "Synced firmware release to $FW_DIR"

#!/bin/bash
# ดาวน์โหลด Gradle 8.11.1 จาก mirror (ใช้เมื่อ services.gradle.org ช้า)
set -euo pipefail

HASH="2af475fe1def18df21de4c494b7d8df77de0cf2e75df4e5289fdf80eb32b3be1"
DEST="$HOME/.gradle/wrapper/dists/gradle-8.11.1-bin/$HASH"
ZIP="$DEST/gradle-8.11.1-bin.zip"
mkdir -p "$DEST"

echo "Downloading Gradle 8.11.1 to $ZIP ..."
curl -fL --http1.1 -C - --retry 10 --retry-delay 5 \
  -o "$ZIP" \
  "https://mirrors.cloud.tencent.com/gradle/gradle-8.11.1-bin.zip"

unzip -t "$ZIP"
touch "$DEST/gradle-8.11.1-bin.zip.ok"
echo "Gradle ready."

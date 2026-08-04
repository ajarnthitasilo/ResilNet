#!/bin/zsh
# Fix Ollama models path (SSD_DATA is often unmounted) and draft Karen sheet.
# Usage:
#   ./tool/run_ksw_ollama.sh              # pull small model + draft all
#   ./tool/run_ksw_ollama.sh --limit 20  # smoke test
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MODELS_DIR="/Volumes/SSD_2TB/Documents/dev-cache/ollama_models"
LOG_DIR="/Volumes/SSD_2TB/Documents/resilnet-build"
mkdir -p "$MODELS_DIR" "$LOG_DIR"

if [[ ! -d /Volumes/SSD_2TB ]]; then
  echo "ERROR: /Volumes/SSD_2TB not mounted — free space on system disk is tight."
  exit 1
fi

# Broken env from old disk:
#   OLLAMA_MODELS=/Volumes/SSD_DATA/ollama_models  (volume often missing)
export OLLAMA_MODELS="$MODELS_DIR"
export OLLAMA_HOST="127.0.0.1:11434"
MODEL="${OLLAMA_MODEL:-qwen2.5:1.5b}"

echo "OLLAMA_MODELS=$OLLAMA_MODELS"
echo "MODEL=$MODEL"

# Prefer GUI if present, else serve
if ! curl -sf -m 2 "http://$OLLAMA_HOST/api/tags" >/dev/null; then
  echo "Starting Ollama…"
  killall Ollama ollama 2>/dev/null || true
  sleep 1
  open -a Ollama || true
  sleep 4
fi
if ! curl -sf -m 2 "http://$OLLAMA_HOST/api/tags" >/dev/null; then
  echo "GUI API down — starting ollama serve with fixed models path…"
  killall ollama 2>/dev/null || true
  nohup /usr/local/bin/ollama serve >"$LOG_DIR/ollama-serve.log" 2>&1 &
  sleep 3
fi
if ! curl -sf -m 2 "http://$OLLAMA_HOST/api/tags" >/dev/null; then
  echo "ERROR: Ollama API still not reachable on $OLLAMA_HOST"
  echo "Check: open /Applications/Ollama.app"
  echo "Unset broken path: unset OLLAMA_MODELS  # if it points at /Volumes/SSD_DATA"
  echo "Log: $LOG_DIR/ollama-serve.log"
  exit 1
fi

if ! ollama list 2>/dev/null | grep -q "$MODEL"; then
  echo "Pulling $MODEL …"
  ollama pull "$MODEL"
fi
ollama list

cd "$ROOT"
python3 tool/draft_ksw_llm.py --provider ollama --ollama-model "$MODEL" --batch 6 "$@"

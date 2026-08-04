# ResilNet localizations

## Shipped locales (~37)

`en`, `th`, `zh`, `zh_TW`, `ja`, `ko`, `id`, `vi`, `ms`, `my`, `ksw`, `hi`, `bn`, `ta`, `te`, `mr`, `gu`, `kn`, `ml`, `pa`, `ur`, `ar`, `fa`, `he`, `tr`, `ru`, `uk`, `pl`, `de`, `fr`, `es`, `pt`, `it`, `nl`, `sv`, `fi`, `cs`

- **Default:** follow the device language (Settings → Language → System).
- Unsupported device languages fall back to **English**.
- Draft translations (except curated `th`) may be machine-assisted — polish as needed.
- `my` = Myanmar (Burmese). `ksw` = S'gaw Karen (กะเหรี่ยงสกอว์); machine translation for Karen is limited so many strings may stay English until reviewed.

## Karen (ksw) human + LLM draft sheet

Sheet for translators (EN + TH pairs):

`lib/l10n/human_translate_ksw.txt`

Draft empty `KSW:` lines with an LLM (batch), then have a Karen speaker review:

```bash
cd mobile_app

# OpenRouter (or set OPENAI_API_KEY / ANTHROPIC_API_KEY)
export OPENROUTER_API_KEY=sk-or-...
python3 tool/draft_ksw_llm.py --provider openrouter --batch 12

# Or local Ollama
ollama pull qwen2.5:7b
python3 tool/draft_ksw_llm.py --provider ollama --ollama-model qwen2.5:7b --limit 40

# After review (or to push drafts into the app ARB):
python3 tool/draft_ksw_llm.py --apply-arb-only
# optional: drop [DRAFT] tags when applying
python3 tool/draft_ksw_llm.py --apply-arb-only --strip-draft-tag
flutter gen-l10n
```

Draft lines are prefixed with `[DRAFT]` in the sheet until a reviewer removes the tag.

### Ollama on this Mac (important)

Login env may set `OLLAMA_MODELS=/Volumes/SSD_DATA/ollama_models`. If that volume is **unmounted**, `ollama serve` can fail/exit immediately and `ollama list` stays empty.

Prefer models on the working SSD:

```bash
export OLLAMA_MODELS="/Volumes/SSD_2TB/Documents/dev-cache/ollama_models"
mkdir -p "$OLLAMA_MODELS"
open /Applications/Ollama.app   # system Applications — not ~/Applications
# Mac mini 8GB RAM: use a small model
ollama pull qwen2.5:1.5b
./tool/run_ksw_ollama.sh --limit 20
./tool/run_ksw_ollama.sh          # full sheet when smoke test OK
```

## Sync / translate

```bash
# Create/update ARB keys from app_en.arb
python3 tool/sync_l10n_arbs.py

# Draft-translate missing strings (uses deep-translator; prefer a venv)
python3 tool/sync_l10n_arbs.py --translate --workers 12
python3 tool/sync_l10n_arbs.py --translate --only ja,ko,vi
python3 tool/sync_l10n_arbs.py --translate --force --clear-cache --workers 12
```

Cache file `tool/.l10n_translate_cache.json` is gitignored.
```

Then:

```bash
flutter gen-l10n
```

Locale option metadata for Settings lives in `supported_locales.dart`.

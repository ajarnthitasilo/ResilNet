#!/usr/bin/env python3
"""Draft S'gaw Karen (ksw) UI strings via LLM into human_translate_ksw.txt.

Fills empty `KSW:` lines in batches for human review. Optionally applies
drafts into app_ksw.arb.

Backends (first match wins unless --provider set):
  1) OPENAI_API_KEY (+ optional OPENAI_BASE_URL) — OpenAI / OpenRouter / compatible
  2) OPENROUTER_API_KEY — https://openrouter.ai/api/v1
  3) ANTHROPIC_API_KEY
  4) Ollama at localhost:11434 (--ollama-model)

Examples:
  # OpenRouter (recommended if you have a key)
  export OPENROUTER_API_KEY=sk-or-...
  python3 tool/draft_ksw_llm.py --batch 12

  # OpenAI-compatible
  export OPENAI_API_KEY=...
  export OPENAI_BASE_URL=https://api.openai.com/v1   # optional
  python3 tool/draft_ksw_llm.py --model gpt-4o-mini

  # Ollama
  ollama pull qwen2.5:7b
  python3 tool/draft_ksw_llm.py --provider ollama --ollama-model qwen2.5:7b --limit 30

  # After humans edit the sheet (or to push LLM drafts into ARB):
  python3 tool/draft_ksw_llm.py --apply-arb-only
"""

from __future__ import annotations

import argparse
import json
import os
import re
import sys
import time
import urllib.error
import urllib.request
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
L10N = ROOT / "lib" / "l10n"
SHEET = L10N / "human_translate_ksw.txt"
ARB = L10N / "app_ksw.arb"
EN_ARB = L10N / "app_en.arb"


SYSTEM = """You are a careful translator for ResilNet, an offline mesh chat app.
Translate UI strings into S'gaw Karen (กะเหรี่ยงสกอว์ / K'nyaw), code `ksw`.

Rules:
- Prefer S'gaw Karen script when you can write it confidently; otherwise clear S'gaw romanization is OK.
- Keep product terms unchanged when appropriate: ResilNet, LoRa, BLE, Nostr, Meshtastic, LXMF, ESP32, SoftAP, Wi-Fi, MQTT, Heltec, RNLB.
- Preserve every ICU placeholder exactly (e.g. {error}, {name}, {count}) — same spelling and braces.
- Keep meaning close to EN; use TH as meaning help when EN is terse.
- Do not add explanations — return JSON only.
- Output a JSON object: { "<key>": "<karen translation>", ... } for every input key.
"""


@dataclass
class Entry:
    index: int
    total: int
    key: str
    en: str
    th: str
    ksw: str


def load_sheet(path: Path) -> tuple[str, list[Entry]]:
    text = path.read_text(encoding="utf-8")
    entries: list[Entry] = []
    lines = text.splitlines()
    i = 0
    header_sep = re.compile(r"^────────\s*(\d+)/(\d+)\s*────────\s*$")
    while i < len(lines):
        m = header_sep.match(lines[i])
        if not m:
            i += 1
            continue
        index = int(m.group(1))
        total = int(m.group(2))
        key = en = th = ksw = ""
        i += 1
        while i < len(lines) and not header_sep.match(lines[i]):
            line = lines[i]
            if line.startswith("KEY:"):
                key = line[4:].strip()
            elif line.startswith("EN:"):
                en = line[3:].strip()
            elif line.startswith("TH:"):
                th = line[3:].strip()
            elif line.startswith("KSW:"):
                ksw = line[4:].strip()
            i += 1
        if key:
            entries.append(
                Entry(index=index, total=total, key=key, en=en, th=th, ksw=ksw)
            )
    return text, entries


def write_ksw_values(text: str, entries: list[Entry], updates: dict[str, str]) -> str:
    """Rewrite sheet text with new KSW values."""
    header_end = text.find("────────")
    header = text[:header_end] if header_end >= 0 else text
    empty_left = sum(1 for e in entries if not updates.get(e.key, e.ksw).strip())
    header = re.sub(
        r"จำนวนที่ต้องแปล:.*",
        f"จำนวนที่ต้องแปล: ว่างเหลือประมาณ {empty_left} ข้อ / รวม {len(entries)}",
        header,
        count=1,
    )
    if "[DRAFT]" not in header:
        header = header.rstrip() + (
            "\n\nหมายเหตุ: บรรทัด KSW ที่ขึ้นต้นด้วย [DRAFT] เป็นร่างจาก LLM — "
            "ให้คนกะเหรี่ยงตรวจแล้วลบคำว่า [DRAFT] เมื่อโอเค\n\n"
        )

    parts = [header if header.endswith("\n") else header + "\n"]
    for e in entries:
        ksw = updates.get(e.key, e.ksw)
        if e.key in updates and ksw and not str(ksw).startswith("[DRAFT]"):
            ksw = f"[DRAFT] {ksw}"
        parts.append(
            f"──────── {e.index}/{e.total} ────────\n"
            f"KEY: {e.key}\n"
            f"EN:  {e.en}\n"
            f"TH:  {e.th}\n"
            f"KSW: {ksw}\n\n"
        )
    return "".join(parts)


def http_json(url: str, payload: dict, headers: dict, timeout: int = 120) -> dict:
    data = json.dumps(payload).encode("utf-8")
    req = urllib.request.Request(url, data=data, headers=headers, method="POST")
    with urllib.request.urlopen(req, timeout=timeout) as resp:
        return json.loads(resp.read().decode("utf-8"))


def chat_openai_compatible(
    base_url: str, api_key: str, model: str, user: str
) -> str:
    url = base_url.rstrip("/") + "/chat/completions"
    payload = {
        "model": model,
        "temperature": 0.2,
        "messages": [
            {"role": "system", "content": SYSTEM},
            {"role": "user", "content": user},
        ],
        "response_format": {"type": "json_object"},
    }
    headers = {
        "Content-Type": "application/json",
        "Authorization": f"Bearer {api_key}",
    }
    try:
        out = http_json(url, payload, headers)
    except urllib.error.HTTPError as e:
        # Some providers reject response_format — retry without it.
        if e.code in (400, 404, 422):
            payload.pop("response_format", None)
            out = http_json(url, payload, headers)
        else:
            raise
    return out["choices"][0]["message"]["content"]


def chat_anthropic(api_key: str, model: str, user: str) -> str:
    url = "https://api.anthropic.com/v1/messages"
    payload = {
        "model": model,
        "max_tokens": 4096,
        "temperature": 0.2,
        "system": SYSTEM,
        "messages": [{"role": "user", "content": user}],
    }
    headers = {
        "Content-Type": "application/json",
        "x-api-key": api_key,
        "anthropic-version": "2023-06-01",
    }
    out = http_json(url, payload, headers)
    parts = out.get("content") or []
    return "".join(p.get("text", "") for p in parts if p.get("type") == "text")


def chat_ollama(model: str, user: str, host: str) -> str:
    url = host.rstrip("/") + "/api/chat"
    payload = {
        "model": model,
        "stream": False,
        "format": "json",
        "messages": [
            {"role": "system", "content": SYSTEM},
            {"role": "user", "content": user},
        ],
        "options": {"temperature": 0.2},
    }
    out = http_json(url, payload, {"Content-Type": "application/json"})
    return out.get("message", {}).get("content", "")


def parse_json_object(raw: str) -> dict[str, str]:
    raw = raw.strip()
    if raw.startswith("```"):
        raw = re.sub(r"^```(?:json)?\s*", "", raw)
        raw = re.sub(r"\s*```$", "", raw)
    data = json.loads(raw)
    if not isinstance(data, dict):
        raise ValueError("LLM did not return a JSON object")
    return {str(k): str(v) for k, v in data.items()}


def build_user_prompt(batch: list[Entry]) -> str:
    items = [
        {"key": e.key, "en": e.en, "th": e.th}
        for e in batch
    ]
    return (
        "Translate these ResilNet UI strings to S'gaw Karen.\n"
        "Return JSON object mapping each key to the Karen string only.\n\n"
        + json.dumps(items, ensure_ascii=False, indent=2)
    )


def resolve_backend(args: argparse.Namespace):
    provider = (args.provider or "").lower().strip()
    if provider == "openai" or (not provider and os.getenv("OPENAI_API_KEY")):
        key = os.getenv("OPENAI_API_KEY", "")
        base = os.getenv("OPENAI_BASE_URL", "https://api.openai.com/v1")
        model = args.model or os.getenv("OPENAI_MODEL", "gpt-4o-mini")
        return ("openai", key, base, model)
    if provider == "openrouter" or (not provider and os.getenv("OPENROUTER_API_KEY")):
        key = os.getenv("OPENROUTER_API_KEY", "")
        base = "https://openrouter.ai/api/v1"
        model = args.model or os.getenv(
            "OPENROUTER_MODEL", "openai/gpt-4o-mini"
        )
        return ("openai", key, base, model)
    if provider == "anthropic" or (not provider and os.getenv("ANTHROPIC_API_KEY")):
        key = os.getenv("ANTHROPIC_API_KEY", "")
        model = args.model or os.getenv("ANTHROPIC_MODEL", "claude-3-5-haiku-latest")
        return ("anthropic", key, "", model)
    if provider == "ollama" or not provider:
        model = args.ollama_model or os.getenv("OLLAMA_MODEL", "qwen2.5:7b")
        host = args.ollama_host or os.getenv("OLLAMA_HOST", "http://127.0.0.1:11434")
        return ("ollama", "", host, model)
    raise SystemExit(f"Unknown provider: {provider}")


def translate_batch(backend, batch: list[Entry]) -> dict[str, str]:
    kind, key, base_or_host, model = backend
    user = build_user_prompt(batch)
    if kind == "openai":
        if not key:
            raise SystemExit("Missing OPENAI_API_KEY / OPENROUTER_API_KEY")
        raw = chat_openai_compatible(base_or_host, key, model, user)
    elif kind == "anthropic":
        if not key:
            raise SystemExit("Missing ANTHROPIC_API_KEY")
        raw = chat_anthropic(key, model, user)
    else:
        raw = chat_ollama(model, user, base_or_host)
    return parse_json_object(raw)


def apply_sheet_to_arb(entries: list[Entry], strip_draft_tag: bool) -> int:
    if not ARB.is_file():
        raise SystemExit(f"Missing {ARB}")
    data = json.loads(ARB.read_text(encoding="utf-8"))
    en = json.loads(EN_ARB.read_text(encoding="utf-8"))
    applied = 0
    for e in entries:
        val = e.ksw.strip()
        if not val:
            continue
        if strip_draft_tag and val.startswith("[DRAFT]"):
            val = val[len("[DRAFT]") :].strip()
        # Skip pure English copies unless marked draft (still useful as interim).
        en_val = en.get(e.key)
        if val == en_val and not e.ksw.startswith("[DRAFT]"):
            continue
        data[e.key] = val
        applied += 1
    data["@@locale"] = "ksw"
    ARB.write_text(
        json.dumps(data, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
    )
    return applied


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--sheet", type=Path, default=SHEET)
    ap.add_argument("--batch", type=int, default=12, help="Strings per LLM call")
    ap.add_argument("--limit", type=int, default=0, help="Max empty items (0=all)")
    ap.add_argument("--sleep", type=float, default=0.8)
    ap.add_argument("--provider", default="", help="openai|openrouter|anthropic|ollama")
    ap.add_argument("--model", default="")
    ap.add_argument("--ollama-model", default="")
    ap.add_argument("--ollama-host", default="")
    ap.add_argument(
        "--only-empty",
        action="store_true",
        default=True,
        help="Only fill blank KSW lines (default)",
    )
    ap.add_argument(
        "--refill-drafts",
        action="store_true",
        help="Also re-translate lines that still start with [DRAFT]",
    )
    ap.add_argument(
        "--apply-arb",
        action="store_true",
        help="After drafting, also write values into app_ksw.arb",
    )
    ap.add_argument(
        "--apply-arb-only",
        action="store_true",
        help="Only sync current sheet → app_ksw.arb (no LLM)",
    )
    ap.add_argument(
        "--strip-draft-tag",
        action="store_true",
        help="When applying ARB, remove leading [DRAFT] tags",
    )
    args = ap.parse_args()

    if not args.sheet.is_file():
        raise SystemExit(f"Missing sheet: {args.sheet}")

    text, entries = load_sheet(args.sheet)
    if not entries:
        raise SystemExit("No entries parsed — check sheet format")

    if args.apply_arb_only:
        n = apply_sheet_to_arb(entries, strip_draft_tag=args.strip_draft_tag)
        print(f"Applied {n} strings → {ARB}")
        return 0

    def needs(e: Entry) -> bool:
        if not e.ksw.strip():
            return True
        if args.refill_drafts and e.ksw.startswith("[DRAFT]"):
            return True
        return False

    todo = [e for e in entries if needs(e)]
    if args.limit and args.limit > 0:
        todo = todo[: args.limit]

    if not todo:
        print("Nothing to draft (all KSW lines filled).")
        if args.apply_arb:
            n = apply_sheet_to_arb(entries, strip_draft_tag=args.strip_draft_tag)
            print(f"Applied {n} strings → {ARB}")
        return 0

    backend = resolve_backend(args)
    print(
        f"backend={backend[0]} model={backend[3]} "
        f"todo={len(todo)} batch={args.batch}",
        flush=True,
    )

    updates: dict[str, str] = {}
    for i in range(0, len(todo), args.batch):
        batch = todo[i : i + args.batch]
        print(
            f"… {i + 1}-{i + len(batch)}/{len(todo)} "
            f"({batch[0].key} …)",
            flush=True,
        )
        try:
            got = translate_batch(backend, batch)
        except Exception as exc:  # noqa: BLE001
            print(f"  ERROR: {exc}", file=sys.stderr, flush=True)
            break
        for e in batch:
            val = (got.get(e.key) or "").strip()
            if not val:
                print(f"  missing key in LLM output: {e.key}", flush=True)
                continue
            updates[e.key] = val
        # Persist after each batch (reload sheet so prior drafts stay).
        _, entries = load_sheet(args.sheet)
        new_text = write_ksw_values(
            args.sheet.read_text(encoding="utf-8"),
            entries,
            updates,
        )
        args.sheet.write_text(new_text, encoding="utf-8")
        time.sleep(args.sleep)

    print(f"Drafted {len(updates)} strings → {args.sheet}", flush=True)

    if args.apply_arb:
        text, entries = load_sheet(args.sheet)
        n = apply_sheet_to_arb(entries, strip_draft_tag=args.strip_draft_tag)
        print(f"Applied {n} strings → {ARB}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())

#!/usr/bin/env python3
"""Sync + draft-translate Flutter ARB files from app_en.arb.

Usage:
  python3 tool/sync_l10n_arbs.py                 # sync keys only (fill missing with EN)
  python3 tool/sync_l10n_arbs.py --translate     # machine-translate EN fills
  python3 tool/sync_l10n_arbs.py --translate --only ja,ko,vi
  python3 tool/sync_l10n_arbs.py --translate --force --clear-cache --workers 12
"""

from __future__ import annotations

import argparse
import json
import re
import sys
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
L10N = ROOT / "lib" / "l10n"
EN_ARB = L10N / "app_en.arb"
CACHE = ROOT / "tool" / ".l10n_translate_cache.json"

# ~37 locales including en/th. Flutter ARB file suffix → @@locale value.
LOCALES: list[tuple[str, str]] = [
    ("en", "en"),
    ("th", "th"),
    ("zh", "zh"),
    ("zh_TW", "zh_TW"),
    ("ja", "ja"),
    ("ko", "ko"),
    ("id", "id"),
    ("vi", "vi"),
    ("ms", "ms"),
    ("my", "my"),
    ("ksw", "ksw"),  # S'gaw Karen (กะเหรี่ยงสกอว์)
    ("hi", "hi"),
    ("bn", "bn"),
    ("ta", "ta"),
    ("te", "te"),
    ("mr", "mr"),
    ("gu", "gu"),
    ("kn", "kn"),
    ("ml", "ml"),
    ("pa", "pa"),
    ("ur", "ur"),
    ("ar", "ar"),
    ("fa", "fa"),
    ("he", "he"),
    ("tr", "tr"),
    ("ru", "ru"),
    ("uk", "uk"),
    ("pl", "pl"),
    ("de", "de"),
    ("fr", "fr"),
    ("es", "es"),
    ("pt", "pt"),
    ("it", "it"),
    ("nl", "nl"),
    ("sv", "sv"),
    ("fi", "fi"),
    ("cs", "cs"),
]

# Google gtx language codes (may differ from Flutter locale).
GOOGLE_LANG = {
    "zh": "zh-CN",
    "zh_TW": "zh-TW",
    "ksw": "sgaw",  # best-effort; MT quality for Karen is limited
}

# MyMemory requires regional codes.
MYMEMORY_LANG = {
    "en": "en-US",
    "th": "th-TH",
    "zh": "zh-CN",
    "zh_TW": "zh-TW",
    "ja": "ja-JP",
    "ko": "ko-KR",
    "id": "id-ID",
    "vi": "vi-VN",
    "ms": "ms-MY",
    "my": "my-MM",
    "hi": "hi-IN",
    "bn": "bn-IN",
    "ta": "ta-IN",
    "te": "te-IN",
    "mr": "mr-IN",
    "gu": "gu-IN",
    "kn": "kn-IN",
    "ml": "ml-IN",
    "pa": "pa-IN",
    "ur": "ur-PK",
    "ar": "ar-SA",
    "fa": "fa-IR",
    "he": "he-IL",
    "tr": "tr-TR",
    "ru": "ru-RU",
    "uk": "uk-UA",
    "pl": "pl-PL",
    "de": "de-DE",
    "fr": "fr-FR",
    "es": "es-ES",
    "pt": "pt-BR",
    "it": "it-IT",
    "nl": "nl-NL",
    "sv": "sv-SE",
    "fi": "fi-FI",
    "cs": "cs-CZ",
}

PROTECT_TOKENS = [
    "ResilNet",
    "Meshtastic",
    "Nostr",
    "LXMF",
    "LoRa",
    "BLE",
    "GATT",
    "ESP32",
    "Heltec",
    "RNLB",
    "SoftAP",
    "Wi‑Fi",
    "Wi-Fi",
    "MQTT",
]

_PLACEHOLDER_RE = re.compile(r"\{([a-zA-Z_][a-zA-Z0-9_]*)\}")


def load_arb(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def dump_arb(path: Path, data: dict) -> None:
    path.write_text(
        json.dumps(data, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )


def message_keys(en: dict) -> list[str]:
    return [k for k in en.keys() if not k.startswith("@") and k != "@@locale"]


def protect(text: str) -> tuple[str, list[str]]:
    bag: list[str] = []

    def hold(s: str) -> str:
        i = len(bag)
        bag.append(s)
        # Markers that MT engines usually leave intact (avoid <x0/> → <x0/}).
        return f"⟦{i}⟧"

    out = text
    for tok in PROTECT_TOKENS:
        if tok in out:
            out = out.replace(tok, hold(tok))

    def ph(m: re.Match[str]) -> str:
        return hold(m.group(0))

    out = _PLACEHOLDER_RE.sub(ph, out)
    return out, bag


def restore(text: str, bag: list[str]) -> str:
    out = text
    for i, s in enumerate(bag):
        for marker in (
            f"⟦{i}⟧",
            f"[[{i}]]",
            f"<x{i}/>",
            f"<x{i}>",
            f"</x{i}>",
            "<x%d/}" % i,
        ):
            if marker in out:
                out = out.replace(marker, s)
    return out


def translate_one(locale: str, text: str, retries: int = 3) -> str:
    """Translate a single string. Thread-safe; hard HTTP timeouts."""
    import requests

    if not text.strip() or text in PROTECT_TOKENS:
        return text

    protected, bag = protect(text)
    gcode = GOOGLE_LANG.get(locale, locale)
    mm_tgt = MYMEMORY_LANG.get(locale)
    last_err: Exception | None = None

    for attempt in range(retries):
        # Official-ish gtx endpoint — respects requests timeout (unlike some scrapers).
        try:
            r = requests.get(
                "https://translate.googleapis.com/translate_a/single",
                params={
                    "client": "gtx",
                    "sl": "en",
                    "tl": gcode,
                    "dt": "t",
                    "q": protected,
                },
                timeout=12,
            )
            r.raise_for_status()
            data = r.json()
            if isinstance(data, list) and data and data[0]:
                out = "".join(part[0] for part in data[0] if part and part[0])
                if out.strip():
                    return restore(out, bag)
        except Exception as exc:  # noqa: BLE001
            last_err = exc

        if mm_tgt:
            try:
                r = requests.get(
                    "https://api.mymemory.translated.net/get",
                    params={"q": protected, "langpair": f"en-US|{mm_tgt}"},
                    timeout=12,
                )
                r.raise_for_status()
                payload = r.json()
                out = (payload.get("responseData") or {}).get("translatedText") or ""
                if out.strip() and "MYMEMORY WARNING" not in out.upper():
                    return restore(out, bag)
            except Exception as exc:  # noqa: BLE001
                last_err = exc

        time.sleep(0.35 * (attempt + 1))

    if last_err:
        print(f"  translate error: {last_err}", file=sys.stderr, flush=True)
    return text


def translate_pending(
    locale: str,
    suffix: str,
    pending: list[tuple[str, str]],
    data: dict,
    cache: dict,
    workers: int,
) -> tuple[int, int]:
    """Translate pending (key, en_val) pairs; mutate data+cache. Return done, failed."""
    done = 0
    failed = 0
    chunk_size = max(workers * 2, 16)
    for i in range(0, len(pending), chunk_size):
        chunk = pending[i : i + chunk_size]
        pool = ThreadPoolExecutor(max_workers=max(1, workers))
        futs = {
            pool.submit(translate_one, locale, en_val): (k, en_val)
            for k, en_val in chunk
        }
        finished: set = set()
        try:
            for fut in as_completed(futs, timeout=max(90, 12 * len(chunk))):
                finished.add(fut)
                k, en_val = futs[fut]
                try:
                    out = fut.result(timeout=12)
                except Exception as exc:  # noqa: BLE001
                    print(f"  fail {k}: {exc}", file=sys.stderr, flush=True)
                    out = en_val
                data[k] = out
                if out != en_val:
                    cache[f"{locale}|{en_val}"] = out
                else:
                    failed += 1
                done += 1
        except TimeoutError:
            print(
                f"  chunk timeout at "
                f"{min(i + chunk_size, len(pending))}/{len(pending)}",
                flush=True,
            )
        for fut, (k, en_val) in futs.items():
            if fut in finished:
                continue
            fut.cancel()
            # Keep existing value if somehow set; otherwise leave EN.
            if needs_translate(en_val, str(data.get(k, en_val)), locale):
                data[k] = en_val
                failed += 1
                done += 1
        pool.shutdown(wait=False, cancel_futures=True)

        print(
            f"  … {done}/{len(pending)} (failed_as_en={failed})",
            flush=True,
        )
        save_cache(cache)
        dump_arb(L10N / f"app_{suffix}.arb", data)
    return done, failed


def sync_locale(en: dict, suffix: str, locale: str) -> dict:
    path = L10N / f"app_{suffix}.arb"
    existing: dict = {}
    if path.is_file():
        try:
            existing = load_arb(path)
        except json.JSONDecodeError:
            existing = {}

    out: dict = {"@@locale": locale}
    for k in en:
        if k == "@@locale":
            continue
        if k.startswith("@"):
            out[k] = en[k]
            continue
        if k in existing and isinstance(existing[k], str) and existing[k].strip():
            out[k] = existing[k]
        else:
            out[k] = en[k]
    return out


def needs_translate(en_val: str, cur: str, locale: str) -> bool:
    if locale == "en":
        return False
    return cur == en_val


def save_cache(cache: dict) -> None:
    CACHE.parent.mkdir(parents=True, exist_ok=True)
    CACHE.write_text(json.dumps(cache, ensure_ascii=False), encoding="utf-8")


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--translate", action="store_true")
    ap.add_argument(
        "--force",
        action="store_true",
        help="Re-translate non-th locales even if already filled",
    )
    ap.add_argument("--only", default="", help="Comma suffixes e.g. ja,ko,vi")
    ap.add_argument("--clear-cache", action="store_true")
    ap.add_argument("--workers", type=int, default=10)
    args = ap.parse_args()

    if args.clear_cache and CACHE.is_file():
        CACHE.unlink()
        print("cache cleared", flush=True)

    en = load_arb(EN_ARB)
    only = {x.strip() for x in args.only.split(",") if x.strip()}

    cache: dict = {}
    if CACHE.is_file():
        try:
            cache = json.loads(CACHE.read_text(encoding="utf-8"))
        except json.JSONDecodeError:
            cache = {}

    if args.translate:
        try:
            import requests  # noqa: F401
        except ImportError:
            print("Installing requests…", flush=True)
            import subprocess

            subprocess.check_call(
                [sys.executable, "-m", "pip", "install", "requests", "-q"]
            )

    for suffix, locale in LOCALES:
        if only and suffix not in only:
            continue
        print(f"== {suffix} ({locale}) ==", flush=True)
        data = sync_locale(en, suffix, locale)

        if args.translate and locale != "en":
            keys = message_keys(en)
            jobs: list[tuple[str, str]] = []
            for k in keys:
                en_val = en[k]
                if not isinstance(en_val, str):
                    continue
                cur = data.get(k, en_val)
                cur_s = cur if isinstance(cur, str) else ""
                # Never overwrite curated Thai that already differs from EN.
                if locale == "th" and cur_s != en_val:
                    continue
                if args.force and locale != "th":
                    jobs.append((k, en_val))
                elif needs_translate(en_val, cur_s, locale):
                    jobs.append((k, en_val))

            pending: list[tuple[str, str]] = []
            applied = 0
            for k, en_val in jobs:
                ck = f"{locale}|{en_val}"
                hit = cache.get(ck)
                if (
                    not args.force
                    and isinstance(hit, str)
                    and hit.strip()
                    and hit != en_val
                ):
                    data[k] = hit
                    applied += 1
                else:
                    pending.append((k, en_val))

            print(
                f"  jobs={len(jobs)} cache_hits={applied} pending={len(pending)}",
                flush=True,
            )

            done, failed = translate_pending(
                locale, suffix, pending, data, cache, args.workers
            )
            print(
                f"  translated {done} (failed_as_en={failed}) cache_hits={applied}",
                flush=True,
            )
            save_cache(cache)

        dump_arb(L10N / f"app_{suffix}.arb", data)

    if args.translate:
        save_cache(cache)
        print(f"cache → {CACHE}", flush=True)

    print("done", flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

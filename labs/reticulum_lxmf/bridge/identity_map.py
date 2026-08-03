"""Manual ResilNet peerId ↔ LXMF destination hash mapping (lab stub)."""

from __future__ import annotations

import json
from pathlib import Path


def load_map(path: str | Path) -> dict:
    p = Path(path).expanduser().resolve()
    if not p.is_file():
        return {"version": 1, "entries": []}
    data = json.loads(p.read_text(encoding="utf-8"))
    if not isinstance(data, dict):
        raise ValueError("identity map must be a JSON object")
    data.setdefault("version", 1)
    data.setdefault("entries", [])
    return data


def save_map(path: str | Path, data: dict) -> None:
    p = Path(path).expanduser().resolve()
    p.parent.mkdir(parents=True, exist_ok=True)
    p.write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def lookup_lxmf_dest(data: dict, resilnet_peer_id: str) -> str | None:
    rid = resilnet_peer_id.strip()
    for e in data.get("entries", []):
        if (e.get("resilnet_peer_id") or "").strip() == rid:
            dest = (e.get("lxmf_destination") or "").strip()
            return dest or None
    return None


def lookup_peer_id(data: dict, lxmf_destination: str) -> str | None:
    dest = lxmf_destination.strip().lower()
    for e in data.get("entries", []):
        if (e.get("lxmf_destination") or "").strip().lower() == dest:
            rid = (e.get("resilnet_peer_id") or "").strip()
            return rid or None
    return None


def upsert_entry(
    data: dict,
    *,
    resilnet_peer_id: str,
    lxmf_destination: str,
    note: str = "",
) -> dict:
    rid = resilnet_peer_id.strip()
    dest = lxmf_destination.strip().lower()
    entries = list(data.get("entries", []))
    for e in entries:
        if (e.get("resilnet_peer_id") or "").strip() == rid:
            e["lxmf_destination"] = dest
            if note:
                e["note"] = note
            data["entries"] = entries
            return data
    entries.append(
        {
            "resilnet_peer_id": rid,
            "lxmf_destination": dest,
            "note": note,
        }
    )
    data["entries"] = entries
    return data

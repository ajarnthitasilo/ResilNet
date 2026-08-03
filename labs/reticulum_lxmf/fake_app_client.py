#!/usr/bin/env python3
"""Fake Flutter app client for the Mac LXMF bridge (lab only).

Builds a ChatMessage-shaped *sealed stub* (no real crypto, no Flutter imports),
POSTs it to a local bridge HTTP API, and can run an end-to-end demo B→A.

Examples:
  # Full demo (starts daemons + bridges A/B, send, assert inbox)
  .venv/bin/python fake_app_client.py demo

  # Against an already-running Bob bridge:
  .venv/bin/python fake_app_client.py send \\
      --bridge http://127.0.0.1:8766 \\
      --dest <alice_lxmf_hex> \\
      --to-peer-id alice_lab_peer_aaaaaaaa \\
      --from-peer-id bob_lab_peer_bbbbbbbb
"""

from __future__ import annotations

import argparse
import json
import os
import signal
import subprocess
import sys
import time
import urllib.error
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parent
DEFAULT_TO = "alice_lab_peer_aaaaaaaa"
DEFAULT_FROM = "bob_lab_peer_bbbbbbbb"


def make_sealed_stub(
    *,
    msg_id: str,
    sender_id: str,
    receiver_id: str,
    sender_name: str = "Bob Lab",
) -> bytes:
    """Opaque stand-in for sealed ChatMessage wire fields (content stripped).

    Mirrors keys from mobile_app ChatMessage.toMap / packet codec usage —
    encrypted* fields are fake hex, not real E2EE.
    """
    envelope = {
        "id": msg_id,
        "senderId": sender_id,
        "senderName": sender_name,
        "receiverId": receiver_id,
        # plaintext omitted on purpose (sealed path)
        "content": "",
        "encryptedPayload": "cafebabe" + ("00" * 24),
        "encryptedKey": "deadbeef" + ("11" * 12),
        "signature": "a" * 64,
        "type": "direct",
        "isBroadcast": 0,
        "payloadKind": "text",
        "ttl": 32,
        "timestamp": int(time.time() * 1000),
        "status": "pending",
    }
    return json.dumps(envelope, separators=(",", ":"), ensure_ascii=False).encode(
        "utf-8"
    )


def http_json(method: str, url: str, body: dict | None = None, timeout: float = 10.0):
    data = None
    headers = {"Accept": "application/json"}
    if body is not None:
        data = json.dumps(body).encode("utf-8")
        headers["Content-Type"] = "application/json"
    req = urllib.request.Request(url, data=data, headers=headers, method=method)
    try:
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            raw = resp.read().decode("utf-8")
            return resp.status, json.loads(raw) if raw else {}
    except urllib.error.HTTPError as e:
        raw = e.read().decode("utf-8", errors="replace")
        try:
            parsed = json.loads(raw) if raw else {}
        except json.JSONDecodeError:
            parsed = {"ok": False, "error": raw}
        return e.code, parsed


def wait_http(url: str, timeout_s: float = 15.0) -> dict:
    deadline = time.time() + timeout_s
    last_err = None
    while time.time() < deadline:
        try:
            code, data = http_json("GET", url)
            if code == 200 and data.get("ok"):
                return data
        except Exception as exc:  # noqa: BLE001
            last_err = exc
        time.sleep(0.25)
    raise SystemExit(f"HTTP not ready at {url}: {last_err}")


def cmd_pack(args: argparse.Namespace) -> int:
    sealed = make_sealed_stub(
        msg_id=args.msg_id,
        sender_id=args.from_peer_id,
        receiver_id=args.to_peer_id,
    )
    if args.out:
        Path(args.out).write_bytes(sealed)
        print(f"wrote sealed stub {len(sealed)} bytes -> {args.out}")
    print(sealed.hex())
    return 0


def cmd_send(args: argparse.Namespace) -> int:
    sealed = make_sealed_stub(
        msg_id=args.msg_id,
        sender_id=args.from_peer_id,
        receiver_id=args.to_peer_id,
    )
    body: dict = {
        "to_peer_id": args.to_peer_id,
        "from_peer_id": args.from_peer_id,
        "sealed_hex": sealed.hex(),
    }
    if args.dest:
        body["dest"] = args.dest.strip()
    url = args.bridge.rstrip("/") + "/send"
    code, data = http_json("POST", url, body)
    print(json.dumps(data, indent=2))
    if code != 200 or not data.get("ok"):
        return 1
    print(f"sealed_stub_len={len(sealed)}")
    return 0


def cmd_inbox(args: argparse.Namespace) -> int:
    code, data = http_json("GET", args.bridge.rstrip("/") + "/inbox")
    print(json.dumps(data, indent=2))
    return 0 if code == 200 else 1


def _popen_bridge(py: Path, *args: str, log: Path) -> subprocess.Popen:
    log.parent.mkdir(parents=True, exist_ok=True)
    f = log.open("w", encoding="utf-8")
    return subprocess.Popen(
        [str(py), "-u", "-m", "bridge", "listen", *args],
        cwd=str(ROOT),
        stdout=f,
        stderr=subprocess.STDOUT,
        start_new_session=True,
    )


def cmd_demo(_args: argparse.Namespace) -> int:
    py = ROOT / ".venv" / "bin" / "python"
    if not py.is_file():
        raise SystemExit("Missing .venv — create and pip install -r requirements.txt")

    map_a = ROOT / "config" / "identity_map_a.json"
    map_b = ROOT / "config" / "identity_map_b.json"
    example = ROOT / "config" / "identity_map.example.json"
    for p in (map_a, map_b):
        p.write_text(example.read_text(encoding="utf-8"), encoding="utf-8")

    subprocess.run([str(ROOT / "stop_daemons.sh")], cwd=str(ROOT), check=False)
    subprocess.run([str(ROOT / "start_daemons.sh")], cwd=str(ROOT), check=True)
    time.sleep(1.0)

    (ROOT / "logs").mkdir(exist_ok=True)
    (ROOT / "inbox_a").mkdir(exist_ok=True)

    procs: list[subprocess.Popen] = []

    def cleanup() -> None:
        for p in procs:
            try:
                os.killpg(p.pid, signal.SIGTERM)
            except ProcessLookupError:
                pass
        subprocess.run([str(ROOT / "stop_daemons.sh")], cwd=str(ROOT), check=False)

    try:
        print("== bridge A :8765 ==")
        procs.append(
            _popen_bridge(
                py,
                "--config",
                "config/a",
                "--name",
                "bridge-a",
                "--http-port",
                "8765",
                "--identity-map",
                str(map_a),
                "--inbox-dir",
                str(ROOT / "inbox_a"),
                "--self-peer-id",
                DEFAULT_TO,
                log=ROOT / "logs" / "fake_bridge_a.log",
            )
        )
        print("== bridge B :8766 (app-facing) ==")
        procs.append(
            _popen_bridge(
                py,
                "--config",
                "config/b",
                "--name",
                "bridge-b",
                "--http-port",
                "8766",
                "--identity-map",
                str(map_b),
                "--self-peer-id",
                DEFAULT_FROM,
                log=ROOT / "logs" / "fake_bridge_b.log",
            )
        )

        status_a = wait_http("http://127.0.0.1:8765/status")
        status_b = wait_http("http://127.0.0.1:8766/status")
        dest_a = status_a["lxmf_destination"]
        print(f"A lxmf_destination={dest_a}")
        print(f"B lxmf_destination={status_b['lxmf_destination']}")

        # Bob's map needs Alice dest for to_peer_id lookups (send also passes dest).
        from bridge import identity_map as idmap

        data = idmap.load_map(map_b)
        idmap.upsert_entry(
            data,
            resilnet_peer_id=DEFAULT_TO,
            lxmf_destination=dest_a,
            note="fake_app demo A",
        )
        idmap.save_map(map_b, data)

        time.sleep(2.0)

        print("== fake app POST /send on B ==")
        sealed = make_sealed_stub(
            msg_id="fake-app-m1",
            sender_id=DEFAULT_FROM,
            receiver_id=DEFAULT_TO,
        )
        code, send_resp = http_json(
            "POST",
            "http://127.0.0.1:8766/send",
            {
                "dest": dest_a,
                "to_peer_id": DEFAULT_TO,
                "from_peer_id": DEFAULT_FROM,
                "sealed_hex": sealed.hex(),
            },
            timeout=60.0,
        )
        print(json.dumps(send_resp, indent=2))
        if code != 200 or not send_resp.get("ok"):
            raise SystemExit(f"send failed: HTTP {code}")

        # Poll Alice inbox
        item = None
        for _ in range(40):
            _, inbox = http_json("GET", "http://127.0.0.1:8765/inbox")
            items = inbox.get("items") or []
            if items:
                item = items[-1]
                break
            time.sleep(0.25)
        if not item:
            raise SystemExit("inbox empty — delivery failed")

        blob = item.get("blob") or {}
        sealed_hex = blob.get("sealed_hex") or ""
        print("inbox last:")
        print(
            json.dumps(
                {
                    "bytes": item.get("bytes"),
                    "to_peer_id": blob.get("to_peer_id"),
                    "from_peer_id": blob.get("from_peer_id"),
                    "sealed_len": blob.get("sealed_len"),
                    "sealed_hex_preview": blob.get("sealed_hex_preview"),
                },
                indent=2,
            )
        )
        assert blob.get("to_peer_id") == DEFAULT_TO
        assert blob.get("from_peer_id") == DEFAULT_FROM
        assert sealed_hex == sealed.hex(), "sealed bytes mismatch"
        print(f"sealed_stub_len={len(sealed)} roundtrip_ok")
        print("FAKE_APP_DEMO_OK")
        return 0
    finally:
        cleanup()


def main() -> int:
    ap = argparse.ArgumentParser(description="Fake ResilNet app → LXMF bridge client")
    sub = ap.add_subparsers(dest="cmd", required=True)

    p_pack = sub.add_parser("pack", help="Print sealed stub hex")
    p_pack.add_argument("--to-peer-id", default=DEFAULT_TO)
    p_pack.add_argument("--from-peer-id", default=DEFAULT_FROM)
    p_pack.add_argument("--msg-id", default="fake-app-m1")
    p_pack.add_argument("--out", help="Optional path to write raw sealed bytes")

    p_send = sub.add_parser("send", help="POST sealed stub to bridge /send")
    p_send.add_argument("--bridge", default="http://127.0.0.1:8766")
    p_send.add_argument("--dest", default=None, help="Alice LXMF dest hex")
    p_send.add_argument("--to-peer-id", default=DEFAULT_TO)
    p_send.add_argument("--from-peer-id", default=DEFAULT_FROM)
    p_send.add_argument("--msg-id", default="fake-app-m1")

    p_inbox = sub.add_parser("inbox", help="GET bridge /inbox")
    p_inbox.add_argument("--bridge", default="http://127.0.0.1:8765")

    sub.add_parser("demo", help="E2E: daemons + A/B bridges + HTTP send + assert")

    args = ap.parse_args()
    if args.cmd == "pack":
        return cmd_pack(args)
    if args.cmd == "send":
        return cmd_send(args)
    if args.cmd == "inbox":
        return cmd_inbox(args)
    if args.cmd == "demo":
        return cmd_demo(args)
    raise SystemExit(f"unknown cmd {args.cmd}")


if __name__ == "__main__":
    os.environ.setdefault("PYTHONUNBUFFERED", "1")
    # Ensure lab root is on path for `bridge` imports inside demo
    if str(ROOT) not in sys.path:
        sys.path.insert(0, str(ROOT))
    raise SystemExit(main())

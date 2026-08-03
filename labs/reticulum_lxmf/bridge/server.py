"""Thin Mac/desktop LXMF bridge: listen + localhost HTTP + CLI send.

Does not call Flutter. Simulate the app with curl / CLI and opaque sealed stubs.
"""

from __future__ import annotations

import argparse
import json
import threading
import time
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from typing import Any
from urllib.parse import urlparse

import RNS

from bridge.blob import (
    LXMF_TITLE,
    decode_blob,
    encode_blob,
    looks_like_blob,
)
from bridge import identity_map as idmap
from bridge.node import attach_lxmf, config_dir, send_bytes

# Process-local inbox of delivered blobs (newest last).
_INBOX: list[dict[str, Any]] = []
_INBOX_LOCK = threading.Lock()
_STATE: dict[str, Any] = {}


def _preview_hex(data: bytes, n: int = 64) -> str:
    h = data[:n].hex()
    return h + ("…" if len(data) > n else "")


def _on_delivery(message) -> None:
    title = message.title_as_string() if hasattr(message, "title_as_string") else ""
    raw = message.content if isinstance(message.content, (bytes, bytearray)) else b""
    src = RNS.prettyhexrep(message.source_hash) if message.source_hash else "?"
    entry: dict[str, Any] = {
        "ts": time.time(),
        "source": src,
        "title": title,
        "bytes": len(raw),
        "hex_preview": _preview_hex(bytes(raw)),
        "hex": bytes(raw).hex(),
    }
    if looks_like_blob(bytes(raw)):
        try:
            blob = decode_blob(bytes(raw))
            entry["blob"] = {
                "version": blob.version,
                "to_peer_id": blob.to_peer_id,
                "from_peer_id": blob.from_peer_id,
                "sealed_len": len(blob.sealed),
                "sealed_hex_preview": _preview_hex(blob.sealed),
                "sealed_hex": blob.sealed.hex(),
            }
            RNS.log("=" * 60, RNS.LOG_INFO)
            RNS.log(f"RNLB DELIVERED from {src}", RNS.LOG_INFO)
            RNS.log(f"  to={blob.to_peer_id} from={blob.from_peer_id}", RNS.LOG_INFO)
            RNS.log(
                f"  sealed={len(blob.sealed)}B hex={_preview_hex(blob.sealed)}",
                RNS.LOG_INFO,
            )
            RNS.log("=" * 60, RNS.LOG_INFO)
        except Exception as exc:  # noqa: BLE001 — lab logging
            entry["blob_error"] = str(exc)
            RNS.log(f"RNLB parse failed: {exc}", RNS.LOG_ERROR)
    else:
        RNS.log(f"LXMF DELIVERED (non-RNLB) from {src} bytes={len(raw)}", RNS.LOG_INFO)

    with _INBOX_LOCK:
        _INBOX.append(entry)
        if len(_INBOX) > 200:
            del _INBOX[:-100]

    inbox_dir = _STATE.get("inbox_dir")
    if inbox_dir:
        path = Path(inbox_dir)
        path.mkdir(parents=True, exist_ok=True)
        stamp = int(time.time() * 1000)
        (path / f"{stamp}.bin").write_bytes(bytes(raw))
        (path / f"{stamp}.json").write_text(
            json.dumps(entry, indent=2) + "\n", encoding="utf-8"
        )


def _json_response(handler: BaseHTTPRequestHandler, code: int, obj: Any) -> None:
    body = json.dumps(obj, indent=2).encode("utf-8")
    handler.send_response(code)
    handler.send_header("Content-Type", "application/json")
    handler.send_header("Content-Length", str(len(body)))
    handler.end_headers()
    handler.wfile.write(body)


def _read_json(handler: BaseHTTPRequestHandler) -> dict:
    length = int(handler.headers.get("Content-Length") or "0")
    raw = handler.rfile.read(length) if length else b"{}"
    if not raw:
        return {}
    data = json.loads(raw.decode("utf-8"))
    if not isinstance(data, dict):
        raise ValueError("JSON body must be an object")
    return data


class BridgeHandler(BaseHTTPRequestHandler):
    def log_message(self, fmt: str, *args) -> None:  # quieter than default
        RNS.log(f"HTTP {self.address_string()} {fmt % args}", RNS.LOG_DEBUG)

    def do_GET(self) -> None:  # noqa: N802
        path = urlparse(self.path).path
        if path in ("/", "/status"):
            _json_response(
                self,
                200,
                {
                    "ok": True,
                    "name": _STATE.get("name"),
                    "config": _STATE.get("config"),
                    "lxmf_destination": _STATE.get("dest_hex"),
                    "http": _STATE.get("http"),
                    "inbox_count": len(_INBOX),
                },
            )
            return
        if path == "/inbox":
            with _INBOX_LOCK:
                items = list(_INBOX)
            _json_response(self, 200, {"ok": True, "items": items})
            return
        if path == "/identity_map":
            data = idmap.load_map(_STATE["identity_map_path"])
            _json_response(self, 200, data)
            return
        _json_response(self, 404, {"ok": False, "error": "not found"})

    def do_POST(self) -> None:  # noqa: N802
        path = urlparse(self.path).path
        try:
            body = _read_json(self)
        except Exception as exc:  # noqa: BLE001
            _json_response(self, 400, {"ok": False, "error": str(exc)})
            return

        if path == "/announce":
            source = _STATE["source"]
            source.announce()
            _json_response(
                self,
                200,
                {"ok": True, "lxmf_destination": _STATE["dest_hex"], "announced": True},
            )
            return

        if path == "/send":
            try:
                dest = (body.get("dest") or body.get("lxmf_destination") or "").strip()
                peer = (body.get("to_peer_id") or "").strip()
                if not dest and peer:
                    m = idmap.load_map(_STATE["identity_map_path"])
                    dest = idmap.lookup_lxmf_dest(m, peer) or ""
                if not dest:
                    raise ValueError("need dest (lxmf hash) or to_peer_id in identity map")

                if "blob_hex" in body and body["blob_hex"]:
                    content = bytes.fromhex(body["blob_hex"].strip())
                elif "sealed_hex" in body and body["sealed_hex"] is not None:
                    sealed = bytes.fromhex(str(body["sealed_hex"]).strip())
                    to_id = peer or body.get("receiver_id") or "unknown"
                    content = encode_blob(
                        to_peer_id=str(to_id),
                        sealed=sealed,
                        from_peer_id=body.get("from_peer_id"),
                    )
                else:
                    raise ValueError("need blob_hex or sealed_hex")

                title = body.get("title") or LXMF_TITLE
                send_bytes(
                    router=_STATE["router"],
                    source=_STATE["source"],
                    dest_hash_hex=dest,
                    content=content,
                    title=title,
                )
                _json_response(
                    self,
                    200,
                    {
                        "ok": True,
                        "dest": dest,
                        "bytes": len(content),
                        "hex_preview": _preview_hex(content),
                    },
                )
            except Exception as exc:  # noqa: BLE001
                _json_response(self, 400, {"ok": False, "error": str(exc)})
            return

        _json_response(self, 404, {"ok": False, "error": "not found"})


def run_listen_forever(
    *,
    config: str,
    name: str,
    http_host: str,
    http_port: int,
    identity_map_path: str,
    inbox_dir: str | None,
    self_peer_id: str | None,
) -> int:
    configdir = config_dir(config)
    map_path = Path(identity_map_path).expanduser().resolve()
    if not map_path.is_file():
        idmap.save_map(
            map_path,
            {
                "version": 1,
                "entries": [],
                "notes": (
                    "Manual ResilNet peerId ↔ LXMF destination hash. "
                    "Not auto-synced with the Flutter app."
                ),
            },
        )

    _, router, source, dest_hex = attach_lxmf(
        configdir=configdir, name=name, on_delivery=_on_delivery
    )
    source.announce()
    print(f"bridge={name}")
    print(f"config={configdir}")
    print(f"lxmf_destination={dest_hex}")
    print(f"identity_map={map_path}")

    if self_peer_id:
        data = idmap.load_map(map_path)
        idmap.upsert_entry(
            data,
            resilnet_peer_id=self_peer_id,
            lxmf_destination=dest_hex,
            note=f"bridge {name}",
        )
        idmap.save_map(map_path, data)
        print(f"mapped {self_peer_id} -> {dest_hex}")

    _STATE.update(
        {
            "name": name,
            "config": configdir,
            "dest_hex": dest_hex,
            "router": router,
            "source": source,
            "identity_map_path": str(map_path),
            "inbox_dir": inbox_dir,
            "http": f"http://{http_host}:{http_port}",
        }
    )

    httpd = ThreadingHTTPServer((http_host, http_port), BridgeHandler)

    def _serve() -> None:
        httpd.serve_forever(poll_interval=0.5)

    t = threading.Thread(target=_serve, daemon=True)
    t.start()
    print(f"http={_STATE['http']}")
    print("GET  /status  /inbox  /identity_map")
    print("POST /announce  /send")
    print("Listening (Ctrl+C to stop)…")
    try:
        while True:
            time.sleep(30)
            source.announce()
    except KeyboardInterrupt:
        print("\nStopped.")
        httpd.shutdown()
        return 0


def cmd_send(args: argparse.Namespace) -> int:
    configdir = config_dir(args.config)
    map_path = Path(args.identity_map).expanduser().resolve()

    dest = (args.dest or "").strip()
    if not dest and args.to_peer_id:
        dest = idmap.lookup_lxmf_dest(idmap.load_map(map_path), args.to_peer_id) or ""
    if not dest:
        raise SystemExit("Need --dest or --to-peer-id present in identity map")

    if args.blob_hex:
        content = bytes.fromhex(args.blob_hex.strip())
    elif args.blob_file:
        content = Path(args.blob_file).read_bytes()
    elif args.sealed_hex is not None:
        sealed = bytes.fromhex(args.sealed_hex.strip())
        content = encode_blob(
            to_peer_id=args.to_peer_id or args.receiver_id or "unknown",
            sealed=sealed,
            from_peer_id=args.from_peer_id,
        )
    elif args.sealed_file:
        sealed = Path(args.sealed_file).read_bytes()
        content = encode_blob(
            to_peer_id=args.to_peer_id or args.receiver_id or "unknown",
            sealed=sealed,
            from_peer_id=args.from_peer_id,
        )
    else:
        raise SystemExit("Need --blob-hex/--blob-file or --sealed-hex/--sealed-file")

    _, router, source, my_dest = attach_lxmf(
        configdir=configdir, name=args.name, on_delivery=None
    )
    source.announce()
    print(f"bridge={args.name}")
    print(f"lxmf_destination={my_dest}")
    print(f"sending {len(content)} bytes -> {dest}")
    send_bytes(
        router=router,
        source=source,
        dest_hash_hex=dest,
        content=content,
        title=args.title or LXMF_TITLE,
    )
    print("queued; waiting briefly for delivery…")
    time.sleep(args.wait)
    return 0


def cmd_pack(args: argparse.Namespace) -> int:
    if args.sealed_hex:
        sealed = bytes.fromhex(args.sealed_hex.strip())
    else:
        sealed = Path(args.sealed_file).read_bytes()
    blob = encode_blob(
        to_peer_id=args.to_peer_id,
        sealed=sealed,
        from_peer_id=args.from_peer_id,
    )
    if args.out:
        Path(args.out).write_bytes(blob)
        print(f"wrote {len(blob)} bytes -> {args.out}")
    else:
        print(blob.hex())
    return 0


def main() -> int:
    ap = argparse.ArgumentParser(description="ResilNet LXMF Mac bridge (lab spike)")
    sub = ap.add_subparsers(dest="cmd", required=True)

    p_listen = sub.add_parser("listen", help="Announce + HTTP API + inbox")
    p_listen.add_argument("--config", required=True)
    p_listen.add_argument("--name", default="bridge")
    p_listen.add_argument("--http-host", default="127.0.0.1")
    p_listen.add_argument("--http-port", type=int, default=8765)
    p_listen.add_argument(
        "--identity-map",
        default="config/identity_map.json",
        help="JSON peerId ↔ lxmf destination stub",
    )
    p_listen.add_argument(
        "--inbox-dir",
        default=None,
        help="Optional directory to dump received .bin/.json",
    )
    p_listen.add_argument(
        "--self-peer-id",
        default=None,
        help="If set, write this ResilNet peerId → our lxmf dest into identity map",
    )

    p_send = sub.add_parser("send", help="One-shot send opaque RNLB / raw blob")
    p_send.add_argument("--config", required=True)
    p_send.add_argument("--name", default="bridge-send")
    p_send.add_argument("--dest", help="LXMF destination hash hex")
    p_send.add_argument("--to-peer-id", help="Lookup dest via identity map")
    p_send.add_argument("--receiver-id", help="Alias for to-peer-id when packing sealed")
    p_send.add_argument("--from-peer-id", default=None)
    p_send.add_argument("--blob-hex")
    p_send.add_argument("--blob-file")
    p_send.add_argument("--sealed-hex", help="Opaque sealed bytes; wrapped as RNLB")
    p_send.add_argument("--sealed-file")
    p_send.add_argument("--title", default=LXMF_TITLE)
    p_send.add_argument(
        "--identity-map",
        default="config/identity_map.json",
    )
    p_send.add_argument("--wait", type=float, default=4.0)

    p_pack = sub.add_parser("pack", help="Encode RNLB blob to hex or file")
    p_pack.add_argument("--to-peer-id", required=True)
    p_pack.add_argument("--from-peer-id", default=None)
    p_pack.add_argument("--sealed-hex")
    p_pack.add_argument("--sealed-file")
    p_pack.add_argument("--out")

    args = ap.parse_args()
    if args.cmd == "listen":
        return run_listen_forever(
            config=args.config,
            name=args.name,
            http_host=args.http_host,
            http_port=args.http_port,
            identity_map_path=args.identity_map,
            inbox_dir=args.inbox_dir,
            self_peer_id=args.self_peer_id,
        )
    if args.cmd == "send":
        return cmd_send(args)
    if args.cmd == "pack":
        if not args.sealed_hex and not args.sealed_file:
            raise SystemExit("pack needs --sealed-hex or --sealed-file")
        return cmd_pack(args)
    raise SystemExit(f"unknown cmd {args.cmd}")


if __name__ == "__main__":
    # Allow `python -m bridge.server` from labs/reticulum_lxmf
    raise SystemExit(main())

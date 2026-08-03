#!/usr/bin/env python3
"""Minimal LXMF node for the ResilNet Reticulum lab.

Runs against an already-started ``rnsd --config <dir>`` shared instance.

Examples:
  # Terminal 3 — receive on node A
  .venv/bin/python lxmf_node.py --config config/a --name lab-a --listen

  # Terminal 4 — send from B to A's destination hash
  .venv/bin/python lxmf_node.py --config config/b --name lab-b \\
      --send-to <hash_hex> --text 'hello from B'

  # Opaque payload stub (future ResilNet sealed envelope bytes)
  .venv/bin/python lxmf_node.py --config config/b --name lab-b \\
      --send-to <hash_hex> --payload-hex deadbeef
"""

from __future__ import annotations

import argparse
import os
import sys
import time
from pathlib import Path

import LXMF
import RNS

APP = "resilnet-lab"


def _config_dir(path: str) -> str:
    p = Path(path).expanduser().resolve()
    if not (p / "config").is_file():
        raise SystemExit(f"Missing Reticulum config file: {p / 'config'}")
    return str(p)


def _identity_path(storage: Path) -> Path:
    return storage / "identity"


def _load_or_create_identity(storage: Path) -> RNS.Identity:
    storage.mkdir(parents=True, exist_ok=True)
    path = _identity_path(storage)
    if path.is_file():
        ident = RNS.Identity.from_file(str(path))
        RNS.log(f"Loaded identity from {path}", RNS.LOG_INFO)
        return ident
    ident = RNS.Identity()
    ident.to_file(str(path))
    RNS.log(f"Created new identity at {path}", RNS.LOG_INFO)
    return ident


def _on_delivery(message: LXMF.LXMessage) -> None:
    title = message.title_as_string() if hasattr(message, "title_as_string") else ""
    try:
        text = message.content_as_string()
    except Exception:
        text = None
    raw = message.content if isinstance(message.content, (bytes, bytearray)) else b""
    src = RNS.prettyhexrep(message.source_hash) if message.source_hash else "?"
    RNS.log("=" * 60, RNS.LOG_INFO)
    RNS.log(f"LXMF DELIVERED from {src}", RNS.LOG_INFO)
    if title:
        RNS.log(f"  title: {title}", RNS.LOG_INFO)
    if text is not None:
        RNS.log(f"  text:  {text}", RNS.LOG_INFO)
    RNS.log(f"  bytes: {len(raw)}  hex={raw[:64].hex()}{'…' if len(raw) > 64 else ''}", RNS.LOG_INFO)
    RNS.log("=" * 60, RNS.LOG_INFO)


def _wait_for_path(dest_hash: bytes, timeout_s: float = 20.0) -> bool:
    if RNS.Transport.has_path(dest_hash):
        return True
    RNS.Transport.request_path(dest_hash)
    deadline = time.time() + timeout_s
    while time.time() < deadline:
        if RNS.Transport.has_path(dest_hash):
            return True
        time.sleep(0.4)
    return RNS.Transport.has_path(dest_hash)


def main() -> int:
    ap = argparse.ArgumentParser(description="ResilNet LXMF lab node")
    ap.add_argument("--config", required=True, help="Reticulum config directory")
    ap.add_argument("--name", default="lab", help="LXMF display name")
    ap.add_argument("--listen", action="store_true", help="Announce and wait for messages")
    ap.add_argument("--send-to", help="Destination hash hex (lxmf delivery)")
    ap.add_argument("--text", default="", help="UTF-8 text content")
    ap.add_argument("--payload-hex", help="Opaque bytes as hex (overrides --text)")
    ap.add_argument("--payload-file", help="Opaque bytes from .bin file (overrides --text)")
    ap.add_argument("--title", default="resilnet-lab", help="LXMF title")
    args = ap.parse_args()

    configdir = _config_dir(args.config)
    storage = Path(configdir) / "lxmf_storage"
    storage.mkdir(parents=True, exist_ok=True)

    # Attach to the already-running rnsd shared instance for this configdir.
    # Without require_shared_instance=True, a second process can steal ports from rnsd.
    reticulum = RNS.Reticulum(configdir=configdir, require_shared_instance=True)
    if not reticulum.is_connected_to_shared_instance:
        raise SystemExit(
            f"Not connected to shared rnsd for {configdir}. "
            "Start daemons first: ./start_daemons.sh"
        )
    identity = _load_or_create_identity(storage)
    router = LXMF.LXMRouter(storagepath=str(storage))
    source = router.register_delivery_identity(identity, display_name=args.name)
    if source is None:
        raise SystemExit("Failed to register LXMF delivery identity")
    router.register_delivery_callback(_on_delivery)

    dest_hex = RNS.hexrep(source.hash, delimit=False)
    print(f"node={args.name}")
    print(f"config={configdir}")
    print(f"lxmf_destination={dest_hex}")
    print(f"reticulum_shared={reticulum.is_connected_to_shared_instance}")

    router.announce(source.hash)
    RNS.log(f"Announced LXMF destination {dest_hex}", RNS.LOG_INFO)

    if args.send_to:
        target = bytes.fromhex(args.send_to.strip())
        if len(target) != RNS.Reticulum.TRUNCATED_HASHLENGTH // 8:
            raise SystemExit(
                f"Invalid destination hash length {len(target)} "
                f"(want {RNS.Reticulum.TRUNCATED_HASHLENGTH // 8})"
            )
        if not _wait_for_path(target):
            raise SystemExit(
                "No path to destination — is the peer rnsd up and announced?"
            )
        recipient_identity = RNS.Identity.recall(target)
        if recipient_identity is None:
            # Path may exist before identity material; request again and wait.
            RNS.Transport.request_path(target)
            time.sleep(2.0)
            recipient_identity = RNS.Identity.recall(target)
        if recipient_identity is None:
            raise SystemExit(
                "Could not recall Identity for destination — "
                "ensure the peer called announce()"
            )
        dest = RNS.Destination(
            recipient_identity,
            RNS.Destination.OUT,
            RNS.Destination.SINGLE,
            "lxmf",
            "delivery",
        )
        if args.payload_hex:
            content = bytes.fromhex(args.payload_hex.strip())
        elif args.payload_file:
            content = Path(args.payload_file).read_bytes()
        else:
            content = args.text or "hello from resilnet reticulum lab"
        lxm = LXMF.LXMessage(
            dest,
            source,
            content,
            title=args.title,
            desired_method=LXMF.LXMessage.DIRECT,
            include_ticket=True,
        )
        router.handle_outbound(lxm)
        RNS.log("Outbound LXMF dispatched", RNS.LOG_INFO)
        # Allow link/delivery callbacks to finish.
        time.sleep(3.0)
        if not args.listen:
            return 0

    if args.listen or not args.send_to:
        print("Listening for LXMF… (Ctrl+C to stop)")
        try:
            while True:
                time.sleep(1.0)
        except KeyboardInterrupt:
            print("\nbye")
    return 0


if __name__ == "__main__":
    # Reduce noise slightly for lab demos.
    os.environ.setdefault("PYTHONUNBUFFERED", "1")
    sys.exit(main())

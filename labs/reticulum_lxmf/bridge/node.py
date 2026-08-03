"""Shared helpers to attach LXMF to an already-running rnsd."""

from __future__ import annotations

from pathlib import Path

import LXMF
import RNS


def config_dir(path: str) -> str:
    p = Path(path).expanduser().resolve()
    if not (p / "config").is_file():
        raise SystemExit(f"Missing Reticulum config file: {p / 'config'}")
    return str(p)


def load_or_create_identity(storage: Path) -> RNS.Identity:
    storage.mkdir(parents=True, exist_ok=True)
    path = storage / "identity"
    if path.is_file():
        return RNS.Identity.from_file(str(path))
    ident = RNS.Identity()
    ident.to_file(str(path))
    RNS.log(f"Created LXMF identity at {path}", RNS.LOG_INFO)
    return ident


def attach_lxmf(
    *,
    configdir: str,
    name: str,
    storage_subdir: str = "lxmf_storage",
    on_delivery=None,
):
    """Connect to shared rnsd and register an LXMF delivery identity."""
    reticulum = RNS.Reticulum(configdir=configdir, require_shared_instance=True)
    if not reticulum.is_connected_to_shared_instance:
        raise SystemExit(
            f"Not connected to shared rnsd for {configdir}. "
            "Start daemons first: ./start_daemons.sh"
        )
    storage = Path(configdir) / storage_subdir
    identity = load_or_create_identity(storage)
    router = LXMF.LXMRouter(storagepath=str(storage))
    source = router.register_delivery_identity(identity, display_name=name)
    if source is None:
        raise SystemExit("Failed to register LXMF delivery identity")
    if on_delivery is not None:
        router.register_delivery_callback(on_delivery)
    dest_hex = RNS.hexrep(source.hash, delimit=False)
    return reticulum, router, source, dest_hex


def wait_for_path(dest_hash: bytes, timeout_s: float = 25.0) -> bool:
    import time

    if RNS.Transport.has_path(dest_hash):
        return True
    RNS.Transport.request_path(dest_hash)
    deadline = time.time() + timeout_s
    while time.time() < deadline:
        if RNS.Transport.has_path(dest_hash):
            return True
        time.sleep(0.4)
    return RNS.Transport.has_path(dest_hash)


def send_bytes(
    *,
    router: LXMF.LXMRouter,
    source,
    dest_hash_hex: str,
    content: bytes,
    title: str,
) -> None:
    target = bytes.fromhex(dest_hash_hex.strip())
    want = RNS.Reticulum.TRUNCATED_HASHLENGTH // 8
    if len(target) != want:
        raise SystemExit(f"Invalid dest hash length {len(target)} (want {want})")
    if not wait_for_path(target):
        raise SystemExit("No path to destination — is peer bridge/rnsd up and announced?")
    recipient = RNS.Identity.recall(target)
    if recipient is None:
        RNS.Transport.request_path(target)
        import time

        time.sleep(2.0)
        recipient = RNS.Identity.recall(target)
    if recipient is None:
        raise SystemExit("Could not recall Identity — peer must announce()")
    dest = RNS.Destination(
        recipient,
        RNS.Destination.OUT,
        RNS.Destination.SINGLE,
        "lxmf",
        "delivery",
    )
    lxm = LXMF.LXMessage(
        dest,
        source,
        content,
        title=title,
        desired_method=LXMF.LXMessage.DIRECT,
        include_ticket=True,
    )
    router.handle_outbound(lxm)

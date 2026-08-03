"""ResilNet opaque blob carried inside LXMF content bytes.

Binary layout (version 1)::

    magic[4] = b\"RNLB\"
    version[1] = 0x01
    flags[1]   bit0 = has_sender
    to_len[1]  + to_utf8 (ResilNet peer id / pubkey hash)
    from_len[1] + from_utf8 (optional; 0 if no sender)
    sealed_len[4] big-endian
    sealed[sealed_len]  opaque ResilNet sealed envelope bytes

The sealed region is intentionally opaque to Reticulum/LXMF. In production it
should match the wire map ResilNet already uses for E2EE chat (see mobile_app
``ChatMessage.toMap`` / ``ResilNetPacketCodec``) — typically JSON/UTF-8 of the
sealed fields only (encryptedPayload, encryptedKey, signature, ids, …) with
plaintext ``content`` stripped. This lab never imports Flutter.
"""

from __future__ import annotations

import struct
from dataclasses import dataclass

MAGIC = b"RNLB"
VERSION = 1
FLAG_HAS_SENDER = 0x01
LXMF_TITLE = "resilnet-blob-v1"


@dataclass(frozen=True)
class ResilNetLxmfBlob:
    """Parsed ResilNet-over-LXMF blob."""

    to_peer_id: str
    sealed: bytes
    from_peer_id: str | None = None
    version: int = VERSION

    def encode(self) -> bytes:
        if self.version != VERSION:
            raise ValueError(f"unsupported blob version {self.version}")
        to_b = self.to_peer_id.encode("utf-8")
        from_b = (self.from_peer_id or "").encode("utf-8")
        if len(to_b) > 255 or len(from_b) > 255:
            raise ValueError("peer id too long for v1 header")
        flags = FLAG_HAS_SENDER if from_b else 0
        return b"".join(
            [
                MAGIC,
                bytes([VERSION, flags, len(to_b)]),
                to_b,
                bytes([len(from_b)]),
                from_b,
                struct.pack(">I", len(self.sealed)),
                self.sealed,
            ]
        )


def encode_blob(
    *,
    to_peer_id: str,
    sealed: bytes,
    from_peer_id: str | None = None,
) -> bytes:
    return ResilNetLxmfBlob(
        to_peer_id=to_peer_id,
        sealed=sealed,
        from_peer_id=from_peer_id or None,
    ).encode()


def decode_blob(data: bytes) -> ResilNetLxmfBlob:
    if len(data) < 8:
        raise ValueError("blob too short")
    if data[0:4] != MAGIC:
        raise ValueError(f"bad magic {data[0:4]!r} (want {MAGIC!r})")
    version = data[4]
    if version != VERSION:
        raise ValueError(f"unsupported version {version}")
    flags = data[5]
    to_len = data[6]
    off = 7
    to_b = data[off : off + to_len]
    off += to_len
    if len(to_b) != to_len:
        raise ValueError("truncated to_peer_id")
    from_len = data[off]
    off += 1
    from_b = data[off : off + from_len]
    off += from_len
    if len(from_b) != from_len:
        raise ValueError("truncated from_peer_id")
    if off + 4 > len(data):
        raise ValueError("truncated sealed length")
    (sealed_len,) = struct.unpack(">I", data[off : off + 4])
    off += 4
    sealed = data[off : off + sealed_len]
    if len(sealed) != sealed_len:
        raise ValueError("truncated sealed bytes")
    from_id = from_b.decode("utf-8") if from_len else None
    if from_id and not (flags & FLAG_HAS_SENDER):
        # tolerate encoders that set from without flag
        pass
    return ResilNetLxmfBlob(
        to_peer_id=to_b.decode("utf-8"),
        sealed=sealed,
        from_peer_id=from_id or None,
        version=version,
    )


def looks_like_blob(data: bytes) -> bool:
    return len(data) >= 4 and data[0:4] == MAGIC

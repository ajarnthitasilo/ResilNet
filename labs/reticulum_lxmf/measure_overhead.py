#!/usr/bin/env python3
"""Measure RNLB + LXMF packing overhead vs ResilNet LoRa radio budget.

Offline by default (temp Reticulum config — does not need start_daemons.sh).
Writes CSV + prints a markdown table.

Examples:
  .venv/bin/python measure_overhead.py
  .venv/bin/python measure_overhead.py --out docs/overhead_results.csv
"""

from __future__ import annotations

import argparse
import csv
import shutil
import tempfile
from pathlib import Path

import LXMF
import RNS

from bridge.blob import LXMF_TITLE, encode_blob

# From ResilNet sources (not assumed):
#   mobile_app/lib/core/resilnet_protocol.dart  radioMaxPayloadLen = 230
#   esp32_firmware/include/packet.h            payload[230]
#   mobile_app/.../resilnet_chunk_codec.dart   maxChunkDataLen = 200
RESILNET_RADIO_PAYLOAD_MAX = 230
RESILNET_CHUNK_DATA_MAX = 200

# RNS / LXMF library constants (measured from installed packages)
RNS_MTU = RNS.Reticulum.MTU  # 500
RNS_MDU = RNS.Reticulum.MDU  # 464
LXMF_OVERHEAD = LXMF.LXMessage.LXMF_OVERHEAD  # 112
PLAIN_PACKET_MDU = LXMF.LXMessage.PLAIN_PACKET_MDU
ENCRYPTED_PACKET_MAX_CONTENT = LXMF.LXMessage.ENCRYPTED_PACKET_MAX_CONTENT

DEFAULT_SIZES = (32, 64, 128, 200, 230, 256, 512, 1024)
DEFAULT_TO = "alice_lab_peer_aaaaaaaa"
DEFAULT_FROM = "bob_lab_peer_bbbbbbbb"


def _temp_reticulum() -> tuple[RNS.Reticulum, Path]:
    td = Path(tempfile.mkdtemp(prefix="rns_overhead_"))
    (td / "config").write_text(
        "\n".join(
            [
                "[reticulum]",
                "  enable_transport = No",
                "  share_instance = No",
                "  shared_instance_port = 47600",
                "  instance_control_port = 47601",
                "  panic_on_interface_error = No",
                "",
                "[logging]",
                "  loglevel = 8",
                "",
                "[interfaces]",
                "",
            ]
        ),
        encoding="utf-8",
    )
    return RNS.Reticulum(configdir=str(td)), td


def measure_rows(
    *,
    sizes: tuple[int, ...],
    to_peer_id: str,
    from_peer_id: str,
    title: str,
) -> list[dict]:
    reticulum, td = _temp_reticulum()
    try:
        id_a = RNS.Identity()
        id_b = RNS.Identity()
        source = RNS.Destination(
            id_a, RNS.Destination.IN, RNS.Destination.SINGLE, "lxmf", "delivery"
        )
        dest = RNS.Destination(
            id_b, RNS.Destination.OUT, RNS.Destination.SINGLE, "lxmf", "delivery"
        )

        rows: list[dict] = []
        title_b = title.encode("utf-8")
        for sealed_len in sizes:
            sealed = bytes([(i * 7) & 0xFF for i in range(sealed_len)])
            rnlb = encode_blob(
                to_peer_id=to_peer_id,
                sealed=sealed,
                from_peer_id=from_peer_id,
            )
            lxm = LXMF.LXMessage(
                dest,
                source,
                rnlb,
                title=title,
                desired_method=LXMF.LXMessage.DIRECT,
            )
            lxm.pack()
            packed = len(lxm.packed)
            rnlb_oh = len(rnlb) - sealed_len
            lxmf_oh = packed - len(rnlb)  # includes title/msgpack/signature framing
            # RNS radio frame (native Reticulum LoRa) is a different stack than
            # ResilNet Heltec path — compare packed LXMF to RNS MDU as estimate.
            fits_rns_plain_mdu = packed <= PLAIN_PACKET_MDU
            fits_resilnet_radio = packed <= RESILNET_RADIO_PAYLOAD_MAX
            fits_resilnet_chunk = packed <= RESILNET_CHUNK_DATA_MAX
            rows.append(
                {
                    "sealed_len": sealed_len,
                    "rnlb_len": len(rnlb),
                    "rnlb_overhead": rnlb_oh,
                    "title_len": len(title_b),
                    "lxmf_packed_len": packed,
                    "lxmf_overhead_over_rnlb": lxmf_oh,
                    "total_overhead_over_sealed": packed - sealed_len,
                    "fits_resilnet_radio_230": fits_resilnet_radio,
                    "fits_resilnet_chunk_200": fits_resilnet_chunk,
                    "fits_rns_plain_mdu_464": fits_rns_plain_mdu,
                    "within_lxmf_enc_max_content_295": len(rnlb) + len(title_b)
                    <= ENCRYPTED_PACKET_MAX_CONTENT,
                    "needs_rns_resource_est": packed > PLAIN_PACKET_MDU,
                    "kind_rnlb": "measured",
                    "kind_lxmf_packed": "measured",
                    "kind_rns_on_air": "estimated_compare_only",
                }
            )
        return rows
    finally:
        shutil.rmtree(td, ignore_errors=True)
        del reticulum


def write_csv(path: Path, rows: list[dict]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fields = list(rows[0].keys()) if rows else []
    with path.open("w", encoding="utf-8", newline="") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        w.writerows(rows)


def print_markdown(rows: list[dict]) -> None:
    print()
    print(
        "| sealed | RNLB | RNLB oh | LXMF packed | total oh | "
        "≤230 radio? | ≤200 chunk? | ≤464 RNS MDU? |"
    )
    print("|-------:|-----:|--------:|------------:|---------:|:---:|:---:|:---:|")
    for r in rows:
        print(
            f"| {r['sealed_len']} | {r['rnlb_len']} | {r['rnlb_overhead']} | "
            f"{r['lxmf_packed_len']} | {r['total_overhead_over_sealed']} | "
            f"{'yes' if r['fits_resilnet_radio_230'] else 'NO'} | "
            f"{'yes' if r['fits_resilnet_chunk_200'] else 'NO'} | "
            f"{'yes' if r['fits_rns_plain_mdu_464'] else 'NO'} |"
        )
    print()
    print(
        f"Constants: ResilNet radio payload={RESILNET_RADIO_PAYLOAD_MAX}B "
        f"(from app/firmware), chunk data≤{RESILNET_CHUNK_DATA_MAX}B; "
        f"RNS MTU={RNS_MTU} MDU={RNS_MDU}; LXMF_OVERHEAD={LXMF_OVERHEAD}; "
        f"title={LXMF_TITLE!r}."
    )


def main() -> int:
    ap = argparse.ArgumentParser(description="RNLB/LXMF overhead vs LoRa budgets")
    ap.add_argument(
        "--sizes",
        default=",".join(str(s) for s in DEFAULT_SIZES),
        help="Comma-separated sealed stub sizes in bytes",
    )
    ap.add_argument("--to-peer-id", default=DEFAULT_TO)
    ap.add_argument("--from-peer-id", default=DEFAULT_FROM)
    ap.add_argument("--title", default=LXMF_TITLE)
    ap.add_argument(
        "--out",
        default="docs/overhead_results.csv",
        help="CSV output path (relative to cwd)",
    )
    args = ap.parse_args()
    sizes = tuple(int(x.strip()) for x in args.sizes.split(",") if x.strip())
    rows = measure_rows(
        sizes=sizes,
        to_peer_id=args.to_peer_id,
        from_peer_id=args.from_peer_id,
        title=args.title,
    )
    out = Path(args.out)
    write_csv(out, rows)
    print(f"wrote {out.resolve()} ({len(rows)} rows)")
    print_markdown(rows)

    # Product gate summary — "fits 230" alone is misleading (no room for
    # ResilNet framing / realistic sealed DM sizes).
    fit_radio = [r["sealed_len"] for r in rows if r["fits_resilnet_radio_230"]]
    fit_chunk = [r["sealed_len"] for r in rows if r["fits_resilnet_chunk_200"]]
    print("SUMMARY")
    print(
        f"  Sealed sizes with LXMF packed ≤{RESILNET_RADIO_PAYLOAD_MAX}B radio: "
        f"{fit_radio or 'none'}"
    )
    print(
        f"  Sealed sizes with LXMF packed ≤{RESILNET_CHUNK_DATA_MAX}B chunk: "
        f"{fit_chunk or 'none'}"
    )
    print(
        "  Practical gate: real sealed DMs are ≫32B; even 32B sealed → ~215B "
        f"packed (fails {RESILNET_CHUNK_DATA_MAX}B chunk budget). "
        "Do not put full LXMF on ResilNet Heltec 230B path."
    )
    print(
        "  Mac/Pi bridge over TCP/Wi‑Fi remains the intended v1 LXMF host."
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

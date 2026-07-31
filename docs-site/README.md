# ResilNet documentation site

Static user docs (Docsify). Thai is the default language; English lives under `en/`.

## Preview locally

```bash
cd docs-site
python3 -m http.server 8080
# open http://127.0.0.1:8080
```

## Live site

- Docs: https://ajarnthitasilo.github.io/ResilNet/
- Firmware base (app dart-define): `https://ajarnthitasilo.github.io/ResilNet/firmware`

Deployed by `.github/workflows/deploy-docs.yml` on pushes that touch `docs-site/**`.

## Layout

| Path | Role |
|------|------|
| `th/` | คู่มือภาษาไทย (ค่าเริ่มต้น) |
| `en/` | English guide |
| `firmware/` | CDN hub: `manifest.json`, `esp32_*/latest.bin`, alias `.bin` names |

## Refresh firmware on the docs hub

```bash
./tool/sync_docs_firmware.sh
# or (after PlatformIO build):
./tool/sync_firmware_release.sh
```

Firmware binaries are mirrored from `../releases/firmware/` into `firmware/` so
`RESILNET_FIRMWARE_BASE_URL=…/firmware` matches `FirmwareConfig` paths.

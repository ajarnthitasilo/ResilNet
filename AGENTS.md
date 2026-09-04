# AGENTS.md

## Cursor Cloud specific instructions

ResilNet is an account-less, decentralized mesh messenger. The one user-facing
product is `mobile_app` (Flutter) with its routing/crypto/Nostr engine in
`resilnet_core` (Rust), compiled into the app via `flutter_rust_bridge`/cargokit
(no standalone backend — remote sync uses public Nostr relays over the internet).
Build/run commands live in `README.md`; the notes below are the non-obvious
cloud caveats.

### Toolchains (pre-installed in the VM snapshot)
- Flutter `3.44.8` (Dart `3.12.2`) at `/home/ubuntu/flutter/bin` (added to PATH in `~/.bashrc`).
- Rust: the default toolchain is set to `stable` (1.97.1). This is REQUIRED — `resilnet_core/Cargo.lock` pins `zeroize 1.9.0` which needs `edition2024`, so the older `1.83.0` toolchain cannot even parse it. Use plain `cargo` (now stable) for any `resilnet_core` work.
- Android SDK at `/home/ubuntu/android-sdk` (`ANDROID_HOME` in `~/.bashrc`): platform `android-36`, build-tools `36.0.0`, NDK `28.2.13676358`, plus `emulator` + AVDs `resilnet_aosp`/`resilnet_test`.
- Linux desktop build deps: `clang`, `g++`/`libstdc++-14-dev`, `libgtk-3-dev`, `ninja-build`, `cmake`, `pkg-config`, GStreamer dev, `libsecret-1-dev`.
- A TigerVNC display is available at `DISPLAY=:1` for GUI apps.

### Lint / test (fast, reliable — prefer these)
- `cd mobile_app && flutter analyze` — NOTE: the only `error`s reported are inside `mobile_app/rust_builder/cargokit/build_tool/` (cargokit's own tool references optional deps that the app's `pub get` does not resolve). These are pre-existing and are NOT build blockers; the app's own `lib/` and `test/` are clean (info/warnings only).
- `cd mobile_app && flutter test` — 110 tests covering the core protocol/crypto/hybrid-routing/ACK/bulletin/board-invite logic.

### Build
- Android (the first-class runtime target): `cd mobile_app && flutter build apk --debug` — cargokit cross-compiles `resilnet_core` for all 4 Android ABIs via the NDK. `android/app/google-services.json` is present (needed by the applied `com.google.gms.google-services` plugin).
- Linux desktop: `cd mobile_app && flutter build linux --debug`. If a prior configure failed, run `rm -rf build/linux` before retrying — a stale CMake cache makes the install step try to copy into `/usr/local` and fail.

### Running the app — important platform caveats
- The app is Android/iOS-first. It does NOT fully run on Linux desktop or web: `sqflite`, `permission_handler`, BLE and `geolocator` are mobile-only. On Linux the window renders and the Rust core initializes (`[Init] ... status=ok`), but bootstrap then fails with `databaseFactory not initialized` and shows the app's boot-error screen. Use Android to exercise the full UI.
- Android emulator has NO KVM here, so it runs in slow software mode. It does work, with caveats:
  - Boot takes ~5-8 min; a cold app launch re-runs init for ~2-3 min.
  - Under CPU load the app/system frequently shows "isn't responding" (ANR) dialogs — tap **Wait**, don't close.
  - Prefer a plain AOSP image (`system-images;android-34;default;x86_64`, AVD `resilnet_aosp`) over `google_apis` (GMS starves the CPU and causes constant ANRs).
  - Launch: `emulator -avd resilnet_aosp -no-snapshot -no-audio -no-boot-anim -gpu swiftshader_indirect -accel off -cores 4 -qemu -m 5120` (on `DISPLAY=:1`).
  - Pass the permission gate by granting runtime perms via ADB (BLE hardware is absent but perms unblock the UI): `adb shell pm grant com.example.resilnet android.permission.{BLUETOOTH_SCAN,BLUETOOTH_CONNECT,BLUETOOTH_ADVERTISE,ACCESS_FINE_LOCATION,RECORD_AUDIO,POST_NOTIFICATIONS}`.
  - Fine-grained touch/typing is unreliable under load (the AOSP IME goes fullscreen and drops keystrokes). For deterministic verification of the core transport, prefer the Rust round-trip below.

### Fastest end-to-end check of core functionality (no emulator)
The product's core is publishing/receiving over public Nostr relays. You can verify it directly against `resilnet_core` with a short `#[tokio::test]` in `resilnet_core/tests/` that calls `resilnet_core::api::init_nostr(None, None)`, then `nostr_publish_geo_notice(cell, json, None)`, then `nostr_fetch_geo_notices(vec![cell], Some(600))` and asserts the payload round-trips. Requires outbound internet to the public relays. (This is a demonstration harness — don't commit it.)

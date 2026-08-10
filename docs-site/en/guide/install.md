# Install the app

## Supported platforms

| Platform | Notes |
|----------|--------|
| **Android** | API 24+ (Android 7+) through current target — Android 12+ uses the new BLE permission set |
| **iPhone / iPad** | Via Xcode / TestFlight / team-distributed builds |
| **Apple Watch** | Companion with iPhone on builds that embed the Watch app — see [Apple Watch](apple-watch.md) |

## Android

1. Install the APK from your team (or build from the repo)
2. Allow install from unknown sources if prompted
3. First launch creates on-device keys automatically and starts onboarding

### Permissions you will usually see

- **Bluetooth** — scan / connect / advertise (`BLUETOOTH_SCAN`, `CONNECT`, `ADVERTISE` on Android 12+)
- **Location** — required by some Android versions for BLE scanning; also used for Area / geohash
- **Notifications** — incoming messages
- **Microphone** — voice notes when you use that feature
- **Camera** — board invite QR / peer import when you use those features

## iOS

1. Install from a provisioned device or your team’s distribution channel
2. Grant Bluetooth (and Camera / Microphone / Location when you use those features)
3. **Local Network** — needed for [Local Wi‑Fi](local-wifi.md) on a LAN
4. Check **Settings → ResilNet** that permissions stay enabled
5. (Optional) Install the paired Watch app, then open ResilNet on iPhone at least once — [Apple Watch](apple-watch.md)

## After install

- Onboarding covers Identity, channels, toolbar, safety, and more
- You can set a display name in Settings
- Version in Settings should show **1.9.75** (or newer)
- There is no email/password signup screen
- (Optional) If your team uses a home bridge: [Home node / Reticulum](reticulum-home-node.md)
- (Optional) Tor for Nostr: Settings → Route Nostr via Tor (you must run Orbot/Tor yourself)

## Next

- [What’s new](whats-new.md)
- [1:1 chat](chat.md)
- [ESP32 firmware](../firmware/)

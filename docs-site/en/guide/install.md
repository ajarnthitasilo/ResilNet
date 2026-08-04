# Install the app

## Supported platforms

| Platform | Notes |
|----------|--------|
| **Android** | API 24+ (Android 7+) through current target — Android 12+ uses the new BLE permission set |
| **iPhone / iPad** | Via Xcode / TestFlight / team-distributed builds |

## Android

1. Install the APK from your team (or build from the repo)
2. Allow install from unknown sources if prompted
3. First launch creates on-device keys automatically

### Permissions you will usually see

- **Bluetooth** — scan / connect / advertise (`BLUETOOTH_SCAN`, `CONNECT`, `ADVERTISE` on Android 12+)
- **Location** — required by some Android versions for BLE scanning
- **Notifications** — incoming messages
- **Camera** — board invite QR / peer import when you use those features

## iOS

1. Install from a provisioned device or your team’s distribution channel
2. Grant Bluetooth (and Camera if you scan QR codes)
3. Check **Settings → ResilNet** that permissions stay enabled

## After install

- You can set a display name in Settings
- Version in Settings should show **1.9.64** (or newer)
- There is no email/password signup screen
- (Optional) If your team uses a home bridge: [Home node / Reticulum](reticulum-home-node.md)

## Next

- [What’s new](whats-new.md)
- [1:1 chat](chat.md)
- [ESP32 firmware](../firmware/)

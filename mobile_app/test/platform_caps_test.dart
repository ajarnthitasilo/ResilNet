import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/core/platform_caps.dart';

void main() {
  test('macOS implies Apple BLE style + mesh attempt + desktop', () {
    if (!PlatformCaps.isMacOS) {
      // Host is not macOS (e.g. CI Linux) — flags still must be mutually consistent.
      expect(PlatformCaps.usesIosStyleBle, PlatformCaps.isApple);
      return;
    }
    expect(PlatformCaps.isApple, isTrue);
    expect(PlatformCaps.usesIosStyleBle, isTrue);
    expect(PlatformCaps.meshBleAttempted, isTrue);
    expect(PlatformCaps.isDesktop, isTrue);
  });
}

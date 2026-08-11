import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/core/gateway_caps_coordinator.dart';
import 'package:resilnet/core/gateway_control_codec.dart';
import 'package:resilnet/models/gateway_radio_mode.dart';

void main() {
  group('GatewayControlCodec', () {
    test('decodes LoRa-only RN_CAPS (no HaLow bits)', () {
      final frame = GatewayControlCodec.tryDecodeCaps(
        GatewayControlCodec.encodeCapsForTest(
          mask: GatewayControlCodec.capLora,
          activeRadio: GatewayControlCodec.radioLora,
        ),
      );
      expect(frame, isNotNull);
      expect(frame!.loraCapable, isTrue);
      expect(frame.halowCapable, isFalse);
      expect(frame.halowStub, isFalse);
      expect(frame.halowLinkUp, isFalse);
    });

    test('decodes HaLow stub caps separately from real link', () {
      final stub = GatewayControlCodec.tryDecodeCaps(
        GatewayControlCodec.encodeCapsForTest(
          mask: GatewayControlCodec.capLora |
              GatewayControlCodec.capHalow |
              GatewayControlCodec.capHalowStub,
          activeRadio: GatewayControlCodec.radioHalow,
        ),
      );
      expect(stub!.halowCapable, isTrue);
      expect(stub.halowStub, isTrue);
      expect(stub.halowLinkUp, isFalse);
      expect(stub.halowAvailable, isTrue);

      final real = GatewayControlCodec.tryDecodeCaps(
        GatewayControlCodec.encodeCapsForTest(
          mask: GatewayControlCodec.capLora |
              GatewayControlCodec.capHalow |
              GatewayControlCodec.capHalowUp,
          activeRadio: GatewayControlCodec.radioHalow,
        ),
      );
      expect(real!.halowStub, isFalse);
      expect(real.halowLinkUp, isTrue);
      expect(real.halowAvailable, isTrue);
    });

    test('RN_RADIO encode produces valid control frame', () {
      for (final mode in GatewayRadioMode.values) {
        final frame = GatewayControlCodec.encodeRadioCommand(mode);
        expect(GatewayControlCodec.isRadioFrame(frame), isTrue);
      }
    });
  });

  group('GatewayCapsCoordinator', () {
    final t0 = DateTime(2026, 1, 1, 12);

    test('waits for caps then falls back to LoRa-only after timeout', () {
      final c = GatewayCapsCoordinator(waitTimeout: const Duration(seconds: 4));
      c.onGatewayActive(true, t0);
      expect(c.phase, GatewayCapsPhase.waitingCaps);
      expect(c.availability().loraAvailable, isFalse);

      expect(c.checkTimeout(t0.add(const Duration(seconds: 3))), isFalse);
      expect(c.phase, GatewayCapsPhase.waitingCaps);

      expect(c.checkTimeout(t0.add(const Duration(seconds: 4))), isTrue);
      expect(c.phase, GatewayCapsPhase.loraFallback);
      expect(c.availability().loraAvailable, isTrue);
      expect(c.availability().halowAvailable, isFalse);
    });

    test('caps received before timeout cancels fallback', () {
      final c = GatewayCapsCoordinator(waitTimeout: const Duration(seconds: 4));
      c.onGatewayActive(true, t0);
      c.onCaps(
        const GatewayCaps(
          loraCapable: true,
          halowCapable: true,
          halowLinkUp: false,
          halowStub: true,
          activeRadio: 1,
        ),
      );
      expect(c.phase, GatewayCapsPhase.fromCaps);
      expect(c.availability().halowStub, isTrue);
      expect(c.availability().halowLinkUp, isFalse);
      expect(c.checkTimeout(t0.add(const Duration(seconds: 10))), isFalse);
    });

    test('disconnect clears waiting state', () {
      final c = GatewayCapsCoordinator();
      c.onGatewayActive(true, t0);
      c.onGatewayActive(false, t0.add(const Duration(seconds: 1)));
      expect(c.phase, GatewayCapsPhase.disconnected);
      expect(c.availability().capsKnown, isFalse);
    });
  });

  group('LoRa-only firmware regression (config default)', () {
    test('HALOW_ENABLE defaults to 0 in config.h', () {
      final config = _readRepoFile('esp32_firmware/include/config.h');
      expect(config.contains('#ifndef HALOW_ENABLE'), isTrue);
      expect(config.contains('#define HALOW_ENABLE 0'), isTrue);
    });

    test('lora_gateway env does not force HALOW_ENABLE=1', () {
      final ini = _readRepoFile('esp32_firmware/platformio.ini');
      expect(ini.contains('lora_gateway'), isTrue);
      expect(RegExp(r'HALOW_ENABLE\s*=\s*1').hasMatch(ini), isFalse);
    });
  });
}

File _repoFile(String relativePath) {
  final cwd = Directory.current;
  final root = cwd.path.endsWith('mobile_app') ? cwd.parent : cwd;
  return File('${root.path}/$relativePath');
}

String _readRepoFile(String relativePath) =>
    _repoFile(relativePath).readAsStringSync();

import 'package:flutter/foundation.dart';

import '../models/gateway_radio_mode.dart';

/// RN_CAPS / RN_RADIO control frames (see esp32_firmware/docs/halow_control.md).
class GatewayControlCodec {
  GatewayControlCodec._();

  static const capsMagicHi = 0x52;
  static const capsMagicLo = 0x43;
  static const radioMagicHi = 0x52;
  static const radioMagicLo = 0x52;
  static const version = 1;

  static const capLora = 0x01;
  static const capHalow = 0x02;
  static const capHalowUp = 0x04;
  static const capHalowStub = 0x08;

  static const radioLora = 0;
  static const radioHalow = 1;
  static const radioAuto = 2;

  static const capsFrameLen = 6;
  static const radioFrameLen = 4;

  static bool isCapsFrame(Uint8List data) {
    return data.length >= capsFrameLen &&
        data[0] == capsMagicHi &&
        data[1] == capsMagicLo;
  }

  static bool isRadioFrame(Uint8List data) {
    return data.length >= radioFrameLen &&
        data[0] == radioMagicHi &&
        data[1] == radioMagicLo;
  }

  static GatewayCaps? tryDecodeCaps(Uint8List data) {
    if (!isCapsFrame(data) || data[2] != version) return null;
    final mask = data[3];
    return GatewayCaps(
      loraCapable: (mask & capLora) != 0,
      halowCapable: (mask & capHalow) != 0,
      halowLinkUp: (mask & capHalowUp) != 0,
      halowStub: (mask & capHalowStub) != 0,
      activeRadio: data[4],
    );
  }

  static Uint8List encodeRadioCommand(GatewayRadioMode mode) {
    final wireMode = switch (mode) {
      GatewayRadioMode.lora => radioLora,
      GatewayRadioMode.halow => radioHalow,
      GatewayRadioMode.auto => radioAuto,
    };
    return Uint8List.fromList([
      radioMagicHi,
      radioMagicLo,
      version,
      wireMode,
    ]);
  }

  /// Test helper — build RN_CAPS bytes (same layout as firmware).
  static Uint8List encodeCapsForTest({
    required int mask,
    required int activeRadio,
  }) {
    return Uint8List.fromList([
      capsMagicHi,
      capsMagicLo,
      version,
      mask & 0xFF,
      activeRadio & 0xFF,
      0,
    ]);
  }

  static void debugLogCaps(GatewayCaps caps) {
    debugPrint(
      '[GatewayControl] caps lora=${caps.loraCapable} halow=${caps.halowCapable} '
      'linkUp=${caps.halowLinkUp} stub=${caps.halowStub} active=${caps.activeRadio}',
    );
  }
}

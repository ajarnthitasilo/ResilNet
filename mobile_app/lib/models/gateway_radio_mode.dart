import '../src/rust/api/dto.dart';

/// Gateway radio preference (LoRa / HaLow / Auto) — mirrors [GatewayRadioPreferenceDto].
enum GatewayRadioMode {
  lora,
  halow,
  auto;

  static GatewayRadioMode fromName(String? name) {
    return GatewayRadioMode.values.firstWhere(
      (e) => e.name == name,
      orElse: () => GatewayRadioMode.auto,
    );
  }

  GatewayRadioPreferenceDto toDto() {
    return switch (this) {
      GatewayRadioMode.lora => GatewayRadioPreferenceDto.loRa,
      GatewayRadioMode.halow => GatewayRadioPreferenceDto.haLow,
      GatewayRadioMode.auto => GatewayRadioPreferenceDto.auto,
    };
  }

  static GatewayRadioMode fromDto(GatewayRadioPreferenceDto dto) {
    return switch (dto) {
      GatewayRadioPreferenceDto.loRa => GatewayRadioMode.lora,
      GatewayRadioPreferenceDto.haLow => GatewayRadioMode.halow,
      GatewayRadioPreferenceDto.auto => GatewayRadioMode.auto,
    };
  }
}

/// Parsed RN_CAPS from ESP32 gateway.
class GatewayCaps {
  const GatewayCaps({
    required this.loraCapable,
    required this.halowCapable,
    required this.halowLinkUp,
    required this.halowStub,
    required this.activeRadio,
  });

  final bool loraCapable;
  final bool halowCapable;
  final bool halowLinkUp;
  final bool halowStub;
  /// 0=LoRa, 1=HaLow
  final int activeRadio;

  bool get halowAvailable => halowCapable && (halowLinkUp || halowStub);

  bool get loraAvailable => loraCapable;
}

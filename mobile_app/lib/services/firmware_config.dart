/// ค่าคงที่และ URL สำหรับดาวน์โหลดเฟิร์มแวร์ ESP32
class FirmwareConfig {
  FirmwareConfig._();

  /// Base URL ของ manifest (JSON) หรือไฟล์ .bin โดยตรง
  ///
  /// ตั้งผ่าน `--dart-define=RESILNET_FIRMWARE_BASE_URL=https://...`
  static const baseUrl = String.fromEnvironment(
    'RESILNET_FIRMWARE_BASE_URL',
    defaultValue: '',
  );

  /// URL เฉพาะแต่ละประเภท (override manifest)
  static const standaloneBinUrl = String.fromEnvironment(
    'RESILNET_FW_STANDALONE_URL',
    defaultValue: '',
  );

  static const loraGatewayBinUrl = String.fromEnvironment(
    'RESILNET_FW_LORA_GATEWAY_URL',
    defaultValue: '',
  );

  /// ชื่อไฟล์เก็บในเครื่อง
  static const standaloneFileName = 'resilnet_esp32_standalone.bin';
  static const loraGatewayFileName = 'resilnet_esp32_lora_gateway.bin';

  static String resolveDownloadUrl(FirmwareKind kind) {
    final direct = switch (kind) {
      FirmwareKind.standaloneNode => standaloneBinUrl,
      FirmwareKind.loraGateway => loraGatewayBinUrl,
    };
    if (direct.trim().isNotEmpty) return direct.trim();

    final base = baseUrl.trim();
    if (base.isEmpty) return '';

    final path = switch (kind) {
      FirmwareKind.standaloneNode => 'esp32_standalone/latest.bin',
      FirmwareKind.loraGateway => 'esp32_lora_gateway/latest.bin',
    };
    return base.endsWith('/') ? '$base$path' : '$base/$path';
  }
}

enum FirmwareKind {
  standaloneNode,
  loraGateway,
}

extension FirmwareKindLabels on FirmwareKind {
  String get title => switch (this) {
        FirmwareKind.standaloneNode => 'ESP32 Standalone Node',
        FirmwareKind.loraGateway => 'ESP32 LoRa Gateway',
      };

  String get subtitle => switch (this) {
        FirmwareKind.standaloneNode =>
          'BLE Data Mule — เก็บและส่งต่อข้อความออฟไลน์',
        FirmwareKind.loraGateway =>
          'BLE ↔ LoRa Bridge — ขยายระยะด้วยวิทยุ LoRa',
      };

  String get localFileName => switch (this) {
        FirmwareKind.standaloneNode => FirmwareConfig.standaloneFileName,
        FirmwareKind.loraGateway => FirmwareConfig.loraGatewayFileName,
      };
}

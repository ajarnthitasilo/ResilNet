import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:resilnet/services/firmware_config.dart';
import 'package:resilnet/services/firmware_service.dart';

void main() {
  final standaloneBytes = Uint8List.fromList(List.generate(64, (i) => i));
  final loraBytes = Uint8List.fromList(List.generate(48, (i) => 255 - i));

  Map<String, dynamic> manifest({
    String appVersion = '1.9.44',
    String? minCompatibleVersion,
    String? standaloneSha,
    String? loraSha,
  }) =>
      {
        'schema': 1,
        'appVersion': appVersion,
        if (minCompatibleVersion != null)
          'minCompatibleVersion': minCompatibleVersion,
        'artifacts': {
          'standaloneNode': {
            'file': FirmwareConfig.standaloneFileName,
            'sha256': standaloneSha ?? sha256.convert(standaloneBytes).toString(),
          },
          'loraGateway': {
            'file': FirmwareConfig.loraGatewayFileName,
            'sha256': loraSha ?? sha256.convert(loraBytes).toString(),
          },
        },
      };

  Future<ByteData> Function(String) assetLoaderWith(
    Map<String, dynamic> manifestJson,
  ) {
    return (String path) async {
      if (path == FirmwareConfig.baselineManifestAsset) {
        final bytes =
            Uint8List.fromList(utf8.encode(jsonEncode(manifestJson)));
        return ByteData.view(bytes.buffer);
      }
      if (path == FirmwareConfig.baselineStandaloneAsset) {
        return ByteData.view(standaloneBytes.buffer);
      }
      if (path == FirmwareConfig.baselineLoraGatewayAsset) {
        return ByteData.view(loraBytes.buffer);
      }
      throw StateError('asset not found: $path');
    };
  }

  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('fw_test_');
  });

  tearDown(() async {
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  test('online success resolves onlineLatest', () async {
    final onlineBytes = Uint8List.fromList(List.generate(32, (i) => i * 2));
    final service = FirmwareService(
      firmwareDirOverride: tempDir,
      urlResolver: (_) => 'https://example.com/fw.bin',
      httpClientFactory: () => MockClient((request) async {
        return http.Response.bytes(onlineBytes, 200);
      }),
      assetLoader: assetLoaderWith(manifest()),
    );

    final resolved =
        await service.ensureFirmware(FirmwareKind.standaloneNode);
    expect(resolved.source, FirmwareSource.onlineLatest);
    expect(resolved.isUsable, isTrue);
    expect(await resolved.file!.readAsBytes(), onlineBytes);
  });

  test('online failure falls back to verified cached copy', () async {
    // เตรียม cache: ดาวน์โหลดสำเร็จก่อนหนึ่งครั้ง
    final cachedBytes = Uint8List.fromList(List.generate(16, (i) => i + 7));
    final seeder = FirmwareService(
      firmwareDirOverride: tempDir,
      urlResolver: (_) => 'https://example.com/fw.bin',
      httpClientFactory: () =>
          MockClient((_) async => http.Response.bytes(cachedBytes, 200)),
      assetLoader: assetLoaderWith(manifest()),
    );
    await seeder.download(FirmwareKind.standaloneNode);

    // รอบใหม่: ออนไลน์พัง → ต้องได้ cached
    final service = FirmwareService(
      firmwareDirOverride: tempDir,
      urlResolver: (_) => 'https://example.com/fw.bin',
      httpClientFactory: () =>
          MockClient((_) async => http.Response('down', 503)),
      assetLoader: assetLoaderWith(manifest()),
    );
    await service.refreshLocalInfo();

    final resolved =
        await service.ensureFirmware(FirmwareKind.standaloneNode);
    expect(resolved.source, FirmwareSource.offlineCached);
    expect(await resolved.file!.readAsBytes(), cachedBytes);
  });

  test('offline with no cache falls back to bundled baseline', () async {
    final service = FirmwareService(
      firmwareDirOverride: tempDir,
      urlResolver: (_) => '', // ไม่ได้ตั้ง URL = ออฟไลน์
      assetLoader: assetLoaderWith(manifest()),
    );

    final resolved =
        await service.ensureFirmware(FirmwareKind.standaloneNode);
    expect(resolved.source, FirmwareSource.offlineBundledBaseline);
    expect(resolved.version, '1.9.44');
    expect(await resolved.file!.readAsBytes(), standaloneBytes);
    expect(
      service.localSource(FirmwareKind.standaloneNode),
      FirmwareSource.offlineBundledBaseline,
    );
  });

  test('baseline checksum mismatch blocks flashing', () async {
    final service = FirmwareService(
      firmwareDirOverride: tempDir,
      urlResolver: (_) => '',
      assetLoader: assetLoaderWith(
        manifest(standaloneSha: 'deadbeef' * 8),
      ),
    );

    final resolved =
        await service.ensureFirmware(FirmwareKind.standaloneNode);
    expect(resolved.source, FirmwareSource.unavailable);
    expect(resolved.isUsable, isFalse);
    expect(resolved.error, contains('checksum'));
  });

  test('baseline below minCompatibleVersion blocks flashing', () async {
    final service = FirmwareService(
      firmwareDirOverride: tempDir,
      urlResolver: (_) => '',
      assetLoader: assetLoaderWith(
        manifest(appVersion: '1.8.0', minCompatibleVersion: '1.9.0'),
      ),
    );

    final resolved =
        await service.ensureFirmware(FirmwareKind.standaloneNode);
    expect(resolved.source, FirmwareSource.unavailable);
    expect(resolved.error, contains('minCompatible'));
  });

  test('corrupted cache is discarded and baseline used instead', () async {
    // เตรียม cache ปกติ
    final cachedBytes = Uint8List.fromList(List.generate(16, (i) => i));
    final seeder = FirmwareService(
      firmwareDirOverride: tempDir,
      urlResolver: (_) => 'https://example.com/fw.bin',
      httpClientFactory: () =>
          MockClient((_) async => http.Response.bytes(cachedBytes, 200)),
      assetLoader: assetLoaderWith(manifest()),
    );
    final file = await seeder.download(FirmwareKind.standaloneNode);

    // ทำให้ไฟล์เสีย (checksum ไม่ตรงกับ metadata)
    await file.writeAsBytes([0, 0, 0, 0], flush: true);

    final service = FirmwareService(
      firmwareDirOverride: tempDir,
      urlResolver: (_) => '',
      assetLoader: assetLoaderWith(manifest()),
    );
    await service.refreshLocalInfo();

    final resolved =
        await service.ensureFirmware(FirmwareKind.standaloneNode);
    expect(resolved.source, FirmwareSource.offlineBundledBaseline);
    expect(await resolved.file!.readAsBytes(), standaloneBytes);
  });

  test('isVersionAtLeast compares semver correctly', () {
    expect(FirmwareConfig.isVersionAtLeast('1.9.44', '1.9.0'), isTrue);
    expect(FirmwareConfig.isVersionAtLeast('1.9.0', '1.9.0'), isTrue);
    expect(FirmwareConfig.isVersionAtLeast('1.8.9', '1.9.0'), isFalse);
    expect(FirmwareConfig.isVersionAtLeast('2.0.0', '1.9.44'), isTrue);
    expect(FirmwareConfig.isVersionAtLeast('1.9.44+66', '1.9.44'), isTrue);
  });
}

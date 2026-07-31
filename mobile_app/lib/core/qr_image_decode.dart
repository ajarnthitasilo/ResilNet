import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:path_provider/path_provider.dart';

/// Decode the first QR payload from image [bytes] (PNG/JPEG). Returns null if none.
Future<String?> decodeQrFromImageBytes(Uint8List bytes) async {
  if (bytes.isEmpty) return null;
  File? temp;
  final controller = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
    autoStart: false,
  );
  try {
    final dir = await getTemporaryDirectory();
    temp = File(
      '${dir.path}/resilnet_qr_${DateTime.now().millisecondsSinceEpoch}.img',
    );
    await temp.writeAsBytes(bytes, flush: true);
    final capture = await controller.analyzeImage(temp.path);
    final raw = capture?.barcodes
        .map((b) => b.rawValue?.trim() ?? '')
        .firstWhere((v) => v.isNotEmpty, orElse: () => '');
    if (raw == null || raw.isEmpty) return null;
    return raw;
  } catch (e) {
    debugPrint('[QR] decode from image failed: $e');
    return null;
  } finally {
    await controller.dispose();
    try {
      await temp?.delete();
    } catch (_) {}
  }
}

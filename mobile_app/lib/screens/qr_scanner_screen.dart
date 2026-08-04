import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../services/camera_permission.dart';
import '../l10n/l10n_ext.dart';
import '../state/app_state.dart';
import '../app/glass_overlays.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  MobileScannerController? _controller;
  AppState? _appState;
  bool _handled = false;
  bool _starting = true;
  bool _closing = false;
  bool _resumedRadios = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _boot();
  }

  void _resumeRadiosIfNeeded() {
    if (_resumedRadios) return;
    _resumedRadios = true;
    final s = _appState;
    if (s != null && s.radioPaused) {
      unawaited(s.resumeRadiosAfterCamera());
    }
  }

  Future<void> _boot() async {
    // หยุด BLE ก่อนเปิดกล้อง — ลดโอกาส radio conflict / UI freeze บน iOS
    try {
      _appState = context.read<AppState>();
      await _appState!.pauseRadiosForCamera();
    } catch (e) {
      debugPrint('[ResilNet] pause radios: $e');
    }
    if (!mounted) return;
    await _prepareCamera();
  }

  Future<void> _safeClose([bool? result]) async {
    if (_closing) return;
    _closing = true;
    try {
      await _controller?.stop();
    } catch (_) {}
    try {
      await _controller?.dispose();
    } catch (_) {}
    _controller = null;
    if (!mounted) return;
    final s = context.read<AppState>();
    _appState = s;
    Navigator.of(context).pop(result);
    // resume หลัง pop เพื่อไม่บล็อกการปิดหน้า
    _resumeRadiosIfNeeded();
  }

  @override
  void dispose() {
    // เผื่อถูก pop ด้วย gesture / system back
    final c = _controller;
    _controller = null;
    c?.dispose();
    _resumeRadiosIfNeeded();
    super.dispose();
  }

  Future<void> _prepareCamera() async {
    setState(() {
      _starting = true;
      _error = null;
    });

    try {
      await ensureCameraPermission();

      final controller = MobileScannerController(
        formats: const [BarcodeFormat.qrCode],
        detectionSpeed: DetectionSpeed.normal,
        facing: CameraFacing.back,
        autoStart: true,
      );
      _controller = controller;
      if (!mounted) return;
      setState(() => _starting = false);
    } catch (e, st) {
      debugPrint('[ResilNet] camera prepare failed: $e\n$st');
      if (!mounted) return;
      final l10n = context.l10n;
      setState(() {
        _starting = false;
        if (e is StateError && e.message == cameraPermanentlyDeniedCode) {
          _error = l10n.permissionCameraDenied;
        } else if (e is StateError && e.message == 'CAMERA_DENIED') {
          _error = l10n.permissionCameraFailed;
        } else {
          _error = l10n.qrCameraOpenFailed('$e');
        }
      });
    }
  }

  Future<void> _handle(String data) async {
    if (_handled || _closing) return;
    _handled = true;
    try {
      await _controller?.stop();
    } catch (_) {}

    try {
      if (!mounted) return;
      final s = context.read<AppState>();
      final peer = await s.importPeerFromIdentityAny(data);
      if (peer == null) {
        throw const FormatException('Invalid QR data');
      }

      if (!mounted) return;
      await _safeClose(true);
    } catch (e) {
      debugPrint('[ResilNet] QR handle failed: $e');
      _handled = false;
      try {
        await _controller?.start();
      } catch (_) {}
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        GlassSnackBar(
          content: Text(
            e is FormatException &&
                    e.message.contains('does not match public key')
                ? context.l10n.qrIdKeyMismatch
                : context.l10n.qrInvalid,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        await _safeClose(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.qrScanTitle),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => _safeClose(false),
          ),
        ),
        body: _buildScannerBody(),
      ),
    );
  }

  Widget _buildScannerBody() {
    if (_starting) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_error!, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () async {
                if (await Permission.camera.isPermanentlyDenied) {
                  await openAppSettings();
                } else {
                  await _prepareCamera();
                }
              },
              child: Text(context.l10n.qrRetrySettings),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => _safeClose(false),
              child: Text(context.l10n.close),
            ),
          ],
        ),
      );
    }

    final controller = _controller;
    if (controller == null) {
      return Center(child: Text(context.l10n.qrCameraNotReady));
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        MobileScanner(
          controller: controller,
          onDetect: (capture) {
            if (_handled || _closing) return;
            final barcodes = capture.barcodes;
            if (barcodes.isEmpty) return;
            final raw = barcodes.first.rawValue;
            if (raw == null || raw.isEmpty) return;
            _handle(raw);
          },
          errorBuilder: (context, error) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  context.l10n.qrCameraOpenFailed('$error'),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
        const _QrScanOverlay(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            color: Colors.black54,
            padding: const EdgeInsets.all(12),
            child: Text(
              context.l10n.qrScanAlignHint,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

/// กรอบสแกน QR ตรงกลาง — มืดรอบนอกเพื่อโฟกัสตำแหน่งสแกน
class _QrScanOverlay extends StatelessWidget {
  const _QrScanOverlay();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(
        painter: _QrScanOverlayPainter(
          frameColor: const Color(0xFF10B981),
          overlayColor: Colors.black.withValues(alpha: 0.55),
        ),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _QrScanOverlayPainter extends CustomPainter {
  _QrScanOverlayPainter({
    required this.frameColor,
    required this.overlayColor,
  });

  final Color frameColor;
  final Color overlayColor;

  @override
  void paint(Canvas canvas, Size size) {
    const frameRatio = 0.68;
    final frameSize = size.shortestSide * frameRatio;
    final left = (size.width - frameSize) / 2;
    final top = (size.height - frameSize) / 2;
    final scanRect = Rect.fromLTWH(left, top, frameSize, frameSize);
    final rrect = RRect.fromRectAndRadius(scanRect, const Radius.circular(16));

    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRect(Offset.zero & size),
        Path()..addRRect(rrect),
      ),
      Paint()..color = overlayColor,
    );

    final border = Paint()
      ..color = frameColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawRRect(rrect, border);

    const cornerLen = 28.0;
    const stroke = 5.0;
    final corner = Paint()
      ..color = frameColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;

    void drawCorner(Offset start, Offset hEnd, Offset vEnd) {
      canvas.drawLine(start, hEnd, corner);
      canvas.drawLine(start, vEnd, corner);
    }

    drawCorner(
      scanRect.topLeft,
      scanRect.topLeft + const Offset(cornerLen, 0),
      scanRect.topLeft + const Offset(0, cornerLen),
    );
    drawCorner(
      scanRect.topRight,
      scanRect.topRight + const Offset(-cornerLen, 0),
      scanRect.topRight + const Offset(0, cornerLen),
    );
    drawCorner(
      scanRect.bottomLeft,
      scanRect.bottomLeft + const Offset(cornerLen, 0),
      scanRect.bottomLeft + const Offset(0, -cornerLen),
    );
    drawCorner(
      scanRect.bottomRight,
      scanRect.bottomRight + const Offset(-cornerLen, 0),
      scanRect.bottomRight + const Offset(0, -cornerLen),
    );
  }

  @override
  bool shouldRepaint(covariant _QrScanOverlayPainter oldDelegate) => false;
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

import '../l10n/l10n_ext.dart';
import '../services/camera_permission.dart';
import '../state/app_state.dart';

/// สแกน QR แล้วคืน raw string (ใช้กับ board invite / payloads อื่น)
class QrCaptureScreen extends StatefulWidget {
  const QrCaptureScreen({super.key, this.title});

  final String? title;

  @override
  State<QrCaptureScreen> createState() => _QrCaptureScreenState();
}

class _QrCaptureScreenState extends State<QrCaptureScreen> {
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
    try {
      _appState = context.read<AppState>();
      await _appState!.pauseRadiosForCamera();
    } catch (e) {
      debugPrint('[ResilNet] pause radios: $e');
    }
    if (!mounted) return;
    await _prepareCamera();
  }

  Future<void> _safeClose([String? result]) async {
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
    _appState = context.read<AppState>();
    Navigator.of(context).pop(result);
    _resumeRadiosIfNeeded();
  }

  @override
  void dispose() {
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
      debugPrint('[ResilNet] qr capture prepare failed: $e\n$st');
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

  void _onDetect(BarcodeCapture capture) {
    if (_handled || _closing) return;
    final raw = capture.barcodes
        .map((b) => b.rawValue?.trim() ?? '')
        .firstWhere((s) => s.isNotEmpty, orElse: () => '');
    if (raw.isEmpty) return;
    _handled = true;
    unawaited(_safeClose(raw));
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.title ?? context.l10n.announceScanInviteQr;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        await _safeClose();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => _safeClose(),
          ),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
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
              onPressed: _prepareCamera,
              child: Text(context.l10n.retry),
            ),
          ],
        ),
      );
    }
    final c = _controller;
    if (c == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return MobileScanner(controller: c, onDetect: _onDetect);
  }
}

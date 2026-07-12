import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gal/gal.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../app/theme.dart';
import '../state/app_state.dart';
import 'qr_scanner_screen.dart';

class IdentityScreen extends StatefulWidget {
  const IdentityScreen({super.key});

  @override
  State<IdentityScreen> createState() => _IdentityScreenState();
}

class _IdentityScreenState extends State<IdentityScreen> {
  late final TextEditingController _name;
  final _nameFocus = FocusNode();
  bool _saving = false;
  String? _cachedQrData;
  String? _cachedName;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController();
  }

  @override
  void dispose() {
    _nameFocus.dispose();
    _name.dispose();
    super.dispose();
  }

  void _syncNameField(String displayName) {
    if (_nameFocus.hasFocus || _name.text == displayName) return;
    _name.value = _name.value.copyWith(
      text: displayName,
      selection: TextSelection.collapsed(offset: displayName.length),
    );
  }

  Future<void> _copyUserId(String userId) async {
    await Clipboard.setData(ClipboardData(text: userId));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('คัดลอก Public Key Hash เรียบร้อยแล้ว')),
    );
  }

  Future<void> _openScanner() async {
    if (!mounted) return;
    final ok = await Navigator.of(
      context,
    ).push<bool>(MaterialPageRoute(builder: (_) => const QrScannerScreen()));
    if (!mounted) return;
    // เผื่อ resume radios ยังไม่ทัน — เรียกซ้ำแบบปลอดภัย
    try {
      await context.read<AppState>().resumeRadiosAfterCamera();
    } catch (_) {}
    if (!mounted) return;
    if (ok == true) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('บันทึกเพื่อนจาก QR แล้ว')));
    }
  }

  Future<void> _saveQrToGallery(String qrData) async {
    if (_saving) return;
    setState(() => _saving = true);
    try {
      final hasAccess = await Gal.hasAccess();
      if (!hasAccess) {
        final granted = await Gal.requestAccess();
        if (!granted) {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('ไม่ได้รับสิทธิ์บันทึกลงคลังภาพ')),
          );
          return;
        }
      }

      // สร้าง PNG จาก QrPainter โดยตรง (ไม่พึ่ง widget tree / ไม่ค้างจาก rebuild)
      final painter = QrPainter(
        data: qrData,
        version: QrVersions.auto,
        errorCorrectionLevel: QrErrorCorrectLevel.M,
        gapless: true,
        eyeStyle: const QrEyeStyle(
          eyeShape: QrEyeShape.square,
          color: Color(0xFF000000),
        ),
        dataModuleStyle: const QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.square,
          color: Color(0xFF000000),
        ),
      );
      final byteData = await painter.toImageData(
        1024,
        format: ui.ImageByteFormat.png,
      );
      if (byteData == null) throw StateError('QR encode failed');
      final bytes = byteData.buffer.asUint8List();

      await Gal.putImageBytes(
        Uint8List.fromList(bytes),
        name: 'resilnet_qr_${DateTime.now().millisecondsSinceEpoch}',
      );

      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('บันทึก QR ลงคลังภาพแล้ว')));
    } catch (e, st) {
      debugPrint('[ResilNet] save QR failed: $e\n$st');
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('บันทึก QR ไม่สำเร็จ: $e')));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // ใช้ Selector เฉพาะ field ที่เกี่ยวกับ QR — ไม่ rebuild ทุกครั้งที่ mesh อัปเดต
    final userId = context.select<AppState, String>((s) => s.myUserId);
    final displayName = context.select<AppState, String>((s) => s.displayName);
    final crypto = context.read<AppState>().crypto;
    _syncNameField(displayName);

    if (_cachedName != displayName || _cachedQrData == null) {
      _cachedName = displayName;
      _cachedQrData = jsonEncode(crypto.identityJson(displayName: displayName));
    }
    final qrData = _cachedQrData!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ตัวตน (Identity)'),
        actions: [
          IconButton(
            tooltip: 'สแกน QR ด้วยกล้อง',
            onPressed: _openScanner,
            icon: const Icon(Icons.qr_code_scanner),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            Text(
              'User ID (Public Key Hash)',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SelectableText(
                    userId,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontFamily: 'monospace',
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                ),
                IconButton(
                  tooltip: 'คัดลอก Public Key Hash',
                  onPressed: () => _copyUserId(userId),
                  icon: const Icon(Icons.copy),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _name,
              focusNode: _nameFocus,
              decoration: const InputDecoration(
                labelText: 'ชื่อที่แสดงในชุมชน',
              ),
              onSubmitted: (v) =>
                  context.read<AppState>().setDisplayName(v.trim()),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () =>
                    context.read<AppState>().setDisplayName(_name.text.trim()),
                child: const Text('บันทึกชื่อ'),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.qr_code_2,
                          color: ResilNetTheme.emerald,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'My QR (id + pubKey + name)',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: QrImageView(
                          data: qrData,
                          size: 240,
                          version: QrVersions.auto,
                          errorCorrectionLevel: QrErrorCorrectLevel.M,
                          gapless: true,
                          eyeStyle: const QrEyeStyle(
                            eyeShape: QrEyeShape.square,
                            color: Colors.black,
                          ),
                          dataModuleStyle: const QrDataModuleStyle(
                            dataModuleShape: QrDataModuleShape.square,
                            color: Colors.black,
                          ),
                          errorStateBuilder: (context, error) {
                            return SizedBox(
                              width: 240,
                              height: 240,
                              child: Center(
                                child: Text(
                                  'สร้าง QR ไม่สำเร็จ\n$error',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: _saving
                            ? null
                            : () => _saveQrToGallery(qrData),
                        icon: _saving
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.save_alt),
                        label: Text(
                          _saving ? 'กำลังบันทึก...' : 'บันทึก QR ลงคลังภาพ',
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: _openScanner,
                        icon: const Icon(Icons.photo_camera),
                        label: const Text('เปิดกล้องสแกน QR'),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'ให้เพื่อนสแกนเพื่อบันทึก public key และ (ถ้าจำเป็น)ตั้งเป็น Verified Issuer',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white.withValues(alpha: 0.72),
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'ทิป: สามารถสแกน QR ในหน้าแชตเพื่อเติม Public Key ให้พร้อมส่ง E2EE',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

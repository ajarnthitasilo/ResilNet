import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/firmware_config.dart';
import '../services/firmware_service.dart';
import '../state/app_state.dart';
import '../l10n/l10n_ext.dart';
import 'esp32_ota_screen.dart';

/// ดาวน์โหลดและจัดการไฟล์เฟิร์มแวร์ ESP32
class Esp32FirmwareScreen extends StatefulWidget {
  const Esp32FirmwareScreen({super.key});

  @override
  State<Esp32FirmwareScreen> createState() => _Esp32FirmwareScreenState();
}

class _Esp32FirmwareScreenState extends State<Esp32FirmwareScreen> {
  final Map<FirmwareKind, bool> _fwDownloading = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<AppState>().firmware.refreshLocalInfo();
    });
  }

  Future<void> _downloadFirmware(FirmwareKind kind) async {
    if (_fwDownloading[kind] == true) return;
    setState(() => _fwDownloading[kind] = true);

    final fw = context.read<AppState>().firmware;

    void listener() {
      if (mounted) setState(() {});
    }

    fw.addListener(listener);

    try {
      final file = await fw.download(kind);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'ดาวน์โหลด ${kind.title} แล้ว (${_formatBytes(file.lengthSync())})',
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ดาวน์โหลดไม่สำเร็จ: $e')),
      );
    } finally {
      fw.removeListener(listener);
      if (mounted) {
        setState(() => _fwDownloading[kind] = false);
        await fw.refreshLocalInfo();
      }
    }
  }

  Future<void> _showOtaInfo() async {
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('แฟลชผ่าน BLE (OTA)'),
        content: const Text(
          'แอปรองรับการส่งไฟล์ .bin ผ่าน Bluetooth OTA แล้ว (Esp32OtaService)\n\n'
          'แต่บอร์ด ESP32 ต้องมี OTA service ในเฟิร์มแวร์ก่อน — '
          'ดูรายละเอียดใน docs/esp32_ble_ota.md\n\n'
          'ขั้นตอนตอนนี้:\n'
          '1. ดาวน์โหลด .bin ลงเครื่อง\n'
          '2. แฟลชครั้งแรกผ่าน USB (PlatformIO)\n'
          '3. อัปเดตครั้งถัดไปผ่านแอปเมื่อ firmware รองรับ OTA',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('ปิด'),
          ),
        ],
      ),
    );
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    }
    return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
  }

  Widget _firmwareTile(FirmwareKind kind, FirmwareService fw) {
    final downloading = _fwDownloading[kind] == true || fw.isDownloading(kind);
    final progress = fw.downloadProgress(kind);
    final hasLocal = fw.hasLocalFirmware(kind);
    final size = fw.localSizeBytes(kind);
    final modified = fw.localModifiedAt(kind);

    String? subtitle;
    if (hasLocal && size != null) {
      final when = modified != null
          ? ' · ${modified.toLocal().toString().substring(0, 16)}'
          : '';
      subtitle = 'มีในเครื่อง ${_formatBytes(size)}$when';
    } else {
      subtitle = kind.subtitle;
    }

    return Card(
      child: Column(
        children: [
          ListTile(
            leading: downloading
                ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      value: progress != null && progress > 0 ? progress : null,
                    ),
                  )
                : Icon(
                    hasLocal
                        ? Icons.check_circle_outline
                        : Icons.memory_outlined,
                    color: hasLocal ? Colors.greenAccent : null,
                  ),
            title: Text(kind.title),
            subtitle: Text(subtitle),
            trailing: downloading
                ? null
                : IconButton(
                    tooltip: 'ดาวน์โหลด',
                    icon: const Icon(Icons.download_outlined),
                    onPressed: () => _downloadFirmware(kind),
                  ),
          ),
          if (downloading && progress != null && progress > 0)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: LinearProgressIndicator(value: progress),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fw = context.watch<AppState>().firmware;

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.firmwareDownloadTitle)),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Text(
            'ดาวน์โหลดไฟล์ .bin เก็บในเครื่องเพื่อแฟลชบอร์ด ESP32 '
            '(แฟลชผ่าน BLE OTA เมื่อเฟิร์มแวร์บอร์ดรองรับ)',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white.withValues(alpha: 0.65),
            ),
          ),
          const SizedBox(height: 12),
          _firmwareTile(FirmwareKind.standaloneNode, fw),
          const SizedBox(height: 8),
          _firmwareTile(FirmwareKind.loraGateway, fw),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.bluetooth_connected),
              title: const Text('แฟลชเฟิร์มแวร์ผ่าน Bluetooth'),
              subtitle: const Text('เปิดหน้าจอ OTA — สแกนและอัปเดตบอร์ด ESP32'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const Esp32OtaScreen()),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('วิธีแฟลชและโปรโตคอล OTA'),
              subtitle: const Text('docs/esp32_ble_ota.md'),
              onTap: _showOtaInfo,
            ),
          ),
        ],
      ),
    );
  }
}

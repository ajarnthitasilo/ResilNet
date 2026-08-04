import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../core/docs_links.dart';
import '../services/firmware_config.dart';
import '../services/firmware_service.dart';
import '../state/app_state.dart';
import '../l10n/l10n_ext.dart';
import 'esp32_ota_screen.dart';
import '../app/glass_overlays.dart';

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
      // Hybrid: online-first แล้ว fallback cache → baseline ที่ฝังในแอป
      final resolved = await fw.ensureFirmware(kind);
      if (!mounted) return;
      final l10n = context.l10n;
      if (resolved.isUsable) {
        ScaffoldMessenger.of(context).showSnackBar(
          GlassSnackBar(
            content: Text(
              l10n.firmwareReadyFromSource(_sourceLabel(resolved.source)),
            ),
          ),
        );
      } else {
        final err = resolved.error ?? '';
        final msg = err.contains('minCompatible')
            ? l10n.firmwareBaselineIncompatible
            : err.contains('checksum')
                ? l10n.firmwareChecksumFailed
                : '${l10n.firmwareSourceUnavailable}${err.isEmpty ? '' : ' — $err'}';
        ScaffoldMessenger.of(context).showSnackBar(
          GlassSnackBar(content: Text(msg)),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        GlassSnackBar(content: Text('ดาวน์โหลดไม่สำเร็จ: $e')),
      );
    } finally {
      fw.removeListener(listener);
      if (mounted) {
        setState(() => _fwDownloading[kind] = false);
        await fw.refreshLocalInfo();
      }
    }
  }

  String _sourceLabel(FirmwareSource source) {
    final l10n = context.l10n;
    return switch (source) {
      FirmwareSource.onlineLatest => l10n.firmwareSourceOnline,
      FirmwareSource.offlineCached => l10n.firmwareSourceCached,
      FirmwareSource.offlineBundledBaseline => l10n.firmwareSourceBaseline,
      FirmwareSource.unavailable => l10n.firmwareSourceUnavailable,
    };
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
      final source = fw.localSource(kind);
      final sourceLabel = source != null ? ' · ${_sourceLabel(source)}' : '';
      subtitle = 'มีในเครื่อง ${_formatBytes(size)}$when$sourceLabel';
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
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.firmwareDownloadTitle)),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Text(
            'ดาวน์โหลดไฟล์ .bin เก็บในเครื่องเพื่อแฟลชบอร์ด ESP32 '
            '(แฟลชผ่าน BLE OTA เมื่อเฟิร์มแวร์บอร์ดรองรับ)',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: ResilNetTheme.mutedOnSurface(context, alpha: 0.72),
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
              leading: const Icon(Icons.menu_book_outlined),
              title: Text(l10n.firmwareOtaGuideTitle),
              subtitle: Text(l10n.firmwareOtaGuideSubtitle),
              trailing: const Icon(Icons.open_in_new, size: 20),
              onTap: () => DocsLinks.openOtaGuideOrSnack(context),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.download_for_offline_outlined),
              title: Text(l10n.firmwareWebDownloadsTitle),
              subtitle: Text(l10n.firmwareWebDownloadsSubtitle),
              trailing: const Icon(Icons.open_in_new, size: 20),
              onTap: () => DocsLinks.openFirmwareGuideOrSnack(context),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:provider/provider.dart';

import '../services/esp32_ota_service.dart';
import '../services/firmware_config.dart';
import '../state/app_state.dart';
import '../widgets/ota_progress_dialog.dart';

/// แฟลชเฟิร์มแวร์ ESP32 ผ่าน Bluetooth OTA
class Esp32OtaScreen extends StatefulWidget {
  const Esp32OtaScreen({super.key});

  @override
  State<Esp32OtaScreen> createState() => _Esp32OtaScreenState();
}

class _Esp32OtaScreenState extends State<Esp32OtaScreen> {
  late final Esp32OtaService _ota;
  FirmwareKind _selectedKind = FirmwareKind.standaloneNode;
  String? _selectedDeviceId;
  bool _flashing = false;

  @override
  void initState() {
    super.initState();
    _ota = Esp32OtaService();
    _ota.addListener(_onOtaUpdate);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppState>().firmware.refreshLocalInfo();
      _ota.startScan();
    });
  }

  void _onOtaUpdate() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _ota.removeListener(_onOtaUpdate);
    _ota.dispose();
    super.dispose();
  }

  Future<void> _startFlash() async {
    if (_flashing || _selectedDeviceId == null) return;

    final fw = context.read<AppState>().firmware;
    if (!fw.hasLocalFirmware(_selectedKind)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('ยังไม่มีไฟล์ ${_selectedKind.title} — ดาวน์โหลดจากตั้งค่าก่อน'),
        ),
      );
      return;
    }

    final file = await fw.localFile(_selectedKind);
    if (file == null) return;

    setState(() => _flashing = true);

    final progressState = ValueNotifier(
      const OtaProgressState(phaseLabel: 'กำลังเชื่อมต่อ…'),
    );
    void syncProgress() {
      final last = _ota.lastControl;
      final arq = (last?.isProgress == true &&
              last?.total != null &&
              last!.total! > 0)
          ? ((last.received ?? 0) / last.total!) * 100
          : _ota.progress * 100;
      progressState.value = progressState.value.copyWith(
        phaseLabel: _phaseLabel(_ota.phase),
        progress: _ota.progress,
        nackArqPercent: arq,
        statusMessage: _ota.statusMessage,
        bytesPerSecond: _ota.bytesPerSecond,
        dismiss: _ota.phase == OtaPhase.done || _ota.phase == OtaPhase.failed,
      );
    }

    _ota.addListener(syncProgress);
    unawaited(
      OtaProgressDialog.show(
        context,
        title: 'อัปเดตเฟิร์มแวร์ ESP32',
        state: progressState,
      ),
    );

    OtaResult result;
    try {
      result = await _ota.flashFirmware(
        deviceId: _selectedDeviceId!,
        firmwareFile: file,
        kind: _selectedKind,
      );
    } finally {
      _ota.removeListener(syncProgress);
      progressState.value = progressState.value.copyWith(dismiss: true);
      progressState.dispose();
      if (mounted) setState(() => _flashing = false);
    }

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          result.success
              ? 'แฟลชสำเร็จ — บอร์ดกำลังรีสตาร์ท'
              : (result.message ?? 'แฟลชไม่สำเร็จ'),
        ),
      ),
    );
  }

  String _formatSpeed(double bps) {
    if (bps < 1024) return '${bps.toStringAsFixed(0)} B/s';
    return '${(bps / 1024).toStringAsFixed(1)} KB/s';
  }

  String _phaseLabel(OtaPhase p) {
    return switch (p) {
      OtaPhase.idle => 'พร้อม',
      OtaPhase.scanning => 'กำลังสแกน…',
      OtaPhase.connecting => 'กำลังเชื่อมต่อ…',
      OtaPhase.negotiating => 'เจรจา OTA…',
      OtaPhase.transferring => 'กำลังส่งข้อมูล…',
      OtaPhase.verifying => 'ตรวจสอบ checksum…',
      OtaPhase.rebooting => 'กำลัง Reboot บอร์ด ESP32…',
      OtaPhase.done => 'เสร็จสมบูรณ์',
      OtaPhase.failed => 'ล้มเหลว',
    };
  }

  @override
  Widget build(BuildContext context) {
    final fw = context.watch<AppState>().firmware;
    final devices = _ota.discoveredDevices;
    final last = _ota.lastControl;

    return Scaffold(
      appBar: AppBar(
        title: const Text('แฟลชเฟิร์มแวร์ผ่าน Bluetooth'),
        actions: [
          IconButton(
            tooltip: 'สแกนใหม่',
            onPressed: _flashing ? null : () => _ota.startScan(),
            icon: const Icon(Icons.bluetooth_searching),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Text('เลือกเฟิร์มแวร์', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          SegmentedButton<FirmwareKind>(
            segments: FirmwareKind.values
                .map(
                  (k) => ButtonSegment<FirmwareKind>(
                    value: k,
                    label: Text(
                      k == FirmwareKind.standaloneNode ? 'Standalone' : 'LoRa GW',
                    ),
                  ),
                )
                .toList(),
            selected: {_selectedKind},
            onSelectionChanged: _flashing
                ? null
                : (s) {
                    if (s.isNotEmpty) setState(() => _selectedKind = s.first);
                  },
          ),
          const SizedBox(height: 8),
          ...FirmwareKind.values.map((k) {
            final has = fw.hasLocalFirmware(k);
            final size = fw.localSizeBytes(k);
            if (k != _selectedKind) return const SizedBox.shrink();
            return Text(
              has && size != null
                  ? 'ไฟล์: ${k.localFileName} (${_formatBytes(size)})'
                  : 'ยังไม่ได้ดาวน์โหลด — ไปที่ตั้งค่า',
              style: Theme.of(context).textTheme.bodySmall,
            );
          }),
          const SizedBox(height: 16),
          Text('บอร์ด ESP32 ใกล้เคียง', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          if (_ota.phase == OtaPhase.scanning && devices.isEmpty)
            const LinearProgressIndicator(),
          if (devices.isEmpty && _ota.phase != OtaPhase.scanning)
            Text(
              'ไม่พบบอร์ด — ให้ ESP32 เปิดอยู่และอยู่ใกล้',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ...devices.map((d) => _deviceTile(d)),
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('สถานะ: ${_phaseLabel(_ota.phase)}',
                      style: Theme.of(context).textTheme.titleSmall),
                  if (_ota.statusMessage != null) ...[
                    const SizedBox(height: 6),
                    Text(_ota.statusMessage!),
                  ],
                  const SizedBox(height: 12),
                  LinearProgressIndicator(value: _ota.progress.clamp(0, 1)),
                  const SizedBox(height: 8),
                  Text(
                    '${(_ota.progress * 100).toStringAsFixed(1)}% · '
                    '${_formatSpeed(_ota.bytesPerSecond)}',
                  ),
                  if (last != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      'ACK/Status: ${last.op}'
                      '${last.stage != null ? ' (${last.stage})' : ''}'
                      '${last.msg != null ? ' — ${last.msg}' : ''}',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: (_flashing || _selectedDeviceId == null)
                ? null
                : _startFlash,
            icon: _flashing
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.system_update_alt),
            label: Text(_flashing ? 'กำลังแฟลช…' : 'เริ่มแฟลช OTA'),
          ),
        ],
      ),
    );
  }

  Widget _deviceTile(DiscoveredDevice d) {
    final selected = _selectedDeviceId == d.id;
    return Card(
      child: ListTile(
        leading: Icon(
          selected ? Icons.bluetooth_connected : Icons.bluetooth,
          color: selected ? Colors.greenAccent : null,
        ),
        title: Text(d.name.isEmpty ? 'ESP32' : d.name),
        subtitle: Text(d.id),
        trailing: selected ? const Icon(Icons.check_circle) : null,
        onTap: _flashing
            ? null
            : () => setState(() => _selectedDeviceId = d.id),
      ),
    );
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
  }
}

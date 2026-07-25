import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/app_version.dart';
import '../state/app_state.dart';
import 'esp32_firmware_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _clearing = false;

  Future<void> _confirmClearMessages() async {
    if (_clearing) return;

    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('ล้างข้อความทั้งหมด?'),
          content: const Text(
            'การดำเนินการนี้จะลบข้อความแชตทั้งหมดในเครื่องนี้\n'
            'รายชื่อเพื่อน (peers) และชื่อเล่นจะไม่ถูกลบ',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: const Text('ยกเลิก'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () => Navigator.of(ctx).pop(true),
              child: const Text('ล้างข้อมูล'),
            ),
          ],
        );
      },
    );

    if (ok != true || !mounted) return;

    setState(() => _clearing = true);
    try {
      await context.read<AppState>().clearAllMessages();
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('ล้างข้อมูลเรียบร้อยแล้ว')));
    } finally {
      if (mounted) setState(() => _clearing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('การตั้งค่า')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Text('อุปกรณ์', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.download_outlined),
              title: const Text('ดาวน์โหลด/อัปเดตเฟิร์มแวร์ ESP32'),
              subtitle: const Text(
                'ดาวน์โหลดไฟล์ .bin และอัปเดตแอป/บอร์ด ESP32 ผ่าน OTA',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const Esp32FirmwareScreen()),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          Text('จัดการข้อมูล', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            'ลบข้อความในเครื่องเพื่อลดขนาดฐานข้อมูล — ไม่กระทบตัวตน คีย์ หรือรายชื่อเพื่อน',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white.withValues(alpha: 0.65),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.delete_sweep_outlined,
                color: _clearing ? Colors.white38 : Colors.redAccent,
              ),
              title: const Text('ล้างข้อความทั้งหมด'),
              subtitle: const Text('ลบแชตทั้งหมดในเครื่อง'),
              trailing: _clearing
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.chevron_right),
              enabled: !_clearing,
              onTap: _confirmClearMessages,
            ),
          ),
          const SizedBox(height: 32),
          Center(
            child: Text(
              'version $kAppVersion',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Colors.white.withValues(alpha: 0.45),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

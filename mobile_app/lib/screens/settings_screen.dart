import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/app_state.dart';
import 'esp32_firmware_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _clearing = false;
  bool _updatingTrusted = false;

  Future<void> _confirmClearMessages() async {
    if (_clearing) return;

    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('ล้างข้อความทั้งหมด?'),
          content: const Text(
            'การดำเนินการนี้จะลบข้อความแชตและประกาศทั้งหมดในเครื่องนี้\n'
            'รายชื่อเพื่อน (peers) และชื่อเล่นจะไม่ถูกลบ\n\n'
            'หากเชื่อมต่อ Supabase ข้อความที่คุณส่งขึ้น cloud จะถูกลบด้วย',
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

  Future<void> _updateTrustedKeys() async {
    if (_updatingTrusted) return;
    setState(() => _updatingTrusted = true);
    try {
      final s = context.read<AppState>();
      if (s.supabaseSync == null) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('ต้องเชื่อมต่ออินเทอร์เน็ตและ Supabase ก่อนอัปเดต'),
          ),
        );
        return;
      }
      final ok = await s.refreshTrustedKeysFromSupabase();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            ok
                ? 'อัปเดตรายชื่อสิทธิ์ประกาศเรียบร้อยแล้ว'
                : 'ไม่มีการอัปเดต (ไฟล์ไม่ใหม่กว่าที่มีอยู่)',
          ),
        ),
      );
      setState(() {});
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('อัปเดตไม่สำเร็จ: $e')));
    } finally {
      if (mounted) setState(() => _updatingTrusted = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final m = s.trustedKeys.manifest;

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
              title: const Text('ดาวน์โหลดเฟิร์มแวร์ ESP32'),
              subtitle: const Text(
                'ดาวน์โหลดไฟล์ .bin สำหรับ Standalone Node และ LoRa Gateway',
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
          Text(
            'รายชื่อสิทธิ์ประกาศอย่างเป็นทางการ',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'เวอร์ชัน ${m.version} · อัปเดต ${m.timestamp > 0 ? DateTime.fromMillisecondsSinceEpoch(m.timestamp).toLocal() : 'ค่าเริ่มต้นในแอป'} · ${m.issuers.length} รายชื่อ',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.55),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: _updatingTrusted
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.verified_user_outlined),
              title: const Text('ตรวจสอบรายชื่อสิทธิ์ประกาศอย่างเป็นทางการ'),
              trailing: const Icon(Icons.cloud_download_outlined),
              enabled: !_updatingTrusted,
              onTap: _updateTrustedKeys,
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
              subtitle: const Text('ลบแชตและประกาศทั้งหมด'),
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
        ],
      ),
    );
  }
}

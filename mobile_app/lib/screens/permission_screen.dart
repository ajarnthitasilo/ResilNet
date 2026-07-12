import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../state/app_state.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  bool _requesting = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppState>().refreshPermissions();
    });
  }

  Future<void> _request() async {
    debugPrint('[ResilNet] PermissionScreen: button pressed');
    final s = context.read<AppState>();
    if (!s.isReady) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ระบบยังไม่พร้อม — รอสักครู่แล้วลองใหม่')),
      );
      return;
    }
    setState(() => _requesting = true);
    try {
      final granted = await s.requestPermissions();
      debugPrint(
        '[ResilNet] PermissionScreen: request finished granted=$granted',
      );
      if (!mounted) return;
      if (!granted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'ยังไม่ได้สิทธิ์ครบ — เปิด Settings > ResilNet แล้วอนุญาต Bluetooth/Location',
            ),
          ),
        );
      }
    } catch (e, st) {
      debugPrint('[ResilNet] PermissionScreen: request ERROR $e\n$st');
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('ขอสิทธิ์ล้มเหลว: $e')));
    } finally {
      if (mounted) setState(() => _requesting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(title: const Text('สื่อสารชุมชนบ้านปู่คำ')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              'ขอสิทธิ์เพื่อเริ่มใช้งานเครือข่าย BLE Mesh',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'แอปต้องใช้ Bluetooth (สแกน/เชื่อมต่อ/โฆษณาตัวตน) และ Location (รองรับอุปกรณ์ Android รุ่นเก่า) เพื่อสื่อสารแบบออฟไลน์ในชุมชนบ้านปู่คำ',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white.withValues(alpha: 0.78),
                height: 1.4,
              ),
            ),
            const SizedBox(height: 18),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.shield, color: ResilNetTheme.emerald),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'End-to-End Encryption (E2EE)\nโหนดทางผ่านจะไม่สามารถอ่านเนื้อหาข้อความได้',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _requesting ? null : _request,
                child: _requesting
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(
                        s.permissionsGranted
                            ? 'สิทธิ์พร้อมใช้งาน'
                            : 'ขอสิทธิ์และเริ่มใช้งาน',
                      ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'ResilNet Architecture • Store-and-Forward Multi-hop',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.55),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

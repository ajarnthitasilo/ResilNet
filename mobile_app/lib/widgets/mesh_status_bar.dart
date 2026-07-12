import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../core/resilnet_protocol.dart';
import '../state/app_state.dart';

/// แถบสถานะ BLE + Cloud Sync
/// แสดง: ค้นหา / กำลังซิงก์ / สแตนด์บาย + สถานะอินเทอร์เน็ต
class MeshStatusBar extends StatelessWidget {
  const MeshStatusBar({super.key});

  String _phaseLabel(SyncPhase phase) {
    switch (phase) {
      case SyncPhase.scanning:
        return 'BLE: กำลังค้นหา Node';
      case SyncPhase.syncing:
        return 'BLE: กำลังซิงก์กับ ESP32';
      case SyncPhase.cloudSync:
        return 'Cloud: กำลังซิงก์';
      case SyncPhase.idle:
        return 'BLE: สแตนด์บาย';
    }
  }

  Color _phaseColor(SyncPhase phase) {
    switch (phase) {
      case SyncPhase.scanning:
        return Colors.amberAccent;
      case SyncPhase.syncing:
        return ResilNetTheme.emerald;
      case SyncPhase.cloudSync:
        return Colors.lightBlueAccent;
      case SyncPhase.idle:
        return Colors.white24;
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    if (!s.isReady) {
      return const SizedBox.shrink();
    }
    final phase = s.syncPhase;
    final online = s.cloud.isOnline;
    final meshRunning = s.mesh.running;
    final activePeers = s.mesh.nearbyPeers.length;
    final chunkProgress = s.chunkTransferState;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0B1224),
        border: Border(
          bottom: BorderSide(color: Colors.white.withValues(alpha: 0.06)),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: meshRunning ? _phaseColor(phase) : Colors.white24,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  meshRunning ? _phaseLabel(phase) : 'BLE: ต้องขอสิทธิ์ก่อน',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              Icon(
                online ? Icons.wifi : Icons.wifi_off,
                size: 18,
                color: online ? ResilNetTheme.emerald : Colors.white38,
              ),
              const SizedBox(width: 6),
              Text(
                online ? 'ออนไลน์' : 'ออฟไลน์',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: online ? ResilNetTheme.emerald : Colors.white38,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '$activePeers เพื่อนใกล้เคียง • รัศมีซิงก์ ~${ResilNetProtocol.syncRangeMeters}m',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.white.withValues(alpha: 0.55),
            ),
          ),
          if (s.isGatewayWifiActive) ...[
            const SizedBox(height: 4),
            Text(
              chunkProgress != null
                  ? 'Gateway UDP: ${chunkProgress.label}'
                  : 'Gateway UDP: พร้อมส่ง',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: chunkProgress != null
                    ? ResilNetTheme.emerald
                    : Colors.white.withValues(alpha: 0.45),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

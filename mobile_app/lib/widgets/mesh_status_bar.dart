import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../core/resilnet_protocol.dart';
import '../l10n/l10n_ext.dart';
import '../models/ble_radio_state.dart';
import '../state/app_state.dart';

/// แถบสถานะ BLE + LoRa + Nostr relays
class MeshStatusBar extends StatelessWidget {
  const MeshStatusBar({super.key});

  String _phaseLabel(AppLocalizations l10n, SyncPhase phase) {
    switch (phase) {
      case SyncPhase.scanning:
        return l10n.meshBleScanning;
      case SyncPhase.syncing:
        return l10n.meshBleSyncing;
      case SyncPhase.cloudSync:
        return l10n.meshNostrPublishing;
      case SyncPhase.idle:
        return l10n.meshBleIdle;
    }
  }

  String _radioLabel(AppLocalizations l10n, BleRadioState state) {
    return switch (state) {
      BleRadioState.needsPermission => l10n.meshBleNeedsPermission,
      BleRadioState.pausedForCamera => l10n.meshBlePausedCamera,
      BleRadioState.stopped => l10n.meshBleStopped,
      BleRadioState.running => l10n.meshBleIdle,
    };
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
    final l10n = context.l10n;
    if (!s.isReady) {
      return const SizedBox.shrink();
    }
    final radioState = s.bleRadioState;
    final phase = s.syncPhase;
    final meshRunning = radioState == BleRadioState.running;
    final nostrOnline = s.nostr.isOnline;
    final activePeers = s.mesh.nearbyPeers.length;
    final chunkProgress = s.chunkTransferState;
    final relays = '${s.nostr.connectedRelays}/${s.nostr.totalRelays}';
    final lora = s.resilnet.loraAvailable
        ? l10n.meshLoraReady
        : l10n.meshLoraNotReady;
    final showRestart = radioState == BleRadioState.stopped ||
        radioState == BleRadioState.needsPermission ||
        radioState == BleRadioState.pausedForCamera;

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
                  meshRunning
                      ? _phaseLabel(l10n, phase)
                      : _radioLabel(l10n, radioState),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              if (showRestart)
                TextButton(
                  onPressed: () => s.ensureBleRadiosStarted(),
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                  child: Text(l10n.meshBleRestart),
                ),
              Icon(
                nostrOnline ? Icons.hub_outlined : Icons.cloud_off,
                size: 18,
                color: nostrOnline ? ResilNetTheme.emerald : Colors.white38,
              ),
              const SizedBox(width: 6),
              Text(
                nostrOnline
                    ? l10n.meshNostrOnline(relays)
                    : l10n.meshNostrOffline,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color:
                          nostrOnline ? ResilNetTheme.emerald : Colors.white38,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            l10n.meshFooter(
              activePeers,
              lora,
              ResilNetProtocol.syncRangeMeters,
            ),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Colors.white.withValues(alpha: 0.55),
                ),
          ),
          if (s.isGatewayWifiActive) ...[
            const SizedBox(height: 4),
            Text(
              chunkProgress != null
                  ? l10n.meshGatewayProgress(chunkProgress.label)
                  : l10n.meshGatewayReady,
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

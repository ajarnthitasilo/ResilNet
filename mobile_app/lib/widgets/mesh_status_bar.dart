import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../core/gateway_caps_coordinator.dart';
import '../core/resilnet_protocol.dart';
import '../l10n/l10n_ext.dart';
import '../models/ble_radio_state.dart';
import '../models/gateway_radio_mode.dart';
import '../state/app_state.dart';
import '../app/glass_overlays.dart';

/// แถบสถานะ BLE + LoRa + Nostr relays
class MeshStatusBar extends StatelessWidget {
  const MeshStatusBar({super.key});

  String _phaseLabel(AppLocalizations l10n, SyncPhase phase, {int meshPeers = 0}) {
    switch (phase) {
      case SyncPhase.scanning:
        // Legacy ESP32 path — prefer mesh peer wording when shown.
        return l10n.meshBleEsp32Scanning;
      case SyncPhase.syncing:
        return l10n.meshBleSyncing;
      case SyncPhase.cloudSync:
        return l10n.meshNostrPublishing;
      case SyncPhase.idle:
        return meshPeers > 0
            ? l10n.meshBlePeersNearby(meshPeers)
            : l10n.meshBleIdle;
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

  Color _phaseColor(BuildContext context, SyncPhase phase) {
    switch (phase) {
      case SyncPhase.scanning:
        return Colors.amberAccent;
      case SyncPhase.syncing:
        return ResilNetTheme.emerald;
      case SyncPhase.cloudSync:
        return Colors.lightBlueAccent;
      case SyncPhase.idle:
        return ResilNetTheme.mutedOnSurface(context, alpha: 0.28);
    }
  }

  String _meshFooterRadioLabel(
    AppLocalizations l10n,
    AppState s,
    GatewayCaps? caps,
  ) {
    final halowActive = s.resilnet.halowAvailable &&
        s.gatewayRadioMode != GatewayRadioMode.lora;
    if (halowActive) {
      if (caps?.halowStub == true) return l10n.meshHalowStubReady;
      if (caps?.halowLinkUp == true) return l10n.meshHalowRealReady;
      return l10n.meshHalowNotReady;
    }
    return s.resilnet.loraAvailable
        ? l10n.meshLoraReady
        : l10n.meshLoraNotReady;
  }

  String _gatewayDetailLabel(AppLocalizations l10n, AppState s) {
    if (s.gatewayCapsPhase == GatewayCapsPhase.waitingCaps) {
      return l10n.gatewayCapsWaiting;
    }
    final caps = s.resilnet.gatewayCaps;
    final halowActive = s.resilnet.halowAvailable &&
        s.gatewayRadioMode != GatewayRadioMode.lora;
    if (halowActive) {
      if (caps?.halowStub == true) return l10n.meshGatewayHalowStubReady;
      if (caps?.halowLinkUp == true) return l10n.meshGatewayHalowRealReady;
      return l10n.meshHalowNotReady;
    }
    return l10n.meshGatewayReady;
  }

  Future<void> _onNostrTap(BuildContext context, AppState s) async {
    final l10n = context.l10n;
    final ok = await s.reconnectNostrAndSyncGeo();
    if (!context.mounted) return;
    final err = s.nostrLastError;
    ScaffoldMessenger.of(context).showSnackBar(
      GlassSnackBar(
        content: Text(
          ok
              ? l10n.nostrReconnectOk(
                  s.nostr.connectedRelays,
                  s.nostr.totalRelays,
                )
              : (err != null && err.isNotEmpty)
                  ? l10n.nostrReconnectFailedDetail(err)
                  : l10n.nostrReconnectFailed,
        ),
      ),
    );
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
    // 0/0 = not initialized; 0/N = init ok but no relay up yet.
    final relays = s.nostrRelayLabel;
    final caps = s.resilnet.gatewayCaps;
    final waitingCaps = s.gatewayCapsPhase == GatewayCapsPhase.waitingCaps;
    final lora = waitingCaps
        ? l10n.gatewayCapsWaiting
        : _meshFooterRadioLabel(l10n, s, caps);
    final showRestart = radioState == BleRadioState.stopped ||
        radioState == BleRadioState.needsPermission ||
        radioState == BleRadioState.pausedForCamera;

    return Container(
      decoration: BoxDecoration(
        color: ResilNetTheme.barSurface(context),
        border: Border(
          bottom: BorderSide(color: ResilNetTheme.barBorder(context)),
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
                  color: meshRunning
                      ? _phaseColor(context, phase)
                      : ResilNetTheme.mutedOnSurface(context, alpha: 0.28),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  meshRunning
                      ? _phaseLabel(l10n, phase, meshPeers: activePeers)
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
              InkWell(
                onTap: s.nostrReconnecting
                    ? null
                    : () => unawaited(_onNostrTap(context, s)),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (s.nostrReconnecting)
                        const SizedBox(
                          width: 14,
                          height: 14,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      else
                        Icon(
                          nostrOnline ? Icons.hub_outlined : Icons.cloud_off,
                          size: 18,
                          color: nostrOnline
                              ? ResilNetTheme.emerald
                              : Colors.orangeAccent,
                        ),
                      const SizedBox(width: 6),
                      Text(
                        l10n.meshNostrOnline(relays),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: nostrOnline
                                  ? ResilNetTheme.emerald
                                  : Colors.orangeAccent,
                            ),
                      ),
                    ],
                  ),
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
                  color: ResilNetTheme.mutedOnSurface(context),
                ),
          ),
          if (s.isGatewayWifiActive) ...[
            const SizedBox(height: 4),
            Text(
              chunkProgress != null
                  ? l10n.meshGatewayProgress(chunkProgress.label)
                  : _gatewayDetailLabel(l10n, s),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: chunkProgress != null
                        ? ResilNetTheme.emerald
                        : ResilNetTheme.mutedOnSurface(context, alpha: 0.45),
                  ),
            ),
          ],
        ],
      ),
    );
  }
}

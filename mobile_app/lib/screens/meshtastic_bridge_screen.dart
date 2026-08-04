import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/theme.dart';
import '../core/meshtastic_bridge_core.dart';
import '../core/meshtastic_mqtt_json.dart';
import '../l10n/l10n_ext.dart';
import '../services/mqtt_meshtastic_transport.dart';
import '../state/app_state.dart';
import '../app/glass_overlays.dart';

/// Settings → Devices → Meshtastic bridge (Mode A / B mutex, text-only).
class MeshtasticBridgeScreen extends StatefulWidget {
  const MeshtasticBridgeScreen({super.key});

  @override
  State<MeshtasticBridgeScreen> createState() => _MeshtasticBridgeScreenState();
}

class _MeshtasticBridgeScreenState extends State<MeshtasticBridgeScreen> {
  final _compose = TextEditingController();
  final _simulate = TextEditingController(
    text: 'Hello from Meshtastic (demo)',
  );
  final _host = TextEditingController();
  final _port = TextEditingController(text: '1883');
  final _topicIn = TextEditingController(text: 'msh/2/json/#');
  final _topicOut = TextEditingController(text: 'msh/2/json/mqtt/');
  final _user = TextEditingController();
  final _pass = TextEditingController();
  final _region = TextEditingController();
  final _topicRoot = TextEditingController(text: 'msh/2/json');
  final _downlinkCh = TextEditingController(text: 'mqtt');
  final _gatewayFrom = TextEditingController();
  final _channelIndex = TextEditingController();
  bool _busy = false;
  bool _prefsLoaded = false;
  bool _useTls = false;
  bool _autoReconnect = false;

  @override
  void initState() {
    super.initState();
    unawaited(_loadMqttFields());
  }

  Future<void> _loadMqttFields() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      _host.text = prefs.getString('resilnet_meshtastic_mqtt_host') ?? '';
      _port.text =
          '${prefs.getInt('resilnet_meshtastic_mqtt_port') ?? 1883}';
      _topicIn.text =
          prefs.getString('resilnet_meshtastic_mqtt_topic_in') ?? 'msh/2/json/#';
      _topicOut.text = prefs.getString('resilnet_meshtastic_mqtt_topic_out') ??
          'msh/2/json/mqtt/';
      _user.text = prefs.getString('resilnet_meshtastic_mqtt_user') ?? '';
      _region.text = prefs.getString('resilnet_meshtastic_mqtt_region') ?? '';
      _topicRoot.text =
          prefs.getString('resilnet_meshtastic_mqtt_root') ?? 'msh/2/json';
      _downlinkCh.text =
          prefs.getString('resilnet_meshtastic_mqtt_downlink_ch') ?? 'mqtt';
      final from = prefs.getInt('resilnet_meshtastic_mqtt_gateway_from') ?? 0;
      _gatewayFrom.text = from == 0 ? '' : '$from';
      final ch = prefs.getInt('resilnet_meshtastic_mqtt_channel_index');
      _channelIndex.text = ch == null ? '' : '$ch';
      _useTls = prefs.getBool('resilnet_meshtastic_mqtt_use_tls') ?? false;
      _autoReconnect =
          prefs.getBool('resilnet_meshtastic_mqtt_auto_reconnect') ?? false;
      _pass.clear();
      _prefsLoaded = true;
    });
  }

  @override
  void dispose() {
    _compose.dispose();
    _simulate.dispose();
    _host.dispose();
    _port.dispose();
    _topicIn.dispose();
    _topicOut.dispose();
    _user.dispose();
    _pass.dispose();
    _region.dispose();
    _topicRoot.dispose();
    _downlinkCh.dispose();
    _gatewayFrom.dispose();
    _channelIndex.dispose();
    super.dispose();
  }

  Future<void> _setMode(AppState s, MeshtasticBridgeMode mode) async {
    setState(() => _busy = true);
    try {
      await s.setMeshtasticBridgeMode(mode);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _applyTopicPreset() {
    final root = resolveMeshtasticTopicRoot(
      region: _region.text,
      topicRoot: _topicRoot.text,
    );
    setState(() {
      _topicRoot.text = root;
      _topicIn.text = buildMeshtasticTopicIn(root);
      _topicOut.text = buildMeshtasticTopicOut(
        root,
        downlinkChannel: _downlinkCh.text,
      );
    });
  }

  int get _gatewayFromNodeId {
    final fromRaw = _gatewayFrom.text.trim();
    return meshtasticNodeIdToDecimal(fromRaw) ?? int.tryParse(fromRaw) ?? 0;
  }

  bool _canSendMqttEgress({
    required bool useMqtt,
    required bool canEgress,
  }) {
    if (!canEgress) return false;
    if (!useMqtt) return true;
    return _gatewayFromNodeId != 0;
  }

  Future<void> _saveMqtt(AppState s, {bool clearPassword = false}) async {
    var port = int.tryParse(_port.text.trim()) ?? (_useTls ? 8883 : 1883);
    final fromRaw = _gatewayFrom.text.trim();
    final fromNode = meshtasticNodeIdToDecimal(fromRaw) ??
        int.tryParse(fromRaw) ??
        0;
    final chRaw = _channelIndex.text.trim();
    final chIdx = chRaw.isEmpty ? null : int.tryParse(chRaw);
    await s.saveMeshtasticMqttConfig(
      host: _host.text,
      port: port,
      topicIn: _topicIn.text,
      topicOut: _topicOut.text,
      username: _user.text,
      password: clearPassword ? '' : _pass.text,
      clearPassword: clearPassword,
      useTls: _useTls,
      autoReconnect: _autoReconnect,
      gatewayFromNodeId: fromNode,
      downlinkChannelIndex: chIdx,
      region: _region.text,
      topicRoot: _topicRoot.text,
      downlinkChannelName: _downlinkCh.text,
    );
    if (clearPassword || _pass.text.isNotEmpty) {
      _pass.clear();
    }
  }

  String _errLabel(AppLocalizations l10n, String? code) {
    switch (code) {
      case 'mode_not_ingest':
        return l10n.mtBridgeErrModeIngest;
      case 'mode_not_egress':
        return l10n.mtBridgeErrModeEgress;
      case 'rate_limited':
        return l10n.mtBridgeErrRate;
      case 'dedupe':
        return l10n.mtBridgeErrDedupe;
      case 'loop_via_mt':
      case 'loop_via_rn':
        return l10n.mtBridgeErrLoop;
      case 'empty':
        return l10n.mtBridgeErrEmpty;
      case 'publish_failed':
        return l10n.mtBridgeErrPublish;
      case 'not_connected':
        return l10n.mtBridgeErrNotConnected;
      case 'missing_host':
        return l10n.mtBridgeErrMissingHost;
      case 'missing_topic':
        return l10n.mtBridgeErrMissingTopic;
      case 'missing_from_node':
        return l10n.mtBridgeErrMissingFromNode;
      case 'connect_failed':
        return l10n.mtBridgeErrConnect;
      case 'connect_failed_tls':
        return l10n.mtBridgeErrConnectTls;
      default:
        return code ?? '';
    }
  }

  String _mqttStatusLabel(
    AppLocalizations l10n,
    MqttBridgeConnectionState st,
  ) {
    switch (st) {
      case MqttBridgeConnectionState.connected:
        return l10n.mtBridgeMqttConnected;
      case MqttBridgeConnectionState.connecting:
        return l10n.mtBridgeMqttConnecting;
      case MqttBridgeConnectionState.error:
        return l10n.mtBridgeMqttError;
      case MqttBridgeConnectionState.disconnected:
        return l10n.mtBridgeMqttDisconnected;
    }
  }

  String _statusLine(
    AppLocalizations l10n, {
    required MeshtasticBridgeMode mode,
    required bool useMqtt,
    required MqttBridgeConnectionState mqttState,
  }) {
    final modeLabel = switch (mode) {
      MeshtasticBridgeMode.off => l10n.mtBridgeModeOff,
      MeshtasticBridgeMode.ingestA => l10n.mtBridgeModeA,
      MeshtasticBridgeMode.egressB => l10n.mtBridgeModeB,
    };
    if (!useMqtt) {
      return l10n.mtBridgeStatusLine(modeLabel, l10n.mtBridgeTransportDemo);
    }
    final mqtt = _mqttStatusLabel(l10n, mqttState);
    return l10n.mtBridgeStatusLine(modeLabel, mqtt);
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final l10n = context.l10n;
    final bridge = s.meshtasticBridge;
    final mode = bridge?.mode ?? MeshtasticBridgeMode.off;
    final scheme = Theme.of(context).colorScheme;
    final onSurface = scheme.onSurface;
    final narrow = MediaQuery.sizeOf(context).width < 400;
    final useMqtt = bridge?.useMqtt ?? false;
    final canSend = bridge?.canEgress ?? false;
    final allowSend = _canSendMqttEgress(
      useMqtt: useMqtt,
      canEgress: canSend,
    );
    final history = bridge?.egressHistory ?? const <String>[];
    final mqttState = bridge?.mqttConnectionState ??
        MqttBridgeConnectionState.disconnected;
    final missingGatewayFrom =
        useMqtt && mode.isEgress && _gatewayFromNodeId == 0;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.mtBridgeTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          Text(
            l10n.mtBridgeIntro,
            style: TextStyle(
              color: onSurface.withValues(alpha: 0.75),
              height: 1.35,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: scheme.surfaceContainerHighest.withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              _statusLine(
                l10n,
                mode: mode,
                useMqtt: useMqtt,
                mqttState: mqttState,
              ),
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: onSurface.withValues(alpha: 0.85),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.mtBridgeModeLabel,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: onSurface.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 8),
          SegmentedButton<MeshtasticBridgeMode>(
            style: SegmentedButton.styleFrom(
              visualDensity: VisualDensity.compact,
              textStyle: TextStyle(fontSize: narrow ? 11 : 13),
            ),
            segments: [
              ButtonSegment(
                value: MeshtasticBridgeMode.off,
                label: Text(
                  narrow ? l10n.mtBridgeModeOffShort : l10n.mtBridgeModeOff,
                ),
                icon: const Icon(Icons.power_settings_new, size: 16),
              ),
              ButtonSegment(
                value: MeshtasticBridgeMode.ingestA,
                label: Text(
                  narrow ? l10n.mtBridgeModeAShort : l10n.mtBridgeModeA,
                ),
                icon: const Icon(Icons.download, size: 16),
              ),
              ButtonSegment(
                value: MeshtasticBridgeMode.egressB,
                label: Text(
                  narrow ? l10n.mtBridgeModeBShort : l10n.mtBridgeModeB,
                ),
                icon: const Icon(Icons.upload, size: 16),
              ),
            ],
            selected: {mode},
            onSelectionChanged: _busy || bridge == null
                ? null
                : (set) {
                    if (set.isEmpty) return;
                    unawaited(_setMode(s, set.first));
                  },
          ),
          const SizedBox(height: 8),
          Text(
            l10n.mtBridgeMutexHint,
            style: TextStyle(
              fontSize: 12,
              color: onSurface.withValues(alpha: 0.55),
            ),
          ),
          if (bridge?.lastError != null && bridge!.lastError!.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              _errLabel(l10n, bridge.lastError),
              style: TextStyle(color: scheme.error, fontSize: 13),
            ),
          ],
          const SizedBox(height: 20),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.mtBridgeUseMqtt),
            subtitle: Text(l10n.mtBridgeUseMqttHint),
            value: useMqtt,
            onChanged: bridge == null
                ? null
                : (v) => unawaited(s.setMeshtasticUseMqtt(v)),
          ),
          if (useMqtt && _prefsLoaded) ...[
            TextField(
              controller: _host,
              decoration: InputDecoration(
                labelText: l10n.mtBridgeMqttHost,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _port,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: l10n.mtBridgeMqttPort,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _gatewayFrom,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                labelText: l10n.mtBridgeMqttGatewayFrom,
                helperText: l10n.mtBridgeMqttGatewayFromHint,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _mqttStatusLabel(l10n, mqttState),
              style: TextStyle(
                fontSize: 13,
                color: bridge?.mqttConnected == true
                    ? ResilNetTheme.channelGreen
                    : onSurface.withValues(alpha: 0.65),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                OutlinedButton(
                  onPressed: _busy
                      ? null
                      : () async {
                          final messenger = ScaffoldMessenger.of(context);
                          final saved = l10n.mtBridgeMqttSaved;
                          setState(() => _busy = true);
                          try {
                            await _saveMqtt(s);
                            if (!mounted) return;
                            messenger.showSnackBar(
                              GlassSnackBar(content: Text(saved)),
                            );
                          } finally {
                            if (mounted) setState(() => _busy = false);
                          }
                        },
                  child: Text(l10n.mtBridgeMqttSave),
                ),
                FilledButton(
                  onPressed: _busy || bridge == null
                      ? null
                      : () async {
                          final messenger = ScaffoldMessenger.of(context);
                          final connectedMsg = l10n.mtBridgeMqttConnected;
                          final errFallback = l10n.mtBridgeErrConnect;
                          setState(() => _busy = true);
                          try {
                            await _saveMqtt(s);
                            final ok = await s.connectMeshtasticMqtt();
                            if (!mounted) return;
                            final errCode = bridge.mqttTransport.lastError;
                            final err = errCode == null || errCode.isEmpty
                                ? errFallback
                                : _errLabel(l10n, errCode);
                            messenger.showSnackBar(
                              GlassSnackBar(
                                content: Text(ok ? connectedMsg : err),
                              ),
                            );
                          } finally {
                            if (mounted) setState(() => _busy = false);
                          }
                        },
                  child: Text(l10n.mtBridgeMqttConnect),
                ),
                TextButton(
                  onPressed: _busy || bridge == null
                      ? null
                      : () => unawaited(s.disconnectMeshtasticMqtt()),
                  child: Text(l10n.mtBridgeMqttDisconnect),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ExpansionTile(
              tilePadding: EdgeInsets.zero,
              childrenPadding: const EdgeInsets.only(bottom: 8),
              title: Text(
                l10n.mtBridgeMqttAdvanced,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: onSurface.withValues(alpha: 0.9),
                ),
              ),
              subtitle: Text(
                l10n.mtBridgeMqttAdvancedHint,
                style: TextStyle(
                  fontSize: 12,
                  color: onSurface.withValues(alpha: 0.55),
                ),
              ),
              children: [
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.mtBridgeMqttTls),
                  subtitle: Text(l10n.mtBridgeMqttTlsHint),
                  value: _useTls,
                  onChanged: (v) {
                    setState(() {
                      _useTls = v;
                      final p = int.tryParse(_port.text.trim());
                      if (v && (p == null || p == 1883)) {
                        _port.text = '8883';
                      } else if (!v && (p == null || p == 8883)) {
                        _port.text = '1883';
                      }
                    });
                  },
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.mtBridgeMqttAutoReconnect),
                  subtitle: Text(l10n.mtBridgeMqttAutoReconnectHint),
                  value: _autoReconnect,
                  onChanged: (v) => setState(() => _autoReconnect = v),
                ),
                Text(
                  l10n.mtBridgeMqttTopicHelpers,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: onSurface.withValues(alpha: 0.85),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _region,
                  decoration: InputDecoration(
                    labelText: l10n.mtBridgeMqttRegion,
                    hintText: 'US / EU / …',
                    helperText: l10n.mtBridgeMqttRegionHint,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _topicRoot,
                  decoration: InputDecoration(
                    labelText: l10n.mtBridgeMqttTopicRoot,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _downlinkCh,
                  decoration: InputDecoration(
                    labelText: l10n.mtBridgeMqttDownlinkChannel,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: _applyTopicPreset,
                  icon: const Icon(Icons.alt_route),
                  label: Text(l10n.mtBridgeMqttApplyTopics),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _topicIn,
                  decoration: InputDecoration(
                    labelText: l10n.mtBridgeMqttTopicIn,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _topicOut,
                  decoration: InputDecoration(
                    labelText: l10n.mtBridgeMqttTopicOut,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _channelIndex,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: l10n.mtBridgeMqttChannelIndex,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _user,
                  decoration: InputDecoration(
                    labelText: l10n.mtBridgeMqttUser,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                if (s.meshtasticMqttPasswordStored)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.lock_outline,
                          size: 18,
                          color: onSurface.withValues(alpha: 0.65),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            l10n.mtBridgeMqttPassStored,
                            style: TextStyle(
                              fontSize: 13,
                              color: onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: _busy
                              ? null
                              : () async {
                                  setState(() => _busy = true);
                                  try {
                                    await s.clearMeshtasticMqttPassword();
                                    _pass.clear();
                                  } finally {
                                    if (mounted) {
                                      setState(() => _busy = false);
                                    }
                                  }
                                },
                          child: Text(l10n.mtBridgeMqttPassClear),
                        ),
                      ],
                    ),
                  ),
                TextField(
                  controller: _pass,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: s.meshtasticMqttPasswordStored
                        ? l10n.mtBridgeMqttPassReplace
                        : l10n.mtBridgeMqttPass,
                    helperText: s.meshtasticMqttPasswordStored
                        ? l10n.mtBridgeMqttPassReplaceHint
                        : null,
                    border: const OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 16),
          if (mode.isIngest) ...[
            Text(
              l10n.mtBridgeIngestSection,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.mtBridgeIngestHint,
              style: TextStyle(
                color: onSurface.withValues(alpha: 0.7),
                fontSize: 13,
              ),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.mtBridgeRelayTitle),
              subtitle: Text(l10n.mtBridgeRelayHint),
              value: s.meshtasticRelayToMesh,
              onChanged: (v) => unawaited(s.setMeshtasticRelayToMesh(v)),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _simulate,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: l10n.mtBridgeSimulateHint,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: _busy
                  ? null
                  : () async {
                      final messenger = ScaffoldMessenger.of(context);
                      final okMsg = l10n.mtBridgeIngestOk;
                      setState(() => _busy = true);
                      try {
                        await s.simulateMeshtasticInbound(_simulate.text);
                        if (!mounted) return;
                        messenger.showSnackBar(GlassSnackBar(content: Text(okMsg)));
                      } finally {
                        if (mounted) setState(() => _busy = false);
                      }
                    },
              icon: const Icon(Icons.science_outlined),
              label: Text(l10n.mtBridgeSimulate),
            ),
          ],
          if (mode.isEgress) ...[
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: scheme.errorContainer.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                l10n.mtBridgeEgressWarning,
                style: TextStyle(
                  color: scheme.onErrorContainer,
                  height: 1.35,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.mtBridgeEgressSection,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            if (useMqtt && !canSend)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  l10n.mtBridgeErrNotConnected,
                  style: TextStyle(color: scheme.error, fontSize: 13),
                ),
              ),
            if (missingGatewayFrom)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  l10n.mtBridgeErrMissingFromNode,
                  style: TextStyle(color: scheme.error, fontSize: 13),
                ),
              ),
            TextField(
              controller: _compose,
              maxLines: 4,
              maxLength: MeshtasticBridgeTags.maxTextChars,
              decoration: InputDecoration(
                labelText: l10n.mtBridgeComposeHint,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: ResilNetTheme.channelGreen,
              ),
              onPressed: _busy || !allowSend
                  ? null
                  : () async {
                      final messenger = ScaffoldMessenger.of(context);
                      final okMsg = l10n.mtBridgeEgressOk;
                      setState(() => _busy = true);
                      try {
                        final ok = await s.sendToMeshtastic(_compose.text);
                        if (!mounted) return;
                        final err = _errLabel(
                          l10n,
                          s.meshtasticBridge?.lastError,
                        );
                        messenger.showSnackBar(
                          GlassSnackBar(content: Text(ok ? okMsg : err)),
                        );
                        if (ok) _compose.clear();
                      } finally {
                        if (mounted) setState(() => _busy = false);
                      }
                    },
              icon: const Icon(Icons.send),
              label: Text(l10n.mtBridgeSend),
            ),
            if (history.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                l10n.mtBridgeEgressHistory,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: onSurface.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: 6),
              ...history.take(8).map(
                    (line) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: SelectableText(
                        line,
                        style: TextStyle(
                          fontSize: 13,
                          color: onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  ),
            ],
          ],
          if (mode == MeshtasticBridgeMode.off)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                l10n.mtBridgeOffHint,
                style: TextStyle(
                  color: onSurface.withValues(alpha: 0.55),
                  fontSize: 13,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

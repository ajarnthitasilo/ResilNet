import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:network_info_plus/network_info_plus.dart';

import '../core/local_wifi_lan_codec.dart';
import '../core/payload_kinds.dart';
import '../models/chat_message.dart';
import '../models/local_wifi_link.dart';
import '../models/peer.dart';
import 'crypto_service.dart';

typedef LocalWifiIdentity = ({String peerId, String compactPk, String nick});

/// Local Wi‑Fi discovery + sealed DM (hotspot LAN + router LAN).
///
/// Distinct from [UdpTransportService] (ESP32 LoRa gateway SoftAP on :4210).
class LocalWifiLinkService extends ChangeNotifier {
  LocalWifiLinkService({
    Connectivity? connectivity,
    NetworkInfo? networkInfo,
  })  : _connectivity = connectivity ?? Connectivity(),
        _networkInfo = networkInfo ?? NetworkInfo();

  final Connectivity _connectivity;
  final NetworkInfo _networkInfo;

  LocalWifiMode _mode = LocalWifiMode.hotspot;
  LocalWifiPhase _phase = LocalWifiPhase.idle;
  String? _ssid;
  String? _localIp;
  String? _errorMessage;
  final List<LocalWifiPeerSighting> _peers = [];
  final Map<String, _LanPeer> _byId = {};

  RawDatagramSocket? _socket;
  StreamSubscription<RawSocketEvent>? _socketSub;
  Timer? _announceTimer;
  Timer? _pruneTimer;

  LocalWifiIdentity Function()? _identityProvider;
  Future<void> Function(ChatMessage msg)? _onInbound;
  void Function(LocalWifiPeerSighting sighting)? _onPeerDiscovered;
  List<Peer> Function()? _knownPeersProvider;

  static const _peerTtl = Duration(seconds: 20);
  static const _announceEvery = Duration(seconds: 2);

  LocalWifiMode get mode => _mode;
  LocalWifiPhase get phase => _phase;
  String? get ssid => _ssid;
  String? get localIp => _localIp;
  String? get errorMessage => _errorMessage;

  /// False once the UDP socket is bound (live LAN discovery).
  bool get stubDiscovery => _socket == null;
  bool get socketLive => _socket != null;

  List<LocalWifiPeerSighting> get peers => List.unmodifiable(_peers);
  bool get isActive =>
      _phase == LocalWifiPhase.hostWaiting ||
      _phase == LocalWifiPhase.discovering ||
      _phase == LocalWifiPhase.peersFound ||
      _phase == LocalWifiPhase.joinConnectedLan;

  void setIdentityProvider(LocalWifiIdentity Function()? provider) {
    _identityProvider = provider;
  }

  void setInboundHandler(Future<void> Function(ChatMessage msg)? handler) {
    _onInbound = handler;
  }

  void setOnPeerDiscovered(
    void Function(LocalWifiPeerSighting sighting)? handler,
  ) {
    _onPeerDiscovered = handler;
  }

  void setKnownPeersProvider(List<Peer> Function()? provider) {
    _knownPeersProvider = provider;
  }

  String? hostAddressFor(String peerId) => _byId[peerId]?.address.address;

  void setMode(LocalWifiMode mode) {
    if (_mode == mode) return;
    stop(reason: 'mode-switch');
    _mode = mode;
    _phase = LocalWifiPhase.idle;
    _errorMessage = null;
    notifyListeners();
  }

  Future<void> refreshNetworkInfo() async {
    try {
      final results = await _connectivity.checkConnectivity();
      final onWifi = results.contains(ConnectivityResult.wifi) ||
          results.contains(ConnectivityResult.other);
      _ssid = await _networkInfo.getWifiName();
      if (_ssid != null) {
        _ssid = _ssid!.replaceAll('"', '');
      }
      _localIp = await _networkInfo.getWifiIP();
      if (!onWifi && _mode == LocalWifiMode.router) {
        if (_localIp == null || _localIp!.isEmpty) {
          _phase = LocalWifiPhase.routerNoWifi;
        }
      } else if (_mode == LocalWifiMode.router &&
          _phase == LocalWifiPhase.routerNoWifi) {
        _phase = LocalWifiPhase.routerReady;
      }
      notifyListeners();
    } catch (e) {
      debugPrint('[LocalWifi] network info failed: $e');
    }
  }

  void beginHostSetup() {
    _mode = LocalWifiMode.hotspot;
    _phase = LocalWifiPhase.hostSetup;
    _errorMessage = null;
    _clearPeers();
    notifyListeners();
  }

  Future<void> startHostWaiting() async {
    _mode = LocalWifiMode.hotspot;
    _phase = LocalWifiPhase.hostWaiting;
    _errorMessage = null;
    await refreshNetworkInfo();
    final ok = await _ensureSocket();
    if (!ok) return;
    _startAnnounceLoop();
    notifyListeners();
  }

  void beginJoinSetup() {
    _mode = LocalWifiMode.hotspot;
    _phase = LocalWifiPhase.joinSetup;
    _errorMessage = null;
    _clearPeers();
    notifyListeners();
  }

  Future<void> startJoinSearch() async {
    _mode = LocalWifiMode.hotspot;
    await refreshNetworkInfo();
    _phase = LocalWifiPhase.joinConnectedLan;
    _errorMessage = null;
    notifyListeners();
    await startDiscovering();
  }

  Future<void> prepareRouter() async {
    _mode = LocalWifiMode.router;
    await refreshNetworkInfo();
    final results = await _connectivity.checkConnectivity();
    final onWifi = results.contains(ConnectivityResult.wifi) ||
        results.contains(ConnectivityResult.other);
    if (!onWifi && (_localIp == null || _localIp!.isEmpty)) {
      _phase = LocalWifiPhase.routerNoWifi;
    } else {
      _phase = LocalWifiPhase.routerReady;
    }
    _errorMessage = null;
    _clearPeers();
    notifyListeners();
  }

  Future<void> startDiscovering() async {
    if (_mode == LocalWifiMode.router) {
      await refreshNetworkInfo();
      final results = await _connectivity.checkConnectivity();
      final onWifi = results.contains(ConnectivityResult.wifi) ||
          results.contains(ConnectivityResult.other);
      if (!onWifi && (_localIp == null || _localIp!.isEmpty)) {
        _phase = LocalWifiPhase.routerNoWifi;
        notifyListeners();
        return;
      }
    }
    _phase = LocalWifiPhase.discovering;
    _errorMessage = null;
    notifyListeners();
    final ok = await _ensureSocket();
    if (!ok) return;
    _startAnnounceLoop();
    // Immediate announce + broadcast probe.
    await _broadcastAnnounce();
    notifyListeners();
  }

  void markIsolatedHint() {
    _phase = LocalWifiPhase.routerIsolatedHint;
    notifyListeners();
  }

  /// Unicast a sealed chat message to a LAN peer (by ResilNet id).
  Future<bool> sendDirect(ChatMessage msg) async {
    if (_socket == null) return false;
    final to = msg.receiverId.trim();
    if (to.isEmpty) return false;
    final peer = _byId[to];
    final addr = peer?.address;
    if (addr == null) {
      debugPrint('[LocalWifi] sendDirect no LAN address for $to');
      return false;
    }
    final wireMap = Map<String, Object?>.from(msg.toMap());
    if (msg.payloadKind != PayloadKinds.presence &&
        msg.payloadKind != PayloadKinds.bulletin) {
      wireMap['content'] = null;
    }
    if ((msg.senderPk == null || msg.senderPk!.trim().isEmpty) &&
        _identityProvider != null) {
      wireMap['senderPk'] = _identityProvider!().compactPk;
    }
    final bytes = LocalWifiLanCodec.encodeMessage(
      messageId: msg.id,
      fromId: msg.senderId,
      toId: msg.receiverId,
      messageMap: wireMap,
      timestampMs: msg.timestamp,
    );
    try {
      _socket!.send(bytes, addr, LocalWifiLanCodec.port);
      debugPrint(
        '[LocalWifi] sent dm id=${msg.id} to=$to ip=${addr.address} bytes=${bytes.length}',
      );
      return true;
    } catch (e) {
      debugPrint('[LocalWifi] sendDirect failed: $e');
      return false;
    }
  }

  void stop({String reason = 'user'}) {
    debugPrint('[LocalWifi] stop reason=$reason');
    _announceTimer?.cancel();
    _announceTimer = null;
    _pruneTimer?.cancel();
    _pruneTimer = null;
    _socketSub?.cancel();
    _socketSub = null;
    try {
      _socket?.close();
    } catch (_) {}
    _socket = null;
    if (_phase != LocalWifiPhase.idle) {
      _phase = LocalWifiPhase.stopped;
    }
    notifyListeners();
    Future<void>.delayed(const Duration(milliseconds: 400), () {
      if (_phase == LocalWifiPhase.stopped) {
        _phase = LocalWifiPhase.idle;
        notifyListeners();
      }
    });
  }

  Future<bool> _ensureSocket() async {
    if (_socket != null) return true;
    try {
      RawDatagramSocket socket;
      try {
        socket = await RawDatagramSocket.bind(
          InternetAddress.anyIPv4,
          LocalWifiLanCodec.port,
          reuseAddress: true,
          reusePort: true,
        );
      } catch (_) {
        socket = await RawDatagramSocket.bind(
          InternetAddress.anyIPv4,
          LocalWifiLanCodec.port,
          reuseAddress: true,
        );
      }
      socket.broadcastEnabled = true;
      socket.readEventsEnabled = true;
      _socket = socket;
      _socketSub = socket.listen(_onSocketEvent, onError: (Object e) {
        debugPrint('[LocalWifi] socket error: $e');
      });
      _pruneTimer?.cancel();
      _pruneTimer = Timer.periodic(const Duration(seconds: 5), (_) {
        _prunePeers();
      });
      debugPrint('[LocalWifi] bound UDP :${LocalWifiLanCodec.port}');
      _seedKnownPeers();
      notifyListeners();
      return true;
    } catch (e) {
      debugPrint('[LocalWifi] bind failed: $e');
      _errorMessage = '$e';
      _phase = LocalWifiPhase.error;
      notifyListeners();
      return false;
    }
  }

  void _startAnnounceLoop() {
    _announceTimer?.cancel();
    _announceTimer = Timer.periodic(_announceEvery, (_) {
      unawaited(_broadcastAnnounce());
    });
    unawaited(_broadcastAnnounce());
  }

  Future<void> _broadcastAnnounce() async {
    final socket = _socket;
    final identity = _identityProvider?.call();
    if (socket == null || identity == null) return;
    final bytes = LocalWifiLanCodec.encodeAnnounce(
      peerId: identity.peerId,
      compactPk: identity.compactPk,
      nick: identity.nick,
      timestampMs: DateTime.now().millisecondsSinceEpoch,
    );
    try {
      socket.send(
        bytes,
        InternetAddress('255.255.255.255'),
        LocalWifiLanCodec.port,
      );
      final subnet = _subnetBroadcast(_localIp);
      if (subnet != null) {
        socket.send(bytes, subnet, LocalWifiLanCodec.port);
      }
    } catch (e) {
      debugPrint('[LocalWifi] announce failed: $e');
    }
  }

  InternetAddress? _subnetBroadcast(String? ip) {
    if (ip == null || ip.isEmpty) return null;
    final parts = ip.split('.');
    if (parts.length != 4) return null;
    // Assume /24 — common for home routers and phone hotspots.
    return InternetAddress('${parts[0]}.${parts[1]}.${parts[2]}.255');
  }

  void _onSocketEvent(RawSocketEvent event) {
    if (event != RawSocketEvent.read) return;
    final socket = _socket;
    if (socket == null) return;
    Datagram? dg;
    while ((dg = socket.receive()) != null) {
      final packet = dg!;
      if (_isSelf(packet.address)) continue;
      _handleDatagram(packet.data, packet.address);
    }
  }

  bool _isSelf(InternetAddress addr) {
    final mine = _localIp;
    if (mine == null || mine.isEmpty) return false;
    return addr.address == mine;
  }

  void _handleDatagram(Uint8List data, InternetAddress from) {
    final announce = LocalWifiLanCodec.decodeAnnounce(data);
    if (announce != null) {
      _onAnnounce(announce, from);
      return;
    }
    final msg = LocalWifiLanCodec.decodeMessage(data);
    if (msg != null) {
      unawaited(_deliverInbound(msg));
    }
  }

  void _onAnnounce(LocalWifiAnnounce ann, InternetAddress from) {
    final me = _identityProvider?.call().peerId;
    if (me != null && ann.peerId == me) return;

    final now = DateTime.now().millisecondsSinceEpoch;
    final nick = ann.nick.trim();
    final short =
        ann.peerId.length <= 8 ? ann.peerId : ann.peerId.substring(0, 8);
    final label = nick.isNotEmpty ? nick : short;

    var canMessage = false;
    try {
      final pem = CryptoService.normalizePublicKey(ann.compactPk);
      final hash = CryptoService.publicKeyHash(pem);
      canMessage = hash == ann.peerId;
    } catch (_) {
      canMessage = false;
    }

    _byId[ann.peerId] = _LanPeer(
      address: from,
      compactPk: ann.compactPk,
      lastSeenMs: now,
    );

    final existing = _peers.indexWhere((p) => p.id == ann.peerId);
    final sighting = LocalWifiPeerSighting(
      id: ann.peerId,
      label: label,
      canMessage: canMessage,
      hostHint: _ssid,
      hostAddress: from.address,
      compactPk: ann.compactPk,
      isStub: false,
      lastSeenMs: now,
    );
    if (existing >= 0) {
      _peers[existing] = sighting;
    } else {
      _peers.add(sighting);
    }

    if (_phase == LocalWifiPhase.discovering ||
        _phase == LocalWifiPhase.hostWaiting ||
        _phase == LocalWifiPhase.joinConnectedLan) {
      _phase = LocalWifiPhase.peersFound;
    }
    _onPeerDiscovered?.call(sighting);
    notifyListeners();
  }

  Future<void> _deliverInbound(ChatMessage msg) async {
    final me = _identityProvider?.call().peerId;
    if (me != null && msg.receiverId != me && !msg.isBroadcast) {
      // Not for us.
      return;
    }
    debugPrint(
      '[LocalWifi] inbound id=${msg.id} from=${msg.senderId} kind=${msg.payloadKind}',
    );
    final handler = _onInbound;
    if (handler == null) return;
    try {
      await handler(msg);
    } catch (e, st) {
      debugPrint('[LocalWifi] inbound handler failed: $e\n$st');
    }
  }

  void _seedKnownPeers() {
    final known = _knownPeersProvider?.call() ?? const <Peer>[];
    final now = DateTime.now().millisecondsSinceEpoch;
    for (final p in known.take(8)) {
      if (_byId.containsKey(p.id)) continue;
      final name = (p.displayName ?? '').trim();
      final short = p.id.length <= 8 ? p.id : p.id.substring(0, 8);
      _peers.add(
        LocalWifiPeerSighting(
          id: p.id,
          label: name.isNotEmpty ? name : short,
          canMessage: p.publicKey.trim().isNotEmpty,
          hostHint: _ssid,
          isStub: true,
          lastSeenMs: now,
        ),
      );
    }
  }

  void _prunePeers() {
    final cutoff =
        DateTime.now().millisecondsSinceEpoch - _peerTtl.inMilliseconds;
    final before = _peers.length;
    _peers.removeWhere((p) => !p.isStub && p.lastSeenMs < cutoff);
    _byId.removeWhere((_, v) => v.lastSeenMs < cutoff);
    if (_peers.length != before) notifyListeners();
  }

  void _clearPeers() {
    _peers.clear();
    _byId.clear();
  }

  @override
  void dispose() {
    stop(reason: 'dispose');
    super.dispose();
  }
}

class _LanPeer {
  _LanPeer({
    required this.address,
    required this.compactPk,
    required this.lastSeenMs,
  });

  final InternetAddress address;
  final String compactPk;
  final int lastSeenMs;
}

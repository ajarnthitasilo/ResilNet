import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

import '../core/gateway_caps_coordinator.dart';
import '../core/resilnet_chunk_codec.dart';
import '../core/resilnet_nack_codec.dart';
import '../core/resilnet_radio_codec.dart';
import '../models/chat_message.dart';
import '../models/gateway_radio_mode.dart';
import '../services/chunk_arq_service.dart';
import '../services/crypto_service.dart';
import '../services/resilnet_packet_codec.dart';
import '../src/rust/api/dto.dart';
import '../src/rust/api/router_api.dart';
import '../src/rust/frb_generated.dart';
import 'udp_transport_service.dart';

/// Service ฝั่ง Flutter สำหรับเรียกใช้ `resilnet_core` ผ่าน FFI (FRB v2)
class ResilNetService extends ChangeNotifier {
  ResilNetService({Connectivity? connectivity})
      : _connectivity = connectivity ?? Connectivity();

  final Connectivity _connectivity;

  StreamSubscription<List<ConnectivityResult>>? _connectivitySub;
  StreamSubscription<MessagePacketDto>? _incomingSub;
  StreamSubscription<ResilNetRadioPacket>? _udpIncomingSub;
  StreamSubscription<GatewayCaps>? _udpCapsSub;

  UdpTransportService? _udpTransport;

  final _chunkReassembler = ChunkReassembler();
  late final ChunkArqService _chunkArq = ChunkArqService(
    reassembler: _chunkReassembler,
    onSendNack: _sendNack,
    onRetransmitChunk: _retransmitChunk,
  );
  CryptoService? _crypto;
  Timer? _chunkPurgeTimer;
  StreamSubscription<NackFrame>? _udpNackSub;
  Timer? _capsTimeoutTimer;
  final GatewayCapsCoordinator _capsCoordinator = GatewayCapsCoordinator();

  /// RN_CAPS handshake phase (for UI / debugging).
  GatewayCapsPhase get gatewayCapsPhase => _capsCoordinator.phase;

  bool get gatewayCapsKnown => _capsCoordinator.availability().capsKnown;
  bool get gatewayHalowStub => _gatewayCaps?.halowStub ?? false;

  /// Stream ข้อความเข้าที่ผ่าน dedup แล้วจาก Rust router
  final _incomingController = StreamController<MessagePacketDto>.broadcast();

  Stream<MessagePacketDto> get incomingMessages => _incomingController.stream;

  bool _initialized = false;
  bool _internetAvailable = false;
  int _blePeerCount = 0;
  bool _loraAvailable = false;
  bool _halowAvailable = false;
  bool _halowLinkUp = false;
  GatewayRadioMode _gatewayRadioMode = GatewayRadioMode.auto;
  GatewayCaps? _gatewayCaps;

  bool get isInitialized => _initialized;
  bool get isInternetAvailable => _internetAvailable;
  int get blePeerCount => _blePeerCount;
  bool get loraAvailable => _loraAvailable;
  bool get halowAvailable => _halowAvailable;
  bool get halowLinkUp => _halowLinkUp;
  GatewayRadioMode get gatewayRadioMode => _gatewayRadioMode;
  GatewayCaps? get gatewayCaps => _gatewayCaps;
  bool get gatewayHalowCapable => _gatewayCaps?.halowCapable ?? false;

  void setGatewayRadioMode(GatewayRadioMode mode) {
    configureGatewayRadioMode(mode, notifyGateway: true);
  }

  void configureGatewayRadioMode(
    GatewayRadioMode mode, {
    bool notifyGateway = false,
  }) {
    if (_gatewayRadioMode == mode && !notifyGateway) return;
    _gatewayRadioMode = mode;
    unawaited(_pushNetworkStatus());
    if (notifyGateway) {
      unawaited(_udpTransport?.sendRadioCommand(mode));
    }
  }

  void setLoraAvailable(bool value) {
    if (_loraAvailable == value) return;
    _loraAvailable = value;
    unawaited(_pushNetworkStatus());
  }

  void _applyGatewayCaps(GatewayCaps? caps) {
    if (caps != null) {
      _capsCoordinator.onCaps(caps);
      _gatewayCaps = caps;
    }
    _syncAvailabilityFromCoordinator();
  }

  void _syncAvailabilityFromCoordinator() {
    final avail = _capsCoordinator.availability();
    _loraAvailable = avail.loraAvailable;
    _halowAvailable = avail.halowAvailable;
    _halowLinkUp = avail.halowLinkUp;
    _gatewayCaps = _capsCoordinator.caps;
    unawaited(_pushNetworkStatus());
    notifyListeners();
  }

  void _startCapsTimeoutPoll() {
    _capsTimeoutTimer?.cancel();
    _capsTimeoutTimer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      if (_capsCoordinator.checkTimeout(DateTime.now())) {
        debugPrint(
          '[ResilNet] RN_CAPS timeout (${GatewayCapsCoordinator.defaultWaitTimeout.inSeconds}s) — LoRa-only fallback',
        );
        _syncAvailabilityFromCoordinator();
      }
    });
  }

  void _stopCapsTimeoutPoll() {
    _capsTimeoutTimer?.cancel();
    _capsTimeoutTimer = null;
  }

  bool get isGatewayWifiActive => _udpTransport?.isActive ?? false;
  String? get gatewayWifiSsid => _udpTransport?.connectedSsid;

  ChunkArqService get chunkArq => _chunkArq;

  /// ผูก UDP transport — รับแพ็กเก็ตเข้าแล้วสะสม chunk + NACK ARQ
  void attachUdpTransport(UdpTransportService udp, {CryptoService? crypto}) {
    _udpTransport = udp;
    _crypto = crypto;
    _udpIncomingSub?.cancel();
    _udpIncomingSub = udp.incomingPackets.listen(
      (packet) => unawaited(
        _ingestUdpPacket(packet, transport: ChunkArqTransport.wifiUdp),
      ),
      onError: (Object e, StackTrace st) {
        debugPrint('[ResilNet] UDP incoming error: $e\n$st');
      },
    );
    _udpNackSub?.cancel();
    _udpNackSub = udp.incomingNacks.listen(
      (nack) => unawaited(
        _chunkArq.onNackReceived(nack, transport: ChunkArqTransport.wifiUdp),
      ),
      onError: (Object e, StackTrace st) {
        debugPrint('[ResilNet] UDP NACK stream error: $e\n$st');
      },
    );
    _udpCapsSub?.cancel();
    _udpCapsSub = udp.incomingCaps.listen(
      (caps) => _applyGatewayCaps(caps),
      onError: (Object e, StackTrace st) {
        debugPrint('[ResilNet] UDP caps stream error: $e\n$st');
      },
    );
    udp.addListener(_onUdpActiveChanged);
    _chunkPurgeTimer?.cancel();
    _chunkPurgeTimer = Timer.periodic(const Duration(seconds: 15), (_) {
      _chunkArq.purgeStale();
      if (_chunkReassembler.pendingCount == 0) {
        _udpTransport?.clearTransferState();
      }
    });
  }

  /// ส่ง chunk ผ่าน UDP พร้อมลงทะเบียน OutboundChunkCache
  Future<bool> sendChunkedMessageUdp(ChatMessage msg) async {
    final udp = _udpTransport;
    if (udp == null || !udp.isActive) return false;
    return udp.sendChunkedMessage(
      msg,
      onChunksEncoded: (chunks) {
        unawaited(
          _chunkArq.registerOutbound(
            messageId: msg.id,
            ttl: msg.ttl,
            chunks: chunks,
            transport: ChunkArqTransport.wifiUdp,
          ),
        );
      },
    );
  }

  /// รับ binary chunk payload จาก BLE (หรือ transport อื่น)
  Future<ChunkIngestResult?> handleIncomingChunkBytes(
    Uint8List payload, {
    required ChunkArqTransport transport,
  }) async {
    if (!_initialized) return null;
    final result = await _chunkArq.onChunkReceived(payload, transport: transport);
    await _processChunkIngestResult(result, transport: transport);
    return result;
  }

  /// รับ NACK จาก BLE characteristic
  Future<void> handleIncomingNack(
    NackFrame nack, {
    required ChunkArqTransport transport,
  }) async {
    await _chunkArq.onNackReceived(nack, transport: transport);
  }

  Future<void> _sendNack(Uint8List frame, ChunkArqTransport transport) async {
    switch (transport) {
      case ChunkArqTransport.wifiUdp:
        await _udpTransport?.sendNackFrame(frame);
      case ChunkArqTransport.ble:
        await _bleNackSender?.call(frame);
      case ChunkArqTransport.lora:
        break;
    }
  }

  Future<bool> Function(Uint8List nackFrame)? _bleNackSender;

  /// ลงทะเบียน callback ส่ง NACK ทาง BLE
  void setBleNackSender(Future<bool> Function(Uint8List nackFrame)? sender) {
    _bleNackSender = sender;
  }

  Future<bool> _retransmitChunk({
    required String messageId,
    required int chunkIndex,
    required int ttl,
    required Uint8List payload,
    required ChunkArqTransport transport,
  }) async {
    switch (transport) {
      case ChunkArqTransport.wifiUdp:
        return _udpTransport?.sendRadioFrame(
              packetId: ResilNetChunkCodec.chunkPacketId(messageId, chunkIndex),
              ttl: ttl,
              payload: payload,
            ) ??
            false;
      case ChunkArqTransport.ble:
        return _bleChunkSender?.call(
              messageId: messageId,
              chunkIndex: chunkIndex,
              ttl: ttl,
              payload: payload,
            ) ??
            false;
      case ChunkArqTransport.lora:
        return false;
    }
  }

  Future<bool> Function({
    required String messageId,
    required int chunkIndex,
    required int ttl,
    required Uint8List payload,
  })? _bleChunkSender;

  void setBleChunkSender(
    Future<bool> Function({
      required String messageId,
      required int chunkIndex,
      required int ttl,
      required Uint8List payload,
    })? sender,
  ) {
    _bleChunkSender = sender;
  }

  Future<void> _ingestUdpPacket(
    ResilNetRadioPacket packet, {
    required ChunkArqTransport transport,
  }) async {
    if (!_initialized) return;
    try {
      final result = await _chunkArq.onChunkReceived(
        packet.payload,
        transport: transport,
      );
      await _processChunkIngestResult(result, transport: transport);

      if (result.complete == null &&
          !ResilNetChunkCodec.isChunked(packet.payload)) {
        final dto = ResilNetRadioCodec.toMessagePacketDto(packet);
        await ingestMessage(
          id: dto.id,
          sender: dto.sender,
          receiver: dto.receiver,
          payload: dto.payload,
          timestampMs: dto.timestamp.toInt(),
          ttl: dto.ttl,
          payloadTag: dto.payloadTag,
        );
        debugPrint('[ResilNet] UDP → legacy ingest_packet id=${dto.id}');
      }
    } catch (e, st) {
      debugPrint('[ResilNet] UDP ingest failed: $e\n$st');
    }
  }

  Future<void> _processChunkIngestResult(
    ChunkIngestResult result, {
    required ChunkArqTransport transport,
  }) async {
    if (result.received != null && result.total != null) {
      _udpTransport?.reportReceiveProgress(result.received!, result.total!);
    }

    final ciphertext = result.complete;
    if (ciphertext == null) return;

    _udpTransport?.clearTransferState();

    final msg = ResilNetChunkCodec.chatMessageFromCiphertext(ciphertext);
    if (msg != null) {
      await _ingestReassembledMessage(msg);
      debugPrint('[ResilNet] reassembled ingest id=${msg.id} transport=$transport');
    }
  }

  /// Reassemble-then-Decrypt: ตรวจ checksum แล้ว ingest ครั้งเดียวต่อข้อความ
  Future<void> _ingestReassembledMessage(ChatMessage msg) async {
    final crypto = _crypto;
    if (crypto != null && msg.receiverId == crypto.myUserId) {
      try {
        crypto.decryptFromSender(
          encryptedPayload: msg.encryptedPayload,
          encryptedKey: msg.encryptedKey,
        );
      } catch (e) {
        debugPrint('[ResilNet] chunk decrypt verify failed: $e');
        return;
      }
    }

    final dto = ResilNetPacketCodec.toDto(msg);
    await ingestMessage(
      id: dto.id,
      sender: dto.sender,
      receiver: dto.receiver,
      payload: dto.payload,
      timestampMs: dto.timestamp.toInt(),
      ttl: dto.ttl,
      payloadTag: dto.payloadTag,
    );
  }

  /// ส่งแพ็กเก็ตออกทาง Gateway UDP (เมื่อเชื่อมต่อ SoftAP แล้ว)
  Future<bool> sendViaGatewayUdp(MessagePacketDto dto) async {
    final udp = _udpTransport;
    if (udp == null || !udp.isActive) return false;
    return udp.sendPacket(dto);
  }

  /// เริ่มต้น FRB + Rust router (เรียกครั้งเดียวตอนเปิดแอป)
  Future<void> initialize({RouterConfigDto? config}) async {
    if (_initialized) return;

    await ResilNetCore.init();
    await initRouter(config: config ?? _defaultRouterConfig());
    _initialized = true;
    notifyListeners();
  }

  /// ฟังสถานะเครือข่ายจาก connectivity_plus และอัปเดต router
  void startNetworkMonitoring({required int Function() blePeerCount}) {
    _connectivitySub?.cancel();
    _connectivitySub = _connectivity.onConnectivityChanged.listen((_) async {
      await _syncNetworkStatus(blePeerCount);
    });

    unawaited(_connectivity.checkConnectivity().then((_) => _syncNetworkStatus(blePeerCount)));
  }

  /// อัปเดตสถานะเมื่อจำนวน BLE peer เปลี่ยน (เรียกจาก `BleMeshService` listener)
  Future<void> refreshBlePeerCount(int count) async {
    _blePeerCount = count;
    await _pushNetworkStatus();
  }

  /// สมัครรับ Stream ข้อความเข้าแบบ real-time จาก Rust
  Future<void> subscribeIncoming() async {
    await _attachRustIncomingBridge();
  }

  /// สร้าง/รีสตาร์ท bridge จาก Rust → Dart broadcast stream (เรียกซ้ำได้ตอน resume)
  Future<void> reconnectIncomingBridge() async {
    await _attachRustIncomingBridge();
  }

  Future<void> _attachRustIncomingBridge() async {
    _incomingSub?.cancel();
    final rustStream = subscribeIncomingMessages();
    _incomingSub = rustStream.listen(
      _incomingController.add,
      onError: (Object e, StackTrace st) {
        debugPrint('[ResilNet] incoming stream error: $e\n$st');
      },
      onDone: () {
        debugPrint('[ResilNet] incoming rust stream closed — call reconnectIncomingBridge()');
      },
    );
  }

  /// รีเฟรชสถานะเครือข่ายทันที (หลัง resume จาก background)
  Future<void> refreshNetworkStatus({required int Function() blePeerCount}) async {
    await _syncNetworkStatus(blePeerCount);
  }

  Future<RoutedPacketDto> routeMessage({
    required String id,
    required String sender,
    required String receiver,
    required Uint8List payload,
    required int timestampMs,
    int ttl = 5,
    PayloadTagDto payloadTag = PayloadTagDto.text,
  }) {
    return routePacket(
      packet: MessagePacketDto(
        id: id,
        sender: sender,
        receiver: receiver,
        payload: payload,
        timestamp: BigInt.from(timestampMs),
        ttl: ttl,
        payloadTag: payloadTag,
      ),
    );
  }

  Future<void> ingestMessage({
    required String id,
    required String sender,
    required String receiver,
    required Uint8List payload,
    required int timestampMs,
    int ttl = 5,
    PayloadTagDto payloadTag = PayloadTagDto.text,
  }) {
    return ingestPacket(
      packet: MessagePacketDto(
        id: id,
        sender: sender,
        receiver: receiver,
        payload: payload,
        timestamp: BigInt.from(timestampMs),
        ttl: ttl,
        payloadTag: payloadTag,
      ),
    );
  }

  Future<NetworkStatusDto> fetchNetworkStatus() => getNetworkStatus();

  Future<int> fetchOfflineQueueLen() => offlineQueueLen();

  /// Drop pending offline envelopes without flushing to Nostr (panic wipe).
  Future<int> clearOfflineQueuePackets() async {
    if (!_initialized) return 0;
    try {
      final n = await clearOfflineQueue();
      chunkArq.clearAllCaches();
      return n;
    } catch (e) {
      debugPrint('[ResilNet] clearOfflineQueue failed: $e');
      return 0;
    }
  }

  Future<void> _syncNetworkStatus(int Function() blePeerCount) async {
    final results = await _connectivity.checkConnectivity();
    _internetAvailable = results.any((r) => r != ConnectivityResult.none);
    _blePeerCount = blePeerCount();
    await _pushNetworkStatus();
  }

  void _onUdpActiveChanged() {
    final active = _udpTransport?.isActive ?? false;
    _capsCoordinator.onGatewayActive(active, DateTime.now());
    if (active) {
      _startCapsTimeoutPoll();
    } else {
      _stopCapsTimeoutPoll();
    }
    _syncAvailabilityFromCoordinator();
  }

  Future<void> _pushNetworkStatus() async {
    if (!_initialized) return;
    try {
      await updateNetworkStatus(
        isInternetAvailable: _internetAvailable,
        activeBlePeersCount: _blePeerCount,
        loraAvailable: _loraAvailable,
        halowAvailable: _halowAvailable,
        halowLinkUp: _halowLinkUp,
        gatewayRadioPreference: _gatewayRadioMode.toDto(),
      );
      notifyListeners();
    } catch (e, st) {
      debugPrint('[ResilNet] updateNetworkStatus failed: $e\n$st');
    }
  }

  @override
  void dispose() {
    _chunkPurgeTimer?.cancel();
    _capsTimeoutTimer?.cancel();
    _udpNackSub?.cancel();
    _udpCapsSub?.cancel();
    _udpTransport?.removeListener(_onUdpActiveChanged);
    _chunkArq.dispose();
    _connectivitySub?.cancel();
    _incomingSub?.cancel();
    _udpIncomingSub?.cancel();
    _incomingController.close();
    super.dispose();
  }

  static RouterConfigDto _defaultRouterConfig() {
    return RouterConfigDto(
      dedupCapacity: 4096,
      dedupTtlSecs: BigInt.from(300),
      internetTtlReset: 5,
      offlineQueueCapacity: 2048,
      eventChannelCapacity: 256,
      incomingChannelCapacity: 512,
    );
  }
}

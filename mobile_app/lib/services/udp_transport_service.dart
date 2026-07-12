import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:network_info_plus/network_info_plus.dart';

import '../core/resilnet_chunk_codec.dart';
import '../core/resilnet_nack_codec.dart';
import '../core/resilnet_protocol.dart';
import '../core/resilnet_radio_codec.dart';
import '../models/chat_message.dart';
import '../src/rust/api/dto.dart';
import 'database_service.dart';
import 'resilnet_packet_codec.dart';
import 'resilnet_service.dart';

/// UDP Transport สำหรับเชื่อมต่อ ESP32 LoRa Gateway ผ่าน Wi-Fi SoftAP
class UdpTransportService extends ChangeNotifier {
  UdpTransportService({
    required DatabaseService database,
    required this._resilnet,
    Connectivity? connectivity,
    NetworkInfo? networkInfo,
  })  : _db = database,
        _connectivity = connectivity ?? Connectivity(),
        _networkInfo = networkInfo ?? NetworkInfo();

  final DatabaseService _db;
  final ResilNetService _resilnet;
  final Connectivity _connectivity;
  final NetworkInfo _networkInfo;

  static final gatewayAddress = InternetAddress(ResilNetProtocol.gatewayIp);
  static const port = ResilNetProtocol.gatewayUdpPort;

  RawDatagramSocket? _socket;
  StreamSubscription<RawSocketEvent>? _socketSub;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySub;
  Timer? _wifiPollTimer;
  Timer? _sendTimer;

  final _incomingController = StreamController<ResilNetRadioPacket>.broadcast();
  final _incomingNackController = StreamController<NackFrame>.broadcast();

  /// แพ็กเก็ตวิทยุที่ถอดจาก UDP แล้ว (ก่อน ingest Rust)
  Stream<ResilNetRadioPacket> get incomingPackets => _incomingController.stream;

  /// NACK control frames จาก UDP (ก่อน radio decode)
  Stream<NackFrame> get incomingNacks => _incomingNackController.stream;

  bool _running = false;
  bool _active = false;
  String? _connectedSsid;
  String? _localWifiIp;
  ChunkTransferState? _transferState;

  /// หน่วงระหว่าง chunk (ปรับได้สำหรับทดสอบหรือ tuning บน hardware จริง)
  Duration interChunkDelay = ResilNetChunkCodec.defaultInterChunkDelay;

  bool get running => _running;
  bool get isActive => _active;
  String? get connectedSsid => _connectedSsid;
  String? get localWifiIp => _localWifiIp;
  ChunkTransferState? get transferState => _transferState;

  void _setTransferState(ChunkTransferState? state) {
    if (_transferState == state) return;
    _transferState = state;
    notifyListeners();
  }

  void reportReceiveProgress(int current, int total) {
    _setTransferState(
      ChunkTransferState(sending: false, current: current, total: total),
    );
  }

  void clearTransferState() => _setTransferState(null);

  Future<void> start() async {
    if (_running) return;
    _running = true;

    _connectivitySub = _connectivity.onConnectivityChanged.listen((_) {
      unawaited(_refreshGatewayLink());
    });

    _wifiPollTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      unawaited(_refreshGatewayLink());
    });

    _sendTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      unawaited(pumpSendQueue());
    });

    await _refreshGatewayLink();
    notifyListeners();
  }

  Future<void> stop() async {
    _running = false;
    await _connectivitySub?.cancel();
    _connectivitySub = null;
    _wifiPollTimer?.cancel();
    _wifiPollTimer = null;
    _sendTimer?.cancel();
    _sendTimer = null;
    await _closeSocket();
    _setActive(false);
    notifyListeners();
  }

  /// ตรวจสอบ Wi-Fi และเปิด/ปิด UDP socket ตามสภาพเครือข่าย
  Future<void> refresh() => _refreshGatewayLink();

  Future<void> _refreshGatewayLink() async {
    if (!_running) return;

    final results = await _connectivity.checkConnectivity();
    final onWifi = results.contains(ConnectivityResult.wifi);
    if (!onWifi) {
      await _deactivate('not on Wi-Fi');
      return;
    }

    final rawSsid = await _networkInfo.getWifiName();
    final ssid = _normalizeSsid(rawSsid);
    final wifiIp = await _networkInfo.getWifiIP();
    _localWifiIp = wifiIp;

    final onGateway = _isGatewayNetwork(ssid: ssid, wifiIp: wifiIp);
    if (!onGateway) {
      await _deactivate('not on ResilNet gateway Wi-Fi');
      return;
    }

    _connectedSsid = ssid;
    if (!_active) {
      final ok = await _openSocket();
      _setActive(ok);
      if (ok) {
        debugPrint('[UdpTransport] active ssid=$ssid ip=$wifiIp');
      }
    } else {
      notifyListeners();
    }
  }

  bool _isGatewayNetwork({required String? ssid, required String? wifiIp}) {
    if (ssid != null &&
        ssid.isNotEmpty &&
        ssid.startsWith(ResilNetProtocol.gatewaySoftApPrefix)) {
      return true;
    }
    if (wifiIp != null && wifiIp.startsWith('192.168.4.')) {
      return true;
    }
    return false;
  }

  String? _normalizeSsid(String? ssid) {
    if (ssid == null) return null;
    final trimmed = ssid.trim();
    if (trimmed == '<unknown ssid>' || trimmed.isEmpty) return null;
    if (trimmed.length >= 2 &&
        trimmed.startsWith('"') &&
        trimmed.endsWith('"')) {
      return trimmed.substring(1, trimmed.length - 1);
    }
    return trimmed;
  }

  Future<bool> _openSocket() async {
    await _closeSocket();
    try {
      final socket = await RawDatagramSocket.bind(
        InternetAddress.anyIPv4,
        port,
        reuseAddress: true,
        reusePort: false,
      );
      socket.broadcastEnabled = true;
      _socket = socket;
      _socketSub = socket.listen(
        (event) {
          if (event == RawSocketEvent.read) {
            _drainSocket();
          }
        },
        onError: (Object e) {
          debugPrint('[UdpTransport] socket error: $e');
        },
      );
      return true;
    } catch (e, st) {
      debugPrint('[UdpTransport] bind failed: $e\n$st');
      await _closeSocket();
      return false;
    }
  }

  void _drainSocket() {
    final socket = _socket;
    if (socket == null) return;

    while (true) {
      final datagram = socket.receive();
      if (datagram == null) break;
      _onDatagram(datagram);
    }
  }

  void _onDatagram(Datagram datagram) {
    final raw = Uint8List.fromList(datagram.data);
    final nack = ResilNetNackCodec.tryDecode(raw);
    if (nack != null) {
      debugPrint(
        '[UdpTransport] RX NACK msg_id=${nack.msgId} missing=${nack.missingIndices}',
      );
      _incomingNackController.add(nack);
      return;
    }

    final packet = ResilNetRadioCodec.decodeDatagram(raw);
    if (packet == null) {
      debugPrint(
        '[UdpTransport] drop invalid datagram (${datagram.data.length} bytes)',
      );
      return;
    }
    debugPrint(
      '[UdpTransport] RX ${datagram.data.length} bytes from ${datagram.address}',
    );
    _incomingController.add(packet);
  }

  /// ส่ง NACK control frame กลับไปยัง gateway (Wi-Fi UDP ARQ)
  Future<bool> sendNackFrame(Uint8List nackFrame) async {
    final socket = _socket;
    if (!_active || socket == null) return false;
    if (!ResilNetNackCodec.isNackFrame(nackFrame)) return false;
    try {
      final sent = socket.send(nackFrame, gatewayAddress, port);
      if (sent != nackFrame.length) return false;
      debugPrint('[UdpTransport] TX NACK ${nackFrame.length} bytes → gateway');
      return true;
    } catch (e, st) {
      debugPrint('[UdpTransport] NACK send failed: $e\n$st');
      return false;
    }
  }

  /// ส่ง chunk payloads ตามลำดับพร้อม pacing ระหว่างชิ้น
  Future<bool> sendChunkPayloads({
    required String messageId,
    required int ttl,
    required List<Uint8List> chunks,
  }) => _sendChunkPayloads(messageId: messageId, ttl: ttl, chunks: chunks);

  /// ส่ง chunk payloads ตามลำดับพร้อม pacing ระหว่างชิ้น (internal)
  Future<bool> _sendChunkPayloads({
    required String messageId,
    required int ttl,
    required List<Uint8List> chunks,
  }) async {
    for (var i = 0; i < chunks.length; i++) {
      if (i > 0 && interChunkDelay > Duration.zero) {
        await Future<void>.delayed(interChunkDelay);
      }
      _setTransferState(
        ChunkTransferState(
          sending: true,
          current: i + 1,
          total: chunks.length,
        ),
      );
      final ok = await sendRadioFrame(
        packetId: ResilNetChunkCodec.chunkPacketId(messageId, i),
        ttl: ttl,
        payload: chunks[i],
      );
      if (!ok) {
        _setTransferState(null);
        return false;
      }
    }
    _setTransferState(null);
    return true;
  }

  /// ส่ง radio frame เดี่ยว (payload ≤ 230 bytes)
  Future<bool> sendRadioFrame({
    required String packetId,
    required int ttl,
    required Uint8List payload,
  }) async {
    final socket = _socket;
    if (!_active || socket == null) return false;

    try {
      final radio = ResilNetRadioCodec.fromRadioPayload(
        packetId: packetId,
        ttl: ttl,
        payload: payload,
      );
      final frame = ResilNetRadioCodec.encodeFrame(radio);
      final sent = socket.send(frame, gatewayAddress, port);
      if (sent != frame.length) {
        debugPrint('[UdpTransport] partial send $sent/${frame.length}');
        return false;
      }
      debugPrint('[UdpTransport] TX framed ${frame.length} bytes → gateway');
      return true;
    } catch (e, st) {
      debugPrint('[UdpTransport] send failed: $e\n$st');
      return false;
    }
  }

  /// ส่ง [MessagePacketDto] — รองรับ Encrypt-then-Chunk อัตโนมัติ
  Future<bool> sendPacket(MessagePacketDto dto) async {
    final socket = _socket;
    if (!_active || socket == null) return false;

    try {
      if (dto.payload.length <= ResilNetProtocol.radioMaxPayloadLen &&
          !ResilNetChunkCodec.isChunked(dto.payload)) {
        return sendRadioFrame(
          packetId: dto.id,
          ttl: dto.ttl,
          payload: Uint8List.fromList(dto.payload),
        );
      }

      final chunks = ResilNetChunkCodec.encodeChunks(
        Uint8List.fromList(dto.payload),
      );
      await _resilnet.chunkArq.registerOutbound(
        messageId: dto.id,
        ttl: dto.ttl,
        chunks: chunks,
        transport: ChunkArqTransport.wifiUdp,
      );
      return _sendChunkPayloads(
        messageId: dto.id,
        ttl: dto.ttl,
        chunks: chunks,
      );
    } catch (e, st) {
      debugPrint('[UdpTransport] send failed: $e\n$st');
      _setTransferState(null);
      return false;
    }
  }

  /// Encrypt-then-Chunk: ส่ง [ChatMessage] ที่เข้ารหัสแล้วผ่าน UDP
  ///
  /// คืน chunks ที่ encode แล้วผ่าน [onChunksEncoded] สำหรับ OutboundChunkCache
  Future<bool> sendChunkedMessage(
    ChatMessage msg, {
    void Function(List<Uint8List> chunks)? onChunksEncoded,
  }) async {
    final ciphertext = ResilNetChunkCodec.ciphertextFromMessage(msg);
    final chunks = ResilNetChunkCodec.encodeChunks(ciphertext);
    onChunksEncoded?.call(chunks);
    return _sendChunkPayloads(
      messageId: msg.id,
      ttl: msg.ttl,
      chunks: chunks,
    );
  }

  /// ส่งคิวข้อความผ่าน UDP เมื่ออยู่บน Gateway Wi-Fi (ช่องทางเสริม/หลัก)
  Future<void> pumpSendQueue() async {
    if (!_active || _socket == null) return;

    final items = await _db.getPendingOrRelayMessages();
    if (items.isEmpty) return;

    for (final msg in items) {
      try {
        if (_resilnet.isInitialized) {
          final dto = ResilNetPacketCodec.toDto(msg);
          final routed = await _resilnet.routeMessage(
            id: dto.id,
            sender: dto.sender,
            receiver: dto.receiver,
            payload: dto.payload,
            timestampMs: dto.timestamp.toInt(),
            ttl: dto.ttl,
          );
          if (routed.transport == TransportTypeDto.offlineQueue) {
            continue;
          }
          if (routed.transport == TransportTypeDto.internet) {
            await _db.updateMessageStatus(msg.id, MessageStatus.sent.name);
            continue;
          }
        }

        final sent = await _resilnet.sendChunkedMessageUdp(msg);
        if (!sent) break;
        await _db.updateMessageStatus(msg.id, MessageStatus.sent.name);
      } catch (e) {
        debugPrint('[UdpTransport] pump error: $e');
        break;
      }
    }
    notifyListeners();
  }

  Future<void> _deactivate(String reason) async {
    if (_active) {
      debugPrint('[UdpTransport] deactivate: $reason');
    }
    _connectedSsid = null;
    await _closeSocket();
    _setActive(false);
  }

  void _setActive(bool value) {
    if (_active == value) return;
    _active = value;
    notifyListeners();
  }

  Future<void> _closeSocket() async {
    await _socketSub?.cancel();
    _socketSub = null;
    _socket?.close();
    _socket = null;
  }

  @override
  void dispose() {
    unawaited(stop());
    _incomingController.close();
    _incomingNackController.close();
    super.dispose();
  }
}

import 'dart:convert';

import '../models/local_notice.dart';
import '../services/crypto_service.dart';

/// Receiver id ที่ใช้เป็นสัญลักษณ์ broadcast สำหรับ public bulletin.
const kBulletinBroadcastReceiver = '*';

/// Public mesh bulletin — plaintext + ลายเซ็นในตัว (ไม่ต้องรู้จัก key ผู้ส่งก่อน)
///
/// ต่างจาก sealed notice: ทุกเครื่องในรัศมีอ่านได้ทันที ใช้สำหรับ
/// ประกาศสาธารณะยามวิกฤต (offline) เท่านั้น — ห้ามใช้ส่งข้อมูลส่วนตัว
class BulletinWireData {
  BulletinWireData({
    required this.bulletinId,
    required this.text,
    required this.createdAt,
    required this.senderId,
    required this.senderPk,
    required this.signature,
    this.expiresAt,
    this.urgent = false,
    this.senderName,
  });

  final String bulletinId;
  final String text;
  final int createdAt;
  final int? expiresAt;
  final bool urgent;
  final String senderId;
  final String? senderName;

  /// Compact public key ของผู้ส่ง — ผูกกับ [senderId] ด้วย hash binding.
  final String senderPk;

  /// ลายเซ็น RSA เหนือ canonical string (ดู [signingPayload]).
  final String signature;

  bool get isExpired {
    final e = expiresAt;
    if (e == null) return false;
    return DateTime.now().millisecondsSinceEpoch >= e;
  }

  /// Canonical payload ที่ใช้เซ็น/ตรวจ (คงที่ระหว่าง encode/parse)
  String get signingPayload => '$bulletinId|$text|$urgent|${expiresAt ?? 0}';

  LocalNotice toLocalNotice() {
    return LocalNotice(
      id: bulletinId,
      scope: 'mesh',
      channelLabel: '#mesh',
      text: text,
      createdAt: createdAt,
      expiresAt: expiresAt,
      urgent: urgent,
      senderId: senderId,
      senderName: senderName,
      // Received from the mesh — deleting only affects this device.
      sharedExternally: true,
    );
  }

  Map<String, Object?> toJson() => {
        'v': 1,
        'type': 'mesh_bulletin',
        'bulletinId': bulletinId,
        'text': text,
        'createdAt': createdAt,
        if (expiresAt != null) 'expiresAt': expiresAt,
        'urgent': urgent,
        'senderId': senderId,
        if (senderName != null && senderName!.isNotEmpty)
          'senderName': senderName,
        'senderPk': senderPk,
        'sig': signature,
      };

  String encode() => jsonEncode(toJson());
}

/// สร้าง bulletin พร้อมลายเซ็นจาก [crypto] ของเราเอง
BulletinWireData buildSignedBulletin({
  required CryptoService crypto,
  required String bulletinId,
  required String text,
  required int createdAt,
  int? expiresAt,
  bool urgent = false,
  String? senderName,
}) {
  final senderId = crypto.myUserId;
  final unsigned = BulletinWireData(
    bulletinId: bulletinId,
    text: text,
    createdAt: createdAt,
    expiresAt: expiresAt,
    urgent: urgent,
    senderId: senderId,
    senderName: senderName,
    senderPk: CryptoService.compactPublicKey(crypto.publicKeyPem),
    signature: '',
  );
  final sig = crypto.signText(
    senderId: senderId,
    receiverId: kBulletinBroadcastReceiver,
    timestamp: createdAt,
    payload: unsigned.signingPayload,
  );
  return BulletinWireData(
    bulletinId: unsigned.bulletinId,
    text: unsigned.text,
    createdAt: unsigned.createdAt,
    expiresAt: unsigned.expiresAt,
    urgent: unsigned.urgent,
    senderId: unsigned.senderId,
    senderName: unsigned.senderName,
    senderPk: unsigned.senderPk,
    signature: sig,
  );
}

BulletinWireData? parseBulletinWire(String raw) {
  final trimmed = raw.trim();
  if (trimmed.isEmpty) return null;
  try {
    final obj = jsonDecode(trimmed);
    if (obj is! Map) return null;
    final map = Map<String, Object?>.from(obj);
    if ((map['type'] as String?) != 'mesh_bulletin') return null;
    final id = (map['bulletinId'] as String?)?.trim();
    final text = (map['text'] as String?)?.trim();
    final senderId = (map['senderId'] as String?)?.trim();
    final senderPk = (map['senderPk'] as String?)?.trim();
    final sig = (map['sig'] as String?)?.trim();
    if (id == null || id.isEmpty) return null;
    if (text == null || text.isEmpty) return null;
    if (senderId == null || senderId.isEmpty) return null;
    if (senderPk == null || senderPk.isEmpty) return null;
    if (sig == null || sig.isEmpty) return null;
    return BulletinWireData(
      bulletinId: id,
      text: text,
      createdAt:
          (map['createdAt'] as int?) ?? DateTime.now().millisecondsSinceEpoch,
      expiresAt: map['expiresAt'] as int?,
      urgent: map['urgent'] == true,
      senderId: senderId,
      senderName: (map['senderName'] as String?)?.trim(),
      senderPk: senderPk,
      signature: sig,
    );
  } catch (_) {
    return null;
  }
}

/// ตรวจ bulletin: senderPk ต้องผูกกับ senderId และลายเซ็นต้องถูกต้อง
///
/// ใช้ key ที่ฝังมากับ bulletin เอง — ไม่ต้องมี peer record ล่วงหน้า
bool verifyBulletinWire(BulletinWireData w, CryptoService crypto) {
  if (!CryptoService.bindsIdentity(
    rid: w.senderId,
    publicKeyMaterial: w.senderPk,
  )) {
    return false;
  }
  try {
    final pem = CryptoService.normalizePublicKey(w.senderPk);
    return crypto.verifyText(
      senderPublicPem: pem,
      senderId: w.senderId,
      receiverId: kBulletinBroadcastReceiver,
      timestamp: w.createdAt,
      payload: w.signingPayload,
      signature: w.signature,
    );
  } catch (_) {
    return false;
  }
}

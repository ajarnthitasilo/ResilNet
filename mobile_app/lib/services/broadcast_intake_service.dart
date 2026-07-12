import 'package:flutter/foundation.dart';

import '../models/chat_message.dart';
import 'broadcast_filter_service.dart';
import 'database_service.dart';

/// ประมวลผล Broadcast หลังบันทึก (ทุกช่องทาง: Mesh / Supabase)
class BroadcastIntakeService {
  BroadcastIntakeService({
    required DatabaseService database,
    required this._filter,
  }) : _db = database;

  final DatabaseService _db;
  final BroadcastFilterService _filter;

  void Function(ChatMessage msg)? onDisplayable;

  Future<void> processSaved(ChatMessage msg) async {
    if (!msg.isBroadcast) return;

    final decision = await _filter.evaluate(msg);
    if (decision == BroadcastDisplayDecision.display) {
      final senderName = msg.senderName?.trim();
      if (senderName != null && senderName.isNotEmpty) {
        await _db.upsertPeerDisplayNameFromBroadcast(
          senderId: msg.senderId,
          senderName: senderName,
        );
      }
      onDisplayable?.call(msg);
    } else {
      debugPrint(
        '[BroadcastIntake] relay-only id=${msg.id} sender=${msg.senderId}',
      );
    }
  }
}

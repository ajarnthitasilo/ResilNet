import 'package:supabase_flutter/supabase_flutter.dart';

import 'message_model.dart';

/// Service สำหรับตาราง `messages`
/// columns: id(int8), created_at(timestamptz), payload(text), sender_id(text)
class MessageService {
  MessageService({SupabaseClient? client})
    : _client = client ?? Supabase.instance.client;

  final SupabaseClient _client;

  /// ส่งข้อความขึ้น Supabase
  Future<MessageModel> sendMessage({
    required String payload,
    required String senderId,
  }) async {
    final row = await _client
        .from('messages')
        .insert({'payload': payload, 'sender_id': senderId})
        .select('id, created_at, payload, sender_id')
        .single();

    return MessageModel.fromMap(row);
  }

  /// Subscribe ข้อความใหม่ผ่าน Realtime (INSERT)
  ///
  /// วิธีใช้:
  /// final channel = service.listenToMessages(onMessage: (m) { ... });
  /// ...
  /// await service.stopListening(channel);
  RealtimeChannel listenToMessages({
    required void Function(MessageModel message) onMessage,
    void Function(Object error, StackTrace st)? onError,
  }) {
    final channel = _client
        .channel('public:messages')
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          table: 'messages',
          callback: (payload) {
            try {
              final msg = MessageModel.fromMap(payload.newRecord);
              onMessage(msg);
            } catch (e, st) {
              onError?.call(e, st);
            }
          },
        )
        .subscribe();

    return channel;
  }

  Future<void> stopListening(RealtimeChannel channel) async {
    await _client.removeChannel(channel);
  }
}

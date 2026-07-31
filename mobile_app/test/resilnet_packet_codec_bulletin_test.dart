import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/core/payload_kinds.dart';
import 'package:resilnet/models/chat_message.dart';
import 'package:resilnet/services/resilnet_packet_codec.dart';
import 'package:resilnet/src/rust/api/dto.dart';

void main() {
  test('fromDto preserves mesh_bulletin payloadKind (text wire tag)', () {
    final msg = ChatMessage(
      id: 'bl:b-001',
      senderId: 'alice',
      receiverId: '*',
      content: '{"type":"mesh_bulletin","bulletinId":"b-001"}',
      encryptedPayload: PayloadKinds.bulletin,
      encryptedKey: PayloadKinds.bulletin,
      ttl: 5,
      timestamp: 1700000000000,
      status: MessageStatus.pending,
      type: MessageType.direct,
      payloadKind: PayloadKinds.bulletin,
    );
    final dto = ResilNetPacketCodec.toDto(msg);
    expect(dto.payloadTag, PayloadTagDto.text);

    final round = ResilNetPacketCodec.fromDto(dto);
    expect(round.payloadKind, PayloadKinds.bulletin);
    expect(round.content, contains('mesh_bulletin'));
  });

  test('fromDto preserves notice payloadKind', () {
    final msg = ChatMessage(
      id: 'n1',
      senderId: 'alice',
      receiverId: 'bob',
      content: null,
      encryptedPayload: 'ct',
      encryptedKey: 'ek',
      ttl: 3,
      timestamp: 1,
      status: MessageStatus.pending,
      type: MessageType.direct,
      payloadKind: PayloadKinds.notice,
    );
    final round = ResilNetPacketCodec.fromDto(ResilNetPacketCodec.toDto(msg));
    expect(round.payloadKind, PayloadKinds.notice);
  });

  test('fromDto still applies image wire tag', () {
    final msg = ChatMessage(
      id: 'img1',
      senderId: 'alice',
      receiverId: 'bob',
      content: null,
      encryptedPayload: 'ct',
      encryptedKey: 'ek',
      ttl: 3,
      timestamp: 1,
      status: MessageStatus.pending,
      type: MessageType.direct,
      payloadKind: PayloadKinds.text,
    );
    final dto = MessagePacketDto(
      id: msg.id,
      sender: msg.senderId,
      receiver: msg.receiverId,
      payload: utf8.encode(jsonEncode(msg.toMap())),
      timestamp: BigInt.from(msg.timestamp),
      ttl: msg.ttl,
      payloadTag: PayloadTagDto.image,
    );
    final round = ResilNetPacketCodec.fromDto(dto);
    expect(round.payloadKind, PayloadKinds.image);
  });
}

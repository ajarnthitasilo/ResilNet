import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/core/board_invite_wire.dart';
import 'package:resilnet/core/invite_link_codec.dart';
import 'package:resilnet/models/announcement_board.dart';
import 'package:resilnet/services/crypto_service.dart';

void main() {
  late AnnouncementBoard board;

  setUpAll(() {
    final crypto = CryptoService();
    final keys = crypto.generateKeyPairPems();
    board = AnnouncementBoard(
      id: keys.keyId,
      title: 'ชุมชนวัดใต้',
      ownerId: 'owner-rid',
      publicKeyPem: keys.publicPem,
      createdAt: 1700000000000,
      allowLocked: true,
      allowOpen: true,
      epoch: 2,
    );
  });

  test('compact encode → parse round-trip', () {
    final wire = encodeBoardInvite(board);
    expect(wire.contains('BEGIN'), isFalse);
    expect(wire.contains('board_invite'), isTrue);
    final parsed = parseBoardInvite(wire);
    expect(parsed, isNotNull);
    expect(parsed!.id, board.id);
    expect(parsed.title, board.title);
    expect(parsed.ownerId, board.ownerId);
    expect(parsed.allowOpen, isTrue);
    expect(parsed.epoch, 2);
    expect(
      CryptoService.compactPublicKey(parsed.publicKeyPem),
      CryptoService.compactPublicKey(board.publicKeyPem),
    );
  });

  test('legacy PEM JSON still parses', () {
    final legacy = jsonEncode(board.toJson());
    expect(legacy.contains('BEGIN RSA'), isTrue);
    final parsed = parseBoardInvite(legacy);
    expect(parsed, isNotNull);
    expect(parsed!.id, board.id);
    expect(parsed.publicKeyPem.contains('BEGIN'), isTrue);
  });

  test('deep link round-trip (classic + alias)', () {
    final link = encodeBoardInviteDeepLink(board);
    expect(link.startsWith('resilnet://board/invite?d='), isTrue);
    final parsed = parseBoardInvite(link);
    expect(parsed, isNotNull);
    expect(parsed!.id, board.id);
    expect(parsed.title, board.title);

    final uri = Uri.parse(link);
    expect(parseBoardInviteDeepLink(uri)?.id, board.id);

    final alias = encodeBoardInviteAliasDeepLink(board);
    expect(alias.startsWith('resilnet://b?d='), isTrue);
    expect(parseBoardInvite(alias)?.id, board.id);
  });

  test('HTTPS go-link round-trip', () {
    final https = encodeBoardInviteHttpsLink(board);
    expect(https.startsWith(InviteLinkCodec.httpsGoBase), isTrue);
    expect(https.contains('t=b'), isTrue);
    final parsed = parseBoardInvite(https);
    expect(parsed, isNotNull);
    expect(parsed!.id, board.id);
    expect(parsed.title, board.title);
    expect(parseBoardInviteDeepLink(Uri.parse(https))?.id, board.id);
  });

  test('share text with preamble extracts HTTPS go-link', () {
    final text = encodeBoardInviteShareText(
      board: board,
      preamble: (t) => 'คำเชิญเข้ากระดานชุมชน “$t”\nเปิดแอปแล้วติดตาม',
    );
    expect(text.contains('คำเชิญ'), isTrue);
    expect(text.contains('ajarnthitasilo.github.io/ResilNet/go'), isTrue);
    final parsed = parseBoardInvite(text);
    expect(parsed, isNotNull);
    expect(parsed!.title, board.title);
  });

  test('legacy uncompressed deep link still parses', () {
    final plain = base64Url
        .encode(utf8.encode(encodeBoardInvite(board)))
        .replaceAll('=', '');
    final legacy = 'resilnet://board/invite?d=$plain';
    expect(parseBoardInvite(legacy)?.id, board.id);
  });

  test('reject invite without id or key', () {
    expect(parseBoardInvite(''), isNull);
    expect(parseBoardInvite('not json'), isNull);
    expect(parseBoardInvite('{"type":"board_invite"}'), isNull);
    expect(
      parseBoardInvite('{"type":"board_invite","id":"x"}'),
      isNull,
    );
  });

  test('compact payload is shorter than legacy PEM JSON', () {
    final compact = encodeBoardInvite(board);
    final legacy = jsonEncode(board.toJson());
    expect(compact.length, lessThan(legacy.length));
  });
}

import '../src/rust/api/dto.dart';

import 'dart:typed_data';

import '../src/rust/api/dto.dart';

/// Wire payload tags สำหรับ ResilNet binary streams
enum ResilNetPayloadType {
  text(0x01),
  image(0x02),
  audio(0x03),
  firmware(0x04),
  ack(0x05);

  const ResilNetPayloadType(this.wireTag);

  final int wireTag;

  static ResilNetPayloadType fromWireTag(int tag) {
    return ResilNetPayloadType.values.firstWhere(
      (t) => t.wireTag == tag,
      orElse: () => ResilNetPayloadType.text,
    );
  }

  /// ใส่ wire tag นำหน้า payload
  static Uint8List wrapWithTag(Uint8List inner, ResilNetPayloadType type) {
    return Uint8List.fromList([type.wireTag, ...inner]);
  }

  /// ถอด wire tag
  static ({ResilNetPayloadType type, Uint8List inner}) unwrapPayloadTag(
    Uint8List bundled,
  ) {
    if (bundled.isEmpty) {
      return (type: ResilNetPayloadType.text, inner: bundled);
    }
    final tag = bundled[0];
    final known = ResilNetPayloadType.values.any((t) => t.wireTag == tag);
    if (!known) {
      return (type: ResilNetPayloadType.text, inner: bundled);
    }
    return (
      type: ResilNetPayloadType.fromWireTag(tag),
      inner: Uint8List.sublistView(bundled, 1),
    );
  }

  static ResilNetPayloadType fromMessageKind(String? kind) {
    return switch (kind) {
      'image' => ResilNetPayloadType.image,
      'audio' => ResilNetPayloadType.audio,
      'firmware' => ResilNetPayloadType.firmware,
      'ack' => ResilNetPayloadType.ack,
      _ => ResilNetPayloadType.text,
    };
  }

  PayloadTagDto toDto() {
    return switch (this) {
      ResilNetPayloadType.text => PayloadTagDto.text,
      ResilNetPayloadType.image => PayloadTagDto.image,
      ResilNetPayloadType.audio => PayloadTagDto.audio,
      ResilNetPayloadType.firmware => PayloadTagDto.firmware,
      ResilNetPayloadType.ack => PayloadTagDto.ack,
    };
  }

  static ResilNetPayloadType fromDto(PayloadTagDto dto) {
    return switch (dto) {
      PayloadTagDto.text => ResilNetPayloadType.text,
      PayloadTagDto.image => ResilNetPayloadType.image,
      PayloadTagDto.audio => ResilNetPayloadType.audio,
      PayloadTagDto.firmware => ResilNetPayloadType.firmware,
      PayloadTagDto.ack => ResilNetPayloadType.ack,
    };
  }

  String get messageKind => name;
}

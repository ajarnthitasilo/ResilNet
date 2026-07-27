/// Local announcement board (separate from Area sealed fan-out).
class AnnouncementBoard {
  AnnouncementBoard({
    required this.id,
    required this.title,
    required this.ownerId,
    required this.publicKeyPem,
    required this.createdAt,
    this.allowLocked = true,
    this.allowOpen = false,
    this.epoch = 1,
  });

  final String id;
  final String title;
  final String ownerId;
  final String publicKeyPem;
  final int createdAt;
  bool allowLocked;
  bool allowOpen;
  int epoch;

  Map<String, Object?> toJson() => {
        'id': id,
        'title': title,
        'ownerId': ownerId,
        'publicKeyPem': publicKeyPem,
        'createdAt': createdAt,
        'allowLocked': allowLocked,
        'allowOpen': allowOpen,
        'epoch': epoch,
      };

  static AnnouncementBoard fromJson(Map<String, Object?> m) {
    return AnnouncementBoard(
      id: m['id'] as String,
      title: m['title'] as String? ?? 'Board',
      ownerId: m['ownerId'] as String,
      publicKeyPem: m['publicKeyPem'] as String,
      createdAt: m['createdAt'] as int? ?? 0,
      allowLocked: m['allowLocked'] as bool? ?? true,
      allowOpen: m['allowOpen'] as bool? ?? false,
      epoch: m['epoch'] as int? ?? 1,
    );
  }
}

enum AnnouncementPostMode { open, locked }

class AnnouncementPost {
  AnnouncementPost({
    required this.id,
    required this.boardId,
    required this.authorId,
    required this.mode,
    required this.createdAt,
    this.openText,
    this.encryptedPayload,
    this.encryptedKey,
    this.signature,
    this.epoch = 1,
  });

  final String id;
  final String boardId;
  final String authorId;
  final AnnouncementPostMode mode;
  final int createdAt;
  final int epoch;

  /// Plaintext body for open (non-E2EE) posts only.
  final String? openText;

  /// Locked post ciphertext (encrypted to board public key).
  final String? encryptedPayload;
  final String? encryptedKey;
  final String? signature;

  bool get isOpen => mode == AnnouncementPostMode.open;

  Map<String, Object?> toJson() => {
        'id': id,
        'boardId': boardId,
        'authorId': authorId,
        'mode': mode.name,
        'createdAt': createdAt,
        'epoch': epoch,
        'openText': openText,
        'encryptedPayload': encryptedPayload,
        'encryptedKey': encryptedKey,
        'signature': signature,
      };

  static AnnouncementPost fromJson(Map<String, Object?> m) {
    final modeName = m['mode'] as String? ?? 'locked';
    return AnnouncementPost(
      id: m['id'] as String,
      boardId: m['boardId'] as String,
      authorId: m['authorId'] as String,
      mode: modeName == 'open'
          ? AnnouncementPostMode.open
          : AnnouncementPostMode.locked,
      createdAt: m['createdAt'] as int? ?? 0,
      epoch: m['epoch'] as int? ?? 1,
      openText: m['openText'] as String?,
      encryptedPayload: m['encryptedPayload'] as String?,
      encryptedKey: m['encryptedKey'] as String?,
      signature: m['signature'] as String?,
    );
  }
}

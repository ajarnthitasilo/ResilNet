/// Default retention window when publishing via Nostr / public notices.
enum NoticeExpiry {
  forever(0),
  oneDay(1),
  threeDays(3),
  sevenDays(7);

  const NoticeExpiry(this.days);
  final int days;

  Duration? get duration => days <= 0 ? null : Duration(days: days);

  int? get expiresAtMs {
    final d = duration;
    if (d == null) return null;
    return DateTime.now().millisecondsSinceEpoch + d.inMilliseconds;
  }

  static NoticeExpiry fromDays(int? days) {
    return NoticeExpiry.values.firstWhere(
      (e) => e.days == (days ?? 0),
      orElse: () => NoticeExpiry.sevenDays,
    );
  }
}

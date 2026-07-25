/// Local auto-delete window for mesh-scoped message history.
enum MeshRetention {
  /// Keep forever (no automatic purge).
  keep(0),
  oneDay(1),
  threeDays(3),
  sevenDays(7);

  const MeshRetention(this.days);
  final int days;

  Duration? get duration =>
      days <= 0 ? null : Duration(days: days);

  static MeshRetention fromDays(int? days) {
    return MeshRetention.values.firstWhere(
      (e) => e.days == (days ?? 0),
      orElse: () => MeshRetention.keep,
    );
  }
}

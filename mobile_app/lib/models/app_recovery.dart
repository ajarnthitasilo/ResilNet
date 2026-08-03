/// Result of Soft / Hard / Session recovery.
enum AppRecoveryOutcome { ok, partial, failed }

class AppRecoveryReport {
  const AppRecoveryReport({
    required this.outcome,
    this.notes = const [],
  });

  final AppRecoveryOutcome outcome;
  final List<String> notes;

  bool get ok => outcome == AppRecoveryOutcome.ok;
}

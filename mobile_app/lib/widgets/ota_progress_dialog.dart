import 'package:flutter/material.dart';

/// Dialog แสดงความคืบหน้า OTA / chunk reassembly พร้อม NACK ARQ %
class OtaProgressDialog extends StatelessWidget {
  const OtaProgressDialog({
    super.key,
    required this.title,
    required this.phaseLabel,
    required this.progress,
    required this.nackArqPercent,
    this.statusMessage,
    this.bytesPerSecond,
    this.onCancel,
  });

  final String title;
  final String phaseLabel;
  final double progress;
  final double nackArqPercent;
  final String? statusMessage;
  final double? bytesPerSecond;
  final VoidCallback? onCancel;

  static Future<void> show(
    BuildContext context, {
    required String title,
    required ValueNotifier<OtaProgressState> state,
    VoidCallback? onCancel,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AnimatedBuilder(
          animation: state,
          builder: (context, _) {
            final s = state.value;
            if (s.dismiss) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (Navigator.of(ctx).canPop()) Navigator.of(ctx).pop();
              });
            }
            return OtaProgressDialog(
              title: title,
              phaseLabel: s.phaseLabel,
              progress: s.progress,
              nackArqPercent: s.nackArqPercent,
              statusMessage: s.statusMessage,
              bytesPerSecond: s.bytesPerSecond,
              onCancel: onCancel,
            );
          },
        );
      },
    );
  }

  String _formatSpeed(double bps) {
    if (bps < 1024) return '${bps.toStringAsFixed(0)} B/s';
    return '${(bps / 1024).toStringAsFixed(1)} KB/s';
  }

  @override
  Widget build(BuildContext context) {
    final pct = (progress.clamp(0, 1) * 100).toStringAsFixed(1);
    final arq = nackArqPercent.clamp(0, 100).toStringAsFixed(0);

    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(phaseLabel, style: Theme.of(context).textTheme.titleSmall),
          if (statusMessage != null) ...[
            const SizedBox(height: 6),
            Text(statusMessage!),
          ],
          const SizedBox(height: 14),
          LinearProgressIndicator(value: progress.clamp(0, 1)),
          const SizedBox(height: 8),
          Text('ความคืบหน้า $pct% · NACK ARQ $arq%'),
          if (bytesPerSecond != null) ...[
            const SizedBox(height: 4),
            Text(
              _formatSpeed(bytesPerSecond!),
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ],
      ),
      actions: [
        if (onCancel != null)
          TextButton(onPressed: onCancel, child: const Text('ยกเลิก')),
      ],
    );
  }
}

/// สถานะสำหรับอัปเดต OTA progress dialog แบบ reactive
class OtaProgressState {
  const OtaProgressState({
    this.phaseLabel = 'กำลังเตรียม…',
    this.progress = 0,
    this.nackArqPercent = 0,
    this.statusMessage,
    this.bytesPerSecond,
    this.dismiss = false,
  });

  final String phaseLabel;
  final double progress;
  final double nackArqPercent;
  final String? statusMessage;
  final double? bytesPerSecond;
  final bool dismiss;

  OtaProgressState copyWith({
    String? phaseLabel,
    double? progress,
    double? nackArqPercent,
    String? statusMessage,
    double? bytesPerSecond,
    bool? dismiss,
  }) {
    return OtaProgressState(
      phaseLabel: phaseLabel ?? this.phaseLabel,
      progress: progress ?? this.progress,
      nackArqPercent: nackArqPercent ?? this.nackArqPercent,
      statusMessage: statusMessage ?? this.statusMessage,
      bytesPerSecond: bytesPerSecond ?? this.bytesPerSecond,
      dismiss: dismiss ?? this.dismiss,
    );
  }
}

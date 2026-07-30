import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../l10n/l10n_ext.dart';
import '../services/audio_recorder_service.dart';
import '../services/mic_permission.dart';

const double kVoiceRecordPanelHeight = 320;

@visibleForTesting
String formatVoiceRecordTimerMs(int ms) {
  final totalCs = ms ~/ 10;
  final cs = totalCs % 100;
  final totalSec = totalCs ~/ 100;
  final sec = totalSec % 60;
  final min = totalSec ~/ 60;
  return '${min.toString().padLeft(2, '0')}:'
      '${sec.toString().padLeft(2, '0')}.'
      '${cs.toString().padLeft(2, '0')}';
}

class VoiceRecordResult {
  const VoiceRecordResult({
    required this.bytes,
    required this.durationMs,
    this.ext = 'm4a',
  });

  final Uint8List bytes;
  final int durationMs;
  final String ext;
}

/// Tap mic → record sheet (timer + wave + stop) → preview (play / re-record / send).
Future<VoiceRecordResult?> showVoiceRecordSheet(BuildContext context) {
  debugPrint('[PTT] sheet-open');
  return showModalBottomSheet<VoiceRecordResult>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    isDismissible: false,
    enableDrag: false,
    useRootNavigator: true,
    builder: (_) => const _VoiceRecordPanel(),
  );
}

enum _VoicePhase { preparing, recording, preview }

class _VoiceRecordPanel extends StatefulWidget {
  const _VoiceRecordPanel();

  @override
  State<_VoiceRecordPanel> createState() => _VoiceRecordPanelState();
}

class _VoiceRecordPanelState extends State<_VoiceRecordPanel> {
  final _audio = AudioRecorderService();
  _VoicePhase _phase = _VoicePhase.preparing;
  int? _startedAtMs;
  int _elapsedMs = 0;
  Timer? _tickTimer;
  Timer? _waveTimer;
  Uint8List? _draftBytes;
  String? _draftPath;
  String _draftExt = 'm4a';
  int _draftDurationMs = 0;
  bool _playing = false;
  bool _stopping = false;
  final _waveHeights = List<double>.generate(48, (_) => 0.15);
  final _rng = Random();

  static const _minMs = 400;

  @override
  void initState() {
    super.initState();
    unawaited(_beginRecording());
  }

  @override
  void dispose() {
    _stopTimers();
    unawaited(_audio.stopPlayback());
    unawaited(_audio.cancelRecording());
    _audio.dispose();
    super.dispose();
  }

  void _stopTimers() {
    _tickTimer?.cancel();
    _tickTimer = null;
    _waveTimer?.cancel();
    _waveTimer = null;
  }

  Future<void> _beginRecording() async {
    try {
      await ensureMicPermission();
      await _audio.startRecording();
      if (!mounted) return;
      setState(() => _phase = _VoicePhase.recording);
      _startedAtMs = DateTime.now().millisecondsSinceEpoch;
      _tickTimer = Timer.periodic(const Duration(milliseconds: 50), (_) {
        final start = _startedAtMs;
        if (start == null || _phase != _VoicePhase.recording || !mounted) return;
        setState(() {
          _elapsedMs = DateTime.now().millisecondsSinceEpoch - start;
        });
      });
      _waveTimer = Timer.periodic(const Duration(milliseconds: 80), (_) {
        if (_phase != _VoicePhase.recording || !mounted) return;
        setState(() {
          for (var i = 0; i < _waveHeights.length; i++) {
            // Mostly low floor with occasional peaks (Voice Memos-like).
            _waveHeights[i] = _rng.nextDouble() < 0.18
                ? 0.25 + _rng.nextDouble() * 0.75
                : 0.08 + _rng.nextDouble() * 0.18;
          }
        });
      });
    } catch (e) {
      debugPrint('[PTT] sheet start failed: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.chatVoiceFailed('$e'))),
      );
      Navigator.of(context).pop();
    }
  }

  Future<void> _stopToPreview() async {
    if (_stopping || _phase != _VoicePhase.recording) return;
    _stopping = true;
    _stopTimers();
    final held = _startedAtMs == null
        ? _elapsedMs
        : DateTime.now().millisecondsSinceEpoch - _startedAtMs!;
    setState(() => _phase = _VoicePhase.preparing);

    final result = await _audio.stopRecording();
    _stopping = false;
    final bytes = result?.bytes;
    if (!mounted) return;

    if (held < _minMs || bytes == null || bytes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            held < _minMs
                ? context.l10n.voiceRecordTooShort
                : context.l10n.voiceRecordFailed,
          ),
        ),
      );
      Navigator.of(context).pop();
      return;
    }

    setState(() {
      _phase = _VoicePhase.preview;
      _draftBytes = bytes;
      _draftPath = result?.filePath;
      _draftExt = result?.ext ?? 'm4a';
      _draftDurationMs = held;
      _playing = false;
    });
  }

  Future<void> _togglePlay() async {
    final draft = _draftBytes;
    if (draft == null) return;
    if (_playing) {
      await _audio.stopPlayback();
      if (mounted) setState(() => _playing = false);
      return;
    }
    try {
      final path = _draftPath;
      if (path != null && path.isNotEmpty && File(path).existsSync()) {
        await _audio.playFile(path, ext: _draftExt);
      } else {
        await _audio.playBytes(draft, ext: _draftExt);
      }
      if (mounted) setState(() => _playing = true);
      // Best-effort reset after max duration window.
      Future<void>.delayed(Duration(milliseconds: _draftDurationMs + 400), () {
        if (mounted && _playing) setState(() => _playing = false);
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.chatPlayVoiceFailed('$e'))),
      );
    }
  }

  Future<void> _reRecord() async {
    await _audio.stopPlayback();
    setState(() {
      _phase = _VoicePhase.preparing;
      _draftBytes = null;
      _draftPath = null;
      _draftDurationMs = 0;
      _elapsedMs = 0;
      _playing = false;
      _stopping = false;
    });
    await _beginRecording();
  }

  void _discard() {
    unawaited(_audio.stopPlayback());
    unawaited(_audio.cancelRecording());
    Navigator.of(context).pop();
  }

  void _send() {
    final draft = _draftBytes;
    if (draft == null || draft.isEmpty) {
      debugPrint('[PTT] send ignored — empty draft');
      return;
    }
    debugPrint(
      '[PTT] send tap bytes=${draft.length} durMs=$_draftDurationMs',
    );
    // Do not gate on raw m4a size here — iOS containers are large even for
    // sub-second clips. Transport size is checked after seal on send.
    unawaited(_audio.stopPlayback());
    if (!mounted) return;
    Navigator.of(context).pop(
      VoiceRecordResult(
        bytes: draft,
        durationMs: _draftDurationMs,
        ext: _draftExt,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bottom = MediaQuery.paddingOf(context).bottom;
    return Container(
      height: kVoiceRecordPanelHeight + bottom,
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A1A),
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 14, 16, 16 + bottom),
        child: switch (_phase) {
          _VoicePhase.preparing => const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          _VoicePhase.recording => _buildRecording(l10n),
          _VoicePhase.preview => _buildPreview(l10n),
        },
      ),
    );
  }

  Widget _buildRecording(AppLocalizations l10n) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: _discard,
            icon: const Icon(Icons.close, color: Colors.white54),
          ),
        ),
        Text(
          formatVoiceRecordTimerMs(_elapsedMs),
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 28,
            fontWeight: FontWeight.w300,
            fontFeatures: [FontFeature.tabularFigures()],
          ),
        ),
        const SizedBox(height: 18),
        SizedBox(
          height: 56,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (final h in _waveHeights)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.5),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 70),
                      height: 56 * h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF3B30),
                        borderRadius: BorderRadius.circular(1.5),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const Spacer(),
        Text(
          l10n.voicePttRecording,
          style: const TextStyle(color: Colors.white38, fontSize: 13),
        ),
        const SizedBox(height: 14),
        GestureDetector(
          onTap: () => unawaited(_stopToPreview()),
          child: Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white24, width: 3),
            ),
            alignment: Alignment.center,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: const Color(0xFFFF3B30),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildPreview(AppLocalizations l10n) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                l10n.voicePttDraftReady,
                style: const TextStyle(color: Colors.white70, fontSize: 15),
              ),
            ),
            Text(
              formatVoiceRecordTimerMs(_draftDurationMs),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFeatures: [FontFeature.tabularFigures()],
              ),
            ),
            IconButton(
              onPressed: _discard,
              icon: const Icon(Icons.close, color: Colors.white54),
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => unawaited(_togglePlay()),
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _playing
                          ? const Color(0xFF10B981)
                          : const Color(0xFF10B981).withValues(alpha: 0.18),
                      border: Border.all(
                        color: const Color(0xFF10B981),
                        width: 2.5,
                      ),
                    ),
                    child: Icon(
                      _playing ? Icons.stop_rounded : Icons.play_arrow_rounded,
                      size: 40,
                      color: _playing ? Colors.black : const Color(0xFF10B981),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _playing ? l10n.voicePttStopPreview : l10n.voicePttPlayPreview,
                  style: const TextStyle(color: Colors.white54, fontSize: 13),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _Action(
              icon: Icons.delete_outline_rounded,
              label: l10n.voicePttDiscard,
              color: Colors.white54,
              onTap: _discard,
            ),
            _Action(
              icon: Icons.mic_none_rounded,
              label: l10n.voicePttReRecord,
              color: Colors.white70,
              onTap: () => unawaited(_reRecord()),
            ),
            _Action(
              icon: Icons.send_rounded,
              label: l10n.voicePttSend,
              color: const Color(0xFF10B981),
              filled: true,
              onTap: _send,
            ),
          ],
        ),
      ],
    );
  }
}

class _Action extends StatelessWidget {
  const _Action({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
    this.filled = false,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: filled ? color : Colors.transparent,
            shape: filled
                ? const CircleBorder()
                : CircleBorder(side: BorderSide(color: color.withValues(alpha: 0.45))),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onTap,
              child: SizedBox(
                width: 52,
                height: 52,
                child: Icon(icon, color: filled ? Colors.black : color),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(color: color, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

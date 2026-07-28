import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../l10n/l10n_ext.dart';
import '../services/audio_recorder_service.dart';
import '../services/mic_permission.dart';

/// Compact voice panel height (not full screen).
const double kVoiceRecordPanelHeight = 260;

/// Formats elapsed milliseconds as `MM:SS.cs` (Voice Memos style).
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

/// Result from the voice recorder panel.
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

/// Tap mic → compact panel → record → stop → preview → send.
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

enum _VoicePhase { idle, preparing, recording, preview }

class _VoiceRecordPanel extends StatefulWidget {
  const _VoiceRecordPanel();

  @override
  State<_VoiceRecordPanel> createState() => _VoiceRecordPanelState();
}

class _VoiceRecordPanelState extends State<_VoiceRecordPanel> {
  final _audio = AudioRecorderService();
  _VoicePhase _phase = _VoicePhase.idle;
  int? _recorderStartedAtMs;
  int _elapsedMs = 0;
  Timer? _tickTimer;
  Timer? _waveTimer;
  bool _recorderReady = false;
  String? _permError;
  Uint8List? _draftBytes;
  String? _draftPath;
  String _draftExt = 'm4a';
  int _draftDurationMs = 0;
  bool _playingPreview = false;
  final _waveHeights = List<double>.generate(16, (_) => 0.2);
  final _rng = Random();

  static const _minRecordMs = 400;

  @override
  void initState() {
    super.initState();
    unawaited(_prepareMic());
  }

  @override
  void dispose() {
    _stopTimers();
    unawaited(_audio.stopPlayback());
    unawaited(_audio.cancelRecording());
    _audio.dispose();
    super.dispose();
  }

  Future<void> _prepareMic() async {
    try {
      await ensureMicPermission();
    } catch (e) {
      debugPrint('[PTT] mic-permission failed: $e');
      if (!mounted) return;
      setState(() => _permError = '$e');
    }
  }

  String _formatTimer(int ms) => formatVoiceRecordTimerMs(ms);

  void _startTimers() {
    _recorderStartedAtMs = DateTime.now().millisecondsSinceEpoch;
    _tickTimer?.cancel();
    _tickTimer = Timer.periodic(const Duration(milliseconds: 50), (_) {
      final start = _recorderStartedAtMs;
      if (start == null || _phase != _VoicePhase.recording) return;
      if (mounted) {
        setState(() {
          _elapsedMs = DateTime.now().millisecondsSinceEpoch - start;
        });
      }
    });
    _waveTimer?.cancel();
    _waveTimer = Timer.periodic(const Duration(milliseconds: 90), (_) {
      if (_phase != _VoicePhase.recording || !mounted) return;
      setState(() {
        for (var i = 0; i < _waveHeights.length; i++) {
          _waveHeights[i] = 0.1 + _rng.nextDouble() * 0.9;
        }
      });
    });
  }

  void _stopTimers() {
    _tickTimer?.cancel();
    _tickTimer = null;
    _waveTimer?.cancel();
    _waveTimer = null;
  }

  Future<void> _onTapRecord() async {
    if (_phase != _VoicePhase.idle) return;
    if (_permError != null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.chatVoiceFailed(_permError!))),
      );
      return;
    }

    setState(() => _phase = _VoicePhase.preparing);
    debugPrint('[PTT] record-start');
    try {
      await ensureMicPermission();
      await _audio.startRecording();
      _recorderReady = true;
      debugPrint('[PTT] recorder-ready ext=${_audio.activeExt}');
      if (!mounted) return;
      setState(() => _phase = _VoicePhase.recording);
      _startTimers();
    } catch (e) {
      debugPrint('[PTT] record start failed: $e');
      if (!mounted) return;
      setState(() {
        _phase = _VoicePhase.idle;
        _permError = '$e';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.chatVoiceFailed('$e'))),
      );
    }
  }

  Future<void> _stopRecording() async {
    if (_phase != _VoicePhase.recording || !_recorderReady) return;
    if (mounted) setState(() => _phase = _VoicePhase.preparing);
    _stopTimers();
    final startedAt = _recorderStartedAtMs;
    final heldMs = startedAt == null
        ? _elapsedMs
        : DateTime.now().millisecondsSinceEpoch - startedAt;
    debugPrint('[PTT] stop heldMs=$heldMs ready=$_recorderReady');

    VoiceRecordingStopResult? result;
    if (_audio.isRecording) {
      result = await _audio.stopRecording();
    } else {
      await _audio.cancelRecording();
    }
    _recorderReady = false;
    _recorderStartedAtMs = null;

    final bytes = result?.bytes;
    debugPrint('[PTT] stop bytes=${bytes?.length ?? 0} ext=${result?.ext}');

    if (heldMs < _minRecordMs) {
      debugPrint('[PTT] drop voice note reason=too-short heldMs=$heldMs');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.voiceRecordTooShort)),
        );
        setState(() {
          _phase = _VoicePhase.idle;
          _elapsedMs = 0;
        });
      }
      return;
    }

    if (bytes == null || bytes.isEmpty) {
      debugPrint('[PTT] drop voice note reason=empty-bytes heldMs=$heldMs');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.voiceRecordFailed)),
        );
        setState(() {
          _phase = _VoicePhase.idle;
          _elapsedMs = 0;
        });
      }
      return;
    }

    if (!mounted) return;
    setState(() {
      _phase = _VoicePhase.preview;
      _draftBytes = bytes;
      _draftPath = result?.filePath;
      _draftExt = result?.ext ?? 'm4a';
      _draftDurationMs = heldMs;
      _playingPreview = false;
    });
    debugPrint('[PTT] draft-ready bytes=${bytes.length} heldMs=$heldMs');
  }

  Future<void> _cancelActive() async {
    _stopTimers();
    if (_recorderReady || _audio.isRecording) {
      await _audio.cancelRecording();
    }
    _recorderReady = false;
    _recorderStartedAtMs = null;
  }

  Future<void> _togglePreview() async {
    final draft = _draftBytes;
    if (draft == null) return;
    if (_playingPreview) {
      await _audio.stopPlayback();
      if (mounted) setState(() => _playingPreview = false);
      return;
    }
    try {
      debugPrint('[PTT] preview-play ext=$_draftExt path=$_draftPath');
      final path = _draftPath;
      if (path != null && path.isNotEmpty && File(path).existsSync()) {
        await _audio.playFile(path, ext: _draftExt);
      } else {
        await _audio.playBytes(draft, ext: _draftExt);
      }
      if (mounted) setState(() => _playingPreview = true);
    } catch (e) {
      debugPrint('[PTT] preview-play failed: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.chatPlayVoiceFailed('$e'))),
      );
    }
  }

  void _close() {
    debugPrint('[PTT] sheet-close');
    unawaited(_cancelActive());
    Navigator.of(context).pop();
  }

  void _discard() {
    debugPrint('[PTT] draft-discard');
    unawaited(_audio.stopPlayback());
    _close();
  }

  Future<void> _reRecord() async {
    debugPrint('[PTT] re-record');
    await _audio.stopPlayback();
    setState(() {
      _phase = _VoicePhase.idle;
      _draftBytes = null;
      _draftPath = null;
      _draftExt = 'm4a';
      _draftDurationMs = 0;
      _playingPreview = false;
      _elapsedMs = 0;
      _recorderStartedAtMs = null;
      _recorderReady = false;
    });
  }

  void _send() {
    final draft = _draftBytes;
    if (draft == null || draft.isEmpty) return;
    debugPrint('[PTT] draft-send bytes=${draft.length}');
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

    return Container(
      height: kVoiceRecordPanelHeight,
      decoration: BoxDecoration(
        color: const Color(0xFF141414),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 8, 12),
          child: _permError != null && _phase == _VoicePhase.idle
              ? _buildError(l10n)
              : switch (_phase) {
                  _VoicePhase.idle => _buildIdle(l10n),
                  _VoicePhase.preparing => _buildPreparing(l10n),
                  _VoicePhase.recording => _buildRecording(l10n),
                  _VoicePhase.preview => _buildPreview(l10n),
                },
        ),
      ),
    );
  }

  Widget _closeButton({VoidCallback? onPressed}) {
    return IconButton(
      onPressed: onPressed ?? _close,
      icon: const Icon(Icons.close, color: Colors.white54, size: 22),
      visualDensity: VisualDensity.compact,
    );
  }

  Widget _buildError(AppLocalizations l10n) {
    return Row(
      children: [
        Expanded(
          child: Text(
            l10n.chatVoiceFailed(_permError ?? ''),
            style: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
          ),
        ),
        _closeButton(),
      ],
    );
  }

  Widget _buildIdle(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                l10n.voiceRecordTapToStart,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.65),
                  fontSize: 15,
                ),
              ),
            ),
            _closeButton(),
          ],
        ),
        const Spacer(),
        Center(
          child: GestureDetector(
            onTap: () => unawaited(_onTapRecord()),
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.22),
                  width: 3,
                ),
              ),
              alignment: Alignment.center,
              child: Container(
                width: 52,
                height: 52,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF3B30),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _buildPreparing(AppLocalizations l10n) {
    return Row(
      children: [
        const SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            l10n.voicePttRecording,
            style: TextStyle(color: Colors.white.withValues(alpha: 0.65)),
          ),
        ),
        _closeButton(onPressed: () {
          unawaited(_cancelActive());
          if (mounted) setState(() => _phase = _VoicePhase.idle);
        }),
      ],
    );
  }

  Widget _buildRecording(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Icon(Icons.fiber_manual_record, color: Color(0xFFFF3B30), size: 12),
            const SizedBox(width: 8),
            Text(
              _formatTimer(_elapsedMs),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFeatures: [FontFeature.tabularFigures()],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 28,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (final h in _waveHeights)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 80),
                          width: 3,
                          height: 28 * h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF6B4A),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: _recorderReady ? () => unawaited(_stopRecording()) : null,
              icon: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white24, width: 2),
                ),
                alignment: Alignment.center,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF3B30),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
            _closeButton(onPressed: () async {
              await _cancelActive();
              if (mounted) _close();
            }),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          l10n.voicePttRecording,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.45),
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _buildPreview(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            IconButton(
              tooltip: _playingPreview
                  ? l10n.voicePttStopPreview
                  : l10n.voicePttPlayPreview,
              onPressed: () => unawaited(_togglePreview()),
              icon: Icon(
                _playingPreview ? Icons.stop_circle : Icons.play_circle_fill,
                color: const Color(0xFF10B981),
                size: 40,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              _formatTimer(_draftDurationMs),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFeatures: [FontFeature.tabularFigures()],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                l10n.voicePttDraftReady,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.55),
                  fontSize: 13,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            _closeButton(onPressed: _discard),
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _previewAction(
              tooltip: l10n.voicePttDiscard,
              icon: Icons.delete_outline_rounded,
              color: Colors.white54,
              onPressed: _discard,
            ),
            _previewAction(
              tooltip: l10n.voicePttReRecord,
              icon: Icons.mic_none_rounded,
              color: Colors.white70,
              onPressed: () => unawaited(_reRecord()),
            ),
            _previewAction(
              tooltip: l10n.voicePttSend,
              icon: Icons.send_rounded,
              color: const Color(0xFF10B981),
              filled: true,
              onPressed: _send,
            ),
          ],
        ),
      ],
    );
  }

  Widget _previewAction({
    required String tooltip,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
    bool filled = false,
  }) {
    const size = 52.0;
    if (filled) {
      return Tooltip(
        message: tooltip,
        child: Material(
          color: color,
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onPressed,
            child: SizedBox(
              width: size,
              height: size,
              child: Icon(icon, color: Colors.black, size: 24),
            ),
          ),
        ),
      );
    }
    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.transparent,
        shape: CircleBorder(
          side: BorderSide(color: color.withValues(alpha: 0.45)),
        ),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          child: SizedBox(
            width: size,
            height: size,
            child: Icon(icon, color: color, size: 26),
          ),
        ),
      ),
    );
  }
}

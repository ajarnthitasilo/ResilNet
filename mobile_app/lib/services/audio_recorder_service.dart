import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import 'mic_permission.dart';

/// Bytes + container extension from a completed recording.
class VoiceRecordingStopResult {
  const VoiceRecordingStopResult({
    required this.bytes,
    required this.ext,
    this.filePath,
  });

  final Uint8List bytes;
  final String ext;
  final String? filePath;
}

/// Detect container from magic bytes.
String detectAudioExt(Uint8List bytes) {
  if (bytes.length >= 4 &&
      bytes[0] == 0x4F &&
      bytes[1] == 0x67 &&
      bytes[2] == 0x67 &&
      bytes[3] == 0x53) {
    return 'opus';
  }
  if (bytes.length >= 4 &&
      bytes[0] == 0x63 &&
      bytes[1] == 0x61 &&
      bytes[2] == 0x66 &&
      bytes[3] == 0x66) {
    return 'caf';
  }
  if (bytes.length >= 8 &&
      bytes[4] == 0x66 &&
      bytes[5] == 0x74 &&
      bytes[6] == 0x79 &&
      bytes[7] == 0x70) {
    return 'm4a';
  }
  return 'm4a';
}

@visibleForTesting
bool isValidAudioBytes(Uint8List bytes) {
  if (bytes.length < 64) return false;
  if (bytes.length >= 4 &&
      bytes[0] == 0x4F &&
      bytes[1] == 0x67 &&
      bytes[2] == 0x67 &&
      bytes[3] == 0x53) {
    return true;
  }
  if (bytes.length >= 8 &&
      bytes[4] == 0x66 &&
      bytes[5] == 0x74 &&
      bytes[6] == 0x79 &&
      bytes[7] == 0x70) {
    return true;
  }
  // Accept any non-trivial file so short AAC drafts still send.
  return bytes.length >= 200;
}

/// Push-to-Talk voice note recorder — simple start/stop like v1.9.0.
class AudioRecorderService {
  AudioRecorderService()
      : _recorder = AudioRecorder(),
        _player = AudioPlayer();

  final AudioRecorder _recorder;
  final AudioPlayer _player;

  static const maxDuration = Duration(seconds: 12);
  static const sampleRate = 16000;
  /// Soft send cap (BLE/Nostr). Larger drafts are rejected at send time.
  static const maxBytes = 48 * 1024;

  static bool _playbackContextReady = false;

  Timer? _maxTimer;
  String? _activePath;
  String? _activeExt;
  bool _recording = false;

  bool get isRecording => _recording;
  String? get activeExt => _activeExt;

  Future<bool> hasPermission() => micPermissionGranted();

  Future<void> _ensurePlaybackContext() async {
    if (_playbackContextReady) return;
    await AudioPlayer.global.setAudioContext(
      AudioContext(
        iOS: AudioContextIOS(
          category: AVAudioSessionCategory.playAndRecord,
          options: {
            AVAudioSessionOptions.defaultToSpeaker,
            AVAudioSessionOptions.allowBluetooth,
          },
        ),
        android: const AudioContextAndroid(
          isSpeakerphoneOn: true,
          stayAwake: true,
          contentType: AndroidContentType.speech,
          usageType: AndroidUsageType.media,
          audioFocus: AndroidAudioFocus.gain,
        ),
      ),
    );
    _playbackContextReady = true;
  }

  Future<void> startRecording() async {
    if (_recording) return;
    await ensureMicPermission();

    final dir = (await getTemporaryDirectory()).path;
    final stamp = DateTime.now().millisecondsSinceEpoch;

    // AAC first (reliable on iOS/Android); Opus fallback.
    final attempts = <({String path, String ext, RecordConfig config})>[
      (
        path: '$dir/resilnet_voice_$stamp.m4a',
        ext: 'm4a',
        config: const RecordConfig(
          encoder: AudioEncoder.aacLc,
          sampleRate: sampleRate,
          bitRate: 16000,
          numChannels: 1,
        ),
      ),
      (
        path: '$dir/resilnet_voice_$stamp.opus',
        ext: 'opus',
        config: const RecordConfig(
          encoder: AudioEncoder.opus,
          sampleRate: sampleRate,
          bitRate: 16000,
          numChannels: 1,
        ),
      ),
    ];

    Object? lastError;
    for (final attempt in attempts) {
      try {
        await _recorder.start(attempt.config, path: attempt.path);
        _activePath = attempt.path;
        _activeExt = attempt.ext;
        _recording = true;
        debugPrint('[PTT] recording to ${attempt.path}');
        _maxTimer?.cancel();
        _maxTimer = Timer(maxDuration, () {
          unawaited(stopRecording());
        });
        return;
      } catch (e) {
        lastError = e;
        debugPrint('[PTT] encoder ${attempt.ext} failed: $e');
      }
    }
    throw StateError('เริ่มอัดเสียงไม่สำเร็จ: $lastError');
  }

  /// Stop and return audio bytes (null if empty / missing).
  Future<VoiceRecordingStopResult?> stopRecording() async {
    _maxTimer?.cancel();
    _maxTimer = null;
    if (!_recording) return null;

    final savedPath = _activePath;
    final fallbackExt = _activeExt ?? 'm4a';

    String? stopPath;
    try {
      stopPath = await _recorder.stop();
    } catch (e) {
      debugPrint('[PTT] recorder.stop error: $e');
    }
    _recording = false;
    _activePath = null;
    _activeExt = null;

    final filePath = (stopPath != null && stopPath.isNotEmpty)
        ? stopPath
        : (savedPath ?? '');
    if (filePath.isEmpty) return null;

    // iOS / some OEMs flush the container a moment after stop.
    final file = File(filePath);
    Uint8List? bytes;
    for (var i = 0; i < (Platform.isIOS ? 20 : 8); i++) {
      if (await file.exists()) {
        final len = await file.length();
        if (len >= 64) {
          final raw = await file.readAsBytes();
          if (raw.isNotEmpty) {
            bytes = Uint8List.fromList(raw);
            break;
          }
        }
      }
      await Future<void>.delayed(
        Duration(milliseconds: Platform.isIOS ? 100 : 50),
      );
    }

    if (bytes == null || bytes.isEmpty) {
      debugPrint('[PTT] stop empty path=$filePath');
      await file.delete().catchError((_) => file);
      return null;
    }

    debugPrint('[PTT] stop ok bytes=${bytes.length} path=$filePath');
    // Keep temp file briefly for local preview playbacks that want a path.
    return VoiceRecordingStopResult(
      bytes: bytes,
      ext: detectAudioExt(bytes).isNotEmpty ? detectAudioExt(bytes) : fallbackExt,
      filePath: filePath,
    );
  }

  Future<void> cancelRecording() async {
    _maxTimer?.cancel();
    _maxTimer = null;
    final savedPath = _activePath;
    if (_recording) {
      try {
        final path = await _recorder.stop();
        final toDelete = (path != null && path.isNotEmpty) ? path : savedPath;
        if (toDelete != null && toDelete.isNotEmpty) {
          await File(toDelete).delete().catchError((_) => File(toDelete));
        }
      } catch (e) {
        debugPrint('[PTT] cancelRecording error: $e');
      }
      _recording = false;
    }
    _activePath = null;
    _activeExt = null;
  }

  Future<void> playFile(String path, {String? ext}) async {
    await _ensurePlaybackContext();
    await _player.stop();
    await _player.setReleaseMode(ReleaseMode.stop);
    await _player.setVolume(1.0);
    debugPrint('[PTT] play file=$path ext=$ext');
    await _player.play(DeviceFileSource(path));
  }

  Future<void> playBytes(Uint8List bytes, {String? ext}) async {
    final resolvedExt = ext ?? detectAudioExt(bytes);
    final dir = await getTemporaryDirectory();
    final path =
        '${dir.path}/resilnet_play_${DateTime.now().millisecondsSinceEpoch}.$resolvedExt';
    await File(path).writeAsBytes(bytes, flush: true);
    await playFile(path, ext: resolvedExt);
  }

  Future<void> stopPlayback() => _player.stop();

  void dispose() {
    _maxTimer?.cancel();
    unawaited(_recorder.dispose());
    unawaited(_player.dispose());
    if (_activePath != null) {
      File(_activePath!).delete().catchError((_) => File(_activePath!));
    }
  }
}

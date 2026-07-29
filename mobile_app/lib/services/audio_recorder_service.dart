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
  /// File extension used for playback, e.g. `opus` or `m4a`.
  final String ext;
  /// Temp file kept alive for reliable preview playback (optional).
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

/// True when [bytes] look like a playable audio container (not just non-empty).
@visibleForTesting
bool isValidAudioBytes(Uint8List bytes) {
  if (bytes.length < 64) return false;
  final ext = detectAudioExt(bytes);
  if (ext == 'opus' || ext == 'caf' || ext == 'm4a') return true;
  return false;
}

/// Push-to-Talk voice note recorder — 16 kHz, สูงสุด 15 วินาที
class AudioRecorderService {
  AudioRecorderService()
      : _recorder = AudioRecorder(),
        _player = AudioPlayer();

  final AudioRecorder _recorder;
  final AudioPlayer _player;

  static const maxDuration = Duration(seconds: 8);
  static const sampleRate = 16000;
  /// Soft cap so sealed voice fits BLE chunk limit (~51 KB ciphertext) and Nostr.
  static const maxBytes = 18 * 1024;

  static bool _playbackContextReady = false;

  Timer? _maxTimer;
  String? _activePath;
  String? _activeExt;
  String? _previewPath;
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
          usageType: AndroidUsageType.voiceCommunication,
          audioFocus: AndroidAudioFocus.gain,
        ),
      ),
    );
    _playbackContextReady = true;
  }

  List<({String path, String ext, RecordConfig config})> _encoderAttempts(
    String dir,
    int stamp,
  ) {
    final m4a = (
      path: '$dir/resilnet_voice_$stamp.m4a',
      ext: 'm4a',
      config: const RecordConfig(
        encoder: AudioEncoder.aacLc,
        sampleRate: sampleRate,
        bitRate: 24000,
        numChannels: 1,
      ),
    );
    final opus = (
      path: '$dir/resilnet_voice_$stamp.opus',
      ext: 'opus',
      config: const RecordConfig(
        encoder: AudioEncoder.opus,
        sampleRate: sampleRate,
        bitRate: 24000,
        numChannels: 1,
      ),
    );
    // AAC/m4a is the most reliable container on both iOS and Android.
    return [m4a, opus];
  }

  Future<void> startRecording() async {
    if (_recording) return;
    await ensureMicPermission();
    await _deletePreviewFile();

    final dir = (await getTemporaryDirectory()).path;
    final stamp = DateTime.now().millisecondsSinceEpoch;

    Object? lastError;
    for (final attempt in _encoderAttempts(dir, stamp)) {
      try {
        await _recorder.start(attempt.config, path: attempt.path);
        _activePath = attempt.path;
        _activeExt = attempt.ext;
        _recording = true;
        debugPrint('[PTT] recording to ${attempt.path} ext=${attempt.ext}');
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

  Future<({Uint8List bytes, String ext})?> _readRecordingFile(
    String filePath,
    String fallbackExt,
  ) async {
    if (filePath.isEmpty) return null;
    final file = File(filePath);
    final attempts = Platform.isIOS ? 20 : 10;
    for (var attempt = 0; attempt < attempts; attempt++) {
      if (await file.exists()) {
        final len = await file.length();
        if (len >= 64) {
          final raw = await file.readAsBytes();
          if (raw.isNotEmpty && isValidAudioBytes(raw)) {
            final ext = detectAudioExt(raw);
            if (raw.length > maxBytes) {
              debugPrint('[PTT] recording too large: ${raw.length}');
              return null;
            }
            return (bytes: Uint8List.fromList(raw), ext: ext);
          }
          if (raw.isNotEmpty && attempt >= attempts - 3) {
            debugPrint(
              '[PTT] invalid audio header len=${raw.length} '
              'ext=$fallbackExt magic=${raw.take(8).toList()}',
            );
          }
        }
      }
      await Future<void>.delayed(
        Duration(milliseconds: Platform.isIOS ? 100 : 80),
      );
    }
    // Some OEM encoders flush late or omit magic bytes we recognize — still
    // accept non-empty files so preview actions appear after a valid recording.
    if (await file.exists()) {
      final len = await file.length();
      if (len >= 64) {
        final raw = await file.readAsBytes();
        if (raw.isNotEmpty) {
          if (raw.length > maxBytes) {
            debugPrint('[PTT] recording too large (fallback): ${raw.length}');
            return null;
          }
          final ext =
              isValidAudioBytes(raw) ? detectAudioExt(raw) : fallbackExt;
          debugPrint(
            '[PTT] fallback read len=${raw.length} ext=$ext '
            'valid=${isValidAudioBytes(raw)}',
          );
          return (bytes: Uint8List.fromList(raw), ext: ext);
        }
      }
    }
    return null;
  }

  Future<void> _deletePreviewFile() async {
    final path = _previewPath;
    _previewPath = null;
    if (path != null && path.isNotEmpty) {
      await File(path).delete().catchError((_) => File(path));
    }
  }

  /// Stop recording and return bytes + container extension.
  Future<VoiceRecordingStopResult?> stopRecording() async {
    _maxTimer?.cancel();
    _maxTimer = null;
    if (!_recording) return null;

    final fallbackExt = _activeExt ?? 'm4a';
    final savedPath = _activePath;

    String? stopPath;
    try {
      stopPath = await _recorder.stop();
    } catch (e) {
      debugPrint('[PTT] recorder.stop error: $e');
    }
    _recording = false;
    _activePath = null;
    _activeExt = null;

    if (Platform.isIOS) {
      await Future<void>.delayed(const Duration(milliseconds: 200));
    }

    final filePath = (stopPath != null && stopPath.isNotEmpty)
        ? stopPath
        : (savedPath ?? '');
    debugPrint('[PTT] stop path=$filePath ext=$fallbackExt stopReturn=$stopPath');

    final read = await _readRecordingFile(filePath, fallbackExt);
    if (read == null) {
      debugPrint('[PTT] stopRecording invalid or empty path=$filePath');
      if (filePath.isNotEmpty) {
        await File(filePath).delete().catchError((_) => File(filePath));
      }
      return null;
    }

    await _deletePreviewFile();
    _previewPath = filePath;
    debugPrint(
      '[PTT] stop ok bytes=${read.bytes.length} ext=${read.ext} path=$filePath',
    );
    return VoiceRecordingStopResult(
      bytes: read.bytes,
      ext: read.ext,
      filePath: filePath,
    );
  }

  /// Stop an active recording, or return bytes retained after auto-stop.
  Future<VoiceRecordingStopResult?> finishRecording() async {
    if (_recording) return stopRecording();
    final path = _previewPath;
    if (path == null || path.isEmpty) return null;
    final ext = path.split('.').last.toLowerCase();
    final fallbackExt =
        ext == 'opus' || ext == 'm4a' || ext == 'caf' ? ext : 'm4a';
    final read = await _readRecordingFile(path, fallbackExt);
    if (read == null) return null;
    return VoiceRecordingStopResult(
      bytes: read.bytes,
      ext: read.ext,
      filePath: path,
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

  /// Fires when preview playback reaches the end (or is stopped).
  StreamSubscription<void>? _onCompleteSub;

  Future<void> playFile(
    String path, {
    String? ext,
    VoidCallback? onComplete,
  }) async {
    await _ensurePlaybackContext();
    await _onCompleteSub?.cancel();
    _onCompleteSub = null;
    await _player.stop();
    await _player.setReleaseMode(ReleaseMode.stop);
    await _player.setPlayerMode(PlayerMode.mediaPlayer);
    if (onComplete != null) {
      _onCompleteSub = _player.onPlayerComplete.listen((_) {
        onComplete();
      });
    }
    final source = DeviceFileSource(path);
    debugPrint('[PTT] play file=$path ext=$ext');
    await _player.play(source);
  }

  Future<void> playBytes(
    Uint8List bytes, {
    String? ext,
    VoidCallback? onComplete,
  }) async {
    final resolvedExt = ext ?? detectAudioExt(bytes);
    final dir = await getTemporaryDirectory();
    final path =
        '${dir.path}/resilnet_play_${DateTime.now().millisecondsSinceEpoch}.$resolvedExt';
    final file = File(path);
    await file.writeAsBytes(bytes, flush: true);
    await playFile(path, ext: resolvedExt, onComplete: onComplete);
  }

  Future<void> stopPlayback() async {
    await _onCompleteSub?.cancel();
    _onCompleteSub = null;
    await _player.stop();
  }

  void dispose() {
    _maxTimer?.cancel();
    unawaited(_onCompleteSub?.cancel());
    _onCompleteSub = null;
    unawaited(_recorder.dispose());
    unawaited(_player.dispose());
    if (_activePath != null) {
      File(_activePath!).delete().catchError((_) => File(_activePath!));
    }
    unawaited(_deletePreviewFile());
  }
}

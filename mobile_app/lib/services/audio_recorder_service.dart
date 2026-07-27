import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import 'mic_permission.dart';

/// Push-to-Talk voice note recorder — 16 kHz Opus, สูงสุด 15 วินาที / <20 KB
class AudioRecorderService {
  AudioRecorderService()
      : _recorder = AudioRecorder(),
        _player = AudioPlayer();

  final AudioRecorder _recorder;
  final AudioPlayer _player;

  static const maxDuration = Duration(seconds: 15);
  static const sampleRate = 16000;
  static const maxBytes = 20 * 1024;

  Timer? _maxTimer;
  String? _activePath;
  bool _recording = false;

  bool get isRecording => _recording;

  Future<bool> hasPermission() => micPermissionGranted();

  Future<void> startRecording() async {
    if (_recording) return;
    await ensureMicPermission();

    final dir = await getTemporaryDirectory();
    final stamp = DateTime.now().millisecondsSinceEpoch;

    // Prefer Opus; fall back to AAC if the platform encoder is unavailable.
    Object? lastError;
    for (final attempt in [
      (
        path: '${dir.path}/resilnet_voice_$stamp.opus',
        config: const RecordConfig(
          encoder: AudioEncoder.opus,
          sampleRate: sampleRate,
          bitRate: 32000,
          numChannels: 1,
        ),
      ),
      (
        path: '${dir.path}/resilnet_voice_$stamp.m4a',
        config: const RecordConfig(
          encoder: AudioEncoder.aacLc,
          sampleRate: sampleRate,
          bitRate: 32000,
          numChannels: 1,
        ),
      ),
    ]) {
      try {
        await _recorder.start(attempt.config, path: attempt.path);
        _activePath = attempt.path;
        _recording = true;
        _maxTimer?.cancel();
        _maxTimer = Timer(maxDuration, () {
          unawaited(stopRecording());
        });
        return;
      } catch (e) {
        lastError = e;
      }
    }
    throw StateError('เริ่มอัดเสียงไม่สำเร็จ: $lastError');
  }

  /// หยุดอัดแล้วคืน Opus bytes (null ถ้าว่างหรือเกินขนาด)
  Future<Uint8List?> stopRecording() async {
    _maxTimer?.cancel();
    _maxTimer = null;
    if (!_recording) return null;

    final path = await _recorder.stop();
    _recording = false;
    _activePath = null;

    final filePath = path ?? '';
    if (filePath.isEmpty) return null;

    final file = File(filePath);
    if (!await file.exists()) return null;

    final bytes = await file.readAsBytes();
    await file.delete().catchError((_) => file);

    if (bytes.isEmpty) return null;
    if (bytes.length > maxBytes) {
      return Uint8List.sublistView(bytes, 0, maxBytes);
    }
    return Uint8List.fromList(bytes);
  }

  Future<void> cancelRecording() async {
    _maxTimer?.cancel();
    _maxTimer = null;
    if (_recording) {
      final path = await _recorder.stop();
      _recording = false;
      if (path != null) {
        await File(path).delete().catchError((_) => File(path));
      }
    }
    _activePath = null;
  }

  Future<void> playBytes(Uint8List bytes) async {
    final dir = await getTemporaryDirectory();
    // Detect container loosely; players accept both Opus and AAC in practice.
    final ext = bytes.length >= 4 &&
            bytes[0] == 0x4F &&
            bytes[1] == 0x67 &&
            bytes[2] == 0x67 &&
            bytes[3] == 0x53
        ? 'opus'
        : 'm4a';
    final path =
        '${dir.path}/resilnet_play_${DateTime.now().millisecondsSinceEpoch}.$ext';
    final file = File(path);
    await file.writeAsBytes(bytes, flush: true);
    await _player.stop();
    await _player.play(DeviceFileSource(path));
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

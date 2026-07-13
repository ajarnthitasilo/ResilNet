import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

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

  Future<bool> hasPermission() => _recorder.hasPermission();

  Future<void> startRecording() async {
    if (_recording) return;
    if (!await hasPermission()) {
      throw StateError('ไม่ได้รับอนุญาตไมโครโฟน');
    }

    final dir = await getTemporaryDirectory();
    final path =
        '${dir.path}/resilnet_voice_${DateTime.now().millisecondsSinceEpoch}.opus';
    _activePath = path;

    await _recorder.start(
      const RecordConfig(
        encoder: AudioEncoder.opus,
        sampleRate: sampleRate,
        bitRate: 32000,
        numChannels: 1,
      ),
      path: path,
    );
    _recording = true;

    _maxTimer?.cancel();
    _maxTimer = Timer(maxDuration, () {
      unawaited(stopRecording());
    });
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

  Future<void> playBytes(Uint8List opusBytes) async {
    final dir = await getTemporaryDirectory();
    final path =
        '${dir.path}/resilnet_play_${DateTime.now().millisecondsSinceEpoch}.opus';
    final file = File(path);
    await file.writeAsBytes(opusBytes, flush: true);
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

import 'dart:async';
import 'dart:io' show Platform;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

import '../core/firebase_config.dart';
import '../firebase_options.dart';
import '../models/push_signal.dart';
import '../push_background_handler.dart';
import 'fcm_token_service.dart';
import 'push_signal_processor.dart';

/// FCM/APNs integration — privacy-first (metadata-only wire payloads).
class PushNotificationService {
  PushNotificationService();

  final _messaging = FirebaseMessaging.instance;
  bool _initialized = false;
  bool _firebaseReady = false;

  PushSignalProcessor? _processor;
  FcmTokenService? _tokenService;
  String? _myUserId;

  bool get isReady => _initialized && _firebaseReady;

  Future<bool> init({
    required PushSignalProcessor processor,
    FcmTokenService? tokenService,
    String? myUserId,
  }) async {
    if (_initialized) return _firebaseReady;
    _processor = processor;
    _tokenService = tokenService;
    _myUserId = myUserId;

    if (!FirebaseConfig.isConfigured) {
      debugPrint('[Push] Firebase skipped — placeholders still in use');
      _initialized = true;
      return false;
    }

    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      _firebaseReady = true;

      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

      await _requestPlatformPermissions();

      final settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );
      debugPrint('[Push] permission=${settings.authorizationStatus}');

      FirebaseMessaging.onMessage.listen(_onForegroundMessage);
      FirebaseMessaging.onMessageOpenedApp.listen(_onOpenedApp);

      final initial = await _messaging.getInitialMessage();
      if (initial != null) {
        unawaited(_dispatch(initial.data));
      }

      _messaging.onTokenRefresh.listen((token) {
        unawaited(_registerToken(token));
      });

      final token = await _messaging.getToken();
      if (token != null) {
        await _registerToken(token);
      }

      debugPrint('[Push] FCM initialized');
    } catch (e, st) {
      debugPrint('[Push] Firebase init failed (non-fatal): $e\n$st');
      _firebaseReady = false;
    }

    _initialized = true;
    return _firebaseReady;
  }

  Future<void> _requestPlatformPermissions() async {
    if (Platform.isAndroid) {
      await Permission.notification.request();
    }
  }

  Future<void> updateUserContext({
    required String myUserId,
    FcmTokenService? tokenService,
  }) async {
    _myUserId = myUserId;
    _tokenService = tokenService;
    if (_firebaseReady) {
      final token = await _messaging.getToken();
      if (token != null) await _registerToken(token);
    }
  }

  Future<void> _registerToken(String token) async {
    final userId = _myUserId;
    final svc = _tokenService;
    if (userId == null || svc == null) return;
    try {
      await svc.upsertToken(userId: userId, fcmToken: token);
    } catch (e) {
      debugPrint('[Push] token upsert failed: $e');
    }
  }

  void _onForegroundMessage(RemoteMessage message) {
    unawaited(_dispatch(message.data));
  }

  void _onOpenedApp(RemoteMessage message) {
    unawaited(_dispatch(message.data));
  }

  Future<void> _dispatch(Map<String, dynamic> data) async {
    final processor = _processor;
    if (processor == null) return;
    final signal = PushSignal.fromRemoteData(data);
    if (!signal.isMessageSignal) return;
    await processor.handleSignal(signal);
  }
}

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

import '../models/push_signal.dart';

class NotificationService {
  final _plugin = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings();
    const settings = InitializationSettings(android: android, iOS: ios);
    await _plugin.initialize(settings: settings);

    const directChannel = AndroidNotificationChannel(
      'resilnet_direct',
      'Direct Messages',
      description: 'แจ้งเตือนข้อความส่วนตัว (E2EE)',
      importance: Importance.high,
    );
    final androidPlugin = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await androidPlugin?.createNotificationChannel(directChannel);

    _initialized = true;
  }

  Future<void> requestPermissions() async {
    await Permission.notification.request();
    final ios = _plugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>();
    await ios?.requestPermissions(alert: true, badge: true, sound: true);
  }

  /// Direct message — body is produced on-device after local decryption.
  Future<void> showDirectMessage({
    required int id,
    required String title,
    required String body,
  }) async {
    await _show(
      id: id,
      title: title,
      body: body,
      channelId: 'resilnet_direct',
      channelName: 'Direct Messages',
    );
  }

  Future<void> showGenericMessageSignal({required int id}) async {
    await showDirectMessage(
      id: id,
      title: PushNotificationCopy.title,
      body: PushNotificationCopy.genericBody,
    );
  }

  Future<void> _show({
    required int id,
    required String title,
    required String body,
    required String channelId,
    required String channelName,
  }) async {
    final android = AndroidNotificationDetails(
      channelId,
      channelName,
      importance: Importance.high,
      priority: Priority.high,
    );
    const ios = DarwinNotificationDetails();
    final details = NotificationDetails(android: android, iOS: ios);
    await _plugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: details,
    );
  }
}

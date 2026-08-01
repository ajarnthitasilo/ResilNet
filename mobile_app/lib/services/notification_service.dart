import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

import '../models/push_signal.dart';

class NotificationService {
  final _plugin = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  /// Stable id so presence summary updates replace the previous banner.
  static const presenceSummaryNotificationId = 71001;

  Future<void> init() async {
    if (_initialized) return;
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    // Request permission at init time on iOS/macOS; show alerts in foreground too.
    const darwin = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const settings = InitializationSettings(
      android: android,
      iOS: darwin,
      macOS: darwin,
    );
    await _plugin.initialize(settings: settings);

    const directChannel = AndroidNotificationChannel(
      'resilnet_direct',
      'Direct Messages',
      description: 'แจ้งเตือนข้อความส่วนตัว (E2EE)',
      importance: Importance.high,
    );
    const presenceChannel = AndroidNotificationChannel(
      'resilnet_presence',
      'Presence',
      description: 'People online on mesh / Nostr',
      importance: Importance.high,
    );
    final androidPlugin = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    await androidPlugin?.createNotificationChannel(directChannel);
    await androidPlugin?.createNotificationChannel(presenceChannel);

    _initialized = true;
    debugPrint('[Notify] initialized');
    try {
      await logPermissionStatus(reason: 'init');
    } catch (e) {
      debugPrint('[Notify] logPermissionStatus skipped: $e');
    }
  }

  Future<void> requestPermissions({String reason = 'unknown'}) async {
    debugPrint('[Notify] permission request begin reason=$reason');
    try {
      final status = await Permission.notification.request();
      debugPrint('[Notify] permission request result=$status reason=$reason');
    } catch (e) {
      debugPrint('[Notify] permission request skipped: $e');
    }
    try {
      final ios = _plugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >();
      final iosRes = await ios?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      debugPrint('[Notify] iOS permission result=$iosRes reason=$reason');
    } catch (e) {
      debugPrint('[Notify] iOS permission skipped: $e');
    }
    try {
      final mac = _plugin
          .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin
          >();
      final macRes = await mac?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      debugPrint('[Notify] macOS permission result=$macRes reason=$reason');
    } catch (e) {
      debugPrint('[Notify] macOS permission skipped: $e');
    }
    await logPermissionStatus(reason: 'post-request:$reason');
  }

  Future<PermissionStatus> currentPermissionStatus() {
    return Permission.notification.status;
  }

  Future<void> logPermissionStatus({String reason = 'status-check'}) async {
    final status = await currentPermissionStatus();
    debugPrint('[Notify] permission status=$status reason=$reason');
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

  /// Favorite peer appeared nearby or in area.
  Future<void> showFavoriteAlert({
    required int id,
    required String title,
    required String body,
  }) async {
    await showPresenceAlert(id: id, title: title, body: body);
  }

  /// Someone came online on mesh or Nostr (presence channel).
  Future<void> showPresenceAlert({
    required int id,
    required String title,
    required String body,
  }) async {
    await _show(
      id: id,
      title: title,
      body: body,
      channelId: 'resilnet_presence',
      channelName: 'Presence',
    );
  }

  /// Sticky summary of online counts (updates in place in Notification Center).
  Future<void> showPresenceSummary({
    required String title,
    required String body,
  }) async {
    await _show(
      id: presenceSummaryNotificationId,
      title: title,
      body: body,
      channelId: 'resilnet_presence',
      channelName: 'Presence',
    );
  }

  Future<void> clearPresenceSummary() async {
    await _plugin.cancel(id: presenceSummaryNotificationId);
  }

  Future<void> _show({
    required int id,
    required String title,
    required String body,
    required String channelId,
    required String channelName,
  }) async {
    final status = await Permission.notification.status;
    if (!status.isGranted && !status.isLimited && !status.isProvisional) {
      debugPrint(
        '[Notify] skip id=$id channel=$channelId reason=permission:$status',
      );
      return;
    }
    debugPrint('[Notify] enqueue id=$id channel=$channelId reason=show');
    final android = AndroidNotificationDetails(
      channelId,
      channelName,
      importance: Importance.high,
      priority: Priority.high,
      ongoing: id == presenceSummaryNotificationId,
      onlyAlertOnce: id == presenceSummaryNotificationId,
    );
    const ios = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      presentBanner: true,
      presentList: true,
    );
    final details = NotificationDetails(android: android, iOS: ios);
    await _plugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: details,
    );
    debugPrint('[Notify] shown id=$id channel=$channelId title=$title');
  }
}

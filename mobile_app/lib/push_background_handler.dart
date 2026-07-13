import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/firebase_config.dart';
import 'firebase_options.dart';
import 'models/push_signal.dart';
import 'services/crypto_service.dart';
import 'services/database_service.dart';
import 'services/init_supabase.dart';
import 'services/notification_service.dart';
import 'services/push_signal_processor.dart';
import 'services/supabase_sync_service.dart';

/// Optional test hook for background processor injection.
PushSignalProcessor? pushBackgroundProcessor;

/// Background FCM handler — fetch ciphertext from Supabase, decrypt locally,
/// show generic or decrypted local notification only.
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!FirebaseConfig.isConfigured) return;

  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await initSupabase();
    await ensureSupabaseAuthSession();

    final signal = PushSignal.fromRemoteData(message.data);
    if (!signal.isMessageSignal) return;

    final db = DatabaseService();
    await db.init();

    final crypto = CryptoService();
    await crypto.init();

    final notifications = NotificationService();
    await notifications.init();

    final myUserId = crypto.myUserId;
    SupabaseSyncService? sync;
    if (Supabase.instance.isInitialized) {
      sync = SupabaseSyncService(
        database: db,
        supabase: Supabase.instance.client,
        myUserId: myUserId,
      );
    }

    final processor = pushBackgroundProcessor ??
        PushSignalProcessor(
          database: db,
          crypto: crypto,
          notifications: notifications,
          myUserId: myUserId,
          supabaseSync: sync,
          notificationsEnabled: true,
        );

    await processor.handleSignal(signal);
  } catch (e, st) {
    debugPrint('[PushBG] handler error: $e\n$st');
    try {
      final notifications = NotificationService();
      await notifications.init();
      await notifications.showDirectMessage(
        id: message.hashCode.abs() % 2147483647,
        title: PushNotificationCopy.title,
        body: PushNotificationCopy.genericBody,
      );
    } catch (_) {}
  }
}

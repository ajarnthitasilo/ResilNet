/// Firebase project constants — replace via `--dart-define` at build time
/// or update defaults after creating a Firebase project.
class FirebaseConfig {
  FirebaseConfig._();

  static const projectId = String.fromEnvironment(
    'FIREBASE_PROJECT_ID',
    defaultValue: 'resilnet-messaging',
  );
  static const messagingSenderId = String.fromEnvironment(
    'FIREBASE_MESSAGING_SENDER_ID',
    defaultValue: '000000000000',
  );
  static const androidApiKey = String.fromEnvironment(
    'FIREBASE_ANDROID_API_KEY',
    defaultValue: 'AIzaSy-placeholder-replace-with-real-key',
  );
  static const iosApiKey = String.fromEnvironment(
    'FIREBASE_IOS_API_KEY',
    defaultValue: 'AIzaSy-placeholder-replace-with-real-key',
  );
  static const iosAppId = String.fromEnvironment(
    'FIREBASE_IOS_APP_ID',
    defaultValue: '1:000000000000:ios:placeholder',
  );
  static const androidAppId = String.fromEnvironment(
    'FIREBASE_ANDROID_APP_ID',
    defaultValue: '1:000000000000:android:placeholder',
  );

  /// Skip FCM when placeholders are still in use (offline-only dev builds).
  static bool get isConfigured =>
      !androidApiKey.contains('placeholder') &&
      !iosApiKey.contains('placeholder') &&
      messagingSenderId != '000000000000';
}

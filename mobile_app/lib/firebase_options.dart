import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

import 'core/firebase_config.dart';

/// Firebase options for ResilNet — sync with `google-services.json` /
/// `GoogleService-Info.plist` after `flutterfire configure`.
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError('ResilNet web push is not configured.');
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return ios;
      default:
        throw UnsupportedError(
          'Firebase is not supported on $defaultTargetPlatform.',
        );
    }
  }

  static FirebaseOptions get android => FirebaseOptions(
        apiKey: FirebaseConfig.androidApiKey,
        appId: FirebaseConfig.androidAppId,
        messagingSenderId: FirebaseConfig.messagingSenderId,
        projectId: FirebaseConfig.projectId,
        storageBucket: '${FirebaseConfig.projectId}.appspot.com',
      );

  static FirebaseOptions get ios => FirebaseOptions(
        apiKey: FirebaseConfig.iosApiKey,
        appId: FirebaseConfig.iosAppId,
        messagingSenderId: FirebaseConfig.messagingSenderId,
        projectId: FirebaseConfig.projectId,
        storageBucket: '${FirebaseConfig.projectId}.appspot.com',
        iosBundleId: 'com.example.resilnet',
      );
}

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Shared Keychain/Keystore config — matches iOS Keychain Sharing group.
const resilnetSecureStorage = FlutterSecureStorage(
  iOptions: IOSOptions(
    groupId: 'com.ajarnnarin.resilnet',
    accessibility: KeychainAccessibility.first_unlock_this_device,
  ),
);

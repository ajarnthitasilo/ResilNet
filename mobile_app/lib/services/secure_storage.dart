import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Canonical Keychain/Keystore — **default app access group** (no custom
/// `groupId`). A bare `groupId: 'com.ajarnnarin.resilnet'` caused iOS
/// SecItem **-34018** (entitlement mismatch with
/// `TEAMID.com.ajarnnarin.resilnet`) and blocked identity load.
const resilnetSecureStorage = FlutterSecureStorage(
  iOptions: IOSOptions(
    accessibility: KeychainAccessibility.first_unlock_this_device,
  ),
);

/// Legacy Keychain Sharing group used by older builds. Reads may fail with
/// -34018; kept only for best-effort migration into [resilnetSecureStorage].
const resilnetLegacyGroupSecureStorage = FlutterSecureStorage(
  iOptions: IOSOptions(
    groupId: 'com.ajarnnarin.resilnet',
    accessibility: KeychainAccessibility.first_unlock_this_device,
  ),
);

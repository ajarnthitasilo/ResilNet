import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Canonical Keychain/Keystore — **default app access group** (no custom
/// `groupId`). A bare `groupId: 'com.ajarnnarin.resilnet'` caused iOS
/// SecItem **-34018** (entitlement mismatch with
/// `TEAMID.com.ajarnnarin.resilnet`) and blocked identity load.
///
/// On macOS, [MacOsOptions.usesDataProtectionKeychain] defaults to `true`, which
/// fails under App Sandbox without a data-protection keychain setup and surfaces
/// as “บันทึกกุญแจตัวตนไม่สำเร็จ”. Use the classic keychain + empty
/// `keychain-access-groups` entitlement (see flutter_secure_storage README).
const resilnetSecureStorage = FlutterSecureStorage(
  iOptions: IOSOptions(
    accessibility: KeychainAccessibility.first_unlock_this_device,
  ),
  mOptions: MacOsOptions(
    accessibility: KeychainAccessibility.first_unlock_this_device,
    usesDataProtectionKeychain: false,
  ),
);

/// Legacy Keychain Sharing group used by older builds. Reads may fail with
/// -34018; kept only for best-effort migration into [resilnetSecureStorage].
const resilnetLegacyGroupSecureStorage = FlutterSecureStorage(
  iOptions: IOSOptions(
    groupId: 'com.ajarnnarin.resilnet',
    accessibility: KeychainAccessibility.first_unlock_this_device,
  ),
  mOptions: MacOsOptions(
    accessibility: KeychainAccessibility.first_unlock_this_device,
    usesDataProtectionKeychain: false,
  ),
);

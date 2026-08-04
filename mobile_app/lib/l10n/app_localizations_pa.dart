// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'ਤਾਜ਼ਾ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ ResilNet…';

  @override
  String get appRefreshed => 'ਤਾਜ਼ਾ — ਰੇਡੀਓ ਅਤੇ ਖੋਜ ਮੁੜ-ਚਾਲੂ';

  @override
  String appRefreshFailed(String error) {
    return 'ਤਾਜ਼ਾ ਕਰਨਾ ਅਸਫਲ ਰਿਹਾ: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'ਡਬਲ-ਟੈਪ = ਨਰਮ ਤਾਜ਼ਗੀ। ਦੇਰ ਦਬਾਉ = ਔਖਾ ਮੁੜ। ਟ੍ਰਿਪਲ-ਟੈਪ = ਸੰਕਟ ਪੂੰਝਣਾ।';

  @override
  String get softRefreshTipTitle => 'ਜੇਕਰ ResilNet ਫਸਿਆ ਮਹਿਸੂਸ ਕਰਦਾ ਹੈ';

  @override
  String get softRefreshTipBody =>
      'ਸੌਫਟ ਰੇਡੀਓ ਰਿਫਰੈਸ਼ ਲਈ ResilNet (ਉੱਪਰ-ਖੱਬੇ) ਡਬਲ-ਟੈਪ ਕਰੋ। ਜੇਕਰ ਅਜੇ ਵੀ ਫਸਿਆ ਹੋਇਆ ਹੈ: ਸਿਰਲੇਖ ਨੂੰ ਦੇਰ ਤੱਕ ਦਬਾਓ, ⋮ → ਹਾਰਡ ਰਿਕਵਰ, ਜਾਂ ਸੈਟਿੰਗਾਂ ਦੀ ਵਰਤੋਂ ਕਰੋ। ਟ੍ਰਿਪਲ-ਟੈਪ ਸਿਰਫ ਐਮਰਜੈਂਸੀ ਵਾਈਪ ਹੈ।';

  @override
  String get softRefreshTipGotIt => 'ਮਿਲ ਗਿਆ';

  @override
  String get infoSoftRefreshTitle => 'ਜੇਕਰ ਐਪ ਫਸਿਆ ਮਹਿਸੂਸ ਕਰਦਾ ਹੈ';

  @override
  String get infoSoftRefreshStepRefresh =>
      'ਡਬਲ-ਟੈਪ ResilNet (ਉੱਪਰ-ਖੱਬੇ) → ਸਾਫਟ ਰਿਫਰੈਸ਼ ਰੇਡੀਓ ਅਤੇ ਨੇੜਲੇ ਲੋਕ';

  @override
  String get infoSoftRefreshStepHard =>
      'ਅਜੇ ਵੀ ਫਸਿਆ ਹੋਇਆ ਹੈ? ਸਿਰਲੇਖ ਨੂੰ ਲੰਬੇ ਸਮੇਂ ਤੱਕ ਦਬਾਓ, ਜਾਂ ⋮ / ਸੈਟਿੰਗਾਂ → ਹਾਰਡ ਰਿਕਵਰੀ';

  @override
  String get infoSoftRefreshStepWait =>
      'ਨਤੀਜੇ ਸਨੈਕਬਾਰ ਦੀ ਉਡੀਕ ਕਰੋ, ਫਿਰ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ। ਸੈਸ਼ਨ ਰੀਸੈਟ ਤੁਹਾਡੀਆਂ ਕੁੰਜੀਆਂ ਨੂੰ ਰੱਖਦਾ ਹੈ।';

  @override
  String get infoSoftRefreshStepWipe =>
      'ਟ੍ਰਿਪਲ-ਟੈਪ = ਐਮਰਜੈਂਸੀ ਵਾਈਪ (ਸਥਾਨਕ ਡੇਟਾ ਨੂੰ ਮਿਟਾਉਂਦਾ ਹੈ) — ਤਾਂ ਹੀ ਜੇ ਜਾਣਬੁੱਝ ਕੇ';

  @override
  String get appRecoverySection => 'ਐਪ ਰਿਕਵਰੀ';

  @override
  String get appRecoverySectionSubtitle =>
      'ਜਦੋਂ ਐਪ ਫ੍ਰੀਜ਼ ਮਹਿਸੂਸ ਹੋਵੇ ਤਾਂ ਵਰਤੋਂ। ਕੋਮਲ = ਸਿਰਲੇਖ ਡਬਲ-ਟੈਪ। ਹਾਰਡ ਰਿਕਵਰੀ ਮਜ਼ਬੂਤ ​​ਹੁੰਦੀ ਹੈ। ਸੈਸ਼ਨ ਰੀਸੈਟ ਕੁੰਜੀਆਂ ਨੂੰ ਪੂੰਝੇ ਬਿਨਾਂ ਸੇਵਾਵਾਂ ਨੂੰ ਮੁੜ ਚਾਲੂ ਕਰਦਾ ਹੈ।';

  @override
  String get appHardRecoverAction => 'ਸਖ਼ਤ ਰਿਕਵਰੀ';

  @override
  String get appHardRecovering => 'ਔਖਾ ਠੀਕ ਹੋ ਰਿਹਾ ਹੈ...';

  @override
  String get appSessionResetAction => 'ਸੈਸ਼ਨ ਰੀਸੈਟ ਕਰੋ';

  @override
  String get appSessionResetRunning => 'ਸੈਸ਼ਨ ਰੀਸੈੱਟ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get appSessionResetConfirmTitle => 'ਕੀ ਸੈਸ਼ਨ ਰੀਸੈੱਟ ਕਰਨਾ ਹੈ?';

  @override
  String get appSessionResetConfirmBody =>
      'ਇਸ ਡਿਵਾਈਸ \'ਤੇ ResilNet ਸੇਵਾਵਾਂ ਨੂੰ ਰੀਸਟਾਰਟ ਕਰਦਾ ਹੈ। ਤੁਹਾਡੀਆਂ ਪਛਾਣ ਕੁੰਜੀਆਂ ਰੱਖੀਆਂ ਜਾਂਦੀਆਂ ਹਨ।';

  @override
  String get appRecoveryBusy => 'ਰਿਕਵਰੀ ਪਹਿਲਾਂ ਹੀ ਚੱਲ ਰਹੀ ਹੈ...';

  @override
  String get appRecoveryOk => 'ਰਿਕਵਰੀ ਸਮਾਪਤ ਹੋਈ';

  @override
  String get appRecoveryPartial =>
      'ਕੁਝ ਕਦਮ ਛੱਡੇ ਜਾਣ ਨਾਲ ਰਿਕਵਰੀ ਸਮਾਪਤ ਹੋਈ — ਜੇਕਰ ਅਜੇ ਵੀ ਫਸਿਆ ਹੋਇਆ ਹੈ ਤਾਂ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get appRecoveryFailed =>
      'ਰਿਕਵਰੀ ਅਸਫਲ ਰਹੀ — ਸੈਸ਼ਨ ਰੀਸੈੱਟ ਕਰਨ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ, ਜਾਂ OS ਤੋਂ ਐਪ ਨੂੰ ਜ਼ਬਰਦਸਤੀ ਬੰਦ ਕਰੋ';

  @override
  String get localWifiTitle => 'ਸਥਾਨਕ Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'ਇੰਟਰਨੈਟ ਤੋਂ ਬਿਨਾਂ ਨੇੜਲੀਆਂ ਡਿਵਾਈਸਾਂ ਨੂੰ ਲਿੰਕ ਕਰੋ — ਇੱਕ LAN \'ਤੇ ਹੋਣ ਵਾਂਗ ਹੀ।';

  @override
  String get localWifiNotGatewayHint =>
      'ESP32 LoRa ਗੇਟਵੇ SoftAP ਨਹੀਂ। ਇਹ ਸਿਰਫ਼ ਫ਼ੋਨ↔phone/LAN ਹੈ।';

  @override
  String get localWifiUnavailable =>
      'ਸਥਾਨਕ Wi‑Fi ਅਜੇ ਤਿਆਰ ਨਹੀਂ ਹੈ — ਐਪ ਸਟਾਰਟਅਪ ਦੀ ਉਡੀਕ ਕਰੋ।';

  @override
  String get lxmfBridgeTitle => 'ਹੋਮ ਨੋਡ';

  @override
  String get lxmfBridgeSubtitle =>
      'ਤੁਹਾਡੇ Wi‑Fi \'ਤੇ ਵਿਕਲਪਿਕ Mac ਜਾਂ Pi ਜੋ ਸੀਲਬੰਦ ਚੈਟਾਂ ਨੂੰ ਰੀਲੇਅ ਕਰਦਾ ਹੈ। ਮੂਲ ਰੂਪ ਵਿੱਚ ਬੰਦ। ਐਂਡ-ਟੂ-ਐਂਡ ਇਨਕ੍ਰਿਪਸ਼ਨ ਨੂੰ ਨਹੀਂ ਬਦਲਦਾ।';

  @override
  String get lxmfBridgeEnable => 'ਹੋਮ ਨੋਡ ਦੀ ਵਰਤੋਂ ਕਰੋ';

  @override
  String get lxmfBridgeDisabledHint =>
      'ਸਿਰਫ਼ ਉਦੋਂ ਹੀ ਚਾਲੂ ਕਰੋ ਜਦੋਂ ਬ੍ਰਿਜ ਐਪ ਇਸ ਨੈੱਟਵਰਕ \'ਤੇ Mac ਜਾਂ Pi \'ਤੇ ਚੱਲ ਰਹੀ ਹੋਵੇ।';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'ਔਨਲਾਈਨ — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'ਹੋਮ ਨੋਡ ਤੱਕ ਨਹੀਂ ਪਹੁੰਚਿਆ ਜਾ ਸਕਦਾ — $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'ਹੋਮ ਨੋਡ ਪਤਾ';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP ਜਾਂ http://IP:port — ਉਦਾਹਰਨ 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'ਪੀਅਰ → LXMF ਮੰਜ਼ਿਲ (JSON)';

  @override
  String get lxmfBridgeRefresh => 'ਸਥਿਤੀ ਨੂੰ ਸੰਭਾਲੋ ਅਤੇ ਤਾਜ਼ਾ ਕਰੋ';

  @override
  String get lxmfBridgeLabHint => 'ਉੱਨਤ: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'ਹੋਮ ਨੋਡ ਸੈਟਿੰਗਾਂ';

  @override
  String get lxmfBridgeCheckConnection => 'ਕਨੈਕਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ';

  @override
  String get lxmfBridgeStatusOnline => 'ਹੋਮ ਨੋਡ ਨਾਲ ਕਨੈਕਟ ਕੀਤਾ ਗਿਆ';

  @override
  String get lxmfBridgeStatusOffline => 'ਹੋਮ ਨੋਡ ਪਹੁੰਚਯੋਗ ਨਹੀਂ ਹੈ';

  @override
  String get lxmfBridgeYourDest => 'ਇਸ ਨੋਡ ਦਾ ਪਤਾ (ਦੋਸਤਾਂ ਨਾਲ ਸਾਂਝਾ ਕਰੋ)';

  @override
  String get lxmfBridgeCopyDest => 'ਪਤਾ ਕਾਪੀ ਕਰੋ';

  @override
  String get lxmfBridgeDestCopied => 'ਪਤਾ ਕਾਪੀ ਕੀਤਾ ਗਿਆ';

  @override
  String get lxmfBridgeLinkedPeers => 'ਲਿੰਕ ਕੀਤੇ ਦੋਸਤ';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'ਹਰੇਕ ਦੋਸਤ ਨੂੰ ਇੱਕ ਵਾਰ ਆਪਣੇ ਘਰ-ਨੋਡ ਪਤੇ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ। ਫਿਰ ਸੀਲਬੰਦ ਚੈਟ ਇਸ ਮਾਰਗ ਦੀ ਵਰਤੋਂ ਕਰ ਸਕਦੇ ਹਨ।';

  @override
  String get lxmfBridgeNoLinks => 'ਅਜੇ ਤੱਕ ਕੋਈ ਦੋਸਤ ਲਿੰਕ ਨਹੀਂ ਹੋਏ।';

  @override
  String get lxmfBridgeAddLink => 'ਇੱਕ ਦੋਸਤ ਨੂੰ ਲਿੰਕ ਕਰੋ';

  @override
  String get lxmfBridgePickPeer => 'ਦੋਸਤ';

  @override
  String get lxmfBridgePeerDest => 'ਉਹਨਾਂ ਦੇ ਘਰ-ਨੋਡ ਦਾ ਪਤਾ';

  @override
  String get lxmfBridgePeerDestHint =>
      'ਉਹਨਾਂ ਦੀ ਹੋਮ ਨੋਡ ਸਕ੍ਰੀਨ ਤੋਂ 32-ਅੱਖਰਾਂ ਦਾ ਕੋਡ';

  @override
  String get lxmfBridgeInvalidDest =>
      'ਉਹ ਪਤਾ ਵੈਧ ਨਹੀਂ ਜਾਪਦਾ ਹੈ। ਉਹਨਾਂ ਦੇ ਹੋਮ ਨੋਡ ਤੋਂ ਪੂਰਾ ਕੋਡ ਪੇਸਟ ਕਰੋ।';

  @override
  String get lxmfBridgeRemoveLink => 'ਅਣਲਿੰਕ ਕਰੋ';

  @override
  String get lxmfBridgeSaveLink => 'ਸੇਵ ਕਰੋ';

  @override
  String get lxmfBridgeLinkSaved => 'ਦੋਸਤ ਲਿੰਕ ਕੀਤਾ';

  @override
  String get lxmfBridgeNoPeers =>
      'ਅਜੇ ਤੱਕ ਕੋਈ ਸੁਨੇਹਾ ਦੇਣ ਯੋਗ ਸੰਪਰਕ ਨਹੀਂ - ਪਹਿਲਾਂ ਇੱਕ ਦੋਸਤ ਸ਼ਾਮਲ ਕਰੋ।';

  @override
  String get lxmfBridgeHelp =>
      'ਬ੍ਰਿਜ ਨੂੰ Mac/Pi \'ਤੇ ਚੱਲਦਾ ਰੱਖੋ। ਇਹ ਮਾਰਗ ਤੁਹਾਡੇ LAN \'ਤੇ ਰਹਿੰਦਾ ਹੈ — ਇਹ LoRa ਨਹੀਂ ਹੈ ਅਤੇ ਇੰਟਰਨੈੱਟ ਜਾਂ ਬਲੂਟੁੱਥ ਜਾਲ ਨੂੰ ਨਹੀਂ ਬਦਲਦਾ ਹੈ।';

  @override
  String get localWifiModeHotspot => 'ਨੇੜੇ';

  @override
  String get localWifiModeRouter => 'ਰਾਊਟਰ';

  @override
  String get localWifiHotspotIntro =>
      'ਇੱਕ ਡਿਵਾਈਸ ਇੱਕ ਨਿੱਜੀ ਹੌਟਸਪੌਟ ਨੂੰ ਸਾਂਝਾ ਕਰਦੀ ਹੈ। ਦੂਸਰੇ ਉਸ ਹੌਟਸਪੌਟ ਵਿੱਚ ਸ਼ਾਮਲ ਹੁੰਦੇ ਹਨ, ਫਿਰ ResilNet ਉਹਨਾਂ ਨੂੰ ਸਥਾਨਕ ਨੈੱਟਵਰਕ \'ਤੇ ਲੱਭਦਾ ਹੈ।';

  @override
  String get localWifiHostAction => 'ਨੈੱਟਵਰਕ (ਹੋਸਟ) ਬਣਾਓ';

  @override
  String get localWifiJoinAction => 'ਨੈੱਟਵਰਕ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ';

  @override
  String get localWifiHostSteps =>
      '1. ਆਈਓਐਸ/ਐਂਡਰਾਇਡ ਸੈਟਿੰਗਾਂ ਖੋਲ੍ਹੋ ਅਤੇ ਨਿੱਜੀ ਹੌਟਸਪੌਟ (ਜਾਂ ਇੰਟਰਨੈਟ ਸ਼ੇਅਰਿੰਗ) ਚਾਲੂ ਕਰੋ.\n2. ਦੋਸਤਾਂ ਨੂੰ ਹੌਟਸਪੌਟ ਨਾਮ (ਅਤੇ ਪਾਸਵਰਡ) ਦੱਸੋ.\n3. ਇੱਥੇ ਵਾਪਸ ਆਓ ਅਤੇ \"ਹੌਟਸਪੌਟ ਚਾਲੂ ਹੈ — ਉਡੀਕ ਸ਼ੁਰੂ ਕਰੋ\" ਤੇ ਟੈਪ ਕਰੋ ।';

  @override
  String get localWifiHostReady => 'ਹੌਟਸਪੌਟ ਚਾਲੂ ਹੈ — ਉਡੀਕ ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get localWifiHostWaiting =>
      'ਦੋਸਤਾਂ ਦੇ ਸ਼ਾਮਲ ਹੋਣ ਦੀ ਉਡੀਕ ਕੀਤੀ ਜਾ ਰਹੀ ਹੈ...';

  @override
  String get localWifiJoinSteps =>
      '1. ਸਿਸਟਮ ਸੈਟਿੰਗਾਂ ਖੋਲ੍ਹੋ ਅਤੇ ਆਪਣੇ ਦੋਸਤ ਦੇ ਨਿੱਜੀ ਹੌਟਸਪੌਟ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ।\n2. ਇੱਥੇ ਵਾਪਸ ਜਾਓ ਅਤੇ \"ਮੈਂ ਜੁੜਿਆ ਹੋਇਆ ਹਾਂ - ਖੋਜ\" \'ਤੇ ਟੈਪ ਕਰੋ।';

  @override
  String get localWifiJoinReady => 'ਮੈਂ ਜੁੜਿਆ ਹੋਇਆ ਹਾਂ — ਖੋਜ';

  @override
  String get localWifiRouterIntro =>
      'ਹਰੇਕ ਡਿਵਾਈਸ ਨੂੰ ਉਸੇ Wi‑Fi ਰਾਊਟਰ/AP ਨਾਲ ਕਨੈਕਟ ਕਰੋ। ਰਾਊਟਰ ਨੂੰ ਇੰਟਰਨੈੱਟ ਦੀ ਲੋੜ ਨਹੀਂ ਹੈ — ਸਿਰਫ਼ ਇੱਕ ਸਾਂਝਾ ਸਥਾਨਕ ਨੈੱਟਵਰਕ।';

  @override
  String get localWifiRouterSearch => 'ਇਸ Wi‑Fi \'ਤੇ ਖੋਜ ਕਰੋ';

  @override
  String get localWifiRefreshNetwork => 'Wi‑Fi ਜਾਣਕਾਰੀ ਨੂੰ ਤਾਜ਼ਾ ਕਰੋ';

  @override
  String get localWifiRouterNoWifiTitle => '\'ਤੇ ਨਹੀਂ Wi‑Fi';

  @override
  String get localWifiRouterNoWifiBody =>
      'ਸਿਸਟਮ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਰਾਊਟਰ ਦੇ Wi‑Fi ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ, ਫਿਰ ਦੁਬਾਰਾ ਖੋਜ ਕਰੋ।';

  @override
  String get localWifiDiscovering => 'ਸਥਾਨਕ Wi‑Fi \'ਤੇ ਖੋਜ ਕੀਤੀ ਜਾ ਰਹੀ ਹੈ...';

  @override
  String get localWifiPeersFound => 'ਇਸ ਨੈੱਟਵਰਕ \'ਤੇ ਡਿਵਾਈਸਾਂ';

  @override
  String get localWifiStop => 'ਰੂਕੋ';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi ਨਾਂ ਉਪਲੱਬਧ ਨਹੀਂ';

  @override
  String get localWifiStubBanner => 'LAN ਸਾਕਟ ਦੀ ਉਡੀਕ ਕੀਤੀ ਜਾ ਰਹੀ ਹੈ...';

  @override
  String get localWifiLiveBanner =>
      'LAN ਖੋਜ ਲਾਈਵ (UDP) — ਇਸ Wi‑Fi \'ਤੇ + ​​ਸੀਲਬੰਦ ਚੈਟ ਦੀ ਘੋਸ਼ਣਾ ਕਰੋ';

  @override
  String get localWifiEmptyHotspot =>
      'ਅਜੇ ਤੱਕ ਕੋਈ ਡਿਵਾਈਸ ਨਹੀਂ ਹੈ।\nਜਾਂਚ ਕਰੋ ਕਿ ਦੋਸਤ ਤੁਹਾਡੇ ਹੌਟਸਪੌਟ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਏ ਹਨ ਅਤੇ ਸਥਾਨਕ ਨੈੱਟਵਰਕ ਤੱਕ ਪਹੁੰਚ ਦੀ ਇਜਾਜ਼ਤ ਦਿੱਤੀ ਹੈ।';

  @override
  String get localWifiEmptyRouter =>
      'ਅਜੇ ਤੱਕ ਕੋਈ ਡਿਵਾਈਸ ਨਹੀਂ ਹੈ।\nਉਹੀ SSID? ਕੀ ਸਥਾਨਕ ਨੈੱਟਵਰਕ ਦੀ ਇਜਾਜ਼ਤ ਹੈ? ਕੁਝ ਰਾਊਟਰ ਡਿਵਾਈਸ-ਟੂ-ਡਿਵਾਈਸ ਟ੍ਰੈਫਿਕ (AP ਆਈਸੋਲੇਸ਼ਨ) ਨੂੰ ਬਲੌਕ ਕਰਦੇ ਹਨ।';

  @override
  String get localWifiIsolationHelp => 'ਅਸੀਂ ਇੱਕ ਦੂਜੇ ਨੂੰ ਕਿਉਂ ਨਹੀਂ ਲੱਭ ਸਕਦੇ?';

  @override
  String get localWifiIsolationTitle => 'ਰਾਊਟਰ ਗਾਹਕਾਂ ਨੂੰ ਅਲੱਗ ਕਰ ਸਕਦਾ ਹੈ';

  @override
  String get localWifiIsolationBody =>
      'ਜੇਕਰ AP/ਕਲਾਇੰਟ ਆਈਸੋਲੇਸ਼ਨ (ਜਾਂ ਇੱਕ ਗੈਸਟ ਨੈੱਟਵਰਕ) ਚਾਲੂ ਹੈ, ਤਾਂ ਉਸੇ Wi‑Fi \'ਤੇ ਫ਼ੋਨ ਗੱਲ ਨਹੀਂ ਕਰ ਸਕਦੇ। ਆਈਸੋਲੇਸ਼ਨ ਬੰਦ ਕਰੋ, ਮੁੱਖ SSID ਦੀ ਵਰਤੋਂ ਕਰੋ, ਜਾਂ ਨੇੜਲੇ (ਹੌਟਸਪੌਟ) ਮੋਡ \'ਤੇ ਸਵਿਚ ਕਰੋ।';

  @override
  String get localWifiPeerReady => 'ਗੱਲਬਾਤ ਕਰਨ ਲਈ ਤਿਆਰ (ਕੁੰਜੀ ਹੈ)';

  @override
  String get localWifiPeerNeedKey => 'ਲੱਭਿਆ — ਕੁੰਜੀਆਂ ਨੂੰ ਬਦਲਣ ਲਈ QR ਸਕੈਨ ਕਰੋ';

  @override
  String get localWifiErrorTitle => 'ਸਥਾਨਕ Wi‑Fi ਤਰੁੱਟੀ';

  @override
  String get localWifiErrorBody =>
      'ਕੁਝ ਗਲਤ ਹੋ ਗਿਆ। ਰੁਕੋ ਅਤੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get preparingSystem => 'ਸਿਸਟਮ ਤਿਆਰ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get bootFailedTitle => 'ਸ਼ੁਰੂ ਨਹੀਂ ਹੋ ਸਕਿਆ';

  @override
  String get retry => 'ਫਿਰ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get bootRecoveryAction => 'ਨਵੀਂ ਪਛਾਣ ਸ਼ੁਰੂ ਕਰੋ (ਸਥਾਨਕ ਡੇਟਾ ਮਿਟਾਓ)';

  @override
  String get bootRecoveryConfirmTitle => 'ਨਵੀਂ ਪਛਾਣ ਸ਼ੁਰੂ ਕਰੀਏ?';

  @override
  String get bootRecoveryConfirmBody =>
      'ਇਹ ਇਸ ਡਿਵਾਈਸ \'ਤੇ ਸਥਾਨਕ ਚੈਟਾਂ, ਕੁੰਜੀਆਂ ਅਤੇ ਪਛਾਣ ਨੂੰ ਸਥਾਈ ਤੌਰ \'ਤੇ ਮਿਟਾ ਦੇਵੇਗਾ।\nਸਾਥੀਆਂ ਨੂੰ ਤੁਹਾਡੀ ਨਵੀਂ ਪਛਾਣ ਦੇ ਨਾਲ ਤੁਹਾਡੇ QR ਨੂੰ ਦੁਬਾਰਾ ਸਕੈਨ ਕਰਨਾ ਚਾਹੀਦਾ ਹੈ।\nਇਸਨੂੰ ਅਣਕੀਤਾ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ।';

  @override
  String get bootRecoveryRunning => 'ਸਥਾਨਕ ਪਛਾਣ ਰੀਸੈੱਟ ਕੀਤੀ ਜਾ ਰਹੀ ਹੈ...';

  @override
  String get bootRecoverySuccess => 'ਸਥਾਨਕ ਪਛਾਣ ਰੀਸੈਟ ਪੂਰਾ ਹੋਇਆ';

  @override
  String bootRecoveryFailed(String error) {
    return 'ਪਛਾਣ ਰੀਸੈਟ ਨਹੀਂ ਕੀਤੀ ਜਾ ਸਕੀ: $error';
  }

  @override
  String get cancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get save => 'ਸੇਵ ਕਰੋ';

  @override
  String get close => 'ਬੰਦ ਕਰੋ';

  @override
  String get start => 'ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get send => 'ਭੇਜੋ';

  @override
  String get settings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get language => 'ਭਾਸ਼ਾ';

  @override
  String get languageSubtitle =>
      'ਪੂਰਵ-ਨਿਰਧਾਰਤ ਤੌਰ \'ਤੇ ਐਪ ਤੁਹਾਡੀ ਫ਼ੋਨ ਭਾਸ਼ਾ ਦੀ ਪਾਲਣਾ ਕਰਦੀ ਹੈ (ਜਦੋਂ ਸਮਰਥਿਤ ਹੋਵੇ)। ਹੋਰ ਭਾਸ਼ਾਵਾਂ ਅੰਗਰੇਜ਼ੀ ਵਿੱਚ ਵਾਪਸ ਆਉਂਦੀਆਂ ਹਨ। ਤੁਸੀਂ ਇੱਥੇ ਇੱਕ ਭਾਸ਼ਾ ਨੂੰ ਲਾਕ ਵੀ ਕਰ ਸਕਦੇ ਹੋ।';

  @override
  String get languageSystem => 'ਸਿਸਟਮ ਪੂਰਵ-ਨਿਰਧਾਰਤ';

  @override
  String get languageThai => 'ਥਾਈ';

  @override
  String get languageEnglish => 'ਅੰਗਰੇਜ਼ੀ';

  @override
  String get notificationsTooltip => 'ਸੂਚਨਾ ਸੈਟਿੰਗਾਂ';

  @override
  String get enableMessageNotifications => 'ਸੁਨੇਹਾ ਸੂਚਨਾਵਾਂ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ';

  @override
  String get settingsNotificationsSubtitle =>
      '1:1 ਸੁਨੇਹੇ ਅਤੇ ਲੋਕ ਔਨਲਾਈਨ (ਸਥਾਨਕ ਚੇਤਾਵਨੀਆਂ)';

  @override
  String get networkMembersTooltip => 'ਨੈੱਟਵਰਕ ਸਦੱਸ';

  @override
  String get identityQrTooltip => 'ਪਛਾਣ / QR';

  @override
  String get feedDirects => 'ਚੈਟ';

  @override
  String get feedMesh => 'ਕੇ- ਸਰੁੰਗDescription';

  @override
  String get feedGeo => 'ਖੇਤਰ';

  @override
  String get feedDirectsSubtitle => 'ਪ੍ਰਾਈਵੇਟ E2EE ਸੁਨੇਹੇ';

  @override
  String feedMeshSubtitle(Object ble) {
    return 'ਨੇੜਲੇ ਸਾਥੀ (BLE)';
  }

  @override
  String get feedGeoSubtitle => 'ਜਿਓਹਸ਼ ਖੋਜ ਚੈਨਲ';

  @override
  String get peerIdHint =>
      'ਚੈਟ ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਰਿਸੀਵਰ ਆਈਡੀ (ਪਬਲਿਕ ਕੀ ਹੈਸ਼) ਪੇਸਟ ਕਰੋ';

  @override
  String get directsEmpty =>
      'ਅਜੇ ਤੱਕ ਕੋਈ ਚੈਟ ਨਹੀਂ — ਇੱਕ QR ਸਕੈਨ ਕਰੋ ਜਾਂ ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਇੱਕ ਪ੍ਰਾਪਤਕਰਤਾ ਆਈਡੀ ਪੇਸਟ ਕਰੋ\nਸੁਨੇਹੇ ਭੇਜਣ ਤੋਂ ਪਹਿਲਾਂ E2EE ਨਾਲ ਸੀਲ ਕੀਤੇ ਜਾਂਦੇ ਹਨ (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • ਚੈਟ ਖੋਲ੍ਹਣ ਲਈ ਟੈਪ ਕਰੋ';

  @override
  String get meshIntro =>
      'BLE ਰੇਂਜ ਵਿੱਚ ਸਾਥੀ — ਇੱਕ ਨਿੱਜੀ E2EE ਚੈਟ ਲਈ ਟੈਪ ਕਰੋ (#mesh \'ਤੇ ਕੋਈ ਜਨਤਕ ਰਚਨਾ ਨਹੀਂ)\nਹਾਈਬ੍ਰਿਡ ਰਾਊਟਰ ਰਾਹੀਂ ਭੇਜਦਾ ਹੈ (BLE + LoRa + Nostr ਜਦੋਂ ਔਨਲਾਈਨ)';

  @override
  String get meshEmptyRunning =>
      'ਅਜੇ ਤੱਕ ਕੋਈ ਨਜ਼ਦੀਕੀ ਸਾਥੀ ਨਹੀਂ — BLE ਰੇਂਜ ਦੇ ਅੰਦਰ ਕਿਸੇ ਹੋਰ ਡਿਵਾਈਸ \'ਤੇ ਐਪ ਖੋਲ੍ਹੋ';

  @override
  String get meshEmptyStopped =>
      'BLE ਨਹੀਂ ਚੱਲ ਰਿਹਾ ਹੈ — ਬਲੂਟੁੱਥ / ਟਿਕਾਣਾ ਇਜਾਜ਼ਤ ਦਿਓ';

  @override
  String get meshNearbyPrefix => 'ਨੇੜੇ';

  @override
  String get meshRetentionTitle => 'ਸੁਨੇਹੇ ਆਟੋ-ਮਿਟਾਓ';

  @override
  String get meshRetentionSubtitle =>
      'ਪੁਰਾਣਾ ਸਥਾਨਕ ਚੈਟ ਇਤਿਹਾਸ ਆਪਣੇ ਆਪ ਹਟਾ ਦਿੱਤਾ ਜਾਂਦਾ ਹੈ';

  @override
  String get meshRetentionKeep => 'ਰੱਖੋ';

  @override
  String get meshRetention1Day => '1 ਦਿਨ';

  @override
  String get meshRetention3Days => '3 ਦਿਨ';

  @override
  String get meshRetention7Days => '7 ਦਿਨ';

  @override
  String get refreshLocationTooltip => 'ਟਿਕਾਣਾ ਤਾਜ਼ਾ ਕਰੋ';

  @override
  String get geoIntro =>
      'ਇਸ ਜਿਓਹਸ਼ ਵਿੱਚ ਔਨਲਾਈਨ ਲੋਕਾਂ ਨੂੰ 1:1 ਜਾਂ ਇੱਕ ਖੇਤਰ ਜਨਤਕ ਫੈਨ-ਆਊਟ ਨਾਲ ਸੁਨੇਹਾ ਭੇਜਿਆ ਜਾ ਸਕਦਾ ਹੈ (ਅਜੇ ਵੀ ਪ੍ਰਤੀ ਪੀਅਰ E2EE ਸੀਲ ਕੀਤਾ ਗਿਆ ਹੈ - ਸਾਦਾ ਟੈਕਸਟ ਨਹੀਂ)';

  @override
  String geoEmpty(String channel) {
    return 'ਹਾਲੇ ਤੱਕ $channel ਵਿੱਚ ਕੋਈ ਵੀ ਔਨਲਾਈਨ ਨਹੀਂ ਹੈ\nਟਰਾਂਸਪੋਰਟ → ਇੰਟਰਨੈੱਟ/ਆਟੋ ਦੀ ਵਰਤੋਂ ਕਰੋ, Nostr ਦੀ ਉਡੀਕ ਕਰੋ, ਟਿਕਾਣਾ ਤਾਜ਼ਾ ਕਰੋ';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return '$channel ਵਿੱਚ ਔਨਲਾਈਨ • 1:1 E2EE ਲਈ ਟੈਪ ਕਰੋ';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'ਨੇੜੇ (ਇਲਾਕੇ ਦੀ ਮੌਜੂਦਗੀ ਦੀ ਉਡੀਕ) • 1:1 E2EE ਲਈ ਟੈਪ ਕਰੋ';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return '$channel ਵਿੱਚ Nostr \'ਤੇ ਦੇਖਿਆ ਗਿਆ • ਸਿਰਫ਼ ਖੋਜ (ਵਿਰਾਸਤੀ)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'ਪੁਰਾਤਨ ਅਗਿਆਤ ਮੌਜੂਦਗੀ — ਇੱਕ ਬੰਨ੍ਹੇ ਹੋਏ ਪੀਅਰ ਦੀ ਉਡੀਕ ਕਰੋ ਜਾਂ QR ਦਾ ਵਟਾਂਦਰਾ ਕਰੋ';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE ਨੇੜੇ — 1:1 E2EE ਸ਼ੁਰੂ ਕਰਨ ਲਈ QR ਸਕੈਨ ਕਰੋ';

  @override
  String get geoInternetDiscoverHint =>
      'ਖੇਤਰ ਇੰਟਰਨੈੱਟ ਖੋਜ ਲਈ Nostr ਕਨੈਕਟ ਕੀਤੇ ਜਾਣ ਦੀ ਲੋੜ ਹੈ (ਸੈਟਿੰਗਾਂ → ਟ੍ਰਾਂਸਪੋਰਟ → ਇੰਟਰਨੈੱਟ/ਆਟੋ)';

  @override
  String get geoEmptyNoLocation =>
      'ਟਿਕਾਣਾ ਹਾਲੇ ਹੱਲ ਨਹੀਂ ਹੋਇਆ — GPS ਨੂੰ ਇਜਾਜ਼ਤ ਦਿਓ ਅਤੇ ਆਪਣੇ ਜੀਓਹਸ਼ ਨੂੰ Nostr \'ਤੇ ਪ੍ਰਕਾਸ਼ਿਤ ਕਰਨ ਲਈ ਰਿਫ੍ਰੈਸ਼ ਕਰੋ';

  @override
  String get geoEmptyNeedsPermission =>
      'ਟਿਕਾਣਾ ਇਜਾਜ਼ਤ ਅਸਵੀਕਾਰ ਕੀਤੀ ਗਈ — ਸੈਟਿੰਗਾਂ → ਗੋਪਨੀਯਤਾ → ਸਥਾਨ ਵਿੱਚ ResilNet ਦੀ ਇਜਾਜ਼ਤ ਦਿਓ';

  @override
  String get geoEmptyServicesDisabled =>
      'ਟਿਕਾਣਾ ਸੇਵਾਵਾਂ ਬੰਦ ਹਨ — ਉਹਨਾਂ ਨੂੰ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਚਾਲੂ ਕਰੋ';

  @override
  String get geoEmptyNoGpsFix =>
      'ਇੱਕ GPS ਫਿਕਸ ਪ੍ਰਾਪਤ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ (Wi‑Fi iPads \'ਤੇ ਆਮ) — ਹੇਠਾਂ geohash ਨੂੰ ਹੱਥੀਂ ਸੈੱਟ ਕਰੋ';

  @override
  String get geoEmptyTeleportHint =>
      'ਸਥਾਨ ਆਈਕਨ \'ਤੇ ਟੈਪ ਕਰੋ → ਇੱਕ ਜੀਓਹਸ਼ ਦਾਖਲ ਕਰੋ (ਜਿਵੇਂ ਕਿ w5) → ਟੈਲੀਪੋਰਟ';

  @override
  String get geoSetGeohashManually => 'geohash ਸੈੱਟ ਕਰੋ';

  @override
  String get geoTeleportHint =>
      'ਕੋਈ GPS ਨਹੀਂ? geohash ਅਗੇਤਰ ਦਰਜ ਕਰੋ (2–7 ਅੱਖਰ, ਜਿਵੇਂ ਕਿ w5) ਅਤੇ ਟੈਲੀਪੋਰਟ \'ਤੇ ਟੈਪ ਕਰੋ';

  @override
  String get geoTeleportInvalid =>
      'ਅਵੈਧ geohash — ਸਿਰਫ਼ ਅਧਾਰ 32 ਅੱਖਰ/ਨੰਬਰ ਵਰਤੋ (ਉਦਾਹਰਨ ਲਈ w5 ਜਾਂ w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'ਖੇਤਰ $channel \'ਤੇ ਸੈੱਟ ਕੀਤਾ ਗਿਆ';
  }

  @override
  String geoManualActive(String channel) {
    return 'ਮੈਨੁਅਲ ਖੇਤਰ: $channel (GPS ਰਿਫਰੈਸ਼ ਓਵਰਰਾਈਡ ਹੋ ਜਾਵੇਗਾ)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr ਤਿਆਰ ਨਹੀਂ — ਦੁਬਾਰਾ ਕਨੈਕਟ ਕਰੋ \'ਤੇ ਟੈਪ ਕਰੋ (0/0 ਜਦੋਂ ਤੱਕ ਸ਼ੁਰੂ ਨਹੀਂ ਹੁੰਦਾ)';

  @override
  String get geoEmptyMeshOnly =>
      'ਟਰਾਂਸਪੋਰਟ ਸਿਰਫ਼-ਮੇਸ਼ ਹੈ — Nostr ਤੋਂ ਵੱਧ ਸਾਥੀਆਂ ਨੂੰ ਖੋਜਣ ਲਈ ਇੰਟਰਨੈੱਟ ਜਾਂ ਆਟੋ \'ਤੇ ਸਵਿਚ ਕਰੋ';

  @override
  String geoEmptyWaiting(String channel) {
    return 'ਅਜੇ ਤੱਕ $channel ਵਿੱਚ ਕੋਈ ਨਹੀਂ — ਖੇਤਰ + ਇੰਟਰਨੈੱਟ ਦੋਵਾਂ ਡਿਵਾਈਸਾਂ \'ਤੇ ਖੁੱਲ੍ਹਾ ਰੱਖੋ ਅਤੇ ~60s ਉਡੀਕ ਕਰੋ';
  }

  @override
  String get geoChannelFallback => '#ਖੇਤਰ';

  @override
  String get geoRefreshLocation => 'ਟਿਕਾਣਾ ਤਾਜ਼ਾ ਕਰੋ';

  @override
  String get settingsClearLocationTitle => 'ਟਿਕਾਣਾ ਸਾਫ਼ ਕਰੋ';

  @override
  String get settingsClearLocationSubtitle =>
      'GPS / ਟੈਲੀਪੋਰਟ ਜਿਓਹਸ਼ ਹਟਾਓ (ਖੇਤਰ #— ਬਣ ਜਾਂਦਾ ਹੈ)';

  @override
  String get settingsClearLocationConfirmTitle => 'ਕੀ ਟਿਕਾਣਾ ਸਾਫ਼ ਕਰਨਾ ਹੈ?';

  @override
  String get settingsClearLocationConfirmBody =>
      'ਇਸ ਡਿਵਾਈਸ \'ਤੇ ਸਟੋਰ ਕੀਤੇ ਜੀਓਸ਼ੈਸ਼ ਨੂੰ ਮਿਟਾਉਂਦਾ ਹੈ। ਤੁਸੀਂ ਬਾਅਦ ਵਿੱਚ ਦੁਬਾਰਾ GPS ਜਾਂ ਟੈਲੀਪੋਰਟ ਨੂੰ ਤਾਜ਼ਾ ਕਰ ਸਕਦੇ ਹੋ।';

  @override
  String get settingsClearLocationAction => 'ਟਿਕਾਣਾ ਸਾਫ਼ ਕਰੋ';

  @override
  String get settingsClearLocationSnack => 'ਟਿਕਾਣਾ ਸਾਫ਼ ਕੀਤਾ ਗਿਆ';

  @override
  String get chatVoiceTooLarge => 'ਵੌਇਸ ਨੋਟ ਬਹੁਤ ਵੱਡਾ ਹੈ — ਅਧਿਕਤਮ ~30 ਸਕਿੰਟ';

  @override
  String get chatVoiceNeedInternet =>
      'ਵੌਇਸ ਨੋਟ ਨੂੰ ਇੰਟਰਨੈੱਟ (Nostr) ਦੀ ਲੋੜ ਹੈ — ਇਕੱਲੇ BLE ਲਈ ਬਹੁਤ ਵੱਡਾ ਹੈ';

  @override
  String get chatVoiceSentInternet => 'ਇੰਟਰਨੈੱਟ ਰਾਹੀਂ ਵੌਇਸ ਨੋਟ ਭੇਜਿਆ ਗਿਆ';

  @override
  String get noticeAnonMention => 'ਜ਼ਿਕਰ';

  @override
  String get noticeAnonDm => 'ਸਿੱਧਾ ਸੁਨੇਹਾ';

  @override
  String get noticeAnonHug => 'ਜੱਫੀ';

  @override
  String get noticeAnonSlap => 'ਥੱਪੜ';

  @override
  String get noticeAnonBlock => 'ਬਲਾਕ';

  @override
  String get noticeAnonNeedKey =>
      'ਅਜੇ ਤੱਕ ਕੋਈ ਜਨਤਕ ਕੁੰਜੀ ਨਹੀਂ — 1:1 ਲਈ ਪਹਿਲਾਂ QR ਦਾ ਵਟਾਂਦਰਾ ਕਰੋ';

  @override
  String get noticeAnonActionSent => 'ਭੇਜਿਆ';

  @override
  String noticeAnonBlocked(String anon) {
    return 'ਬਲੌਕ ਕੀਤਾ $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* ਜੱਫੀ ਪਾਓ $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* ਥੱਪੜ $anon *';
  }

  @override
  String get geoReconnectNostr => 'Nostr ਨੂੰ ਮੁੜ-ਕਨੈਕਟ ਕਰੋ';

  @override
  String get nostrSectionTitle => 'Nostr ਰੀਲੇਅ';

  @override
  String get nostrSectionSubtitle =>
      'ਇੰਟਰਨੈੱਟ ਮੈਸੇਜਿੰਗ ਅਤੇ ਖੇਤਰ ਖੋਜ ਇਹਨਾਂ ਰੀਲੇਅ ਦੀ ਵਰਤੋਂ ਕਰਦੇ ਹਨ। ਜੇਕਰ ਸਥਿਤੀ ਆਫ਼ਲਾਈਨ ਰਹਿੰਦੀ ਹੈ ਤਾਂ ਮੁੜ-ਕਨੈਕਟ ਕਰੋ \'ਤੇ ਟੈਪ ਕਰੋ।';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'ਕਨੈਕਟ ਕੀਤਾ $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'ਔਫਲਾਈਨ — ਰੀਲੇ ਸੂਚੀਬੱਧ ਹਨ ਪਰ ਕੋਈ ਵੀ ਕਨੈਕਟ ਨਹੀਂ ਹੈ';

  @override
  String get nostrStatusNotInit =>
      'ਸ਼ੁਰੂ ਨਹੀਂ ਹੋਇਆ (0/0) — ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਦੁਬਾਰਾ ਕਨੈਕਟ ਕਰੋ \'ਤੇ ਟੈਪ ਕਰੋ';

  @override
  String get nostrReconnectAction => 'Nostr ਨੂੰ ਮੁੜ-ਕਨੈਕਟ ਕਰੋ';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr ਜੁੜਿਆ ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'ਅਜੇ ਵੀ ਔਫਲਾਈਨ — Wi‑Fi/ਸੈਲੂਲਰ ਦੀ ਜਾਂਚ ਕਰੋ ਜਾਂ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'ਅਸਫਲ: $error';
  }

  @override
  String get nostrReconnecting => 'ਰੀਲੇਅ ਨਾਲ ਕਨੈਕਟ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return '$channel ਵਿੱਚ ਇੰਟਰਨੈੱਟ (Nostr) • ਸੀਲਬੰਦ ਚੈਟ ਤਿਆਰ ਹੈ';
  }

  @override
  String get transportModeTitle => 'ਖੇਤਰ ਆਵਾਜਾਈ';

  @override
  String get transportModeSubtitle =>
      'ਜਾਲ = BLE ਨੇੜਲੇ (ਰੇਡੀਓ) ਜਦੋਂ ਨਹੀਂ Nostr · ਇੰਟਰਨੈਟ ਅਤੇ ਆਟੋ = Nostr ਲੋਕਾਂ ਦੀ ਸੂਚੀ';

  @override
  String get transportModeMesh => 'ਜਾਲ';

  @override
  String get transportModeInternet => 'ਇੰਟਰਨੈੱਟ';

  @override
  String get transportModeAuto => 'ਆਟੋ';

  @override
  String get geoPublicHint => 'ਇਸ ਖੇਤਰ ਵਿੱਚ ਔਨਲਾਈਨ ਹਰ ਕਿਸੇ ਲਈ ਜਨਤਕ ਸੰਦੇਸ਼';

  @override
  String get geoPublicSend => 'ਜਨਤਕ';

  @override
  String geoPublicHelp(int count) {
    return '$count ਔਨਲਾਈਨ ਸਾਥੀ(ਆਂ) ਨੂੰ ਸੀਲਬੰਦ ਫੈਨ-ਆਊਟ — ਹਰੇਕ ਨੂੰ ਇੱਕ ਨਿੱਜੀ ਲਿਫਾਫਾ ਪ੍ਰਾਪਤ ਹੁੰਦਾ ਹੈ';
  }

  @override
  String geoPublicSent(int count) {
    return 'ਇਸ ਖੇਤਰ ਵਿੱਚ $count ਸਾਥੀਆਂ ਨੂੰ ਭੇਜਿਆ ਗਿਆ';
  }

  @override
  String get geoPublicSentNone =>
      'ਕੋਈ ਸੁਨੇਹਾ ਦੇਣ ਯੋਗ ਸਾਥੀ ਔਨਲਾਈਨ ਨਹੀਂ — ਕੁੰਜੀਆਂ ਵਾਲੇ ਸਾਥੀਆਂ ਨਾਲ ਖੇਤਰ/ਜਾਲ ਖੋਲ੍ਹੋ, ਜਾਂ BLE/Nostr ਦੀ ਉਡੀਕ ਕਰੋ';

  @override
  String get areaPublicBadge => 'ਖੇਤਰ ਜਨਤਕ';

  @override
  String get geoErrorPermission =>
      'ਟਿਕਾਣਾ ਪੜ੍ਹਿਆ ਨਹੀਂ ਜਾ ਸਕਿਆ — ਟਿਕਾਣਾ ਇਜਾਜ਼ਤ ਦੀ ਜਾਂਚ ਕਰੋ';

  @override
  String get geoPrecisionRegion => 'ਖੇਤਰ';

  @override
  String get geoPrecisionProvince => 'ਸੂਬਾ';

  @override
  String get geoPrecisionCity => 'ਸ਼ਹਿਰ';

  @override
  String get geoPrecisionNeighborhood => 'ਆਂਢ-ਗੁਆਂਢ';

  @override
  String get geoPrecisionBlock => 'ਬਲਾਕ';

  @override
  String get aliasTitle => 'ਉਪਨਾਮ ਸੈੱਟ ਕਰੋ (ਸੰਪਰਕ ਉਪਨਾਮ)';

  @override
  String get aliasHintBody =>
      'ਇਹ ਉਪਨਾਮ ਸਿਰਫ਼ ਇਸ ਡੀਵਾਈਸ \'ਤੇ ਸਟੋਰ ਕੀਤਾ ਜਾਂਦਾ ਹੈ (ਸਿਰਫ਼-ਸਥਾਨਕ)\nਇਹ ਕਦੇ ਵੀ E2EE ਟ੍ਰੈਫਿਕ ਨਾਲ ਨਹੀਂ ਭੇਜਿਆ ਜਾਂਦਾ ਹੈ';

  @override
  String get aliasLabel => 'ਉਪਨਾਮ';

  @override
  String get aliasHint => 'ਜਿਵੇਂ ਕਿ “ਪਿੰਡ ਦਾ ਮੁਖੀ”, “ਪ’ਸੋਮਚਾਈ”…';

  @override
  String get settingsDevices => 'ਡਿਵਾਈਸਾਂ';

  @override
  String get settingsFirmwareTitle => 'ESP32 ਫਰਮਵੇਅਰ ਨੂੰ ਡਾਊਨਲੋਡ / ਅੱਪਡੇਟ ਕਰੋ';

  @override
  String get settingsFirmwareSubtitle =>
      '.bin ਫਾਈਲਾਂ ਨੂੰ ਡਾਊਨਲੋਡ ਕਰੋ ਅਤੇ OTA ਰਾਹੀਂ ESP32 ਬੋਰਡ ਨੂੰ ਅੱਪਡੇਟ ਕਰੋ';

  @override
  String get mtBridgeTitle => 'Meshtastic ਪੁਲ';

  @override
  String get mtBridgeSettingsSubtitle =>
      'ਸਿਰਫ਼-ਟੈਕਸਟ A/B ਬ੍ਰਿਜ — ResilNet E2EE ਨਹੀਂ';

  @override
  String get mtBridgeIntro =>
      'ਛੋਟੇ ਪਲੇਨ ਟੈਕਸਟ ਨੂੰ Meshtastic ਅਤੇ ResilNet ਵਿਚਕਾਰ ਲੈ ਜਾਓ। ਮੋਡ A ਅਤੇ B ਇੱਕੋ ਸਮੇਂ \'ਤੇ ਨਹੀਂ ਚੱਲ ਸਕਦੇ ਹਨ। ਇਹ ਐਂਡ-ਟੂ-ਐਂਡ ਐਨਕ੍ਰਿਪਸ਼ਨ ਨਹੀਂ ਹੈ।';

  @override
  String get mtBridgeModeLabel => 'ਮੋਡ';

  @override
  String get mtBridgeModeOff => 'ਬੰਦ';

  @override
  String get mtBridgeModeA => 'ਇੰਜੈਸਟ ਏ';

  @override
  String get mtBridgeModeB => 'ਈਗ੍ਰੇਸ ਬੀ';

  @override
  String get mtBridgeModeOffShort => 'ਬੰਦ';

  @override
  String get mtBridgeModeAShort => 'ਵਿਚ ਏ';

  @override
  String get mtBridgeModeBShort => 'ਆਊਟ ਬੀ';

  @override
  String get mtBridgeMutexHint =>
      'ਇੱਕ ਮੋਡ ਨੂੰ ਚੁਣਨ ਨਾਲ ਦੂਜੇ ਨੂੰ ਆਪਣੇ ਆਪ ਬੰਦ ਹੋ ਜਾਂਦਾ ਹੈ। ਸਮਕਾਲੀ A+B ਸਮਰਥਿਤ ਨਹੀਂ ਹੈ।';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'ਡੈਮੋ (ਲੌਗਿੰਗ)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'ਇਨਬਾਊਂਡ ਟੈਕਸਟ ਨੋਟਿਸ ਦੇ ਹੇਠਾਂ #meshtastic ਦੇ ਰੂਪ ਵਿੱਚ ਦਿਖਾਈ ਦਿੰਦਾ ਹੈ। ਜਾਲ ਰੀਲੇਅ ਵਿਕਲਪਿਕ ਹੈ (ਮੂਲ ਰੂਪ ਵਿੱਚ ਬੰਦ)।';

  @override
  String get mtBridgeRelayTitle => 'ResilNet ਜਾਲ \'ਤੇ ਵੀ ਰੀਲੇਅ ਕਰੋ';

  @override
  String get mtBridgeRelayHint =>
      'ਚਾਲੂ ਹੋਣ \'ਤੇ, ਦਸਤਖਤ ਕੀਤੇ ਜਨਤਕ ਬੁਲੇਟਿਨ ਪ੍ਰਸਾਰਿਤ ਕੀਤੇ ਜਾਂਦੇ ਹਨ। ਬੰਦ = ਸਿਰਫ਼ ਇਸ ਫ਼ੋਨ ਦੇ ਨੋਟਿਸ।';

  @override
  String get mtBridgeSimulateHint => 'ਡੈਮੋ ਸੁਨੇਹਾ';

  @override
  String get mtBridgeSimulate => 'Meshtastic ਸੁਨੇਹਾ ਸਿਮੂਲੇਟ ਕਰੋ';

  @override
  String get mtBridgeIngestOk => 'ਨੋਟਿਸਾਂ ਵਿੱਚ ਸ਼ਾਮਲ ਕੀਤਾ ਗਿਆ (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'ਚੇਤਾਵਨੀ: ਇੱਥੇ ਭੇਜੇ ਗਏ ਸੁਨੇਹੇ ResilNet E2EE ਨਹੀਂ ਹਨ। Meshtastic ਮਾਰਗ \'ਤੇ ਕੋਈ ਵੀ ਇਹਨਾਂ ਨੂੰ ਪੜ੍ਹ ਸਕਦਾ ਹੈ।';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'ਪ੍ਰਕਾਸ਼ਿਤ ਕਰਨ ਲਈ ਲਿਖਤ';

  @override
  String get mtBridgeSend => 'Meshtastic ਨੂੰ ਭੇਜੋ';

  @override
  String get mtBridgeEgressOk => 'Meshtastic ਲਈ ਕਤਾਰਬੱਧ (ਦੇਖੋ ਲੌਗ / ਇਤਿਹਾਸ)';

  @override
  String get mtBridgeLastEgress => 'ਆਖਰੀ ਨਿਕਾਸੀ';

  @override
  String get mtBridgeEgressHistory => 'ਤਾਜ਼ਾ ਨਿਕਾਸੀ';

  @override
  String get mtBridgeOffHint =>
      'ਬ੍ਰਿਜ ਦੀ ਵਰਤੋਂ ਕਰਨ ਲਈ ਇੰਜੈਸਟ (ਏ) ਜਾਂ ਈਗ੍ਰੇਸ (ਬੀ) ਨੂੰ ਚਾਲੂ ਕਰੋ।';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTIC · E2EE ਨਹੀਂ';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'MQTT ਟ੍ਰਾਂਸਪੋਰਟ ਦੀ ਵਰਤੋਂ ਕਰੋ';

  @override
  String get mtBridgeUseMqttHint =>
      'ਬੰਦ = ਸਿਰਫ਼ ਡੈਮੋ ਲੌਗਿੰਗ (MQTT ਅੰਦਰ ਵੱਲ ਅਣਡਿੱਠ ਕੀਤਾ ਗਿਆ)। ਕਨੈਕਟ ਹੋਣ \'ਤੇ ਇੰਜੈਸਟ/ਨਿਗਸਣ ਲਈ = MQTT ਚਾਲੂ।';

  @override
  String get mtBridgeMqttHost => 'ਬ੍ਰੋਕਰ ਹੋਸਟ';

  @override
  String get mtBridgeMqttPort => 'ਪੋਰਟ';

  @override
  String get mtBridgeMqttTls => 'TLS (mqtts) ਦੀ ਵਰਤੋਂ ਕਰੋ';

  @override
  String get mtBridgeMqttTlsHint =>
      'ਆਮ ਪੋਰਟ 8883. ਸਿਸਟਮ ਸਰਟੀਫਿਕੇਟ ਵਰਤਦਾ ਹੈ; ਹੈਂਡਸ਼ੇਕ ਗਲਤੀਆਂ \'ਤੇ ਨਰਮ ਫੇਲ ਹੁੰਦਾ ਹੈ।';

  @override
  String get mtBridgeMqttAutoReconnect => 'ਆਟੋ-ਕੁਨੈਕਟ ਕਰੋ';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'ਚਾਲੂ ਹੋਣ \'ਤੇ, ਗਾਹਕ ਡ੍ਰੌਪ ਤੋਂ ਬਾਅਦ ਦੁਬਾਰਾ ਕਨੈਕਟ ਕਰਨ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰਦਾ ਹੈ। ਸਥਿਤੀ ਨੂੰ ਬਹਾਲ ਹੋਣ ਤੱਕ ਕਨੈਕਟ ਕਰਨਾ ਦਿਖਾਉਂਦਾ ਹੈ।';

  @override
  String get mtBridgeMqttTopicHelpers => 'ਵਿਸ਼ਾ ਸਹਾਇਕ';

  @override
  String get mtBridgeMqttRegion => 'ਖੇਤਰ ਅਗੇਤਰ (ਵਿਕਲਪਿਕ)';

  @override
  String get mtBridgeMqttRegionHint =>
      'ਸੈੱਟ ਕੀਤੇ ਜਾਣ \'ਤੇ, msh/<region>/2/json (ਵਿਸ਼ਾ ਰੂਟ ਨੂੰ ਓਵਰਰਾਈਡ ਕਰਦਾ ਹੈ) ਵਜੋਂ ਰੀਬਿਲਡ ਰੂਟ ਨੂੰ ਲਾਗੂ ਕਰੋ।';

  @override
  String get mtBridgeMqttTopicRoot => 'JSON ਵਿਸ਼ਾ ਰੂਟ';

  @override
  String get mtBridgeMqttDownlinkChannel => 'ਡਾਊਨਲਿੰਕ ਚੈਨਲ ਦਾ ਨਾਮ';

  @override
  String get mtBridgeMqttApplyTopics =>
      'ਰੂਟ ਲਾਗੂ ਕਰੋ → ਸਬਸਕ੍ਰਾਈਬ / ਪ੍ਰਕਾਸ਼ਿਤ ਵਿਸ਼ੇ';

  @override
  String get mtBridgeMqttAdvanced => 'ਉੱਨਤ MQTT';

  @override
  String get mtBridgeMqttAdvancedHint => 'TLS, ਮੁੜ-ਕਨੈਕਟ, ਵਿਸ਼ੇ, ਪ੍ਰਮਾਣ ਪੱਤਰ';

  @override
  String get mtBridgeMqttTopicIn => 'ਵਿਸ਼ਾ ਮੈਂਬਰ ਬਣੋ';

  @override
  String get mtBridgeMqttTopicOut => 'ਵਿਸ਼ਾ ਪ੍ਰਕਾਸ਼ਿਤ ਕਰੋ';

  @override
  String get mtBridgeMqttGatewayFrom => 'ਗੇਟਵੇ ਨੋਡ ਆਈਡੀ (ਤੋਂ)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'ਦਸ਼ਮਲਵ id ਜਾਂ !hex — sendtext ਡਾਊਨਲਿੰਕ ਲਈ ਲੋੜੀਂਦਾ ਹੈ';

  @override
  String get mtBridgeMqttChannelIndex => 'ਮੈਸ਼ ਚੈਨਲ ਇੰਡੈਕਸ (ਵਿਕਲਪਿਕ 0–7)';

  @override
  String get mtBridgeMqttUser => 'ਉਪਭੋਗਤਾ ਨਾਮ (ਵਿਕਲਪਿਕ)';

  @override
  String get mtBridgeMqttPass => 'ਪਾਸਵਰਡ (ਵਿਕਲਪਿਕ)';

  @override
  String get mtBridgeMqttPassStored =>
      'ਇਸ ਡਿਵਾਈਸ \'ਤੇ ਇੱਕ ਪਾਸਵਰਡ ਸਟੋਰ ਕੀਤਾ ਗਿਆ ਹੈ (ਨਹੀਂ ਦਿਖਾਇਆ ਗਿਆ)।';

  @override
  String get mtBridgeMqttPassReplace => 'ਨਵਾਂ ਪਾਸਵਰਡ (ਰੱਖਣ ਲਈ ਖਾਲੀ ਛੱਡੋ)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'ਸਟੋਰ ਕੀਤੇ ਪਾਸਵਰਡ ਨੂੰ ਰੱਖਣ ਲਈ ਖਾਲੀ ਛੱਡੋ।';

  @override
  String get mtBridgeMqttPassClear => 'ਪਾਸਵਰਡ ਸਾਫ਼ ਕਰੋ';

  @override
  String get mtBridgeMqttSave => 'MQTT ਸੈਟਿੰਗਾਂ ਨੂੰ ਸੁਰੱਖਿਅਤ ਕਰੋ';

  @override
  String get mtBridgeMqttSaved => 'MQTT ਸੈਟਿੰਗਾਂ ਸੁਰੱਖਿਅਤ ਕੀਤੀਆਂ ਗਈਆਂ';

  @override
  String get mtBridgeMqttConnect => 'ਜੁੜੋ';

  @override
  String get mtBridgeMqttDisconnect => 'ਡਿਸਕਨੈਕਟ ਕਰੋ';

  @override
  String get mtBridgeMqttConnected => 'MQTT ਕਨੈਕਟ ਕੀਤਾ ਗਿਆ';

  @override
  String get mtBridgeMqttConnecting => 'MQTT ਕਨੈਕਟ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT ਡਿਸਕਨੈਕਟ ਕੀਤਾ ਗਿਆ';

  @override
  String get mtBridgeMqttError => 'MQTT ਗਲਤੀ';

  @override
  String get mtBridgeErrModeIngest => 'ਪਹਿਲਾਂ Ingest (A) \'ਤੇ ਜਾਓ';

  @override
  String get mtBridgeErrModeEgress => 'ਪਹਿਲਾਂ Egress (B) \'ਤੇ ਜਾਓ';

  @override
  String get mtBridgeErrRate => 'ਹੌਲੀ - ਸੀਮਤ ਦਰ';

  @override
  String get mtBridgeErrDedupe => 'ਡੁਪਲੀਕੇਟ ਸੁਨੇਹਾ ਅਣਡਿੱਠ ਕੀਤਾ ਗਿਆ';

  @override
  String get mtBridgeErrLoop => 'ਇੱਕ ਪੁਲ ਲੂਪ ਨੂੰ ਰੋਕਣ ਲਈ ਸੁੱਟਿਆ';

  @override
  String get mtBridgeErrEmpty => 'ਸੁਨੇਹਾ ਖਾਲੀ ਹੈ';

  @override
  String get mtBridgeErrPublish => 'ਪ੍ਰਕਾਸ਼ਿਤ ਕਰਨਾ ਅਸਫਲ ਰਿਹਾ';

  @override
  String get mtBridgeErrNotConnected => 'MQTT ਕਨੈਕਟ ਨਹੀਂ ਹੈ';

  @override
  String get mtBridgeErrMissingHost => 'MQTT ਬ੍ਰੋਕਰ ਹੋਸਟ ਦਾਖਲ ਕਰੋ';

  @override
  String get mtBridgeErrMissingTopic => 'ਸਬਸਕ੍ਰਾਈਬ ਕਰੋ ਅਤੇ ਵਿਸ਼ੇ ਪ੍ਰਕਾਸ਼ਿਤ ਕਰੋ';

  @override
  String get mtBridgeErrMissingFromNode =>
      'ਸੇਂਡਟੈਕਸਟ ਲਈ ਗੇਟਵੇ ਨੋਡ ਆਈਡੀ (ਤੋਂ) ਦਰਜ ਕਰੋ';

  @override
  String get mtBridgeErrConnect => 'MQTT ਕਨੈਕਟ ਕਰਨਾ ਅਸਫਲ ਰਿਹਾ';

  @override
  String get mtBridgeErrConnectTls => 'MQTT TLS ਕਨੈਕਟ ਅਸਫਲ';

  @override
  String get settingsData => 'ਡਾਟਾ';

  @override
  String get settingsDataHint =>
      'ਡਾਟਾਬੇਸ ਨੂੰ ਸੁੰਗੜਨ ਲਈ ਸਥਾਨਕ ਸੁਨੇਹਿਆਂ ਨੂੰ ਮਿਟਾਓ — ਪਛਾਣ, ਕੁੰਜੀਆਂ ਅਤੇ ਸਾਥੀਆਂ ਨੂੰ ਰੱਖਿਆ ਜਾਂਦਾ ਹੈ';

  @override
  String get settingsSaveHistoryTitle => 'ਸੁਨੇਹਾ ਇਤਿਹਾਸ ਨੂੰ ਸੁਰੱਖਿਅਤ ਕਰੋ';

  @override
  String get settingsSaveHistorySubtitle =>
      'ਬੰਦ ਹੋਣ \'ਤੇ, ਸੁਨੇਹੇ ਤਾਰ \'ਤੇ E2EE ਰਹਿੰਦੇ ਹਨ ਅਤੇ ਸਿਰਫ਼ ਇਸ ਸੈਸ਼ਨ ਲਈ ਰੱਖੇ ਜਾਂਦੇ ਹਨ (ਸਥਾਨਕ ਚੈਟ ਇਤਿਹਾਸ ਵਿੱਚ ਨਹੀਂ)। ਤੁਹਾਡਾ ਆਪਣਾ ਟੈਕਸਟ ਅਜੇ ਵੀ ਇਸ ਡਿਵਾਈਸ \'ਤੇ ਪਲੇਨ ਟੈਕਸਟ ਦੇ ਰੂਪ ਵਿੱਚ ਦਿਖਾਈ ਦਿੰਦਾ ਹੈ।';

  @override
  String get settingsPrivacy => 'ਗੋਪਨੀਯਤਾ';

  @override
  String get settingsE2eeTitle => 'ਐਂਡ-ਟੂ-ਐਂਡ ਐਨਕ੍ਰਿਪਸ਼ਨ';

  @override
  String get settingsE2eeSubtitle =>
      'ਹਮੇਸ਼ਾ ਚਾਲੂ — ਸੁਨੇਹੇ ਭੇਜਣ ਤੋਂ ਪਹਿਲਾਂ RSA-OAEP + AES-GCM ਨਾਲ ਸੀਲ ਕੀਤੇ ਜਾਂਦੇ ਹਨ। ਰੀਲੇਅ ਅਤੇ ਨੇੜਲੇ ਹੌਪਸ ਸਮੱਗਰੀ ਨੂੰ ਨਹੀਂ ਪੜ੍ਹ ਸਕਦੇ।';

  @override
  String get settingsScreenshotTitle => 'ਸਕ੍ਰੀਨਸ਼ਾਟ ਚੇਤਾਵਨੀਆਂ';

  @override
  String get settingsScreenshotSubtitle =>
      'ਜਦੋਂ ਇਹ ਡਿਵਾਈਸ ਸਕ੍ਰੀਨ ਨੂੰ ਕੈਪਚਰ ਕਰਦੀ ਹੈ ਤਾਂ ਚੈਟ ਵਿੱਚ ਇੱਕ ਸਿਸਟਮ ਲਾਈਨ ਦਿਖਾਓ';

  @override
  String get settingsNostrExpiryTitle => 'Nostr ਸੁਨੇਹਾ ਸਮਾਂ ਰੱਖੋ';

  @override
  String get settingsNostrExpirySubtitle =>
      'Nostr ਰਾਹੀਂ ਔਨਲਾਈਨ ਹੋਣ \'ਤੇ ਸੀਲਬੰਦ ਲਿਫ਼ਾਫ਼ੇ ਸਥਾਨਕ ਤੌਰ \'ਤੇ ਕਿੰਨੀ ਦੇਰ ਤੱਕ ਰਹਿਣੇ ਚਾਹੀਦੇ ਹਨ';

  @override
  String get noticeExpiresIn => 'ਵਿੱਚ ਮਿਆਦ ਪੁੱਗ ਜਾਂਦੀ ਹੈ';

  @override
  String get noticesTitle => 'ਨੋਟਿਸ';

  @override
  String get noticesMeshIntro =>
      'ਜਨਤਕ ਬੁਲੇਟਿਨ — ਰੇਡੀਓ ਰੇਂਜ ਵਿੱਚ ਹਰ ਕਿਸੇ ਨੂੰ ਦਿਖਾਈ ਦਿੰਦਾ ਹੈ, ਐਨਕ੍ਰਿਪਟਡ ਨਹੀਂ। ਇਹ ਫ਼ੋਨ-ਟੂ-ਫ਼ੋਨ ਔਫਲਾਈਨ ਹੋਪ ਕਰਦਾ ਹੈ, ਅਤੇ ਨੇੜਲੇ ResilNet ਰੀਲੇਅ ਬਾਕਸ ਇੱਕ ਕਾਪੀ ਰੱਖਦੇ ਹਨ ਤਾਂ ਜੋ ਬਾਅਦ ਵਿੱਚ ਆਉਣ ਵਾਲੇ ਲੋਕ ਇਸਨੂੰ ਦੇਖ ਸਕਣ।';

  @override
  String get noticesMeshPublicBadge => 'ਜਨਤਕ · ਐਨਕ੍ਰਿਪਟਡ ਨਹੀਂ';

  @override
  String get noticesGeoIntro =>
      'ਇਸ ਸਥਾਨ ਲਈ ਛੋਟੇ ਨੋਟ ਸ਼ਾਮਲ ਕਰੋ ਤਾਂ ਜੋ ਹੋਰ ਸੈਲਾਨੀ ਉਹਨਾਂ ਨੂੰ ਲੱਭ ਸਕਣ।';

  @override
  String get noticesEmpty => 'ਅਜੇ ਤੱਕ ਕੋਈ ਨੋਟਿਸ ਨਹੀਂ';

  @override
  String get noticesEmptyHint =>
      'ਇੱਥੇ ਆਲੇ-ਦੁਆਲੇ ਦੇ ਲੋਕਾਂ ਲਈ ਪਹਿਲਾ ਨੋਟਿਸ ਪਿੰਨ ਕਰੋ।';

  @override
  String get noticesComposeHint => 'ਇੱਕ ਨੋਟਿਸ ਪੋਸਟ ਕਰੋ...';

  @override
  String get noticesUrgent => 'ਜ਼ਰੂਰੀ';

  @override
  String get noticesOpen => 'ਨੋਟਿਸ';

  @override
  String get screenshotTaken => '* ਤੁਸੀਂ ਇੱਕ ਸਕ੍ਰੀਨਸ਼ੌਟ ਲਿਆ ਹੈ *';

  @override
  String get chatAttachImage => 'ਚਿੱਤਰ ਨੱਥੀ ਕਰੋ';

  @override
  String get chatImageLabel => 'ਚਿੱਤਰ';

  @override
  String get chatImageTooLarge => 'ਚਿੱਤਰ ਬਹੁਤ ਵੱਡਾ ਹੈ — ਕੋਈ ਹੋਰ ਫ਼ੋਟੋ ਅਜ਼ਮਾਓ';

  @override
  String get chatNostrExpiry => 'Nostr ਰੱਖੋ';

  @override
  String geoPublicComposeHint(String channel) {
    return '$channel ਨੂੰ ਭੇਜੋ — ਜਨਤਕ';
  }

  @override
  String get settingsClearTitle => 'ਸਾਰੇ ਸੁਨੇਹੇ ਸਾਫ਼ ਕਰੋ';

  @override
  String get settingsClearSubtitle => 'ਇਸ ਡਿਵਾਈਸ \'ਤੇ ਸਾਰੀਆਂ ਚੈਟਾਂ ਨੂੰ ਮਿਟਾਓ';

  @override
  String get settingsClearConfirmTitle => 'ਕੀ ਸਾਰੇ ਸੁਨੇਹੇ ਸਾਫ਼ ਕਰਨੇ ਹਨ?';

  @override
  String get settingsClearConfirmBody =>
      'ਇਹ ਇਸ ਡਿਵਾਈਸ \'ਤੇ ਸਾਰੇ ਚੈਟ ਸੁਨੇਹਿਆਂ ਨੂੰ ਮਿਟਾ ਦਿੰਦਾ ਹੈ।\nਹਾਣੀ ਅਤੇ ਉਪਨਾਮ ਹਟਾਏ ਨਹੀਂ ਜਾਂਦੇ.';

  @override
  String get settingsClearAction => 'ਡਾਟਾ ਸਾਫ਼ ਕਰੋ';

  @override
  String get settingsClearedSnack => 'ਡਾਟਾ ਕਲੀਅਰ ਕੀਤਾ ਗਿਆ';

  @override
  String settingsVersion(String version) {
    return 'ਵਰਜਨ $version';
  }

  @override
  String get meshBleScanning => 'BLE: ਨੋਡਸ ਲਈ ਸਕੈਨਿੰਗ';

  @override
  String get meshBleEsp32Scanning => 'ESP32: ਨੇੜਲੇ ਨੋਡ ਦੀ ਭਾਲ ਕਰ ਰਿਹਾ ਹੈ';

  @override
  String get meshBleSyncing => 'BLE: ESP32 ਨਾਲ ਸਮਕਾਲੀਕਰਨ';

  @override
  String get meshNostrPublishing => 'Nostr: ਪ੍ਰਕਾਸ਼ਨ';

  @override
  String get meshBleIdle => 'BLE ਜਾਲ ਚਾਲੂ — ਅਜੇ ਤੱਕ ਕੋਈ ਨਜ਼ਦੀਕੀ ਫ਼ੋਨ ਨਹੀਂ ਹਨ';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE ਜਾਲ — $count ਨੇੜੇ ਦੇ ਫ਼ੋਨ';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: ਇਜਾਜ਼ਤ ਦੀ ਲੋੜ ਹੈ';

  @override
  String get meshBlePausedCamera =>
      'BLE ਕੈਮਰੇ ਲਈ ਰੋਕਿਆ ਗਿਆ — ਸਟਾਰਟ BLE \'ਤੇ ਟੈਪ ਕਰੋ';

  @override
  String get meshBleStopped =>
      'BLE ਬੰਦ ਹੈ — ਚੈੱਕ ਕਰੋ ਕਿ ਬਲੂਟੁੱਥ ਚਾਲੂ ਹੈ, ਫਿਰ ਸਟਾਰਟ BLE \'ਤੇ ਟੈਪ ਕਰੋ';

  @override
  String get meshBleRestart => 'BLE ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'ਇਜਾਜ਼ਤਾਂ ਦੀ ਜਾਂਚ ਕਰੋ ਅਤੇ BLE ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get meshNostrOffline => 'Nostr ਔਫਲਾਈਨ';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count ਨੇੜਲੇ ਸਾਥੀ • LoRa $lora • ਸਮਕਾਲੀਕਰਨ ~${meters}m';
  }

  @override
  String get meshLoraReady => 'ਤਿਆਰ';

  @override
  String get meshLoraNotReady => 'ਤਿਆਰ ਨਹੀਂ';

  @override
  String meshGatewayProgress(String label) {
    return 'ਗੇਟਵੇ UDP: $label';
  }

  @override
  String get meshGatewayReady => 'ਗੇਟਵੇ UDP: ਤਿਆਰ';

  @override
  String get permissionTitle =>
      'BLE ਜਾਲ ਨੈੱਟਵਰਕ ਨੂੰ ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਪਹੁੰਚ ਦੀ ਇਜਾਜ਼ਤ ਦਿਓ';

  @override
  String get permissionBody =>
      'ਐਪ ਨੂੰ ਕਮਿਊਨਿਟੀ ਮੈਸੇਜਿੰਗ ਲਈ ਬਲੂਟੁੱਥ (ਸਕੈਨ / ਕਨੈਕਟ / ਇਸ਼ਤਿਹਾਰ), ਸਥਾਨ (ਪੁਰਾਣੇ Android ਡਿਵਾਈਸਾਂ ਲਈ), ਅਤੇ ਮਾਈਕ੍ਰੋਫੋਨ (ਚੈਟ ਅਤੇ ਘੋਸ਼ਣਾਵਾਂ ਵਿੱਚ ਵੌਇਸ ਨੋਟਸ ਲਈ) ਦੀ ਲੋੜ ਹੈ।';

  @override
  String get permissionE2ee =>
      'ਐਂਡ-ਟੂ-ਐਂਡ ਐਨਕ੍ਰਿਪਸ਼ਨ (E2EE)\nਰੀਲੇਅ ਨੋਡ ਸੰਦੇਸ਼ ਸਮੱਗਰੀ ਨਹੀਂ ਪੜ੍ਹ ਸਕਦੇ ਹਨ';

  @override
  String get permissionReady => 'ਇਜਾਜ਼ਤਾਂ ਤਿਆਰ ਹਨ';

  @override
  String get permissionRequest => 'ਆਗਿਆ ਦਿਓ ਅਤੇ ਜਾਰੀ ਰੱਖੋ';

  @override
  String get permissionNotReadySnack =>
      'ਸਿਸਟਮ ਅਜੇ ਤਿਆਰ ਨਹੀਂ ਹੈ — ਇੱਕ ਪਲ ਉਡੀਕ ਕਰੋ ਅਤੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get permissionDeniedSnack =>
      'ਇਜਾਜ਼ਤਾਂ ਅਧੂਰੀਆਂ — ਸੈਟਿੰਗਾਂ > ResilNet ਖੋਲ੍ਹੋ ਅਤੇ ਬਲੂਟੁੱਥ / ਟਿਕਾਣਾ / ਮਾਈਕ੍ਰੋਫ਼ੋਨ ਦੀ ਇਜਾਜ਼ਤ ਦਿਓ';

  @override
  String get permissionMicDenied =>
      'ਮਾਈਕ੍ਰੋਫੋਨ ਪਹੁੰਚ ਅਸਵੀਕਾਰ ਕੀਤੀ ਗਈ — ਇਸਨੂੰ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਵੌਇਸ ਨੋਟਸ ਰਿਕਾਰਡ ਕਰਨ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get permissionMicOpenSettings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get permissionCameraDenied =>
      'ਕੈਮਰੇ ਦੀ ਪਹੁੰਚ ਤੋਂ ਇਨਕਾਰ ਕੀਤਾ ਗਿਆ — ਇਸਨੂੰ ਸੈਟਿੰਗਾਂ ਵਿੱਚ QR ਕੋਡਾਂ ਨੂੰ ਸਕੈਨ ਕਰਨ ਦਿਓ';

  @override
  String get permissionCameraFailed =>
      'QR ਕੋਡਾਂ ਨੂੰ ਸਕੈਨ ਕਰਨ ਲਈ ਕੈਮਰੇ ਦੀ ਇਜਾਜ਼ਤ ਦੀ ਲੋੜ ਹੁੰਦੀ ਹੈ';

  @override
  String get permissionCameraOpenSettings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get permissionPhotosDenied =>
      'ਫੋਟੋ ਲਾਇਬ੍ਰੇਰੀ ਪਹੁੰਚ ਅਸਵੀਕਾਰ ਕੀਤੀ ਗਈ — ਇਸਨੂੰ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਆਪਣੇ QR ਕੋਡ ਨੂੰ ਸੁਰੱਖਿਅਤ ਕਰਨ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get permissionPhotosFailed =>
      'ਤੁਹਾਡੇ QR ਕੋਡ ਨੂੰ ਸੁਰੱਖਿਅਤ ਕਰਨ ਲਈ ਫੋਟੋ ਲਾਇਬ੍ਰੇਰੀ ਦੀ ਇਜਾਜ਼ਤ ਦੀ ਲੋੜ ਹੈ';

  @override
  String get permissionPhotosOpenSettings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String permissionFailedSnack(String error) {
    return 'ਇਜਾਜ਼ਤ ਬੇਨਤੀ ਅਸਫਲ: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet ਆਰਕੀਟੈਕਚਰ • ਸਟੋਰ-ਐਂਡ-ਫਾਰਵਰਡ ਮਲਟੀ-ਹੌਪ';

  @override
  String get onboardingSkip => 'ਛੱਡੋ';

  @override
  String get onboardingNext => 'ਅਗਲਾ';

  @override
  String get onboardingStart => 'ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get onboardingWelcomeTitle => 'ResilNet ਵਿੱਚ ਸੁਆਗਤ ਹੈ';

  @override
  String get onboardingWelcomeBody =>
      'ਇੱਕ ਜਾਲ ਨੈੱਟਵਰਕ ਉੱਤੇ ResilNet \'ਤੇ ਚੈਟ ਕਰੋ — ਭਾਵੇਂ ਇੰਟਰਨੈੱਟ ਤੋਂ ਬਿਨਾਂ';

  @override
  String get onboardingFriendsTitle => 'ਆਸਾਨੀ ਨਾਲ ਦੋਸਤਾਂ ਨੂੰ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get onboardingFriendsBody =>
      'ਪਛਾਣ ਤੋਂ ਇੱਕ QR ਸਾਂਝਾ ਕਰੋ, ਜਾਂ ਜਨਤਕ ਕੁੰਜੀਆਂ ਦਾ ਆਦਾਨ-ਪ੍ਰਦਾਨ ਕਰਨ ਲਈ ਕਿਸੇ ਦੋਸਤ ਦੇ QR ਨੂੰ ਸਕੈਨ ਕਰੋ';

  @override
  String get onboardingChannelsTitle => 'ਐਨਕ੍ਰਿਪਟਡ ਚੈਟ + ਨੇੜਲੇ ਚੈਨਲ';

  @override
  String get onboardingChannelsBody =>
      'ਨੇੜਲੇ ਸਾਥੀਆਂ ਨੂੰ ਲੱਭਣ ਲਈ #mesh / ਖੇਤਰ (geohash) ਨੂੰ ਬਦਲੋ — ਸੁਨੇਹੇ BLE ਜਾਲ ਅਤੇ Nostr ਉੱਤੇ E2EE ਰਹਿੰਦੇ ਹਨ';

  @override
  String get chatTitle => 'ਚੈਟ (E2EE)';

  @override
  String get chatScanTooltip => 'ਕਿਸੇ ਪੀਅਰ ਨੂੰ ਸ਼ਾਮਲ ਕਰਨ ਲਈ QR ਸਕੈਨ ਕਰੋ';

  @override
  String get chatBlockTooltip => 'ਇਸ ਭੇਜਣ ਵਾਲੇ ਨੂੰ ਬਲੌਕ ਕਰੋ';

  @override
  String get chatBlockedSnack =>
      'ਬਲੌਕ ਕੀਤਾ: ਕੋਈ ਸੂਚਨਾਵਾਂ ਨਹੀਂ / ਕੋਈ ਰੀਲੇਅ ਨਹੀਂ';

  @override
  String get chatAliasTooltip => 'ਉਪਨਾਮ ਸੈੱਟ ਕਰੋ';

  @override
  String get chatReceiverPemLabel => 'ਪ੍ਰਾਪਤਕਰਤਾ ਜਨਤਕ ਕੁੰਜੀ (PEM)';

  @override
  String get chatReceiverPemHint =>
      'ਆਪਣੇ ਦੋਸਤ ਦੀ ਜਨਤਕ ਕੁੰਜੀ ਨੂੰ ਪੇਸਟ ਕਰੋ (QR / ਸਾਂਝੀ ਕੀਤੀ ਫਾਈਲ ਤੋਂ)';

  @override
  String get chatNeedPeerKey =>
      'ਪਹਿਲਾਂ ਇਸ ਪੀਅਰ ਦੇ QR ਨੂੰ ਸਕੈਨ ਕਰੋ (ਪ੍ਰਮਾਣਿਤ ਜਨਤਕ ਕੁੰਜੀ ਦੀ ਲੋੜ ਹੈ)';

  @override
  String get chatPeerKeyMismatch =>
      'ਸਟੋਰ ਕੀਤੀ ਜਨਤਕ ਕੁੰਜੀ ਇਸ ਪੀਅਰ ਆਈ.ਡੀ. ਨਾਲ ਮੇਲ ਨਹੀਂ ਖਾਂਦੀ';

  @override
  String chatVoiceFailed(String error) {
    return 'ਆਡੀਓ ਰਿਕਾਰਡ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'ਵੌਇਸ ਨੋਟ ਚਲਾਇਆ ਨਹੀਂ ਜਾ ਸਕਿਆ: $error';
  }

  @override
  String get chatPlayVoice => 'ਵੌਇਸ ਨੋਟ ਚਲਾਓ';

  @override
  String get chatPauseVoice => 'ਵਿਰਾਮ';

  @override
  String get chatVoiceLabelSent => '🎤 ਵੌਇਸ ਨੋਟ (ਸੀਲਬੰਦ)';

  @override
  String get chatVoiceLabel => '🎤 ਵੌਇਸ ਨੋਟ';

  @override
  String get chatDecryptFailed => '[ਡਿਕ੍ਰਿਪਸ਼ਨ ਅਸਫਲ]';

  @override
  String chatSentSealed(String preview) {
    return '[ਸੀਲਬੰਦ • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[ਸੀਲ]';

  @override
  String get chatComposeHint => 'ਇੱਕ ਸੁਨੇਹਾ ਟਾਈਪ ਕਰੋ... (ਭੇਜਣ \'ਤੇ ਸੀਲ)';

  @override
  String get chatEmptyThread =>
      'ਹਾਲੇ ਕੋਈ ਸੁਨੇਹਾ ਨਹੀਂ\nਜਾਲ \'ਤੇ ਭੇਜਣ ਲਈ ਹੇਠਾਂ ਟਾਈਪ ਕਰੋ';

  @override
  String chatLoadFailed(String error) {
    return 'ਗੱਲਬਾਤ ਲੋਡ ਨਹੀਂ ਕੀਤੀ ਜਾ ਸਕੀ: $error';
  }

  @override
  String get chatEmojiTooltip => 'ਇਮੋਜੀ';

  @override
  String get statusPending => 'ਬਕਾਇਆ';

  @override
  String get statusSent => 'ਭੇਜਿਆ';

  @override
  String get statusRelayed => 'ਰੀਲੇਅ ਕੀਤਾ';

  @override
  String get statusDelivered => 'ਡਿਲੀਵਰ ਕੀਤਾ ਗਿਆ';

  @override
  String get statusRead => 'ਪੜ੍ਹੋ';

  @override
  String get statusFailed => 'ਅਸਫਲ ਰਿਹਾ';

  @override
  String get chatCopy => 'ਕਾਪੀ ਕਰੋ';

  @override
  String get chatDeleteLocal => 'ਇਸ ਡਿਵਾਈਸ \'ਤੇ ਮਿਟਾਓ';

  @override
  String get chatDeletedLocalSnack => 'ਇਸ ਡਿਵਾਈਸ ਤੋਂ ਮਿਟਾਇਆ ਗਿਆ';

  @override
  String get chatRetry => 'ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get chatSendFailed =>
      'ਡਿਲੀਵਰ ਨਹੀਂ ਕੀਤਾ ਗਿਆ — ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ \'ਤੇ ਟੈਪ ਕਰੋ';

  @override
  String get chatImageNeedInternet => 'ਚਿੱਤਰ ਭੇਜਣ ਲਈ ਇੰਟਰਨੈੱਟ ਨਾਲ ਕਨੈਕਟ ਕਰੋ';

  @override
  String get chatImageTooLargeOnline =>
      'ਚਿੱਤਰ ਨੂੰ ਭੇਜਣ ਲਈ ਕਾਫੀ ਸੰਕੁਚਿਤ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ';

  @override
  String get chatOpenLinkFailed => 'ਲਿੰਕ ਖੋਲ੍ਹਿਆ ਨਹੀਂ ਜਾ ਸਕਿਆ';

  @override
  String get identityTitle => 'ਪਛਾਣ';

  @override
  String get identityScanTooltip => 'ਕੈਮਰੇ ਨਾਲ QR ਸਕੈਨ ਕਰੋ';

  @override
  String get identityCopiedHash => 'ਜਨਤਕ ਕੁੰਜੀ ਹੈਸ਼ ਨੂੰ ਕਾਪੀ ਕੀਤਾ ਗਿਆ';

  @override
  String get identityPeerSaved => 'ਪੀਅਰ ਨੂੰ QR ਤੋਂ ਸੁਰੱਖਿਅਤ ਕੀਤਾ ਗਿਆ';

  @override
  String get identityGalleryDenied =>
      'ਫ਼ੋਟੋ ਲਾਇਬ੍ਰੇਰੀ ਦੀ ਇਜਾਜ਼ਤ ਅਸਵੀਕਾਰ ਕੀਤੀ ਗਈ';

  @override
  String get identityQrSaved => 'QR ਫੋਟੋ ਲਾਇਬ੍ਰੇਰੀ ਵਿੱਚ ਸੁਰੱਖਿਅਤ ਕੀਤਾ ਗਿਆ';

  @override
  String identityQrSaveFailed(String error) {
    return 'QR ਨੂੰ ਸੁਰੱਖਿਅਤ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ: $error';
  }

  @override
  String get peersTitle => 'ਨੈੱਟਵਰਕ ਦੇ ਮੈਂਬਰ';

  @override
  String get qrScanTitle => 'ਕਿਸੇ ਦੋਸਤ ਨੂੰ ਸ਼ਾਮਲ ਕਰਨ ਲਈ QR ਸਕੈਨ ਕਰੋ';

  @override
  String get qrInvalid => 'ਸਕੈਨ ਅਸਫਲ: ਅਵੈਧ QR';

  @override
  String get qrIdKeyMismatch =>
      'QR ਅਸਵੀਕਾਰ ਕੀਤਾ ਗਿਆ: ਆਈਡੀ ਜਨਤਕ ਕੁੰਜੀ ਨਾਲ ਮੇਲ ਨਹੀਂ ਖਾਂਦੀ';

  @override
  String get qrCameraNotReady => 'ਕੈਮਰਾ ਤਿਆਰ ਨਹੀਂ ਹੈ';

  @override
  String get qrRetrySettings => 'ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ / ਸੈਟਿੰਗਾਂ ਖੋਲ੍ਹੋ';

  @override
  String qrCameraOpenFailed(String error) {
    return 'ਕੈਮਰਾ ਖੋਲ੍ਹਿਆ ਨਹੀਂ ਜਾ ਸਕਿਆ: $error';
  }

  @override
  String get qrScanAlignHint => 'QR ਕੋਡ ਨੂੰ ਫਰੇਮ ਦੇ ਅੰਦਰ ਅਲਾਈਨ ਕਰੋ';

  @override
  String get firmwareDownloadTitle => 'ESP32 ਫਰਮਵੇਅਰ ਡਾਊਨਲੋਡ ਕਰੋ';

  @override
  String get firmwareSourceOnline => 'ਨਵੀਨਤਮ (ਆਨਲਾਈਨ)';

  @override
  String get firmwareSourceCached => 'ਸੁਰੱਖਿਅਤ ਕੀਤੀ ਕਾਪੀ (ਆਫਲਾਈਨ)';

  @override
  String get firmwareSourceBaseline => 'ਬੰਡਲ ਬੇਸਲਾਈਨ (ਆਫਲਾਈਨ)';

  @override
  String get firmwareSourceUnavailable => 'ਕੋਈ ਫਰਮਵੇਅਰ ਉਪਲਬਧ ਨਹੀਂ ਹੈ';

  @override
  String get firmwareBaselineIncompatible =>
      'ਬੰਡਲ ਕੀਤਾ ਫਰਮਵੇਅਰ ਬਹੁਤ ਪੁਰਾਣਾ ਹੈ — ਇੱਕ ਨਵਾਂ ਸੰਸਕਰਣ ਡਾਊਨਲੋਡ ਕਰਨ ਲਈ ਇੰਟਰਨੈੱਟ ਨਾਲ ਕਨੈਕਟ ਕਰੋ';

  @override
  String get firmwareChecksumFailed =>
      'ਫਰਮਵੇਅਰ ਅਖੰਡਤਾ ਜਾਂਚ ਵਿੱਚ ਅਸਫਲ ਰਿਹਾ — ਫਲੈਸ਼ਿੰਗ ਬਲੌਕ ਕੀਤੀ ਗਈ';

  @override
  String firmwareReadyFromSource(String source) {
    return 'ਫਰਮਵੇਅਰ ਤਿਆਰ: $source';
  }

  @override
  String get peersRefreshTooltip => 'ਤਾਜ਼ਾ ਕਰੋ';

  @override
  String get peersBlocked => 'ਬਲੌਕ ਕੀਤਾ';

  @override
  String peersNearbyBle(Object ble) {
    return 'ਨੇੜੇ (BLE)';
  }

  @override
  String get peersRecentlyOnline => 'ਹਾਲ ਹੀ ਵਿੱਚ ਔਨਲਾਈਨ';

  @override
  String get peersOnlineInArea => 'ਖੇਤਰ ਵਿੱਚ ਆਨਲਾਈਨ';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return '$minutes ਮਿੰਟ ਪਹਿਲਾਂ ਦੇਖਿਆ ਗਿਆ';
  }

  @override
  String get peersOffline => 'ਔਫਲਾਈਨ';

  @override
  String peersBlockedSnack(String id) {
    return 'ਬਲੌਕ ਕੀਤਾ $id';
  }

  @override
  String get peersUnblockedSnack => 'ਅਨਬਲੌਕ ਕੀਤਾ ਗਿਆ';

  @override
  String get peersEmpty =>
      'ਡਾਟਾਬੇਸ ਵਿੱਚ ਅਜੇ ਕੋਈ ਮੈਂਬਰ ਨਹੀਂ ਹੈ\nਇੱਕ QR ਸਕੈਨ ਕਰੋ ਜਾਂ BLE ਜਾਲ ਖੋਜ ਦੀ ਉਡੀਕ ਕਰੋ';

  @override
  String get peersOpenChat => 'ਚੈਟ ਖੋਲ੍ਹੋ';

  @override
  String get peersBlockAction => 'ਬਲਾਕ';

  @override
  String get peersUnblockAction => 'ਅਨਬਲੌਕ ਕਰੋ';

  @override
  String get channelPickerTooltip => 'ਚੈਟ / #mesh / ਖੇਤਰ';

  @override
  String get locationPickerTooltip => 'ਟਿਕਾਣਾ ਚੈਨਲ';

  @override
  String get transportPickerTooltip => 'ਜਾਲ / ਇੰਟਰਨੈੱਟ / ਆਟੋ';

  @override
  String get onlinePeopleTooltip => 'ਲੋਕ ਆਨਲਾਈਨ';

  @override
  String get unreadDirectsTooltipEmpty => 'ਨਿੱਜੀ ਸੁਨੇਹੇ';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count ਨਾ-ਪੜ੍ਹੇ ਨਿੱਜੀ ਸੁਨੇਹੇ';
  }

  @override
  String get onlinePeopleTitle => 'ਲੋਕ';

  @override
  String get onlinePeopleEmpty => 'ਇੱਥੇ ਅਜੇ ਤੱਕ ਕੋਈ ਵੀ ਔਨਲਾਈਨ ਨਹੀਂ ਹੈ';

  @override
  String onlinePeopleCount(int count) {
    return '$count ਔਨਲਾਈਨ';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · ਨੇੜਲੇ + ਖੇਤਰ';

  @override
  String get peerOnlineMeshTitle => 'ਜਾਲ \'ਤੇ ਕੋਈ ਨੇੜੇ ਹੈ';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name ਜਾਲ ਦੇ ਨੇੜੇ ਹੈ';
  }

  @override
  String get peerOnlineAreaTitle => 'ਖੇਤਰ ਵਿੱਚ ਕੋਈ ਆਨਲਾਈਨ';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name Nostr ਰਾਹੀਂ ਔਨਲਾਈਨ ਹੈ';
  }

  @override
  String get locationSheetTitle => '#location ਚੈਨਲ';

  @override
  String get channelPinsTitle => 'ਪਿੰਨ ਕੀਤਾ';

  @override
  String get channelPinsHint =>
      'ਚੈਨਲਾਂ ਨੂੰ ਪਿੰਨ ਕਰੋ ਜੋ ਤੁਸੀਂ ਅਕਸਰ ਵਰਤਦੇ ਹੋ — ਉਹ ਸਿਖਰ \'ਤੇ ਰਹਿੰਦੇ ਹਨ';

  @override
  String get channelPinTooltip => 'ਇਸ ਚੈਨਲ ਨੂੰ ਪਿੰਨ ਕਰੋ';

  @override
  String get channelUnpinTooltip => 'ਅਨਪਿੰਨ ਕਰੋ';

  @override
  String get locationSheetIntro =>
      'ਮੋਟੇ ਜਿਓਹਸ਼ ਦੀ ਵਰਤੋਂ ਕਰਦੇ ਹੋਏ ਨੇੜਲੇ ਲੋਕਾਂ ਨਾਲ ਚੈਟ ਕਰੋ — ਸਟੀਕ GPS ਦੀ ਨਹੀਂ। ਇੰਟਰਨੈੱਟ \'ਤੇ ਮੌਜੂਦਗੀ ਅਗਿਆਤ Nostr ਕੁੰਜੀਆਂ ਦੀ ਵਰਤੋਂ ਕਰਦੀ ਹੈ।';

  @override
  String get locationMeshSubtitle => '#bluetooth • ~10–50 ਮੀ';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => 'ਟੈਲੀਪੋਰਟ';

  @override
  String homeComposeHint(String channel) {
    return 'ਸੁਨੇਹਾ $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return '$channel ਨੂੰ ਭੇਜੋ — ਜਨਤਕ';
  }

  @override
  String get messageExpiryTitle => 'ਵਿੱਚ ਮਿਆਦ ਪੁੱਗ ਜਾਂਦੀ ਹੈ';

  @override
  String get voiceRecordTapToStart => 'ਵੌਇਸ ਸੁਨੇਹਾ ਰਿਕਾਰਡ ਕਰਨ ਲਈ ਟੈਪ ਕਰੋ';

  @override
  String get voiceRecordTooShort =>
      'ਰਿਕਾਰਡਿੰਗ ਬਹੁਤ ਛੋਟੀ ਹੈ — ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get voiceRecordFailed =>
      'ਰਿਕਾਰਡਿੰਗ ਨੂੰ ਸੁਰੱਖਿਅਤ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ — ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get voicePttHold => 'ਰਿਕਾਰਡ ਕਰਨ ਲਈ ਹੋਲਡ ਕਰੋ';

  @override
  String get voicePttRelease => 'ਪੂਰਵਦਰਸ਼ਨ ਲਈ ਰਿਲੀਜ਼ ਕਰੋ';

  @override
  String get voicePttRecording => 'ਰਿਕਾਰਡਿੰਗ…';

  @override
  String get voicePttDraftReady => 'ਵੌਇਸ ਨੋਟ ਤਿਆਰ ਹੈ';

  @override
  String get voicePttDiscard => 'ਰੱਦ ਕਰੋ';

  @override
  String get voicePttReRecord => 'ਦੁਬਾਰਾ ਰਿਕਾਰਡ ਕਰੋ';

  @override
  String get voicePttSend => 'ਵੌਇਸ ਨੋਟ ਭੇਜੋ';

  @override
  String get voicePttPlayPreview => 'ਪੂਰਵਦਰਸ਼ਨ ਚਲਾਓ';

  @override
  String get voicePttStopPreview => 'ਝਲਕ ਬੰਦ ਕਰੋ';

  @override
  String get noticesBackfilling => 'ਸੂਚਨਾਵਾਂ ਲੋਡ ਕੀਤੀਆਂ ਜਾ ਰਹੀਆਂ ਹਨ...';

  @override
  String get noticesNostrOnline => 'Nostr ਔਨਲਾਈਨ';

  @override
  String get noticesNostrOffline =>
      'Nostr ਔਫਲਾਈਨ — ਬੁਲੇਟਿਨ ਨੂੰ ਇੰਟਰਨੈੱਟ ਦੀ ਲੋੜ ਹੈ';

  @override
  String noticesBackfillLoaded(int count) {
    return '$count ਨੋਟਿਸ ਲੋਡ ਕੀਤੇ ਗਏ';
  }

  @override
  String get noticePublishFailed =>
      'ਏਰੀਆ ਬੋਰਡ ਨੂੰ ਨੋਟਿਸ ਪ੍ਰਕਾਸ਼ਿਤ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ। Nostr ਕਨੈਕਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ।';

  @override
  String get noticeMeshPublishNoLink =>
      'ਸਥਾਨਕ ਤੌਰ \'ਤੇ ਸੁਰੱਖਿਅਤ ਕੀਤਾ ਗਿਆ। ਨੇੜਲੇ ਜਾਲ ਰੇਡੀਓ (ਜਾਂ Wi‑Fi ਗੇਟਵੇ) ਨਾਲ ਕਨੈਕਟ ਕਰੋ ਤਾਂ ਜੋ ਹੋਰ ਲੋਕ ਇਸਨੂੰ ਪ੍ਰਾਪਤ ਕਰ ਸਕਣ।';

  @override
  String noticeMeshPublishSent(int count) {
    return 'ਬੁਲੇਟਿਨ $count ਨਜ਼ਦੀਕੀ ਡਿਵਾਈਸਾਂ ਨੂੰ BLE ਉੱਤੇ ਭੇਜਿਆ ਗਿਆ।';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'ਨੇੜਲੇ ਰੇਡੀਓ ਦੇਖੇ ਗਏ, ਪਰ BLE ਲਿਖਣਾ ਅਸਫਲ ਰਿਹਾ। ਨੋਟਿਸ ਸਕ੍ਰੀਨ \'ਤੇ ਦੋਵੇਂ ਐਪਾਂ ਨੂੰ ਖੁੱਲ੍ਹਾ ਰੱਖੋ ਅਤੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ (ਜਾਂ ਇੱਕ ESP32 ਰੀਲੇਅ ਦੀ ਵਰਤੋਂ ਕਰੋ)।';

  @override
  String get noticeMeshPublishNoGatt =>
      'ਇਸ ਡਿਵਾਈਸ ਦਾ BLE ਰਿਸੀਵਰ ਤਿਆਰ ਨਹੀਂ ਹੈ। ਬਲੂਟੁੱਥ ਨੂੰ ਟੌਗਲ ਕਰੋ ਅਤੇ ਨੋਟਿਸਾਂ ਨੂੰ ਦੁਬਾਰਾ ਖੋਲ੍ਹੋ।';

  @override
  String get noticeDelete => 'ਨੋਟਿਸ ਮਿਟਾਓ';

  @override
  String get noticeDeleteConfirmTitle => 'ਕੀ ਇਸ ਨੋਟਿਸ ਨੂੰ ਮਿਟਾਉਣਾ ਹੈ?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'ਇਹ ਇਸਨੂੰ ਸਿਰਫ਼ ਇਸ ਡੀਵਾਈਸ \'ਤੇ ਹੀ ਹਟਾਉਂਦਾ ਹੈ। ਹੋਰ ਜੋ ਪਹਿਲਾਂ ਹੀ ਇਸਨੂੰ ਪ੍ਰਾਪਤ ਕਰ ਚੁੱਕੇ ਹਨ ਉਹ ਅਜੇ ਵੀ ਇਸਨੂੰ ਦੇਖਣਗੇ।';

  @override
  String get noticeDeleted => 'ਨੋਟਿਸ ਮਿਟਾਇਆ ਗਿਆ';

  @override
  String get chatNoticeHidden => 'ਖੇਤਰ ਨੋਟਿਸ - ਖੁੱਲੇ ਨੋਟਿਸ';

  @override
  String get identityDisplayNameTitle => 'ਦਿਖਾਇਆ ਹੋਇਆ ਨਾਮ';

  @override
  String get identitySaveName => 'ਨਾਮ ਸੁਰੱਖਿਅਤ ਕਰੋ';

  @override
  String get identityUserIdLabel => 'ਯੂਜ਼ਰ ਆਈਡੀ (ਜਨਤਕ ਕੁੰਜੀ ਹੈਸ਼)';

  @override
  String get identityCopyHashTooltip => 'ਜਨਤਕ ਕੁੰਜੀ ਹੈਸ਼ ਨੂੰ ਕਾਪੀ ਕਰੋ';

  @override
  String get identityMyQrTitle => 'ਮੇਰਾ QR (id + pubKey + ਨਾਮ)';

  @override
  String identityQrFailed(String error) {
    return 'QR ਨਹੀਂ ਬਣਾਇਆ ਜਾ ਸਕਿਆ\n$error';
  }

  @override
  String get identitySaving => 'ਰੱਖਿਅਤ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get identitySaveQr => 'QR ਨੂੰ ਫੋਟੋ ਲਾਇਬ੍ਰੇਰੀ ਵਿੱਚ ਸੁਰੱਖਿਅਤ ਕਰੋ';

  @override
  String get identityOpenScanner => 'QR ਸਕੈਨ ਕਰਨ ਲਈ ਕੈਮਰਾ ਖੋਲ੍ਹੋ';

  @override
  String get identityQrHelp =>
      'ਆਪਣੀ ਜਨਤਕ ਕੁੰਜੀ ਨੂੰ ਸੁਰੱਖਿਅਤ ਕਰਨ ਲਈ ਕਿਸੇ ਦੋਸਤ ਨੂੰ ਇਸ ਨੂੰ ਸਕੈਨ ਕਰਨ ਲਈ ਕਹੋ ਅਤੇ (ਜੇ ਲੋੜ ਹੋਵੇ) ਤੁਹਾਨੂੰ ਪ੍ਰਮਾਣਿਤ ਜਾਰੀਕਰਤਾ ਵਜੋਂ ਸੈੱਟ ਕਰੋ';

  @override
  String get identityChatTip =>
      'ਸੁਝਾਅ: ਤੁਸੀਂ E2EE ਲਈ ਇੱਕ ਜਨਤਕ ਕੁੰਜੀ ਜੋੜਨ ਲਈ ਚੈਟ ਵਿੱਚ ਇੱਕ QR ਵੀ ਸਕੈਨ ਕਰ ਸਕਦੇ ਹੋ';

  @override
  String get infoOpen => 'ਬਾਰੇ / ਜਾਣਕਾਰੀ';

  @override
  String get docsGuideTitle => 'ਉਪਭੋਗਤਾ ਗਾਈਡ';

  @override
  String get docsGuideSubtitle => 'ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਖੁੱਲ੍ਹਦਾ ਹੈ';

  @override
  String get docsOpenAction => 'ਗਾਈਡ ਖੋਲ੍ਹੋ';

  @override
  String get docsOpenFailed => 'ਯੂਜ਼ਰ ਗਾਈਡ ਨੂੰ ਖੋਲ੍ਹਿਆ ਨਹੀਂ ਜਾ ਸਕਿਆ';

  @override
  String get firmwareOtaGuideTitle => 'ਫਲੈਸ਼ ਗਾਈਡ ਅਤੇ OTA ਪ੍ਰੋਟੋਕੋਲ';

  @override
  String get firmwareOtaGuideSubtitle =>
      'ਵੈੱਬ ਗਾਈਡ ਖੋਲ੍ਹਦਾ ਹੈ — .bin ਡਾਉਨਲੋਡਸ ਅਤੇ ਪੂਰੇ ਕਦਮ';

  @override
  String get firmwareWebDownloadsTitle => 'ਵੈੱਬ \'ਤੇ ਫਰਮਵੇਅਰ ਡਾਊਨਲੋਡ';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'ਡੌਕਸ ਸਾਈਟ \'ਤੇ ਪ੍ਰਤੀ-ਵਰਜਨ ਲਿੰਕ ਅਤੇ ਚੈੱਕਸਮ';

  @override
  String get inviteCopyShortLink => 'ਛੋਟਾ ਲਿੰਕ ਕਾਪੀ ਕਰੋ';

  @override
  String get inviteShareLink => 'ਲਿੰਕ ਸਾਂਝਾ ਕਰੋ';

  @override
  String get inviteShowFullLink => 'ਪੂਰਾ ਲਿੰਕ';

  @override
  String get inviteCopyFullLink => 'ਪੂਰਾ ਲਿੰਕ ਕਾਪੀ ਕਰੋ';

  @override
  String get inviteLinkCopied => 'ਲਿੰਕ ਕਾਪੀ ਕੀਤਾ ਗਿਆ';

  @override
  String get inviteLongPressHint => 'ਲਿੰਕ ਕਾਰਵਾਈਆਂ ਲਈ ਲੰਬੇ ਸਮੇਂ ਤੱਕ ਦਬਾਓ';

  @override
  String get inviteSendInChat => 'ResilNet ਚੈਟ ਵਿੱਚ ਭੇਜੋ...';

  @override
  String get inviteSendInChatHint =>
      'ਸਿਰਫ਼ ਉਹਨਾਂ ਲੋਕਾਂ ਲਈ ਜੋ ਤੁਹਾਡੇ ਕੋਲ ਪਹਿਲਾਂ ਹੀ ਜਨਤਕ ਕੁੰਜੀ ਹੈ';

  @override
  String get inviteSendInChatEmpty =>
      'ਅਜੇ ਤੱਕ ਕੋਈ ਸੁਨੇਹਾ ਦੇਣ ਯੋਗ ਗੱਲਬਾਤ ਨਹੀਂ ਹੈ।\nਇੱਕ QR ਸਕੈਨ ਕਰੋ, ਖੇਤਰ/ਜਾਲ ਖੋਲ੍ਹੋ, ਜਾਂ ਪਹਿਲਾਂ ਐਪ ਤੋਂ ਬਾਹਰ ਲਿੰਕ ਸਾਂਝਾ ਕਰੋ।';

  @override
  String get inviteSentToChat => 'ਗੱਲਬਾਤ ਵਿੱਚ ਸੱਦਾ ਭੇਜਿਆ ਗਿਆ';

  @override
  String get infoTabInfo => 'ਜਾਣਕਾਰੀ';

  @override
  String get infoTabSettingsHint =>
      'ਭਾਸ਼ਾ, E2EE, ਅਤੇ ਡਾਟਾ ਟੂਲਸ ਲਈ ਮੀਨੂ ਤੋਂ ਸੈਟਿੰਗਾਂ ਖੋਲ੍ਹੋ';

  @override
  String get infoHowToTitle => 'ਕਿਵੇਂ ਵਰਤਣਾ ਹੈ';

  @override
  String get infoHowToBody =>
      '• ਚੈਟ / #mesh / ਖੇਤਰ ਨੂੰ ਬਦਲਣ ਲਈ ਚੈਨਲ ਆਈਕਨ \'ਤੇ ਟੈਪ ਕਰੋ\n• ਜਿਓਹਸ਼ ਆਕਾਰ ਚੁਣਨ ਲਈ ਥਾਂ \'ਤੇ ਟੈਪ ਕਰੋ\n• ਮੈਂਬਰਾਂ ਜਾਂ ਔਨਲਾਈਨ ਹੋਣ ਵਾਲੇ ਲੋਕਾਂ ਲਈ ਟੈਪ ਕਰੋ\n• ਵਿਅਕਤੀਗਤ ਤੌਰ \'ਤੇ ਕੁੰਜੀਆਂ ਦਾ ਆਦਾਨ-ਪ੍ਰਦਾਨ ਕਰਨ ਲਈ ⋮ ਤੋਂ ਪਛਾਣ/QR ਖੋਲ੍ਹੋ\n• ਖੇਤਰ \"ਜਨਤਕ\" ਹਰੇਕ ਔਨਲਾਈਨ ਪੀਅਰ ਨੂੰ ਸੀਲਬੰਦ E2EE ਭੇਜਦਾ ਹੈ - ਇੱਕ ਪਲੇਨ ਟੈਕਸਟ ਰੂਮ ਨੂੰ ਨਹੀਂ';

  @override
  String get infoFeaturesTitle => 'ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ';

  @override
  String get infoFeatureOffline => 'ਬਲੂਟੁੱਥ ਲੋ ਐਨਰਜੀ ਰਾਹੀਂ ਔਫਲਾਈਨ ਮੈਸੇਜਿੰਗ';

  @override
  String get infoFeatureE2ee =>
      'RSA-OAEP + AES-GCM ਦੇ ਨਾਲ ਐਂਡ-ਟੂ-ਐਂਡ ਏਨਕ੍ਰਿਪਸ਼ਨ (ਸ਼ੋਰ ਨਹੀਂ)';

  @override
  String get infoFeatureMultihop =>
      'ਸੁਨੇਹੇ ਦੂਰ ਜਾਣ ਲਈ ਨੇੜਲੇ ਸਾਥੀਆਂ ਦੁਆਰਾ ਭੇਜ ਸਕਦੇ ਹਨ';

  @override
  String get infoFeatureBridge =>
      'ਸੀਲਬੰਦ ਲਿਫ਼ਾਫ਼ਿਆਂ ਲਈ ਹਾਈਬ੍ਰਿਡ ਜਾਲ ↔ ਇੰਟਰਨੈਟ (Nostr)';

  @override
  String get infoFeatureGeo => 'ਨੇੜਲੇ ਲੋਕਾਂ ਲਈ ਸਥਾਨਕ ਜਿਓਹਸ਼ ਚੈਨਲ (ਡਿਸਕਵਰੀ UX)';

  @override
  String get infoFeatureNotices => '#mesh ਅਤੇ ਖੇਤਰ ਲਈ ਮਿਆਦ ਪੁੱਗਣ ਵਾਲੇ ਨੋਟਿਸ';

  @override
  String get infoPrivacyTitle => 'ਗੋਪਨੀਯਤਾ';

  @override
  String get infoPrivacyNoRoom =>
      'ਤਾਰ \'ਤੇ ਕੋਈ ਸਾਦਾ ਲਿਖਤ ਪਿੰਡ/ਜਨਤਕ ਚੈਟ ਰੂਮ ਨਹੀਂ';

  @override
  String get infoPrivacyFanout =>
      'ਖੇਤਰ ਭੇਜੋ = ਸੀਲਬੰਦ 1:1 ਜਾਣੀਆਂ ਜਨਤਕ ਕੁੰਜੀਆਂ ਵਾਲੇ ਸਾਥੀਆਂ ਨੂੰ ਫੈਨ-ਆਊਟ';

  @override
  String get infoPrivacyPresence =>
      'ਇੰਟਰਨੈੱਟ ਖੇਤਰ ਦੀ ਮੌਜੂਦਗੀ ਥੋੜ੍ਹੇ ਸਮੇਂ ਲਈ Nostr ਕੁੰਜੀਆਂ ਦੀ ਵਰਤੋਂ ਕਰਦੀ ਹੈ';

  @override
  String get infoSymbolsTitle => 'ਚਿੰਨ੍ਹ';

  @override
  String get infoSymBle => 'ਸਿੱਧਾ ਬਲੂਟੁੱਥ ਲਿੰਕ';

  @override
  String get infoSymMesh => 'ਜਾਲ ਰਾਹੀਂ ਪਹੁੰਚਯੋਗ (ਹੋਰ ਅੱਗੇ)';

  @override
  String get infoSymInternet => 'ਇੰਟਰਨੈੱਟ ਰਾਹੀਂ (Nostr) — ਸੀਲਬੰਦ ਲਿਫ਼ਾਫ਼ੇ';

  @override
  String get infoSymBridge => 'ਮੈਸ਼↔ਇੰਟਰਨੈੱਟ ਬ੍ਰਿਜ ਮਾਰਗ ਰਾਹੀਂ ਪਹੁੰਚਿਆ';

  @override
  String get infoSymOffline => 'ਔਫਲਾਈਨ — ਇਸ ਸਮੇਂ ਪਹੁੰਚਯੋਗ ਨਹੀਂ ਹੈ';

  @override
  String get infoSymInArea => 'ਇਸ ਟਿਕਾਣਾ ਚੈਨਲ ਦੇ ਖੇਤਰ ਵਿੱਚ';

  @override
  String get infoSymE2eeOk => 'ਐਂਡ-ਟੂ-ਐਂਡ ਐਨਕ੍ਰਿਪਟਡ ਸੈਸ਼ਨ';

  @override
  String get infoSymE2eeFail =>
      'ਏਨਕ੍ਰਿਪਸ਼ਨ ਉਪਲਬਧ ਨਹੀਂ ਹੈ — ਸੰਵੇਦਨਸ਼ੀਲ ਟੈਕਸਟ ਨਾ ਭੇਜੋ';

  @override
  String get infoSymVerified => 'ਪਛਾਣ ਪ੍ਰਮਾਣਿਤ/ਜਾਣਿਆ ਕੁੰਜੀ';

  @override
  String get infoSymBlocked => 'ਬਲੌਕ ਕੀਤਾ';

  @override
  String get infoSymUnread => 'ਨਾ-ਪੜ੍ਹਿਆ ਨਿੱਜੀ ਸੁਨੇਹਾ';

  @override
  String get infoEmergencyTitle => 'ਐਮਰਜੈਂਸੀ ਮੋਡ';

  @override
  String get infoEmergencyBody =>
      'ਇਸ ਡਿਵਾਈਸ \'ਤੇ ਸੁਨੇਹਿਆਂ, ਕੁੰਜੀਆਂ ਅਤੇ ਪਛਾਣ ਨੂੰ ਮਿਟਾਉਣ ਲਈ ਹੋਮ ਸਕ੍ਰੀਨ \'ਤੇ ResilNet ਸਿਰਲੇਖ ਨੂੰ ਤਿੰਨ ਵਾਰ ਟੈਪ ਕਰੋ।';

  @override
  String get infoLegendNote =>
      'ਕੁਝ ਪਾਥ ਆਈਕਨ ਸਪਸ਼ਟਤਾ ਲਈ ਇੱਥੇ ਦਸਤਾਵੇਜ਼ ਹਨ; ਚੈਟ ਵਿੱਚ ਡਿਲੀਵਰੀ ਟਿੱਕ ਪ੍ਰਾਇਮਰੀ ਭੇਜਣ ਦੀ ਸਥਿਤੀ ਬਣੇ ਰਹਿੰਦੇ ਹਨ।';

  @override
  String get dangerZoneTitle => 'ਖ਼ਤਰਾ ਜ਼ੋਨ';

  @override
  String get dangerZoneSubtitle =>
      'ਇਸ ਡਿਵਾਈਸ ਤੋਂ ਸੁਨੇਹਿਆਂ, ਏਨਕ੍ਰਿਪਸ਼ਨ ਕੁੰਜੀਆਂ, Nostr ਪਛਾਣ, ਸਾਥੀਆਂ ਅਤੇ ਉਪਨਾਮਾਂ ਨੂੰ ਮਿਟਾਉਂਦਾ ਹੈ। ਤੁਸੀਂ ਦੁਬਾਰਾ ਸੈੱਟਅੱਪ ਕਰੋਗੇ।';

  @override
  String get panicWipeTitle => 'ਸੰਕਟਕਾਲੀਨ ਪੂੰਝ';

  @override
  String get panicWipeSubtitle =>
      'ਸਥਾਨਕ ਹਰ ਚੀਜ਼ ਨੂੰ ਮਿਟਾਓ — ਘਰ ਦੇ ਸਿਰਲੇਖ ਨੂੰ ਟ੍ਰਿਪਲ-ਟੈਪ ਕਰਨ ਦੇ ਸਮਾਨ (ਡਬਲ-ਟੈਪ ਰੇਡੀਓ ਨੂੰ ਤਾਜ਼ਾ ਕਰਦਾ ਹੈ)';

  @override
  String get panicWipeConfirmTitle => 'ਕੀ ਸਾਰਾ ਸਥਾਨਕ ਡਾਟਾ ਮਿਟਾਉਣਾ ਹੈ?';

  @override
  String get panicWipeConfirmBody =>
      'ਇਹ ਇਸ ਫ਼ੋਨ \'ਤੇ ਚੈਟਾਂ, ਕੁੰਜੀਆਂ ਅਤੇ ਪਛਾਣ ਨੂੰ ਸਥਾਈ ਤੌਰ \'ਤੇ ਮਿਟਾ ਦਿੰਦਾ ਹੈ।\nਸਾਥੀਆਂ ਨੂੰ ਤੁਹਾਡੀ ਨਵੀਂ ਪਛਾਣ ਨਾਲ QR ਕੁੰਜੀਆਂ ਦਾ ਮੁੜ-ਵਟਾਂਦਰਾ ਕਰਨਾ ਚਾਹੀਦਾ ਹੈ।\nਇਸਨੂੰ ਅਣਕੀਤਾ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ।';

  @override
  String get panicWipeAction => 'ਸਭ ਕੁਝ ਪੂੰਝੋ';

  @override
  String get panicWipeSnack => 'ਸਥਾਨਕ ਪਛਾਣ ਮਿਟ ਗਈ — ਦੁਬਾਰਾ ਸੈੱਟਅੱਪ ਕਰੋ';

  @override
  String panicWipeFailed(String error) {
    return 'ਮਿਟਾਉਣਾ ਅਸਫਲ ਰਿਹਾ: $error';
  }

  @override
  String get meshBridgeTitle => 'ਜਾਲ ਪੁਲ';

  @override
  String get meshBridgeSubtitle =>
      'ਚਾਲੂ ਹੋਣ \'ਤੇ (ਡਿਫੌਲਟ), ਸੀਲਬੰਦ ਲਿਫ਼ਾਫ਼ੇ BLE ਜਾਲ ਅਤੇ ਇੰਟਰਨੈੱਟ (Nostr) ਦੋਵਾਂ ਦੀ ਵਰਤੋਂ ਕਰ ਸਕਦੇ ਹਨ ਤਾਂ ਜੋ ਨੇੜਲੇ ਜਾਲ ਟਾਪੂ ਜੁੜ ਸਕਣ। ਬੰਦ ਹੋਣ \'ਤੇ, ਭੇਜਦਾ ਹੈ ਸਿਰਫ਼ ਇੱਕ ਮਾਰਗ ਦੀ ਵਰਤੋਂ ਕਰਦਾ ਹੈ — ਕਦੇ ਵੀ ਤਾਰ \'ਤੇ ਪਲੇਨਟੈਕਸਟ ਨਹੀਂ ਰੱਖਦਾ।';

  @override
  String get favoritesTitle => 'ਮਨਪਸੰਦ';

  @override
  String get favoritesAdd => 'ਮਨਪਸੰਦ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get favoritesRemove => 'ਮਨਪਸੰਦ ਵਿੱਚੋਂ ਹਟਾਓ';

  @override
  String get favoritesEmpty =>
      'ਅਜੇ ਤੱਕ ਕੋਈ ਮਨਪਸੰਦ ਨਹੀਂ - ਮੈਂਬਰ ਸੂਚੀ ਵਿੱਚੋਂ ਇੱਕ ਪੀਅਰ ਨੂੰ ਸਟਾਰ ਕਰੋ';

  @override
  String get favoritesNearbyTitle => 'ਨਜ਼ਦੀਕੀ ਪਸੰਦੀਦਾ';

  @override
  String favoritesNearbyBody(String name) {
    return '$name ਜਾਲ ਦੇ ਨੇੜੇ ਹੈ';
  }

  @override
  String get favoritesInAreaTitle => 'ਖੇਤਰ ਵਿੱਚ ਪਸੰਦੀਦਾ';

  @override
  String favoritesInAreaBody(String name) {
    return '$name ਇਸ ਖੇਤਰ ਵਿੱਚ ਔਨਲਾਈਨ ਹੈ';
  }

  @override
  String get topologyTitle => 'ਜਾਲ ਟੌਪੋਲੋਜੀ';

  @override
  String get topologySubtitle =>
      'ਜਾਲ ਘੋਸ਼ਣਾ ਤੋਂ ਸਾਥੀ ਅਤੇ ਕੁਨੈਕਸ਼ਨ ਸੰਕੇਤ (ਸਿਰਫ਼ ਪੜ੍ਹਨ ਲਈ)';

  @override
  String get topologyConnectedNow => 'ਹੁਣ ਕਨੈਕਟ ਕੀਤਾ ਗਿਆ (BLE)';

  @override
  String get topologyNearby => 'ਨੇੜੇ (BLE)';

  @override
  String get topologyKnown => 'ਜਾਣੇ-ਪਛਾਣੇ ਸਾਥੀ';

  @override
  String get topologyEmpty =>
      'ਅਜੇ ਤੱਕ ਕੋਈ ਸਾਥੀ ਨਹੀਂ ਸਿੱਖਿਆ — BLE ਚਾਲੂ ਨਾਲ ਨੇੜੇ ਰਹੋ';

  @override
  String get topologyYou => 'ਤੁਸੀਂ';

  @override
  String topologyStats(int peers, int links) {
    return '$peers ਸਾਥੀ · $links ਲਿੰਕ';
  }

  @override
  String get topologyGraphHint =>
      'ਨੇੜਲੇ ਜਾਲ ਖੋਜ ਤੋਂ ਅਨੁਮਾਨਿਤ — ਤੁਹਾਡੀ ਡਿਵਾਈਸ ਉਜਾਗਰ ਕੀਤੀ ਗਈ ਹੈ। ਚੈਟ ਖੋਲ੍ਹਣ ਲਈ ਕਿਸੇ ਪੀਅਰ \'ਤੇ ਟੈਪ ਕਰੋ।';

  @override
  String get topologyOpen => 'ਜਾਲ ਟੌਪੋਲੋਜੀ';

  @override
  String get slashHelpTitle => 'ਹੁਕਮ';

  @override
  String get slashHelpBody =>
      '/help — ਇਹ ਸੂਚੀ\n/who — ਮੌਜੂਦਾ ਚੈਨਲ ਵਿੱਚ ਲੋਕ ਆਨਲਾਈਨ\n/ਡ੍ਰੌਪ <text> — ਇੱਥੇ ਇੱਕ ਸੀਲਬੰਦ ਨੋਟਿਸ ਪਿੰਨ ਕਰੋ (E2EE ਫੈਨ-ਆਊਟ)\n\nਪੂਰੀ ਗਾਈਡ: ਹੇਠਾਂ ਖੋਲ੍ਹੋ ਗਾਈਡ, ਜਾਂ ਸੈਟਿੰਗਾਂ → ਉਪਭੋਗਤਾ ਗਾਈਡ ਦੀ ਵਰਤੋਂ ਕਰੋ।';

  @override
  String get slashWhoEmpty => 'ਇਸ ਸਮੇਂ ਇਸ ਚੈਨਲ ਵਿੱਚ ਕੋਈ ਵੀ ਔਨਲਾਈਨ ਨਹੀਂ ਹੈ';

  @override
  String slashWhoTitle(int count) {
    return 'ਔਨਲਾਈਨ ($count)';
  }

  @override
  String get slashDropNeedText => 'ਵਰਤੋਂ: / ਆਪਣੇ ਨੋਟ ਟੈਕਸਟ ਨੂੰ ਛੱਡੋ';

  @override
  String slashDropDone(String channel) {
    return '$channel \'ਤੇ ਨੋਟਿਸ ਛੱਡਿਆ ਗਿਆ';
  }

  @override
  String get slashUnknown => 'ਅਣਜਾਣ ਕਮਾਂਡ — ਕੋਸ਼ਿਸ਼ ਕਰੋ/help';

  @override
  String get announceOpen => 'ਘੋਸ਼ਣਾਵਾਂ';

  @override
  String get announceTitle => 'ਘੋਸ਼ਣਾਵਾਂ';

  @override
  String get announceEmpty =>
      'ਅਜੇ ਤੱਕ ਕੋਈ ਬੋਰਡ ਨਹੀਂ - ਲੌਕ ਕੀਤੇ ਜਾਂ ਖੁੱਲ੍ਹੇ ਨੋਟਿਸਾਂ ਨੂੰ ਪੋਸਟ ਕਰਨ ਲਈ ਇੱਕ ਬਣਾਓ';

  @override
  String get announceCreate => 'ਬੋਰਡ ਬਣਾਓ';

  @override
  String get announceCreateHint => 'ਬੋਰਡ ਦਾ ਨਾਮ';

  @override
  String get announceDefaultTitle => 'ਕਮਿਊਨਿਟੀ ਬੋਰਡ';

  @override
  String get announceSettings => 'ਬੋਰਡ ਸੈਟਿੰਗ';

  @override
  String get announceAllowLocked => 'ਲੌਕ ਕੀਤੀਆਂ (ਇਨਕ੍ਰਿਪਟਡ) ਪੋਸਟਾਂ ਦੀ ਆਗਿਆ ਦਿਓ';

  @override
  String get announceAllowLockedSub =>
      'ਬੋਰਡ ਕੁੰਜੀ ਲਈ ਏਨਕ੍ਰਿਪਟਡ — ਪਾਠਕਾਂ ਨੂੰ ਪਹੁੰਚ ਦੀ ਲੋੜ ਹੈ';

  @override
  String get announceAllowOpen => 'ਖੁੱਲ੍ਹੀਆਂ (ਸਾਦਾ ਲਿਖਤ) ਪੋਸਟਾਂ ਦੀ ਇਜਾਜ਼ਤ ਦਿਓ';

  @override
  String get announceAllowOpenSub =>
      'E2EE ਨਹੀਂ — ਜਾਲ/ਰੀਲੇ \'ਤੇ ਪੜ੍ਹਨਯੋਗ। ਮੂਲ ਰੂਪ ਵਿੱਚ ਬੰਦ।';

  @override
  String get announceComposeHint => 'ਇੱਕ ਘੋਸ਼ਣਾ ਲਿਖੋ...';

  @override
  String get announceMediaInternetOnly =>
      'ਫੋਟੋ/ਆਵਾਜ਼ ਘੋਸ਼ਣਾਵਾਂ ਇੰਟਰਨੈੱਟ \'ਤੇ ਭੇਜੀਆਂ ਜਾਂਦੀਆਂ ਹਨ (BLE ਨਹੀਂ)';

  @override
  String get announceNeedInternet =>
      'ਫੋਟੋ ਜਾਂ ਵੌਇਸ ਘੋਸ਼ਣਾਵਾਂ ਭੇਜਣ ਲਈ ਇੰਟਰਨੈਟ ਨਾਲ ਕਨੈਕਟ ਕਰੋ';

  @override
  String announceVoiceFailed(String error) {
    return 'ਅਵਾਜ਼ ਰਿਕਾਰਡ ਨਹੀਂ ਕੀਤੀ ਜਾ ਸਕੀ: $error';
  }

  @override
  String get announceImageTooLarge => 'ਚਿੱਤਰ ਬਹੁਤ ਵੱਡਾ ਹੈ (ਅਧਿਕਤਮ ~180 KB)';

  @override
  String get announcePlayVoice => 'ਵੌਇਸ ਨੋਟ ਚਲਾਓ';

  @override
  String get announceImageLabel => '📷 ਚਿੱਤਰ';

  @override
  String get announceAudioLabel => '🎤 ਵੌਇਸ ਨੋਟ';

  @override
  String get announceModeLocked => 'ਤਾਲਾਬੰਦ';

  @override
  String get announceModeOpen => 'ਖੋਲ੍ਹੋ';

  @override
  String get announceOpenBadge => 'OPEN · ਇਨਕ੍ਰਿਪਟਡ ਨਹੀਂ';

  @override
  String get announceLockedBadge => 'ਤਾਲਾਬੰਦ';

  @override
  String get announceLockedPlaceholder =>
      'ਐਨਕ੍ਰਿਪਟਡ — ਪੜ੍ਹਨ ਲਈ ਪਹੁੰਚ ਦੀ ਬੇਨਤੀ ਕਰੋ';

  @override
  String get announceRequestAccess => 'ਪਹੁੰਚ ਦੀ ਬੇਨਤੀ ਕਰੋ';

  @override
  String get announceRequestSent => 'ਬੋਰਡ ਮਾਲਕ ਨੂੰ ਪਹੁੰਚ ਦੀ ਬੇਨਤੀ ਭੇਜੀ ਗਈ';

  @override
  String get announceRequestFailed =>
      'ਪਹੁੰਚ ਲਈ ਬੇਨਤੀ ਨਹੀਂ ਕੀਤੀ ਜਾ ਸਕੀ (ਮਾਲਕ ਦੀ ਜਨਤਕ ਕੁੰਜੀ ਦੀ ਲੋੜ ਹੈ)';

  @override
  String get announceOpenConfirmTitle => 'ਐਨਕ੍ਰਿਪਸ਼ਨ ਤੋਂ ਬਿਨਾਂ ਪੋਸਟ ਕਰਨਾ ਹੈ?';

  @override
  String get announceOpenConfirmBody =>
      'ਖੁੱਲ੍ਹੀਆਂ ਪੋਸਟਾਂ E2EE ਨਹੀਂ ਹਨ। ਮਾਰਗ \'ਤੇ ਕੋਈ ਵੀ ਵਿਅਕਤੀ (ਜਾਲ / ਰੀਲੇਅ) ਇਹਨਾਂ ਨੂੰ ਪੜ੍ਹ ਸਕਦਾ ਹੈ। ਜਾਰੀ ਰੱਖਣਾ ਹੈ?';

  @override
  String get announcePostAction => 'ਪੋਸਟ';

  @override
  String get announcePendingRequests => 'ਪਹੁੰਚ ਬੇਨਤੀਆਂ';

  @override
  String get announceApprove => 'ਮਨਜ਼ੂਰ ਕਰੋ';

  @override
  String get announceDeny => 'ਇਨਕਾਰ';

  @override
  String get announceGranted =>
      'ਤੁਸੀਂ ਇਸ ਬੋਰਡ \'ਤੇ ਲੌਕ ਕੀਤੀਆਂ ਪੋਸਟਾਂ ਨੂੰ ਪੜ੍ਹ ਸਕਦੇ ਹੋ';

  @override
  String get announceOwner => 'ਤੁਸੀਂ ਇਸ ਬੋਰਡ ਦੇ ਮਾਲਕ ਹੋ';

  @override
  String get announceCopyInvite => 'ਸੱਦਾ ਲਿਖਤ ਨੂੰ ਕਾਪੀ ਕਰੋ';

  @override
  String get announceShowInviteQr => 'ਸੱਦਾ QR ਦਿਖਾਓ';

  @override
  String get announceScanInviteQr => 'ਸਕੈਨ ਬੋਰਡ ਸੱਦਾ QR';

  @override
  String get announceFollow => 'ਸੱਦੇ ਤੋਂ ਬੋਰਡ ਦੀ ਪਾਲਣਾ ਕਰੋ';

  @override
  String get announceFollowHint =>
      'ਸੱਦਾ ਲਿਖਤ ਜਾਂ ਮਾਲਕ ਵੱਲੋਂ ResilNet ਲਿੰਕ ਪੇਸਟ ਕਰੋ';

  @override
  String get announceFollowOk => 'ਬੋਰਡ ਦੀ ਪਾਲਣਾ';

  @override
  String announceFollowOkNamed(String title) {
    return 'ਹੁਣ “$title” ਦਾ ਅਨੁਸਰਣ ਕਰ ਰਹੇ ਹੋ';
  }

  @override
  String get announceFollowFail => 'ਸੱਦਾ ਅਵੈਧ ਜਾਂ ਖਰਾਬ ਹੈ';

  @override
  String get announceInviteCopied => 'ਸੱਦਾ ਲਿਖਤ ਕਾਪੀ ਕੀਤੀ ਗਈ';

  @override
  String get announceInviteSaveQr => 'QR ਸੁਰੱਖਿਅਤ ਕਰੋ';

  @override
  String get announceInviteShare => 'ਸੱਦਾ ਸਾਂਝਾ ਕਰੋ';

  @override
  String get announceFollowFromCompose => 'ਸੁਨੇਹਾ ਬਾਕਸ ਵਿੱਚ ਬੋਰਡ ਸੱਦਾ ਮਿਲਿਆ';

  @override
  String get peerConfirmAddTitle => 'ਕੀ ਨੈੱਟਵਰਕ ਮੈਂਬਰ ਸ਼ਾਮਲ ਕਰਨਾ ਹੈ?';

  @override
  String peerConfirmAddBody(String name) {
    return 'ਉਹਨਾਂ ਦੀ ਜਨਤਕ ਕੁੰਜੀ ਨਾਲ “$name” ਜੋੜੋ ਤਾਂ ਜੋ ਤੁਸੀਂ ਉਹਨਾਂ ਨੂੰ ਨਿੱਜੀ ਤੌਰ \'ਤੇ ਸੁਨੇਹਾ ਦੇ ਸਕੋ?';
  }

  @override
  String get peerConfirmAdd => 'ਮੈਂਬਰ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String peerAddedOk(String name) {
    return '$name ਨੂੰ ਨੈੱਟਵਰਕ ਮੈਂਬਰਾਂ ਵਿੱਚ ਸ਼ਾਮਲ ਕੀਤਾ ਗਿਆ';
  }

  @override
  String get peerAddFromCompose =>
      'ਸੁਨੇਹਾ ਬਾਕਸ ਵਿੱਚ ਪਛਾਣ / ਜਨਤਕ ਕੁੰਜੀ ਦਾ ਪਤਾ ਲਗਾਇਆ ਗਿਆ ਹੈ';

  @override
  String get peerHashCopied => 'ਜਨਤਕ ਕੁੰਜੀ ਹੈਸ਼ ਨੂੰ ਕਾਪੀ ਕੀਤਾ ਗਿਆ';

  @override
  String get peerHashOpenChat => 'ਚੈਟ ਖੋਲ੍ਹੋ';

  @override
  String get peerHashAddHint =>
      'ਹੈਸ਼ ਕਾਪੀ ਕੀਤਾ। ਉਹਨਾਂ ਨੂੰ ਆਪਣਾ ਪਛਾਣ ਲਿੰਕ ਜਾਂ QR ਸਾਂਝਾ ਕਰਨ ਲਈ ਕਹੋ ਤਾਂ ਜੋ ਤੁਸੀਂ E2EE ਲਈ ਪੂਰੀ ਜਨਤਕ ਕੁੰਜੀ ਜੋੜ ਸਕੋ।';

  @override
  String get peerQrNoCode => 'ਇਸ ਚਿੱਤਰ ਵਿੱਚ ਕੋਈ ResilNet QR ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet ਪਛਾਣ: “$name”\nਲਿੰਕ ਖੋਲ੍ਹੋ ਜਾਂ ਇਸਨੂੰ ਚੈਟ ਵਿੱਚ ਪੇਸਟ ਕਰੋ → ਮੈਂਬਰ ਸ਼ਾਮਲ ਕਰੋ\nਜਾਂ ਪਛਾਣ QR ਨੂੰ ਸਕੈਨ ਕਰੋ।';
  }

  @override
  String get identityShareInvite => 'ਪਛਾਣ ਲਿੰਕ ਸਾਂਝਾ ਕਰੋ';

  @override
  String get identityInviteCopied => 'ਪਛਾਣ ਲਿੰਕ ਕਾਪੀ ਕੀਤਾ ਗਿਆ';

  @override
  String announceInviteSharePreamble(String title) {
    return 'ਬੋਰਡ ਸੱਦਾ: “$title”\nResilNet → ਕਮਿਊਨਿਟੀ ਬੋਰਡ ਖੋਲ੍ਹੋ → ਸੱਦੇ ਤੋਂ ਅਨੁਸਰਣ ਕਰੋ\nਜਾਂ QR ਸਕੈਨ ਕਰੋ / ਹੇਠਾਂ ਦਿੱਤੇ ਲਿੰਕ \'ਤੇ ਟੈਪ ਕਰੋ।';
  }

  @override
  String get announceConfirmFollowTitle => 'ਕੀ ਇਸ ਬੋਰਡ ਦੀ ਪਾਲਣਾ ਕਰਨੀ ਹੈ?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'ਕੀ ਇਸ ਸੱਦੇ ਤੋਂ “$title” ਦਾ ਅਨੁਸਰਣ ਕਰਨਾ ਹੈ?';
  }

  @override
  String get announceConfirmFollow => 'ਦਾ ਪਾਲਣ ਕਰੋ';
}

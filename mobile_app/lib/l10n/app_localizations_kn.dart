// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'ರಿಫ್ರೆಶ್ ಮಾಡಲಾಗುತ್ತಿದೆ ResilNet...';

  @override
  String get appRefreshed =>
      'ರಿಫ್ರೆಶ್ ಮಾಡಲಾಗಿದೆ - ರೇಡಿಯೋಗಳು ಮತ್ತು ಅನ್ವೇಷಣೆಯನ್ನು ಮರುಪ್ರಾರಂಭಿಸಲಾಗಿದೆ';

  @override
  String appRefreshFailed(String error) {
    return 'ರಿಫ್ರೆಶ್ ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'ಡಬಲ್-ಟ್ಯಾಪ್ = ಮೃದುವಾದ ರಿಫ್ರೆಶ್. ಲಾಂಗ್-ಪ್ರೆಸ್ = ಹಾರ್ಡ್ ಚೇತರಿಸಿಕೊಳ್ಳಲು. ಟ್ರಿಪಲ್-ಟ್ಯಾಪ್ = ತುರ್ತು ಒರೆಸುವಿಕೆ.';

  @override
  String get softRefreshTipTitle => 'ResilNet ಅಂಟಿಕೊಂಡಿದೆ ಎಂದು ಭಾವಿಸಿದರೆ';

  @override
  String get softRefreshTipBody =>
      'ಮೃದುವಾದ ರೇಡಿಯೊ ರಿಫ್ರೆಶ್‌ಗಾಗಿ ResilNet (ಮೇಲಿನ-ಎಡ) ಡಬಲ್-ಟ್ಯಾಪ್ ಮಾಡಿ. ಇನ್ನೂ ಅಂಟಿಕೊಂಡಿದ್ದರೆ: ಶೀರ್ಷಿಕೆಯನ್ನು ದೀರ್ಘವಾಗಿ ಒತ್ತಿರಿ, ⋮ → ಹಾರ್ಡ್ ರಿಕವರಿ ಅಥವಾ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಬಳಸಿ. ಟ್ರಿಪಲ್-ಟ್ಯಾಪ್ ತುರ್ತು ವೈಪ್ ಮಾತ್ರ.';

  @override
  String get softRefreshTipGotIt => 'ಅರ್ಥವಾಯಿತು';

  @override
  String get infoSoftRefreshTitle => 'ಅಪ್ಲಿಕೇಶನ್ ಸಿಲುಕಿಕೊಂಡಿದೆ ಎಂದು ಭಾವಿಸಿದರೆ';

  @override
  String get infoSoftRefreshStepRefresh =>
      'ಡಬಲ್-ಟ್ಯಾಪ್ ResilNet (ಮೇಲಿನ-ಎಡ) → ಸಾಫ್ಟ್ ರಿಫ್ರೆಶ್ ರೇಡಿಯೋಗಳು ಮತ್ತು ಹತ್ತಿರದ ಜನರನ್ನು';

  @override
  String get infoSoftRefreshStepHard =>
      'ಇನ್ನೂ ಅಂಟಿಕೊಂಡಿದೆಯೇ? ಲಾಂಗ್-ಪ್ರೆಸ್ ಶೀರ್ಷಿಕೆ, ಅಥವಾ ⋮ / ಸೆಟ್ಟಿಂಗ್‌ಗಳು → ಹಾರ್ಡ್ ರಿಕವರಿ';

  @override
  String get infoSoftRefreshStepWait =>
      'ಫಲಿತಾಂಶ ಸ್ನ್ಯಾಕ್‌ಬಾರ್‌ಗಾಗಿ ನಿರೀಕ್ಷಿಸಿ, ನಂತರ ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ. ಸೆಷನ್ ರೀಸೆಟ್ ನಿಮ್ಮ ಕೀಗಳನ್ನು ಇರಿಸುತ್ತದೆ.';

  @override
  String get infoSoftRefreshStepWipe =>
      'ಟ್ರಿಪಲ್-ಟ್ಯಾಪ್ = ತುರ್ತು ವೈಪ್ (ಸ್ಥಳೀಯ ಡೇಟಾವನ್ನು ಅಳಿಸುತ್ತದೆ) — ಉದ್ದೇಶಪೂರ್ವಕವಾಗಿ ಮಾತ್ರ';

  @override
  String get appRecoverySection => 'ಅಪ್ಲಿಕೇಶನ್ ಮರುಪಡೆಯುವಿಕೆ';

  @override
  String get appRecoverySectionSubtitle =>
      'ಅಪ್ಲಿಕೇಶನ್ ಫ್ರೀಜ್ ಆಗಿರುವಾಗ ಬಳಸಿ. ಮೃದು = ಶೀರ್ಷಿಕೆ ಡಬಲ್-ಟ್ಯಾಪ್. ಹಾರ್ಡ್ ಚೇತರಿಕೆ ಬಲವಾಗಿರುತ್ತದೆ. ಸೆಷನ್ ರೀಸೆಟ್ ಕೀಗಳನ್ನು ಒರೆಸದೆ ಸೇವೆಗಳನ್ನು ಮರುಪ್ರಾರಂಭಿಸುತ್ತದೆ.';

  @override
  String get appHardRecoverAction => 'ಚೇತರಿಸಿಕೊಳ್ಳುವುದು ಕಷ್ಟ';

  @override
  String get appHardRecovering => 'ಚೇತರಿಸಿಕೊಳ್ಳುವುದು ಕಷ್ಟ...';

  @override
  String get appSessionResetAction => 'ಸೆಶನ್ ಅನ್ನು ಮರುಹೊಂದಿಸಿ';

  @override
  String get appSessionResetRunning => 'ಸೆಶನ್ ಅನ್ನು ಮರುಹೊಂದಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get appSessionResetConfirmTitle => 'ಸೆಶನ್ ಅನ್ನು ಮರುಹೊಂದಿಸುವುದೇ?';

  @override
  String get appSessionResetConfirmBody =>
      'ಈ ಸಾಧನದಲ್ಲಿ ResilNet ಸೇವೆಗಳನ್ನು ಮರುಪ್ರಾರಂಭಿಸುತ್ತದೆ. ನಿಮ್ಮ ಗುರುತಿನ ಕೀಗಳನ್ನು ಇರಿಸಲಾಗಿದೆ.';

  @override
  String get appRecoveryBusy => 'ಚೇತರಿಕೆ ಈಗಾಗಲೇ ಚಾಲನೆಯಲ್ಲಿದೆ...';

  @override
  String get appRecoveryOk => 'ಚೇತರಿಕೆ ಮುಗಿದಿದೆ';

  @override
  String get appRecoveryPartial =>
      'ಕೆಲವು ಹಂತಗಳನ್ನು ಬಿಟ್ಟುಬಿಡುವುದರೊಂದಿಗೆ ಮರುಪಡೆಯುವಿಕೆ ಪೂರ್ಣಗೊಂಡಿದೆ - ಇನ್ನೂ ಅಂಟಿಕೊಂಡಿದ್ದರೆ ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get appRecoveryFailed =>
      'ಮರುಪಡೆಯುವಿಕೆ ವಿಫಲವಾಗಿದೆ - ಸೆಷನ್ ಮರುಹೊಂದಿಸಲು ಪ್ರಯತ್ನಿಸಿ ಅಥವಾ OS ನಿಂದ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಬಲವಂತವಾಗಿ ತ್ಯಜಿಸಿ';

  @override
  String get localWifiTitle => 'ಸ್ಥಳೀಯ Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'ಇಂಟರ್ನೆಟ್ ಇಲ್ಲದೆ ಹತ್ತಿರದ ಸಾಧನಗಳನ್ನು ಲಿಂಕ್ ಮಾಡಿ - ಒಂದು LAN ನಲ್ಲಿ ಇರುವಂತೆಯೇ.';

  @override
  String get localWifiNotGatewayHint =>
      'ESP32 LoRa ಗೇಟ್‌ವೇ SoftAP ಅಲ್ಲ. ಇದು ಫೋನ್↔ಫೋನ್ / LAN ಮಾತ್ರ.';

  @override
  String get localWifiUnavailable =>
      'ಸ್ಥಳೀಯ Wi‑Fi ಇನ್ನೂ ಸಿದ್ಧವಾಗಿಲ್ಲ - ಅಪ್ಲಿಕೇಶನ್ ಪ್ರಾರಂಭಕ್ಕಾಗಿ ನಿರೀಕ್ಷಿಸಿ.';

  @override
  String get lxmfBridgeTitle => 'ಹೋಮ್ ನೋಡ್';

  @override
  String get lxmfBridgeSubtitle =>
      'ನಿಮ್ಮ Wi‑Fi ನಲ್ಲಿ ಐಚ್ಛಿಕ Mac ಅಥವಾ Pi ಮೊಹರು ಮಾಡಿದ ಚಾಟ್‌ಗಳನ್ನು ಪ್ರಸಾರ ಮಾಡುತ್ತದೆ. ಡೀಫಾಲ್ಟ್ ಆಗಿ ಆಫ್. ಎಂಡ್-ಟು-ಎಂಡ್ ಎನ್‌ಕ್ರಿಪ್ಶನ್ ಅನ್ನು ಬದಲಾಯಿಸುವುದಿಲ್ಲ.';

  @override
  String get lxmfBridgeEnable => 'ಹೋಮ್ ನೋಡ್ ಬಳಸಿ';

  @override
  String get lxmfBridgeDisabledHint =>
      'ಈ ನೆಟ್‌ವರ್ಕ್‌ನಲ್ಲಿ Mac ಅಥವಾ Pi ನಲ್ಲಿ ಸೇತುವೆಯ ಅಪ್ಲಿಕೇಶನ್ ಚಾಲನೆಯಲ್ಲಿರುವಾಗ ಮಾತ್ರ ಆನ್ ಮಾಡಿ.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'ಆನ್‌ಲೈನ್ - $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'ಹೋಮ್ ನೋಡ್ ಅನ್ನು ತಲುಪಲು ಸಾಧ್ಯವಿಲ್ಲ - $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'ಮುಖಪುಟ ನೋಡ್ ವಿಳಾಸ';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP ಅಥವಾ http://IP:port — ಉದಾಹರಣೆ 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'ಪೀರ್ → LXMF dest (JSON)';

  @override
  String get lxmfBridgeRefresh => 'ಸ್ಥಿತಿಯನ್ನು ಉಳಿಸಿ ಮತ್ತು ರಿಫ್ರೆಶ್ ಮಾಡಿ';

  @override
  String get lxmfBridgeLabHint => 'ಸುಧಾರಿತ: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'ಹೋಮ್ ನೋಡ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get lxmfBridgeCheckConnection => 'ಸಂಪರ್ಕವನ್ನು ಪರಿಶೀಲಿಸಿ';

  @override
  String get lxmfBridgeStatusOnline => 'ಹೋಮ್ ನೋಡ್‌ಗೆ ಸಂಪರ್ಕಿಸಲಾಗಿದೆ';

  @override
  String get lxmfBridgeStatusOffline => 'ಹೋಮ್ ನೋಡ್ ತಲುಪಲು ಸಾಧ್ಯವಿಲ್ಲ';

  @override
  String get lxmfBridgeYourDest => 'ಈ ನೋಡ್‌ನ ವಿಳಾಸ (ಸ್ನೇಹಿತರೊಂದಿಗೆ ಹಂಚಿಕೊಳ್ಳಿ)';

  @override
  String get lxmfBridgeCopyDest => 'ವಿಳಾಸವನ್ನು ನಕಲಿಸಿ';

  @override
  String get lxmfBridgeDestCopied => 'ವಿಳಾಸವನ್ನು ನಕಲಿಸಲಾಗಿದೆ';

  @override
  String get lxmfBridgeLinkedPeers => 'ಲಿಂಕ್ ಮಾಡಿದ ಸ್ನೇಹಿತರು';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'ಪ್ರತಿಯೊಬ್ಬ ಸ್ನೇಹಿತರಿಗೆ ಒಮ್ಮೆ ಅವರ ಮನೆ-ನೋಡ್ ವಿಳಾಸ ಬೇಕಾಗುತ್ತದೆ. ನಂತರ ಮೊಹರು ಮಾಡಿದ ಚಾಟ್‌ಗಳು ಈ ಮಾರ್ಗವನ್ನು ಬಳಸಬಹುದು.';

  @override
  String get lxmfBridgeNoLinks => 'ಯಾವುದೇ ಸ್ನೇಹಿತರನ್ನು ಇನ್ನೂ ಲಿಂಕ್ ಮಾಡಿಲ್ಲ.';

  @override
  String get lxmfBridgeAddLink => 'ಸ್ನೇಹಿತನನ್ನು ಲಿಂಕ್ ಮಾಡಿ';

  @override
  String get lxmfBridgePickPeer => 'ಸ್ನೇಹಿತ';

  @override
  String get lxmfBridgePeerDest => 'ಅವರ ಮನೆ-ನೋಡ್ ವಿಳಾಸ';

  @override
  String get lxmfBridgePeerDestHint => 'ಅವರ ಹೋಮ್ ನೋಡ್ ಪರದೆಯಿಂದ 32-ಅಕ್ಷರಗಳ ಕೋಡ್';

  @override
  String get lxmfBridgeInvalidDest =>
      'ಆ ವಿಳಾಸ ಮಾನ್ಯವಾಗಿ ಕಾಣುತ್ತಿಲ್ಲ. ಅವರ ಹೋಮ್ ನೋಡ್‌ನಿಂದ ಪೂರ್ಣ ಕೋಡ್ ಅನ್ನು ಅಂಟಿಸಿ.';

  @override
  String get lxmfBridgeRemoveLink => 'ಅನ್‌ಲಿಂಕ್ ಮಾಡಿ';

  @override
  String get lxmfBridgeSaveLink => 'ಉಳಿಸಿ';

  @override
  String get lxmfBridgeLinkSaved => 'ಸ್ನೇಹಿತ ಲಿಂಕ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String get lxmfBridgeNoPeers =>
      'ಇನ್ನೂ ಯಾವುದೇ ಸಂದೇಶ ಮಾಡಬಹುದಾದ ಸಂಪರ್ಕಗಳಿಲ್ಲ - ಮೊದಲು ಸ್ನೇಹಿತರನ್ನು ಸೇರಿಸಿ.';

  @override
  String get lxmfBridgeHelp =>
      'Mac/Pi ನಲ್ಲಿ ಸೇತುವೆಯನ್ನು ಚಾಲನೆಯಲ್ಲಿಡಿ. ಈ ಮಾರ್ಗವು ನಿಮ್ಮ LAN ನಲ್ಲಿ ಉಳಿಯುತ್ತದೆ - ಇದು LoRa ಅಲ್ಲ ಮತ್ತು ಇಂಟರ್ನೆಟ್ ಅಥವಾ ಬ್ಲೂಟೂತ್ ಮೆಶ್ ಅನ್ನು ಬದಲಿಸುವುದಿಲ್ಲ.';

  @override
  String get localWifiModeHotspot => 'ಹತ್ತಿರದಲ್ಲಿದೆ';

  @override
  String get localWifiModeRouter => 'ರೂಟರ್';

  @override
  String get localWifiHotspotIntro =>
      'ಒಂದು ಸಾಧನವು ವೈಯಕ್ತಿಕ ಹಾಟ್‌ಸ್ಪಾಟ್ ಅನ್ನು ಹಂಚಿಕೊಳ್ಳುತ್ತದೆ. ಇತರರು ಆ ಹಾಟ್‌ಸ್ಪಾಟ್‌ಗೆ ಸೇರುತ್ತಾರೆ, ನಂತರ ResilNet ಅವರನ್ನು ಸ್ಥಳೀಯ ನೆಟ್‌ವರ್ಕ್‌ನಲ್ಲಿ ಹುಡುಕುತ್ತದೆ.';

  @override
  String get localWifiHostAction => 'ನೆಟ್‌ವರ್ಕ್ ರಚಿಸಿ (ಹೋಸ್ಟ್)';

  @override
  String get localWifiJoinAction => 'ನೆಟ್‌ವರ್ಕ್‌ಗೆ ಸೇರಿ';

  @override
  String get localWifiHostSteps =>
      '1. iOS/Android ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ತೆರೆಯಿರಿ ಮತ್ತು ವೈಯಕ್ತಿಕ ಹಾಟ್‌ಸ್ಪಾಟ್ (ಅಥವಾ ಇಂಟರ್ನೆಟ್ ಹಂಚಿಕೆ) ಆನ್ ಮಾಡಿ.\n2. ಸ್ನೇಹಿತರಿಗೆ ಹಾಟ್‌ಸ್ಪಾಟ್ ಹೆಸರು (ಮತ್ತು ಪಾಸ್‌ವರ್ಡ್) ತಿಳಿಸಿ.\n3. ಇಲ್ಲಿಗೆ ಹಿಂತಿರುಗಿ ಮತ್ತು \"ಹಾಟ್‌ಸ್ಪಾಟ್ ಆನ್ ಆಗಿದೆ - ಕಾಯುವುದನ್ನು ಪ್ರಾರಂಭಿಸಿ\" ಟ್ಯಾಪ್ ಮಾಡಿ.';

  @override
  String get localWifiHostReady =>
      'ಹಾಟ್‌ಸ್ಪಾಟ್ ಆನ್ ಆಗಿದೆ — ಕಾಯುವುದನ್ನು ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get localWifiHostWaiting => 'ಸ್ನೇಹಿತರು ಸೇರಲು ನಿರೀಕ್ಷಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get localWifiJoinSteps =>
      '1. ಸಿಸ್ಟಮ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ತೆರೆಯಿರಿ ಮತ್ತು ನಿಮ್ಮ ಸ್ನೇಹಿತರ ವೈಯಕ್ತಿಕ ಹಾಟ್‌ಸ್ಪಾಟ್‌ಗೆ ಸೇರಿಕೊಳ್ಳಿ.\n2. ಇಲ್ಲಿಗೆ ಹಿಂತಿರುಗಿ ಮತ್ತು \"ನಾನು ಸಂಪರ್ಕಗೊಂಡಿದ್ದೇನೆ - ಹುಡುಕಾಟ\" ಟ್ಯಾಪ್ ಮಾಡಿ.';

  @override
  String get localWifiJoinReady => 'ನಾನು ಸಂಪರ್ಕಗೊಂಡಿದ್ದೇನೆ - ಹುಡುಕಾಟ';

  @override
  String get localWifiRouterIntro =>
      'ಪ್ರತಿಯೊಂದು ಸಾಧನವನ್ನು ಅದೇ Wi‑Fi ರೂಟರ್/AP ಗೆ ಸಂಪರ್ಕಪಡಿಸಿ. ರೂಟರ್‌ಗೆ ಇಂಟರ್ನೆಟ್ ಅಗತ್ಯವಿಲ್ಲ - ಹಂಚಿದ ಸ್ಥಳೀಯ ನೆಟ್‌ವರ್ಕ್ ಮಾತ್ರ.';

  @override
  String get localWifiRouterSearch => 'ಈ Wi‑Fi ನಲ್ಲಿ ಹುಡುಕಿ';

  @override
  String get localWifiRefreshNetwork => 'Wi‑Fi ಮಾಹಿತಿಯನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡಿ';

  @override
  String get localWifiRouterNoWifiTitle => 'Wi‑Fi ನಲ್ಲಿ ಇಲ್ಲ';

  @override
  String get localWifiRouterNoWifiBody =>
      'ಸಿಸ್ಟಂ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ರೂಟರ್‌ನ Wi‑Fi ಗೆ ಸೇರಿ, ನಂತರ ಮತ್ತೆ ಹುಡುಕಿ.';

  @override
  String get localWifiDiscovering => 'ಸ್ಥಳೀಯ Wi‑Fi ನಲ್ಲಿ ಹುಡುಕಲಾಗುತ್ತಿದೆ...';

  @override
  String get localWifiPeersFound => 'ಈ ನೆಟ್‌ವರ್ಕ್‌ನಲ್ಲಿರುವ ಸಾಧನಗಳು';

  @override
  String get localWifiStop => 'ನಿಲ್ಲಿಸು';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi ಹೆಸರು ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get localWifiStubBanner => 'LAN ಸಾಕೆಟ್‌ಗಾಗಿ ನಿರೀಕ್ಷಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get localWifiLiveBanner =>
      'LAN ಅನ್ವೇಷಣೆ ಲೈವ್ (UDP) — ಈ Wi‑Fi ನಲ್ಲಿ ಘೋಷಿಸಿ + ಮೊಹರು ಮಾಡಿದ ಚಾಟ್';

  @override
  String get localWifiEmptyHotspot =>
      'ಇನ್ನೂ ಯಾವುದೇ ಸಾಧನಗಳಿಲ್ಲ.\nಸ್ನೇಹಿತರು ನಿಮ್ಮ ಹಾಟ್‌ಸ್ಪಾಟ್‌ಗೆ ಸೇರಿದ್ದಾರೆಯೇ ಮತ್ತು ಸ್ಥಳೀಯ ನೆಟ್‌ವರ್ಕ್ ಪ್ರವೇಶವನ್ನು ಅನುಮತಿಸಿದ್ದಾರೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ.';

  @override
  String get localWifiEmptyRouter =>
      'ಇನ್ನೂ ಯಾವುದೇ ಸಾಧನಗಳಿಲ್ಲ.\nಅದೇ SSID? ಸ್ಥಳೀಯ ನೆಟ್‌ವರ್ಕ್ ಅನ್ನು ಅನುಮತಿಸಲಾಗಿದೆಯೇ? ಕೆಲವು ಮಾರ್ಗನಿರ್ದೇಶಕಗಳು ಸಾಧನದಿಂದ ಸಾಧನದ ಸಂಚಾರವನ್ನು ನಿರ್ಬಂಧಿಸುತ್ತವೆ (AP ಪ್ರತ್ಯೇಕತೆ).';

  @override
  String get localWifiIsolationHelp =>
      'ನಾವು ಒಬ್ಬರನ್ನೊಬ್ಬರು ಏಕೆ ಹುಡುಕಲು ಸಾಧ್ಯವಿಲ್ಲ?';

  @override
  String get localWifiIsolationTitle => 'ರೂಟರ್ ಗ್ರಾಹಕರನ್ನು ಪ್ರತ್ಯೇಕಿಸಬಹುದು';

  @override
  String get localWifiIsolationBody =>
      'AP/ಕ್ಲೈಂಟ್ ಪ್ರತ್ಯೇಕತೆ (ಅಥವಾ ಅತಿಥಿ ನೆಟ್‌ವರ್ಕ್) ಆನ್ ಆಗಿದ್ದರೆ, ಅದೇ Wi‑Fi ನಲ್ಲಿರುವ ಫೋನ್‌ಗಳು ಮಾತನಾಡುವುದಿಲ್ಲ. ಪ್ರತ್ಯೇಕತೆಯನ್ನು ಆಫ್ ಮಾಡಿ, ಮುಖ್ಯ SSID ಬಳಸಿ ಅಥವಾ ಹತ್ತಿರದ (ಹಾಟ್‌ಸ್ಪಾಟ್) ಮೋಡ್‌ಗೆ ಬದಲಿಸಿ.';

  @override
  String get localWifiPeerReady => 'ಚಾಟ್ ಮಾಡಲು ಸಿದ್ಧವಾಗಿದೆ (ಕೀಲಿಯನ್ನು ಹೊಂದಿದೆ)';

  @override
  String get localWifiPeerNeedKey =>
      'ಕಂಡುಬಂದಿದೆ - ಕೀಗಳನ್ನು ವಿನಿಮಯ ಮಾಡಲು QR ಅನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get localWifiErrorTitle => 'ಸ್ಥಳೀಯ Wi‑Fi ದೋಷ';

  @override
  String get localWifiErrorBody =>
      'ಏನೋ ತಪ್ಪಾಗಿದೆ. ನಿಲ್ಲಿಸಿ ಮತ್ತು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get preparingSystem => 'ವ್ಯವಸ್ಥೆಯನ್ನು ಸಿದ್ಧಪಡಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get bootFailedTitle => 'ಪ್ರಾರಂಭಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ';

  @override
  String get retry => 'ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get bootRecoveryAction =>
      'ಹೊಸ ಗುರುತನ್ನು ಪ್ರಾರಂಭಿಸಿ (ಸ್ಥಳೀಯ ಡೇಟಾವನ್ನು ಅಳಿಸಿ)';

  @override
  String get bootRecoveryConfirmTitle => 'ಹೊಸ ಗುರುತನ್ನು ಪ್ರಾರಂಭಿಸುವುದೇ?';

  @override
  String get bootRecoveryConfirmBody =>
      'ಇದು ಈ ಸಾಧನದಲ್ಲಿನ ಸ್ಥಳೀಯ ಚಾಟ್‌ಗಳು, ಕೀಗಳು ಮತ್ತು ಗುರುತನ್ನು ಶಾಶ್ವತವಾಗಿ ಅಳಿಸುತ್ತದೆ.\nಗೆಳೆಯರು ನಿಮ್ಮ ಹೊಸ ಗುರುತಿನೊಂದಿಗೆ ನಿಮ್ಮ QR ಅನ್ನು ಮತ್ತೊಮ್ಮೆ ಸ್ಕ್ಯಾನ್ ಮಾಡಬೇಕು.\nಇದನ್ನು ರದ್ದುಗೊಳಿಸಲಾಗುವುದಿಲ್ಲ.';

  @override
  String get bootRecoveryRunning => 'ಸ್ಥಳೀಯ ಗುರುತನ್ನು ಮರುಹೊಂದಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get bootRecoverySuccess => 'ಸ್ಥಳೀಯ ಗುರುತಿನ ಮರುಹೊಂದಿಕೆ ಪೂರ್ಣಗೊಂಡಿದೆ';

  @override
  String bootRecoveryFailed(String error) {
    return 'ಗುರುತನ್ನು ಮರುಹೊಂದಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String get cancel => 'ರದ್ದುಮಾಡು';

  @override
  String get save => 'ಉಳಿಸಿ';

  @override
  String get close => 'ಮುಚ್ಚಿ';

  @override
  String get start => 'ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get send => 'ಕಳುಹಿಸು';

  @override
  String get settings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get language => 'ಭಾಷೆ';

  @override
  String get languageSubtitle =>
      'ಡೀಫಾಲ್ಟ್ ಆಗಿ ಅಪ್ಲಿಕೇಶನ್ ನಿಮ್ಮ ಫೋನ್ ಭಾಷೆಯನ್ನು ಅನುಸರಿಸುತ್ತದೆ (ಬೆಂಬಲಿಸಿದಾಗ). ಇತರ ಭಾಷೆಗಳು ಇಂಗ್ಲಿಷ್‌ಗೆ ಹಿಂತಿರುಗುತ್ತವೆ. ನೀವು ಇಲ್ಲಿ ಭಾಷೆಯನ್ನು ಲಾಕ್ ಮಾಡಬಹುದು.';

  @override
  String get languageSystem => 'ಸಿಸ್ಟಮ್ ಡೀಫಾಲ್ಟ್';

  @override
  String get languageThai => 'ಥಾಯ್';

  @override
  String get languageEnglish => 'ಇಂಗ್ಲೀಷ್';

  @override
  String get notificationsTooltip => 'ಅಧಿಸೂಚನೆ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get enableMessageNotifications => 'ಸಂದೇಶ ಅಧಿಸೂಚನೆಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get settingsNotificationsSubtitle =>
      '1:1 ಸಂದೇಶಗಳು ಮತ್ತು ಆನ್‌ಲೈನ್ ಜನರು (ಸ್ಥಳೀಯ ಎಚ್ಚರಿಕೆಗಳು)';

  @override
  String get networkMembersTooltip => 'ನೆಟ್ವರ್ಕ್ ಸದಸ್ಯರು';

  @override
  String get identityQrTooltip => 'ಗುರುತು / QR';

  @override
  String get feedDirects => 'ಚಾಟ್ ಮಾಡಿ';

  @override
  String get feedMesh => '#ಜಾಲರಿ';

  @override
  String get feedGeo => 'ಪ್ರದೇಶ';

  @override
  String get feedDirectsSubtitle => 'ಖಾಸಗಿ E2EE ಸಂದೇಶಗಳು';

  @override
  String get feedMeshSubtitle => 'ಹತ್ತಿರದ ಗೆಳೆಯರು (BLE)';

  @override
  String get feedGeoSubtitle => 'ಜಿಯೋಹಾಶ್ ಡಿಸ್ಕವರಿ ಚಾನೆಲ್';

  @override
  String get peerIdHint =>
      'ಚಾಟ್ ಪ್ರಾರಂಭಿಸಲು ರಿಸೀವರ್ ಐಡಿ (ಸಾರ್ವಜನಿಕ ಕೀ ಹ್ಯಾಶ್) ಅಂಟಿಸಿ';

  @override
  String get directsEmpty =>
      'ಇನ್ನೂ ಯಾವುದೇ ಚಾಟ್‌ಗಳಿಲ್ಲ - ಪ್ರಾರಂಭಿಸಲು QR ಅನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ ಅಥವಾ ರಿಸೀವರ್ ಐಡಿಯನ್ನು ಅಂಟಿಸಿ\nಕಳುಹಿಸುವ ಮೊದಲು ಸಂದೇಶಗಳನ್ನು E2EE ನೊಂದಿಗೆ ಮುಚ್ಚಲಾಗುತ್ತದೆ (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • ಚಾಟ್ ತೆರೆಯಲು ಟ್ಯಾಪ್ ಮಾಡಿ';

  @override
  String get meshIntro =>
      'BLE ಶ್ರೇಣಿಯಲ್ಲಿರುವ ಗೆಳೆಯರು — ಖಾಸಗಿ E2EE ಚಾಟ್‌ಗಾಗಿ ಟ್ಯಾಪ್ ಮಾಡಿ (#mesh ನಲ್ಲಿ ಸಾರ್ವಜನಿಕ ಸಂಯೋಜನೆ ಇಲ್ಲ)\nಹೈಬ್ರಿಡ್ ರೂಟರ್ ಮೂಲಕ ಕಳುಹಿಸುತ್ತದೆ (BLE + LoRa + Nostr ಆನ್‌ಲೈನ್‌ನಲ್ಲಿದ್ದಾಗ)';

  @override
  String get meshEmptyRunning =>
      'ಯಾವುದೇ ಹತ್ತಿರದ ಗೆಳೆಯರು ಇನ್ನೂ ಇಲ್ಲ — BLE ವ್ಯಾಪ್ತಿಯಲ್ಲಿ ಮತ್ತೊಂದು ಸಾಧನದಲ್ಲಿ ಅಪ್ಲಿಕೇಶನ್ ತೆರೆಯಿರಿ';

  @override
  String get meshEmptyStopped =>
      'BLE ಚಾಲನೆಯಲ್ಲಿಲ್ಲ - ಬ್ಲೂಟೂತ್ / ಸ್ಥಳ ಅನುಮತಿ ನೀಡಿ';

  @override
  String get meshNearbyPrefix => 'ಹತ್ತಿರದಲ್ಲಿದೆ';

  @override
  String get meshRetentionTitle => 'ಸಂದೇಶಗಳನ್ನು ಸ್ವಯಂ-ಅಳಿಸಿ';

  @override
  String get meshRetentionSubtitle =>
      'ಹಳೆಯ ಸ್ಥಳೀಯ ಚಾಟ್ ಇತಿಹಾಸವನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ತೆಗೆದುಹಾಕಲಾಗುತ್ತದೆ';

  @override
  String get meshRetentionKeep => 'ಇರಿಸಿಕೊಳ್ಳಿ';

  @override
  String get meshRetention1Day => '1 ದಿನ';

  @override
  String get meshRetention3Days => '3 ದಿನಗಳು';

  @override
  String get meshRetention7Days => '7 ದಿನಗಳು';

  @override
  String get refreshLocationTooltip => 'ಸ್ಥಳವನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡಿ';

  @override
  String get geoIntro =>
      'ಈ ಜಿಯೋಹಾಶ್‌ನಲ್ಲಿ ಆನ್‌ಲೈನ್‌ನಲ್ಲಿರುವ ಜನರಿಗೆ 1:1 ಅಥವಾ ಸಾರ್ವಜನಿಕ ಅಭಿಮಾನಿ-ಔಟ್ ಪ್ರದೇಶದೊಂದಿಗೆ ಸಂದೇಶವನ್ನು ಕಳುಹಿಸಬಹುದು (ಇನ್ನೂ ಪೀರ್‌ಗೆ E2EE ಎಂದು ಮುಚ್ಚಲಾಗಿದೆ - ಸರಳ ಪಠ್ಯವಲ್ಲ)';

  @override
  String geoEmpty(String channel) {
    return '$channel ನಲ್ಲಿ ಇನ್ನೂ ಯಾರೂ ಆನ್‌ಲೈನ್‌ನಲ್ಲಿಲ್ಲ\nಸಾರಿಗೆ → ಇಂಟರ್ನೆಟ್/ಆಟೋ ಬಳಸಿ, Nostr ಗಾಗಿ ನಿರೀಕ್ಷಿಸಿ, ಸ್ಥಳವನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡಿ';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'ಆನ್‌ಲೈನ್‌ನಲ್ಲಿ $channel • 1:1 E2EE ಗಾಗಿ ಟ್ಯಾಪ್ ಮಾಡಿ';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'ಸಮೀಪದ (ಪ್ರದೇಶದ ಉಪಸ್ಥಿತಿಯನ್ನು ನಿರೀಕ್ಷಿಸಲಾಗುತ್ತಿದೆ) • 1:1 E2EE ಗಾಗಿ ಟ್ಯಾಪ್ ಮಾಡಿ';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'Nostr ನಲ್ಲಿ $channel ನಲ್ಲಿ ನೋಡಲಾಗಿದೆ • ಅನ್ವೇಷಣೆ ಮಾತ್ರ (ಪರಂಪರೆ)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'ಲೆಗಸಿ ಅನಾಮಧೇಯ ಉಪಸ್ಥಿತಿ - ಬೌಂಡ್ ಪೀರ್ ಅಥವಾ ಎಕ್ಸ್ಚೇಂಜ್ ಕ್ಯೂಆರ್ಗಾಗಿ ನಿರೀಕ್ಷಿಸಿ';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE ಹತ್ತಿರ — 1:1 E2EE ಅನ್ನು ಪ್ರಾರಂಭಿಸಲು QR ಅನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get geoInternetDiscoverHint =>
      'ಪ್ರದೇಶ ಇಂಟರ್ನೆಟ್ ಅನ್ವೇಷಣೆಗೆ Nostr ಸಂಪರ್ಕದ ಅಗತ್ಯವಿದೆ (ಸೆಟ್ಟಿಂಗ್‌ಗಳು → ಸಾರಿಗೆ → ಇಂಟರ್ನೆಟ್/ಆಟೋ)';

  @override
  String get geoEmptyNoLocation =>
      'ಸ್ಥಳವನ್ನು ಇನ್ನೂ ಪರಿಹರಿಸಲಾಗಿಲ್ಲ - Nostr ನಲ್ಲಿ ನಿಮ್ಮ ಜಿಯೋಹಾಶ್ ಅನ್ನು ಪ್ರಕಟಿಸಲು GPS ಮತ್ತು ರಿಫ್ರೆಶ್ ಅನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get geoEmptyNeedsPermission =>
      'ಸ್ಥಳ ಅನುಮತಿಯನ್ನು ನಿರಾಕರಿಸಲಾಗಿದೆ - ಸೆಟ್ಟಿಂಗ್‌ಗಳು → ಗೌಪ್ಯತೆ → ಸ್ಥಳದಲ್ಲಿ ResilNet ಅನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get geoEmptyServicesDisabled =>
      'ಸ್ಥಳ ಸೇವೆಗಳು ಆಫ್ ಆಗಿವೆ - ಅವುಗಳನ್ನು ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಆನ್ ಮಾಡಿ';

  @override
  String get geoEmptyNoGpsFix =>
      'GPS ಫಿಕ್ಸ್ ಅನ್ನು ಪಡೆಯಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ (Wi‑Fi iPad ಗಳಲ್ಲಿ ಸಾಮಾನ್ಯ) — geohash ಅನ್ನು ಹಸ್ತಚಾಲಿತವಾಗಿ ಕೆಳಗೆ ಹೊಂದಿಸಿ';

  @override
  String get geoEmptyTeleportHint =>
      'ಸ್ಥಳ ಐಕಾನ್ ಟ್ಯಾಪ್ ಮಾಡಿ → ಜಿಯೋಹಾಶ್ ನಮೂದಿಸಿ (ಉದಾ. w5) → ಟೆಲಿಪೋರ್ಟ್';

  @override
  String get geoSetGeohashManually => 'ಜಿಯೋಹಾಶ್ ಅನ್ನು ಹೊಂದಿಸಿ';

  @override
  String get geoTeleportHint =>
      'ಜಿಪಿಎಸ್ ಇಲ್ಲವೇ? ಜಿಯೋಹಾಶ್ ಪೂರ್ವಪ್ರತ್ಯಯವನ್ನು ನಮೂದಿಸಿ (2–7 ಅಕ್ಷರಗಳು, ಉದಾ. w5) ಮತ್ತು ಟೆಲಿಪೋರ್ಟ್ ಟ್ಯಾಪ್ ಮಾಡಿ';

  @override
  String get geoTeleportInvalid =>
      'ಅಮಾನ್ಯ ಜಿಯೋಹಾಶ್ - ಬೇಸ್32 ಅಕ್ಷರಗಳು/ಸಂಖ್ಯೆಗಳನ್ನು ಮಾತ್ರ ಬಳಸಿ (ಉದಾ. w5 ಅಥವಾ w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'ಪ್ರದೇಶವನ್ನು $channel ಗೆ ಹೊಂದಿಸಲಾಗಿದೆ';
  }

  @override
  String geoManualActive(String channel) {
    return 'ಹಸ್ತಚಾಲಿತ ಪ್ರದೇಶ: $channel (GPS ರಿಫ್ರೆಶ್ ಅತಿಕ್ರಮಿಸುತ್ತದೆ)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr ಸಿದ್ಧವಾಗಿಲ್ಲ - ಮರುಸಂಪರ್ಕ ಟ್ಯಾಪ್ ಮಾಡಿ (init ಯಶಸ್ವಿಯಾಗುವವರೆಗೆ 0/0)';

  @override
  String get geoEmptyMeshOnly =>
      'ಸಾರಿಗೆಯು ಮೆಶ್-ಮಾತ್ರ - Nostr ಕ್ಕಿಂತ ಹೆಚ್ಚಿನ ಗೆಳೆಯರನ್ನು ಕಂಡುಹಿಡಿಯಲು ಇಂಟರ್ನೆಟ್ ಅಥವಾ ಆಟೋಗೆ ಬದಲಿಸಿ';

  @override
  String geoEmptyWaiting(String channel) {
    return '$channel ನಲ್ಲಿ ಇನ್ನೂ ಯಾರೂ ಇಲ್ಲ — ಎರಡೂ ಸಾಧನಗಳಲ್ಲಿ ಪ್ರದೇಶ + ಇಂಟರ್ನೆಟ್ ಅನ್ನು ತೆರೆದಿಡಿ ಮತ್ತು ~60s ನಿರೀಕ್ಷಿಸಿ';
  }

  @override
  String get geoChannelFallback => '#ಪ್ರದೇಶ';

  @override
  String get geoRefreshLocation => 'ಸ್ಥಳವನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡಿ';

  @override
  String get settingsClearLocationTitle => 'ಸ್ಥಳವನ್ನು ತೆರವುಗೊಳಿಸಿ';

  @override
  String get settingsClearLocationSubtitle =>
      'GPS / ಟೆಲಿಪೋರ್ಟ್ ಜಿಯೋಹಾಶ್ ತೆಗೆದುಹಾಕಿ (ಪ್ರದೇಶ #- ಆಗುತ್ತದೆ)';

  @override
  String get settingsClearLocationConfirmTitle => 'ಸ್ಥಳವನ್ನು ತೆರವುಗೊಳಿಸುವುದೇ?';

  @override
  String get settingsClearLocationConfirmBody =>
      'ಈ ಸಾಧನದಲ್ಲಿ ಸಂಗ್ರಹವಾಗಿರುವ ಜಿಯೋಹಾಶ್ ಅನ್ನು ಅಳಿಸುತ್ತದೆ. ನೀವು GPS ಅನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡಬಹುದು ಅಥವಾ ನಂತರ ಮತ್ತೆ ಟೆಲಿಪೋರ್ಟ್ ಮಾಡಬಹುದು.';

  @override
  String get settingsClearLocationAction => 'ಸ್ಥಳವನ್ನು ತೆರವುಗೊಳಿಸಿ';

  @override
  String get settingsClearLocationSnack => 'ಸ್ಥಳವನ್ನು ತೆರವುಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get chatVoiceTooLarge =>
      'ಧ್ವನಿ ಟಿಪ್ಪಣಿ ತುಂಬಾ ದೊಡ್ಡದಾಗಿದೆ - ಗರಿಷ್ಠ ~30 ಸೆಕೆಂಡುಗಳು';

  @override
  String get chatVoiceNeedInternet =>
      'ಧ್ವನಿ ಟಿಪ್ಪಣಿಗೆ ಇಂಟರ್ನೆಟ್ ಅಗತ್ಯವಿದೆ (Nostr) — BLE ಗೆ ಮಾತ್ರ ತುಂಬಾ ದೊಡ್ಡದಾಗಿದೆ';

  @override
  String get chatVoiceSentInternet =>
      'ಇಂಟರ್ನೆಟ್ ಮೂಲಕ ಧ್ವನಿ ಟಿಪ್ಪಣಿ ಕಳುಹಿಸಲಾಗಿದೆ';

  @override
  String get noticeAnonMention => 'ಉಲ್ಲೇಖಿಸಿ';

  @override
  String get noticeAnonDm => 'ನೇರ ಸಂದೇಶ';

  @override
  String get noticeAnonHug => 'ಅಪ್ಪುಗೆ';

  @override
  String get noticeAnonSlap => 'ಬಡಿ';

  @override
  String get noticeAnonBlock => 'ಬ್ಲಾಕ್';

  @override
  String get noticeAnonNeedKey =>
      'ಇನ್ನೂ ಯಾವುದೇ ಸಾರ್ವಜನಿಕ ಕೀ ಇಲ್ಲ — QR ಅನ್ನು ಮೊದಲು 1:1 ಗೆ ವಿನಿಮಯ ಮಾಡಿಕೊಳ್ಳಿ';

  @override
  String get noticeAnonActionSent => 'ಕಳುಹಿಸಲಾಗಿದೆ';

  @override
  String noticeAnonBlocked(String anon) {
    return 'ನಿರ್ಬಂಧಿಸಲಾಗಿದೆ $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* ಅಪ್ಪುಗೆಗಳು $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* ಸ್ಲ್ಯಾಪ್ಸ್ $anon *';
  }

  @override
  String get geoReconnectNostr => 'Nostr ಅನ್ನು ಮರುಸಂಪರ್ಕಿಸಿ';

  @override
  String get nostrSectionTitle => 'Nostr ರಿಲೇಗಳು';

  @override
  String get nostrSectionSubtitle =>
      'ಇಂಟರ್ನೆಟ್ ಮೆಸೇಜಿಂಗ್ ಮತ್ತು ಏರಿಯಾ ಡಿಸ್ಕವರಿ ಈ ರಿಲೇಗಳನ್ನು ಬಳಸುತ್ತದೆ. ಸ್ಥಿತಿ ಆಫ್‌ಲೈನ್‌ನಲ್ಲಿದ್ದರೆ ಮರುಸಂಪರ್ಕ ಟ್ಯಾಪ್ ಮಾಡಿ.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return '$connected/$total ಸಂಪರ್ಕಿಸಲಾಗಿದೆ';
  }

  @override
  String get nostrStatusOffline =>
      'ಆಫ್‌ಲೈನ್ - ರಿಲೇಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಲಾಗಿದೆ ಆದರೆ ಯಾವುದೂ ಸಂಪರ್ಕಗೊಂಡಿಲ್ಲ';

  @override
  String get nostrStatusNotInit =>
      'ಪ್ರಾರಂಭಿಸಲಾಗಿಲ್ಲ (0/0) — ಆರಂಭಿಸಲು ಮರುಸಂಪರ್ಕ ಟ್ಯಾಪ್ ಮಾಡಿ';

  @override
  String get nostrReconnectAction => 'Nostr ಅನ್ನು ಮರುಸಂಪರ್ಕಿಸಿ';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr ಸಂಪರ್ಕಗೊಂಡಿದೆ ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'ಇನ್ನೂ ಆಫ್‌ಲೈನ್ - Wi‑Fi/ಸೆಲ್ಯುಲಾರ್ ಪರಿಶೀಲಿಸಿ ಅಥವಾ ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get nostrReconnecting => 'ರಿಲೇಗಳಿಗೆ ಸಂಪರ್ಕಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get nostrTorTitle => 'Route Nostr via Tor';

  @override
  String get nostrTorSubtitle =>
      'When on, relays connect through local Tor SOCKS (127.0.0.1:9050 — Orbot or system Tor). Slower, but hides your IP from relays. Requires Tor to be running; will not fall back to clearnet.';

  @override
  String get nostrTorFailed =>
      'Tor SOCKS unavailable — open Orbot/Tor, then try again';

  @override
  String nostrTorFailedDetail(String error) {
    return 'Tor failed: $error';
  }

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return '$channel ನಲ್ಲಿ ಇಂಟರ್ನೆಟ್ (Nostr) • ಮೊಹರು ಮಾಡಿದ ಚಾಟ್ ಸಿದ್ಧವಾಗಿದೆ';
  }

  @override
  String get transportModeTitle => 'ಪ್ರದೇಶ ಸಾರಿಗೆ';

  @override
  String get transportModeSubtitle =>
      'ಮೆಶ್ = BLE ಹತ್ತಿರದ (ರೇಡಿಯೋ) Nostr · ಇಂಟರ್ನೆಟ್ ಮತ್ತು ಆಟೋ = Nostr ಜನರ ಪಟ್ಟಿ ಇಲ್ಲದಿದ್ದಾಗ';

  @override
  String get transportModeMesh => 'ಜಾಲರಿ';

  @override
  String get transportModeInternet => 'ಇಂಟರ್ನೆಟ್';

  @override
  String get transportModeAuto => 'ಆಟೋ';

  @override
  String get gatewayRadioTitle => 'Gateway radio';

  @override
  String get gatewayRadioSubtitle =>
      'Switch ESP32 gateway RF path — phone still uses BLE / SoftAP UDP';

  @override
  String get gatewayRadioLora => 'LoRa';

  @override
  String get gatewayRadioHalow => 'HaLow';

  @override
  String get gatewayRadioAuto => 'Auto';

  @override
  String get gatewayRadioHalowUnavailable =>
      'HaLow not reported by this gateway (LoRa-only firmware)';

  @override
  String get gatewayRadioSharedWarning =>
      'Changing gateway radio affects every phone connected to this gateway.';

  @override
  String get gatewayCapsWaiting => 'gateway: waiting for caps…';

  @override
  String get geoPublicHint =>
      'ಈ ಪ್ರದೇಶದಲ್ಲಿ ಆನ್‌ಲೈನ್‌ನಲ್ಲಿ ಎಲ್ಲರಿಗೂ ಸಾರ್ವಜನಿಕ ಸಂದೇಶ';

  @override
  String get geoPublicSend => 'ಸಾರ್ವಜನಿಕ';

  @override
  String geoPublicHelp(int count) {
    return '$count ಆನ್‌ಲೈನ್ ಪೀರ್(ಗಳು) ಗೆ ಮೊಹರು ಮಾಡಿದ ಫ್ಯಾನ್-ಔಟ್ - ಪ್ರತಿಯೊಬ್ಬರೂ ಖಾಸಗಿ ಲಕೋಟೆಯನ್ನು ಸ್ವೀಕರಿಸುತ್ತಾರೆ';
  }

  @override
  String geoPublicSent(int count) {
    return 'ಈ ಪ್ರದೇಶದಲ್ಲಿ $count ಪೀರ್(ಗಳಿಗೆ) ಗೆ ಕಳುಹಿಸಲಾಗಿದೆ';
  }

  @override
  String get geoPublicSentNone =>
      'ಆನ್‌ಲೈನ್‌ನಲ್ಲಿ ಸಂದೇಶ ನೀಡಬಹುದಾದ ಪೀರ್‌ಗಳಿಲ್ಲ - ಕೀಗಳನ್ನು ಹೊಂದಿರುವ ಗೆಳೆಯರೊಂದಿಗೆ ಪ್ರದೇಶ/ಮೆಶ್ ತೆರೆಯಿರಿ ಅಥವಾ BLE/Nostr ಗಾಗಿ ನಿರೀಕ್ಷಿಸಿ';

  @override
  String get areaPublicBadge => 'ಪ್ರದೇಶದ ಸಾರ್ವಜನಿಕ';

  @override
  String get geoErrorPermission =>
      'ಸ್ಥಳವನ್ನು ಓದಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ - ಸ್ಥಳ ಅನುಮತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ';

  @override
  String get geoPrecisionRegion => 'ಪ್ರದೇಶ';

  @override
  String get geoPrecisionProvince => 'ಪ್ರಾಂತ್ಯ';

  @override
  String get geoPrecisionCity => 'ನಗರ';

  @override
  String get geoPrecisionNeighborhood => 'ನೆರೆಹೊರೆ';

  @override
  String get geoPrecisionBlock => 'ನಿರ್ಬಂಧಿಸಿ';

  @override
  String get aliasTitle => 'ಅಡ್ಡಹೆಸರನ್ನು ಹೊಂದಿಸಿ (ಸಂಪರ್ಕ ಅಲಿಯಾಸ್)';

  @override
  String get aliasHintBody =>
      'ಈ ಅಲಿಯಾಸ್ ಅನ್ನು ಈ ಸಾಧನದಲ್ಲಿ ಮಾತ್ರ ಸಂಗ್ರಹಿಸಲಾಗಿದೆ (ಸ್ಥಳೀಯ-ಮಾತ್ರ)\nಇದನ್ನು E2EE ಟ್ರಾಫಿಕ್‌ನೊಂದಿಗೆ ಎಂದಿಗೂ ಕಳುಹಿಸಲಾಗುವುದಿಲ್ಲ';

  @override
  String get aliasLabel => 'ಅಡ್ಡಹೆಸರು';

  @override
  String get aliasHint => 'ಉದಾ. \"ಗ್ರಾಮ ಮುಖ್ಯಸ್ಥ\", \"ಪಿ\'ಸೋಮ್ಚೈ\"...';

  @override
  String get settingsDevices => 'ಸಾಧನಗಳು';

  @override
  String get settingsFirmwareTitle =>
      'ESP32 ಫರ್ಮ್‌ವೇರ್ ಅನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ / ನವೀಕರಿಸಿ';

  @override
  String get settingsFirmwareSubtitle =>
      '.bin ಫೈಲ್‌ಗಳನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ ಮತ್ತು OTA ಮೂಲಕ ESP32 ಬೋರ್ಡ್ ಅನ್ನು ನವೀಕರಿಸಿ';

  @override
  String get mtBridgeTitle => 'Meshtastic ಸೇತುವೆ';

  @override
  String get mtBridgeSettingsSubtitle =>
      'ಪಠ್ಯ-ಮಾತ್ರ A/B ಸೇತುವೆ — ResilNet E2EE ಅಲ್ಲ';

  @override
  String get mtBridgeIntro =>
      'Meshtastic ಮತ್ತು ResilNet ನಡುವೆ ಸಣ್ಣ ಸರಳ ಪಠ್ಯವನ್ನು ಸರಿಸಿ. ಎ ಮತ್ತು ಬಿ ವಿಧಾನಗಳು ಒಂದೇ ಸಮಯದಲ್ಲಿ ಕಾರ್ಯನಿರ್ವಹಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ. ಇದು ಎಂಡ್-ಟು-ಎಂಡ್ ಎನ್‌ಕ್ರಿಪ್ಶನ್ ಅಲ್ಲ.';

  @override
  String get mtBridgeModeLabel => 'ಮೋಡ್';

  @override
  String get mtBridgeModeOff => 'ಆಫ್';

  @override
  String get mtBridgeModeA => 'ಇಂಜೆಸ್ಟ್ ಎ';

  @override
  String get mtBridgeModeB => 'ಎಗ್ರೆಸ್ ಬಿ';

  @override
  String get mtBridgeModeOffShort => 'ಆಫ್';

  @override
  String get mtBridgeModeAShort => 'ಎ ನಲ್ಲಿ';

  @override
  String get mtBridgeModeBShort => 'ಔಟ್ ಬಿ';

  @override
  String get mtBridgeMutexHint =>
      'ಮೋಡ್ ಅನ್ನು ಆಯ್ಕೆ ಮಾಡುವುದರಿಂದ ಇನ್ನೊಂದನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಆಫ್ ಮಾಡುತ್ತದೆ. ಏಕಕಾಲಿಕ A+B ಬೆಂಬಲಿತವಾಗಿಲ್ಲ.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'ಡೆಮೊ (ಲಾಗಿಂಗ್)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'ಒಳಬರುವ ಪಠ್ಯವು ಸೂಚನೆಗಳ ಅಡಿಯಲ್ಲಿ #meshtastic ಎಂದು ಗೋಚರಿಸುತ್ತದೆ. ಮೆಶ್ ರಿಲೇ ಐಚ್ಛಿಕವಾಗಿರುತ್ತದೆ (ಡೀಫಾಲ್ಟ್ ಆಗಿ ಆಫ್).';

  @override
  String get mtBridgeRelayTitle => 'ResilNet ಮೆಶ್‌ನಲ್ಲಿ ಸಹ ರಿಲೇ ಮಾಡಿ';

  @override
  String get mtBridgeRelayHint =>
      'ಆನ್ ಮಾಡಿದಾಗ, ಸಹಿ ಮಾಡಿದ ಸಾರ್ವಜನಿಕ ಬುಲೆಟಿನ್‌ಗಳನ್ನು ಪ್ರಸಾರ ಮಾಡಲಾಗುತ್ತದೆ. ಆಫ್ = ಈ ಫೋನ್‌ನ ಸೂಚನೆಗಳು ಮಾತ್ರ.';

  @override
  String get mtBridgeSimulateHint => 'ಡೆಮೊ ಸಂದೇಶ';

  @override
  String get mtBridgeSimulate => 'Meshtastic ಸಂದೇಶವನ್ನು ಅನುಕರಿಸಿ';

  @override
  String get mtBridgeIngestOk => 'ನೋಟಿಸ್‌ಗಳಲ್ಲಿ ಒಳಸೇರಿಸಲಾಗಿದೆ (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'ಎಚ್ಚರಿಕೆ: ಇಲ್ಲಿ ಕಳುಹಿಸಲಾದ ಸಂದೇಶಗಳು ResilNet E2EE ಅಲ್ಲ. Meshtastic ಮಾರ್ಗದಲ್ಲಿರುವ ಯಾರಾದರೂ ಅವುಗಳನ್ನು ಓದಬಹುದು.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'ಪ್ರಕಟಿಸಲು ಪಠ್ಯ';

  @override
  String get mtBridgeSend => 'Meshtastic ಗೆ ಕಳುಹಿಸಿ';

  @override
  String get mtBridgeEgressOk =>
      'Meshtastic ಗೆ ಸರತಿಯಲ್ಲಿದೆ (ಲಾಗ್ / ಇತಿಹಾಸವನ್ನು ನೋಡಿ)';

  @override
  String get mtBridgeLastEgress => 'ಕೊನೆಯ ನಿರ್ಗಮನ';

  @override
  String get mtBridgeEgressHistory => 'ಇತ್ತೀಚಿನ ಹೊರಹೊಮ್ಮುವಿಕೆ';

  @override
  String get mtBridgeOffHint =>
      'ಸೇತುವೆಯನ್ನು ಬಳಸಲು ಇಂಜೆಸ್ಟ್ (ಎ) ಅಥವಾ ಎಗ್ರೆಸ್ (ಬಿ) ಅನ್ನು ಆನ್ ಮಾಡಿ.';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTIC · E2EE ಅಲ್ಲ';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'MQTT ಸಾರಿಗೆ ಬಳಸಿ';

  @override
  String get mtBridgeUseMqttHint =>
      'ಆಫ್ = ಡೆಮೊ ಲಾಗಿಂಗ್ ಮಾತ್ರ (MQTT ಒಳಬರುವಿಕೆಯನ್ನು ನಿರ್ಲಕ್ಷಿಸಲಾಗಿದೆ). ಆನ್ = MQTT ಅನ್ನು ಸಂಪರ್ಕಿಸಿದಾಗ ಸೇವನೆ/ಹೊರಬರುವಿಕೆಗಾಗಿ.';

  @override
  String get mtBridgeMqttHost => 'ಬ್ರೋಕರ್ ಹೋಸ್ಟ್';

  @override
  String get mtBridgeMqttPort => 'ಬಂದರು';

  @override
  String get mtBridgeMqttTls => 'TLS (mqtts) ಬಳಸಿ';

  @override
  String get mtBridgeMqttTlsHint =>
      'ವಿಶಿಷ್ಟ ಪೋರ್ಟ್ 8883. ಸಿಸ್ಟಮ್ ಪ್ರಮಾಣಪತ್ರಗಳನ್ನು ಬಳಸುತ್ತದೆ; ಹ್ಯಾಂಡ್ಶೇಕ್ ದೋಷಗಳಲ್ಲಿ ಮೃದುವಾಗಿ ವಿಫಲಗೊಳ್ಳುತ್ತದೆ.';

  @override
  String get mtBridgeMqttAutoReconnect => 'ಸ್ವಯಂ-ಮರುಸಂಪರ್ಕ';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'ಆನ್ ಆಗಿರುವಾಗ, ಕ್ಲೈಂಟ್ ಡ್ರಾಪ್ಸ್ ನಂತರ ಮರುಸಂಪರ್ಕಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಾನೆ. ಮರುಸ್ಥಾಪಿಸುವವರೆಗೆ ಸಂಪರ್ಕವನ್ನು ಸ್ಥಿತಿ ತೋರಿಸುತ್ತದೆ.';

  @override
  String get mtBridgeMqttTopicHelpers => 'ವಿಷಯ ಸಹಾಯಕರು';

  @override
  String get mtBridgeMqttRegion => 'ಪ್ರದೇಶ ಪೂರ್ವಪ್ರತ್ಯಯ (ಐಚ್ಛಿಕ)';

  @override
  String get mtBridgeMqttRegionHint =>
      'ಹೊಂದಿಸಿದಾಗ, msh/<region>/2/json (ವಿಷಯದ ಮೂಲವನ್ನು ಅತಿಕ್ರಮಿಸುತ್ತದೆ) ಎಂದು ಮರುನಿರ್ಮಾಣಗಳನ್ನು ಅನ್ವಯಿಸಿ.';

  @override
  String get mtBridgeMqttTopicRoot => 'JSON ವಿಷಯ ಮೂಲ';

  @override
  String get mtBridgeMqttDownlinkChannel => 'ಡೌನ್‌ಲಿಂಕ್ ಚಾನಲ್ ಹೆಸರು';

  @override
  String get mtBridgeMqttApplyTopics =>
      'ರೂಟ್ → ಚಂದಾದಾರಿಕೆ / ಪ್ರಕಟಣೆ ವಿಷಯಗಳನ್ನು ಅನ್ವಯಿಸಿ';

  @override
  String get mtBridgeMqttAdvanced => 'ಸುಧಾರಿತ MQTT';

  @override
  String get mtBridgeMqttAdvancedHint => 'TLS, ಮರುಸಂಪರ್ಕ, ವಿಷಯಗಳು, ರುಜುವಾತುಗಳು';

  @override
  String get mtBridgeMqttTopicIn => 'ವಿಷಯ ಚಂದಾದಾರರಾಗಿ';

  @override
  String get mtBridgeMqttTopicOut => 'ವಿಷಯವನ್ನು ಪ್ರಕಟಿಸಿ';

  @override
  String get mtBridgeMqttGatewayFrom => 'ಗೇಟ್‌ವೇ ನೋಡ್ ಐಡಿ (ಇಂದ)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'ದಶಮಾಂಶ ಐಡಿ ಅಥವಾ !ಹೆಕ್ಸ್ — ಸೆಂಡ್‌ಟೆಕ್ಸ್ಟ್ ಡೌನ್‌ಲಿಂಕ್‌ಗೆ ಅಗತ್ಯವಿದೆ';

  @override
  String get mtBridgeMqttChannelIndex => 'ಮೆಶ್ ಚಾನಲ್ ಇಂಡೆಕ್ಸ್ (ಐಚ್ಛಿಕ 0–7)';

  @override
  String get mtBridgeMqttUser => 'ಬಳಕೆದಾರ ಹೆಸರು (ಐಚ್ಛಿಕ)';

  @override
  String get mtBridgeMqttPass => 'ಪಾಸ್ವರ್ಡ್ (ಐಚ್ಛಿಕ)';

  @override
  String get mtBridgeMqttPassStored =>
      'ಈ ಸಾಧನದಲ್ಲಿ ಪಾಸ್‌ವರ್ಡ್ ಅನ್ನು ಸಂಗ್ರಹಿಸಲಾಗಿದೆ (ತೋರಿಸಲಾಗಿಲ್ಲ).';

  @override
  String get mtBridgeMqttPassReplace => 'ಹೊಸ ಪಾಸ್‌ವರ್ಡ್ (ಇರಿಸಲು ಖಾಲಿ ಬಿಡಿ)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'ಸಂಗ್ರಹಿಸಿದ ಪಾಸ್‌ವರ್ಡ್ ಅನ್ನು ಇರಿಸಿಕೊಳ್ಳಲು ಖಾಲಿ ಬಿಡಿ.';

  @override
  String get mtBridgeMqttPassClear => 'ಪಾಸ್ವರ್ಡ್ ತೆರವುಗೊಳಿಸಿ';

  @override
  String get mtBridgeMqttSave => 'MQTT ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಉಳಿಸಿ';

  @override
  String get mtBridgeMqttSaved => 'MQTT ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get mtBridgeMqttConnect => 'ಸಂಪರ್ಕಿಸಿ';

  @override
  String get mtBridgeMqttDisconnect => 'ಸಂಪರ್ಕ ಕಡಿತಗೊಳಿಸಿ';

  @override
  String get mtBridgeMqttConnected => 'MQTT ಸಂಪರ್ಕಗೊಂಡಿದೆ';

  @override
  String get mtBridgeMqttConnecting => 'MQTT ಸಂಪರ್ಕಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT ಸಂಪರ್ಕ ಕಡಿತಗೊಂಡಿದೆ';

  @override
  String get mtBridgeMqttError => 'MQTT ದೋಷ';

  @override
  String get mtBridgeErrModeIngest => 'ಮೊದಲು Ingest (A) ಗೆ ಬದಲಿಸಿ';

  @override
  String get mtBridgeErrModeEgress => 'ಮೊದಲು ಎಗ್ರೆಸ್ (ಬಿ) ಗೆ ಬದಲಿಸಿ';

  @override
  String get mtBridgeErrRate => 'ನಿಧಾನವಾಗಿ - ದರ ಸೀಮಿತವಾಗಿದೆ';

  @override
  String get mtBridgeErrDedupe => 'ನಕಲಿ ಸಂದೇಶವನ್ನು ನಿರ್ಲಕ್ಷಿಸಲಾಗಿದೆ';

  @override
  String get mtBridgeErrLoop => 'ಸೇತುವೆಯ ಲೂಪ್ ಅನ್ನು ತಡೆಯಲು ಕೈಬಿಡಲಾಗಿದೆ';

  @override
  String get mtBridgeErrEmpty => 'ಸಂದೇಶ ಖಾಲಿಯಾಗಿದೆ';

  @override
  String get mtBridgeErrPublish => 'ಪ್ರಕಟಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get mtBridgeErrNotConnected => 'MQTT ಸಂಪರ್ಕಗೊಂಡಿಲ್ಲ';

  @override
  String get mtBridgeErrMissingHost => 'MQTT ಬ್ರೋಕರ್ ಹೋಸ್ಟ್ ಅನ್ನು ನಮೂದಿಸಿ';

  @override
  String get mtBridgeErrMissingTopic =>
      'ಸಬ್‌ಸ್ಕ್ರೈಬ್ ಮಾಡಿ ಮತ್ತು ವಿಷಯಗಳನ್ನು ಪ್ರಕಟಿಸಿ';

  @override
  String get mtBridgeErrMissingFromNode =>
      'ಕಳುಹಿಸುವ ಪಠ್ಯಕ್ಕಾಗಿ ಗೇಟ್‌ವೇ ನೋಡ್ ಐಡಿ (ಇಂದ) ನಮೂದಿಸಿ';

  @override
  String get mtBridgeErrConnect => 'MQTT ಸಂಪರ್ಕ ವಿಫಲವಾಗಿದೆ';

  @override
  String get mtBridgeErrConnectTls => 'MQTT TLS ಸಂಪರ್ಕ ವಿಫಲವಾಗಿದೆ';

  @override
  String get settingsData => 'ಡೇಟಾ';

  @override
  String get settingsDataHint =>
      'ಡೇಟಾಬೇಸ್ ಅನ್ನು ಕುಗ್ಗಿಸಲು ಸ್ಥಳೀಯ ಸಂದೇಶಗಳನ್ನು ಅಳಿಸಿ - ಗುರುತು, ಕೀಗಳು ಮತ್ತು ಗೆಳೆಯರನ್ನು ಇರಿಸಲಾಗುತ್ತದೆ';

  @override
  String get settingsSaveHistoryTitle => 'ಸಂದೇಶ ಇತಿಹಾಸವನ್ನು ಉಳಿಸಿ';

  @override
  String get settingsSaveHistorySubtitle =>
      'ಆಫ್ ಮಾಡಿದಾಗ, ಸಂದೇಶಗಳು ವೈರ್‌ನಲ್ಲಿ E2EE ಆಗಿರುತ್ತವೆ ಮತ್ತು ಈ ಸೆಷನ್‌ಗಾಗಿ ಮಾತ್ರ ಇರಿಸಲಾಗುತ್ತದೆ (ಸ್ಥಳೀಯ ಚಾಟ್ ಇತಿಹಾಸದಲ್ಲಿ ಅಲ್ಲ). ಈ ಸಾಧನದಲ್ಲಿ ನಿಮ್ಮ ಸ್ವಂತ ಪಠ್ಯವು ಇನ್ನೂ ಸರಳ ಪಠ್ಯದಂತೆ ತೋರಿಸುತ್ತದೆ.';

  @override
  String get settingsPrivacy => 'ಗೌಪ್ಯತೆ';

  @override
  String get settingsE2eeTitle => 'ಎಂಡ್-ಟು-ಎಂಡ್ ಎನ್‌ಕ್ರಿಪ್ಷನ್';

  @override
  String get settingsE2eeSubtitle =>
      'ಯಾವಾಗಲೂ ಆನ್ - ಸಂದೇಶಗಳನ್ನು ಕಳುಹಿಸುವ ಮೊದಲು RSA-OAEP + AES-GCM ನೊಂದಿಗೆ ಮುಚ್ಚಲಾಗುತ್ತದೆ. ರಿಲೇಗಳು ಮತ್ತು ಹತ್ತಿರದ ಹಾಪ್‌ಗಳು ವಿಷಯಗಳನ್ನು ಓದಲು ಸಾಧ್ಯವಿಲ್ಲ.';

  @override
  String get settingsScreenshotTitle => 'ಸ್ಕ್ರೀನ್‌ಶಾಟ್ ಎಚ್ಚರಿಕೆಗಳು';

  @override
  String get settingsScreenshotSubtitle =>
      'ಈ ಸಾಧನವು ಪರದೆಯನ್ನು ಸೆರೆಹಿಡಿಯುವಾಗ ಚಾಟ್‌ನಲ್ಲಿ ಸಿಸ್ಟಮ್ ಲೈನ್ ಅನ್ನು ತೋರಿಸಿ';

  @override
  String get settingsNostrExpiryTitle => 'Nostr ಸಂದೇಶವನ್ನು ಇರಿಸಿಕೊಳ್ಳಲು ಸಮಯ';

  @override
  String get settingsNostrExpirySubtitle =>
      'Nostr ಮೂಲಕ ಆನ್‌ಲೈನ್‌ನಲ್ಲಿರುವಾಗ ಸೀಲ್ ಮಾಡಿದ ಲಕೋಟೆಗಳು ಸ್ಥಳೀಯವಾಗಿ ಎಷ್ಟು ಕಾಲ ಉಳಿಯಬೇಕು';

  @override
  String get noticeExpiresIn => 'ರಲ್ಲಿ ಮುಕ್ತಾಯಗೊಳ್ಳುತ್ತದೆ';

  @override
  String get noticesTitle => 'ಸೂಚನೆಗಳು';

  @override
  String get noticesMeshIntro =>
      'ಸಾರ್ವಜನಿಕ ಬುಲೆಟಿನ್ - ರೇಡಿಯೋ ವ್ಯಾಪ್ತಿಯಲ್ಲಿ ಎಲ್ಲರಿಗೂ ಗೋಚರಿಸುತ್ತದೆ, ಎನ್‌ಕ್ರಿಪ್ಟ್ ಮಾಡಲಾಗಿಲ್ಲ. ಇದು ಫೋನ್‌ನಿಂದ ಫೋನ್‌ಗೆ ಆಫ್‌ಲೈನ್‌ನಲ್ಲಿ ಹಾಪ್ ಮಾಡುತ್ತದೆ ಮತ್ತು ಹತ್ತಿರದ ResilNet ರಿಲೇ ಬಾಕ್ಸ್‌ಗಳು ನಕಲನ್ನು ಇರಿಸುತ್ತವೆ ಆದ್ದರಿಂದ ನಂತರ ಬರುವ ಜನರು ಅದನ್ನು ನೋಡುತ್ತಾರೆ.';

  @override
  String get noticesMeshPublicBadge => 'ಸಾರ್ವಜನಿಕ · ಎನ್‌ಕ್ರಿಪ್ಟ್ ಮಾಡಲಾಗಿಲ್ಲ';

  @override
  String get noticesGeoIntro =>
      'ಈ ಸ್ಥಳಕ್ಕಾಗಿ ಕಿರು ಟಿಪ್ಪಣಿಗಳನ್ನು ಸೇರಿಸಿ ಇದರಿಂದ ಇತರ ಸಂದರ್ಶಕರು ಅವುಗಳನ್ನು ಹುಡುಕಬಹುದು.';

  @override
  String get noticesEmpty => 'ಇನ್ನೂ ಯಾವುದೇ ಸೂಚನೆಗಳಿಲ್ಲ';

  @override
  String get noticesEmptyHint =>
      'ಸುತ್ತಮುತ್ತಲಿನ ಜನರಿಗೆ ಮೊದಲ ಸೂಚನೆಯನ್ನು ಪಿನ್ ಮಾಡಿ.';

  @override
  String get noticesComposeHint => 'ನೋಟಿಸ್ ಪೋಸ್ಟ್ ಮಾಡಿ...';

  @override
  String get noticesUrgent => 'ತುರ್ತು';

  @override
  String get noticesOpen => 'ಸೂಚನೆಗಳು';

  @override
  String get screenshotTaken => '* ನೀವು ಸ್ಕ್ರೀನ್‌ಶಾಟ್ ತೆಗೆದುಕೊಂಡಿದ್ದೀರಿ *';

  @override
  String get chatAttachImage => 'ಚಿತ್ರವನ್ನು ಲಗತ್ತಿಸಿ';

  @override
  String get chatImageLabel => 'ಚಿತ್ರ';

  @override
  String get chatImageTooLarge =>
      'ಚಿತ್ರ ತುಂಬಾ ದೊಡ್ಡದಾಗಿದೆ - ಇನ್ನೊಂದು ಫೋಟೋ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get chatNostrExpiry => 'Nostr ಇರಿಸಿಕೊಳ್ಳಿ';

  @override
  String geoPublicComposeHint(String channel) {
    return '$channel ಗೆ ಕಳುಹಿಸಿ — ಸಾರ್ವಜನಿಕ';
  }

  @override
  String get settingsClearTitle => 'ಎಲ್ಲಾ ಸಂದೇಶಗಳನ್ನು ತೆರವುಗೊಳಿಸಿ';

  @override
  String get settingsClearSubtitle => 'ಈ ಸಾಧನದಲ್ಲಿರುವ ಎಲ್ಲಾ ಚಾಟ್‌ಗಳನ್ನು ಅಳಿಸಿ';

  @override
  String get settingsClearConfirmTitle => 'ಎಲ್ಲಾ ಸಂದೇಶಗಳನ್ನು ತೆರವುಗೊಳಿಸುವುದೇ?';

  @override
  String get settingsClearConfirmBody =>
      'ಇದು ಈ ಸಾಧನದಲ್ಲಿರುವ ಎಲ್ಲಾ ಚಾಟ್ ಸಂದೇಶಗಳನ್ನು ಅಳಿಸುತ್ತದೆ.\nಗೆಳೆಯರು ಮತ್ತು ಅಡ್ಡಹೆಸರುಗಳನ್ನು ತೆಗೆದುಹಾಕಲಾಗುವುದಿಲ್ಲ.';

  @override
  String get settingsClearAction => 'ಡೇಟಾವನ್ನು ತೆರವುಗೊಳಿಸಿ';

  @override
  String get settingsClearedSnack => 'ಡೇಟಾವನ್ನು ತೆರವುಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String settingsVersion(String version) {
    return 'ಆವೃತ್ತಿ $version';
  }

  @override
  String get meshBleScanning => 'BLE: ನೋಡ್‌ಗಳಿಗಾಗಿ ಸ್ಕ್ಯಾನ್ ಮಾಡಲಾಗುತ್ತಿದೆ';

  @override
  String get meshBleEsp32Scanning =>
      'ESP32: ಹತ್ತಿರದ ನೋಡ್‌ಗಾಗಿ ಹುಡುಕುತ್ತಿದ್ದೇವೆ';

  @override
  String get meshBleSyncing => 'BLE: ESP32 ನೊಂದಿಗೆ ಸಿಂಕ್ ಮಾಡಲಾಗುತ್ತಿದೆ';

  @override
  String get meshNostrPublishing => 'Nostr: ಪ್ರಕಟಿಸಲಾಗುತ್ತಿದೆ';

  @override
  String get meshBleIdle => 'BLE ಮೆಶ್ ಆನ್ - ಇನ್ನೂ ಯಾವುದೇ ಹತ್ತಿರದ ಫೋನ್‌ಗಳಿಲ್ಲ';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE ಮೆಶ್ — $count ಫೋನ್(ಗಳು) ಹತ್ತಿರದಲ್ಲಿದೆ';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: ಅನುಮತಿ ಅಗತ್ಯವಿದೆ';

  @override
  String get meshBlePausedCamera =>
      'ಕ್ಯಾಮರಾಕ್ಕಾಗಿ BLE ವಿರಾಮಗೊಳಿಸಲಾಗಿದೆ - ಪ್ರಾರಂಭಿಸಿ BLE ಅನ್ನು ಟ್ಯಾಪ್ ಮಾಡಿ';

  @override
  String get meshBleStopped =>
      'BLE ಆಫ್ ಆಗಿದೆ - ಬ್ಲೂಟೂತ್ ಆನ್ ಆಗಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ, ನಂತರ ಸ್ಟಾರ್ಟ್ ಟ್ಯಾಪ್ ಮಾಡಿ BLE';

  @override
  String get meshBleRestart => 'BLE ಅನ್ನು ಪ್ರಾರಂಭಿಸಿ';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction =>
      'ಅನುಮತಿಗಳನ್ನು ಪರಿಶೀಲಿಸಿ ಮತ್ತು BLE ಅನ್ನು ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get meshNostrOffline => 'Nostr ಆಫ್‌ಲೈನ್';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count ಹತ್ತಿರದ ಗೆಳೆಯರು • LoRa $lora • ಸಿಂಕ್ ~$metersಮೀ';
  }

  @override
  String get meshLoraReady => 'ಸಿದ್ಧವಾಗಿದೆ';

  @override
  String get meshLoraNotReady => 'ಸಿದ್ಧವಾಗಿಲ್ಲ';

  @override
  String get meshHalowReady => 'HaLow ready';

  @override
  String get meshHalowStubReady => 'HaLow ready (stub)';

  @override
  String get meshHalowRealReady => 'HaLow ready (link up)';

  @override
  String get meshHalowNotReady => 'HaLow not ready';

  @override
  String get meshGatewayHalowReady => 'Gateway HaLow: ready';

  @override
  String get meshGatewayHalowStubReady => 'Gateway HaLow: stub/loopback';

  @override
  String get meshGatewayHalowRealReady => 'Gateway HaLow: real link';

  @override
  String meshGatewayProgress(String label) {
    return 'ಗೇಟ್‌ವೇ UDP: $label';
  }

  @override
  String get meshGatewayReady => 'ಗೇಟ್‌ವೇ UDP: ಸಿದ್ಧವಾಗಿದೆ';

  @override
  String get permissionTitle =>
      'BLE ಮೆಶ್ ನೆಟ್‌ವರ್ಕ್ ಅನ್ನು ಪ್ರಾರಂಭಿಸಲು ಪ್ರವೇಶವನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get permissionBody =>
      'ಸಮುದಾಯ ಸಂದೇಶ ಕಳುಹಿಸಲು ಅಪ್ಲಿಕೇಶನ್‌ಗೆ ಬ್ಲೂಟೂತ್ (ಸ್ಕ್ಯಾನ್ / ಸಂಪರ್ಕ / ಜಾಹೀರಾತು), ಸ್ಥಳ (ಹಳೆಯ Android ಸಾಧನಗಳಿಗೆ) ಮತ್ತು ಮೈಕ್ರೊಫೋನ್ (ಚಾಟ್ ಮತ್ತು ಪ್ರಕಟಣೆಗಳಲ್ಲಿ ಧ್ವನಿ ಟಿಪ್ಪಣಿಗಳಿಗಾಗಿ) ಅಗತ್ಯವಿದೆ.';

  @override
  String get permissionE2ee =>
      'ಎಂಡ್-ಟು-ಎಂಡ್ ಎನ್‌ಕ್ರಿಪ್ಶನ್ (E2EE)\nರಿಲೇ ನೋಡ್‌ಗಳು ಸಂದೇಶದ ವಿಷಯಗಳನ್ನು ಓದಲು ಸಾಧ್ಯವಿಲ್ಲ';

  @override
  String get permissionReady => 'ಅನುಮತಿಗಳು ಸಿದ್ಧವಾಗಿವೆ';

  @override
  String get permissionRequest => 'ಅನುಮತಿಸಿ ಮತ್ತು ಮುಂದುವರಿಸಿ';

  @override
  String get permissionNotReadySnack =>
      'ಸಿಸ್ಟಂ ಇನ್ನೂ ಸಿದ್ಧವಾಗಿಲ್ಲ - ಸ್ವಲ್ಪ ನಿರೀಕ್ಷಿಸಿ ಮತ್ತು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get permissionDeniedSnack =>
      'ಅನುಮತಿಗಳು ಅಪೂರ್ಣ - ತೆರೆಯಿರಿ ಸೆಟ್ಟಿಂಗ್‌ಗಳು > ResilNet ಮತ್ತು ಬ್ಲೂಟೂತ್ / ಸ್ಥಳ / ಮೈಕ್ರೊಫೋನ್ ಅನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get permissionMicDenied =>
      'ಮೈಕ್ರೊಫೋನ್ ಪ್ರವೇಶವನ್ನು ನಿರಾಕರಿಸಲಾಗಿದೆ - ಧ್ವನಿ ಟಿಪ್ಪಣಿಗಳನ್ನು ರೆಕಾರ್ಡ್ ಮಾಡಲು ಅದನ್ನು ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಅನುಮತಿಸಿ';

  @override
  String get permissionMicOpenSettings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get permissionCameraDenied =>
      'ಕ್ಯಾಮರಾ ಪ್ರವೇಶವನ್ನು ನಿರಾಕರಿಸಲಾಗಿದೆ - QR ಕೋಡ್‌ಗಳನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಲು ಅದನ್ನು ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಅನುಮತಿಸಿ';

  @override
  String get permissionCameraFailed =>
      'QR ಕೋಡ್‌ಗಳನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಲು ಕ್ಯಾಮರಾ ಅನುಮತಿ ಅಗತ್ಯವಿದೆ';

  @override
  String get permissionCameraOpenSettings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get permissionPhotosDenied =>
      'ಫೋಟೋ ಲೈಬ್ರರಿ ಪ್ರವೇಶವನ್ನು ನಿರಾಕರಿಸಲಾಗಿದೆ - ನಿಮ್ಮ QR ಕೋಡ್ ಅನ್ನು ಉಳಿಸಲು ಅದನ್ನು ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಅನುಮತಿಸಿ';

  @override
  String get permissionPhotosFailed =>
      'ನಿಮ್ಮ QR ಕೋಡ್ ಅನ್ನು ಉಳಿಸಲು ಫೋಟೋ ಲೈಬ್ರರಿ ಅನುಮತಿಯ ಅಗತ್ಯವಿದೆ';

  @override
  String get permissionPhotosOpenSettings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String permissionFailedSnack(String error) {
    return 'ಅನುಮತಿ ವಿನಂತಿಯು ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet ಆರ್ಕಿಟೆಕ್ಚರ್ • ಸ್ಟೋರ್ ಮತ್ತು ಫಾರ್ವರ್ಡ್ ಮಲ್ಟಿ-ಹಾಪ್';

  @override
  String get onboardingSkip => 'ಬಿಟ್ಟುಬಿಡಿ';

  @override
  String get onboardingNext => 'ಮುಂದೆ';

  @override
  String get onboardingStart => 'ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get onboardingWelcomeTitle => 'ResilNet ಗೆ ಸುಸ್ವಾಗತ';

  @override
  String get onboardingWelcomeBody =>
      'ಮೆಶ್ ನೆಟ್‌ವರ್ಕ್ ಮೂಲಕ ResilNet ನಲ್ಲಿ ಚಾಟ್ ಮಾಡಿ — ಇಂಟರ್ನೆಟ್ ಇಲ್ಲದಿದ್ದರೂ ಸಹ';

  @override
  String get onboardingWelcomeFeatMeshLabel => 'Mesh';

  @override
  String get onboardingWelcomeFeatMeshHint =>
      'Nearby phones relay sealed packets hop-by-hop over Bluetooth LE.';

  @override
  String get onboardingWelcomeFeatE2eeLabel => 'E2EE';

  @override
  String get onboardingWelcomeFeatE2eeHint =>
      'Direct chats encrypt on your device; only the peer’s key can open them.';

  @override
  String get onboardingWelcomeFeatOfflineLabel => 'Offline';

  @override
  String get onboardingWelcomeFeatOfflineHint =>
      'You can keep chatting without cellular or Wi‑Fi internet access.';

  @override
  String get onboardingIdentityTitle => 'Your identity';

  @override
  String get onboardingIdentityBody =>
      'Open Identity from the ⋮ menu. Your QR carries your public key so friends can verify you before private chat.';

  @override
  String get onboardingIdentityFeatQrLabel => 'QR';

  @override
  String get onboardingIdentityFeatQrHint =>
      'Show or save your identity QR so others can add you safely.';

  @override
  String get onboardingIdentityFeatShareLabel => 'Share';

  @override
  String get onboardingIdentityFeatShareHint =>
      'Share an invite link or QR payload from Identity.';

  @override
  String get onboardingIdentityFeatScanLabel => 'Scan';

  @override
  String get onboardingIdentityFeatScanHint =>
      'Scan a friend’s QR to exchange public keys and unlock Direct chat.';

  @override
  String get onboardingIdentityFeatNameLabel => 'Name';

  @override
  String get onboardingIdentityFeatNameHint =>
      'Save a display name that peers see when you announce yourself.';

  @override
  String get onboardingChannelsTitle =>
      'ಎನ್‌ಕ್ರಿಪ್ಟ್ ಮಾಡಿದ ಚಾಟ್ + ಹತ್ತಿರದ ಚಾನಲ್‌ಗಳು';

  @override
  String get onboardingChannelsBody =>
      'ಹತ್ತಿರದ ಗೆಳೆಯರನ್ನು ಹುಡುಕಲು #mesh / Area (geohash) ಬದಲಿಸಿ — ಸಂದೇಶಗಳು BLE ಮೆಶ್ ಮತ್ತು Nostr ಮೇಲೆ E2EE ಆಗಿರುತ್ತವೆ';

  @override
  String get onboardingChannelsFeatDirectsLabel => 'Directs';

  @override
  String get onboardingChannelsFeatDirectsHint =>
      'Private E2EE conversations with verified peers.';

  @override
  String get onboardingChannelsFeatMeshLabel => '#mesh';

  @override
  String get onboardingChannelsFeatMeshHint =>
      'Public sealed posts to nearby mesh peers.';

  @override
  String get onboardingChannelsFeatGeoLabel => 'Area';

  @override
  String get onboardingChannelsFeatGeoHint =>
      'Public posts scoped to your selected geohash cell.';

  @override
  String get onboardingChannelsFeatPinLabel => 'Pin';

  @override
  String get onboardingChannelsFeatPinHint =>
      'Pin a channel so Community opens on that feed next time.';

  @override
  String get onboardingToolbarTitle => 'Community toolbar';

  @override
  String get onboardingToolbarBody =>
      'App bar icons control location, transport, notices, unread Directs, online people, and the overflow menu (Wi‑Fi, recover, info, announcements, settings, identity).';

  @override
  String get onboardingToolbarFeatLocationLabel => 'Location';

  @override
  String get onboardingToolbarFeatLocationHint =>
      'Open the Area sheet: precision, pin cells, teleport geohash, refresh GPS.';

  @override
  String get onboardingToolbarFeatTransportLabel => 'Transport';

  @override
  String get onboardingToolbarFeatTransportHint =>
      'Choose Mesh, Internet, or Auto for how public traffic is carried.';

  @override
  String get onboardingToolbarFeatNoticesLabel => 'Notices';

  @override
  String get onboardingToolbarFeatNoticesHint =>
      'Post and browse geo/mesh notices; open chat or block from an item.';

  @override
  String get onboardingToolbarFeatUnreadLabel => 'Unread';

  @override
  String get onboardingToolbarFeatUnreadHint =>
      'Jump back to Directs when private messages are waiting.';

  @override
  String get onboardingToolbarFeatPeopleLabel => 'People';

  @override
  String get onboardingToolbarFeatPeopleHint =>
      'See who is online nearby and open a Direct chat.';

  @override
  String get onboardingToolbarFeatMenuLabel => 'Menu';

  @override
  String get onboardingToolbarFeatMenuHint =>
      '⋮ opens Local Wi‑Fi, Hard recover, Info, Announcements, Settings, Identity.';

  @override
  String get onboardingComposeTitle => 'Public compose';

  @override
  String get onboardingComposeBody =>
      'On #mesh or Area, the bottom bar attaches an image, records voice, sends text, and sets message expiry (1d / 3d / 7d / ∞).';

  @override
  String get onboardingComposeFeatImageLabel => 'Image';

  @override
  String get onboardingComposeFeatImageHint =>
      'Attach a photo to a sealed public post.';

  @override
  String get onboardingComposeFeatVoiceLabel => 'Voice';

  @override
  String get onboardingComposeFeatVoiceHint =>
      'Record and send a short voice clip on the public feed.';

  @override
  String get onboardingComposeFeatSendLabel => 'Send';

  @override
  String get onboardingComposeFeatSendHint =>
      'Publish your text to the selected public channel.';

  @override
  String get onboardingComposeFeatExpiryLabel => 'Expiry';

  @override
  String get onboardingComposeFeatExpiryHint =>
      'Pick how long the post should remain before local expiry.';

  @override
  String get onboardingChatTitle => 'Direct chat controls';

  @override
  String get onboardingChatBody =>
      'In a Direct chat you can scan to verify, block, set an alias, accept a pending peer key, then send mic / image / emoji / text. Long-press a message to copy, retry, or delete locally.';

  @override
  String get onboardingChatFeatScanLabel => 'Scan';

  @override
  String get onboardingChatFeatScanHint =>
      'Scan this peer’s QR if their verified key is still missing.';

  @override
  String get onboardingChatFeatBlockLabel => 'Block';

  @override
  String get onboardingChatFeatBlockHint =>
      'Stop notifications and relay for this sender.';

  @override
  String get onboardingChatFeatAliasLabel => 'Alias';

  @override
  String get onboardingChatFeatAliasHint =>
      'Give the peer a nickname only you see.';

  @override
  String get onboardingChatFeatAcceptKeyLabel => 'Accept';

  @override
  String get onboardingChatFeatAcceptKeyHint =>
      'Confirm a pending public key before messaging.';

  @override
  String get onboardingChatFeatMicLabel => 'Mic';

  @override
  String get onboardingChatFeatMicHint =>
      'Push-to-talk voice note, sealed for this peer.';

  @override
  String get onboardingChatFeatImageLabel => 'Image';

  @override
  String get onboardingChatFeatImageHint =>
      'Send an encrypted photo in the Direct thread.';

  @override
  String get onboardingChatFeatEmojiLabel => 'Emoji';

  @override
  String get onboardingChatFeatEmojiHint =>
      'Open the emoji picker for the compose field.';

  @override
  String get onboardingChatFeatSendLabel => 'Send';

  @override
  String get onboardingChatFeatSendHint =>
      'Encrypt and route the text message to this peer.';

  @override
  String get onboardingAnnounceTitle => 'Announcement boards';

  @override
  String get onboardingAnnounceBody =>
      'Create or follow boards, scan invite QR, approve key requests, toggle locked/open posting, then post image/emoji/text and share invites.';

  @override
  String get onboardingAnnounceFeatCreateLabel => 'Create';

  @override
  String get onboardingAnnounceFeatCreateHint =>
      'Start a new announcement board you control.';

  @override
  String get onboardingAnnounceFeatScanLabel => 'Scan';

  @override
  String get onboardingAnnounceFeatScanHint =>
      'Scan a board invite QR or follow a deep link.';

  @override
  String get onboardingAnnounceFeatAccessLabel => 'Access';

  @override
  String get onboardingAnnounceFeatAccessHint =>
      'Request access, approve/deny key requests, lock or open posting.';

  @override
  String get onboardingAnnounceFeatPostLabel => 'Post';

  @override
  String get onboardingAnnounceFeatPostHint =>
      'Publish to the board with image, emoji, or text.';

  @override
  String get onboardingWifiTitle => 'Local Wi‑Fi link';

  @override
  String get onboardingWifiBody =>
      'From Settings or the ⋮ menu, host or join a LAN ResilNet link to chat with peers on the same Wi‑Fi without the internet.';

  @override
  String get onboardingWifiFeatHostLabel => 'Host';

  @override
  String get onboardingWifiFeatHostHint =>
      'Start a Local Wi‑Fi session others on the LAN can discover.';

  @override
  String get onboardingWifiFeatJoinLabel => 'Join';

  @override
  String get onboardingWifiFeatJoinHint =>
      'Discover and join a host on your local network.';

  @override
  String get onboardingWifiFeatChatLabel => 'Chat';

  @override
  String get onboardingWifiFeatChatHint =>
      'Open Direct chat with a peer sighted on the LAN.';

  @override
  String get onboardingTransportTitle => 'Transport & sync';

  @override
  String get onboardingTransportBody =>
      'Settings and the transport picker choose Mesh / Internet / Auto, ensure BLE advertising, and reconnect Nostr with message expiry options.';

  @override
  String get onboardingTransportFeatMeshLabel => 'Mesh';

  @override
  String get onboardingTransportFeatMeshHint =>
      'Prefer BLE mesh for nearby delivery.';

  @override
  String get onboardingTransportFeatInternetLabel => 'Internet';

  @override
  String get onboardingTransportFeatInternetHint =>
      'Prefer Nostr / internet paths when available.';

  @override
  String get onboardingTransportFeatAutoLabel => 'Auto';

  @override
  String get onboardingTransportFeatAutoHint =>
      'Let ResilNet pick mesh or internet based on conditions.';

  @override
  String get onboardingTransportFeatBleLabel => 'BLE';

  @override
  String get onboardingTransportFeatBleHint =>
      'Ensure BLE mesh advertising/scanning is active.';

  @override
  String get onboardingTransportFeatNostrLabel => 'Nostr';

  @override
  String get onboardingTransportFeatNostrHint =>
      'Reconnect relays and set how long synced posts live.';

  @override
  String get onboardingGeoTitle => 'Area & geohash';

  @override
  String get onboardingGeoBody =>
      'The location sheet sets GPS cell precision, pins areas you care about, teleports to a geohash, and refreshes your current cell for Area chat.';

  @override
  String get onboardingGeoFeatGpsLabel => 'GPS';

  @override
  String get onboardingGeoFeatGpsHint =>
      'Refresh your current geohash from GPS.';

  @override
  String get onboardingGeoFeatPrecisionLabel => 'Precision';

  @override
  String get onboardingGeoFeatPrecisionHint =>
      'Widen or tighten the Area cell size.';

  @override
  String get onboardingGeoFeatTeleportLabel => 'Teleport';

  @override
  String get onboardingGeoFeatTeleportHint =>
      'Jump to a geohash string without moving physically.';

  @override
  String get onboardingGeoFeatPinLabel => 'Pin';

  @override
  String get onboardingGeoFeatPinHint =>
      'Pin favorite Area cells for quick return.';

  @override
  String get onboardingAdvancedTitle => 'Bridges & hardware';

  @override
  String get onboardingAdvancedBody =>
      'Settings opens Mesh topology, Meshtastic MQTT bridge, ESP32 firmware download + BLE OTA, and LXMF home-node bridge for radio/mule links.';

  @override
  String get onboardingAdvancedFeatTopoLabel => 'Topology';

  @override
  String get onboardingAdvancedFeatTopoHint =>
      'Visualize mesh nodes and tap a node to open chat.';

  @override
  String get onboardingAdvancedFeatMtLabel => 'Meshtastic';

  @override
  String get onboardingAdvancedFeatMtHint =>
      'Bridge via MQTT topics, relay, and simulate ingest/egress.';

  @override
  String get onboardingAdvancedFeatEspLabel => 'ESP32';

  @override
  String get onboardingAdvancedFeatEspHint =>
      'Download firmware bins and flash over BLE OTA.';

  @override
  String get onboardingAdvancedFeatLxmfLabel => 'LXMF';

  @override
  String get onboardingAdvancedFeatLxmfHint =>
      'Enable a home-node bridge and manage destination links.';

  @override
  String get onboardingSecurityTitle => 'Safety & recovery';

  @override
  String get onboardingSecurityBody =>
      'Settings covers notifications, screenshot alerts, save history, clear messages, panic wipe, hard recover, session reset, language, and docs.';

  @override
  String get onboardingSecurityFeatNotifLabel => 'Alerts';

  @override
  String get onboardingSecurityFeatNotifHint => 'Toggle message notifications.';

  @override
  String get onboardingSecurityFeatShotLabel => 'Screenshot';

  @override
  String get onboardingSecurityFeatShotHint =>
      'Warn when a screenshot is taken while chatting.';

  @override
  String get onboardingSecurityFeatHistoryLabel => 'History';

  @override
  String get onboardingSecurityFeatHistoryHint =>
      'Choose whether chats are kept on disk.';

  @override
  String get onboardingSecurityFeatPanicLabel => 'Panic';

  @override
  String get onboardingSecurityFeatPanicHint =>
      'Wipe local secrets and messages in an emergency.';

  @override
  String get onboardingSecurityFeatRecoverLabel => 'Recover';

  @override
  String get onboardingSecurityFeatRecoverHint =>
      'Hard recover or session reset if the app is stuck.';

  @override
  String get onboardingSecurityFeatDocsLabel => 'Docs';

  @override
  String get onboardingSecurityFeatDocsHint =>
      'Open the in-app guide and info sheets.';

  @override
  String get onboardingWatchTitle => 'Apple Watch';

  @override
  String get onboardingWatchBody =>
      'Pair an Apple Watch to see mesh status, recent Directs, and send short encrypted texts. The Watch uses your iPhone for crypto and mesh routing.';

  @override
  String get onboardingWatchFeatStatusLabel => 'Status';

  @override
  String get onboardingWatchFeatStatusHint =>
      'Glance transport mode, online peers, and your short id.';

  @override
  String get onboardingWatchFeatChatsLabel => 'Chats';

  @override
  String get onboardingWatchFeatChatsHint =>
      'Browse recent Direct threads and unread counts.';

  @override
  String get onboardingWatchFeatSendLabel => 'Send';

  @override
  String get onboardingWatchFeatSendHint =>
      'Type a short message (≈160 chars); iPhone seals and routes it.';

  @override
  String get onboardingReadyTitle => 'You’re ready';

  @override
  String get onboardingReadyBody =>
      'Tap Get started to enter Community, or Skip anytime from the top. You can revisit Settings → Docs if you need a refresher.';

  @override
  String get onboardingReadyFeatStartLabel => 'Start';

  @override
  String get onboardingReadyFeatStartHint =>
      'Finish onboarding and open the Community home.';

  @override
  String get onboardingReadyFeatSkipLabel => 'Skip';

  @override
  String get onboardingReadyFeatSkipHint =>
      'Skip is always available on every page to enter immediately.';

  @override
  String get chatTitle => 'ಚಾಟ್ (E2EE)';

  @override
  String get chatScanTooltip => 'ಪೀರ್ ಅನ್ನು ಸೇರಿಸಲು QR ಅನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get chatBlockTooltip => 'ಈ ಕಳುಹಿಸುವವರನ್ನು ನಿರ್ಬಂಧಿಸಿ';

  @override
  String get chatBlockedSnack =>
      'ನಿರ್ಬಂಧಿಸಲಾಗಿದೆ: ಯಾವುದೇ ಅಧಿಸೂಚನೆಗಳಿಲ್ಲ / ರಿಲೇ ಇಲ್ಲ';

  @override
  String get chatAliasTooltip => 'ಅಡ್ಡಹೆಸರನ್ನು ಹೊಂದಿಸಿ';

  @override
  String get chatReceiverPemLabel => 'ಸ್ವೀಕರಿಸುವವರ ಸಾರ್ವಜನಿಕ ಕೀ (PEM)';

  @override
  String get chatReceiverPemHint =>
      'ನಿಮ್ಮ ಸ್ನೇಹಿತರ ಸಾರ್ವಜನಿಕ ಕೀಲಿಯನ್ನು ಅಂಟಿಸಿ (QR / ಹಂಚಿದ ಫೈಲ್‌ನಿಂದ)';

  @override
  String get chatNeedPeerKey =>
      'ಈ ಪೀರ್‌ನ QR ಅನ್ನು ಮೊದಲು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ (ಪರಿಶೀಲಿಸಿದ ಸಾರ್ವಜನಿಕ ಕೀ ಅಗತ್ಯವಿದೆ)';

  @override
  String get chatPeerKeyMismatch =>
      'ಸಂಗ್ರಹಿಸಲಾದ ಸಾರ್ವಜನಿಕ ಕೀಲಿಯು ಈ ಪೀರ್ ಐಡಿಗೆ ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String chatVoiceFailed(String error) {
    return 'ಆಡಿಯೋ ರೆಕಾರ್ಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'ಧ್ವನಿ ಟಿಪ್ಪಣಿಯನ್ನು ಪ್ಲೇ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String get chatPlayVoice => 'ಧ್ವನಿ ಟಿಪ್ಪಣಿಯನ್ನು ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get chatPauseVoice => 'ವಿರಾಮ';

  @override
  String get chatVoiceLabelSent => '🎤 ಧ್ವನಿ ಟಿಪ್ಪಣಿ (ಮೊಹರು)';

  @override
  String get chatVoiceLabel => '🎤 ಧ್ವನಿ ಟಿಪ್ಪಣಿ';

  @override
  String get chatDecryptFailed => '[ಡಿಕ್ರಿಪ್ಶನ್ ವಿಫಲವಾಗಿದೆ]';

  @override
  String chatSentSealed(String preview) {
    return '[ಮೊಹರು • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[ಮೊಹರು]';

  @override
  String get chatComposeHint =>
      'ಸಂದೇಶವನ್ನು ಟೈಪ್ ಮಾಡಿ... (ಕಳುಹಿಸಲು ಮುಚ್ಚಲಾಗಿದೆ)';

  @override
  String get chatEmptyThread =>
      'ಇನ್ನೂ ಯಾವುದೇ ಸಂದೇಶಗಳಿಲ್ಲ\nಜಾಲರಿಯ ಮೇಲೆ ಕಳುಹಿಸಲು ಕೆಳಗೆ ಟೈಪ್ ಮಾಡಿ';

  @override
  String chatLoadFailed(String error) {
    return 'ಸಂಭಾಷಣೆಯನ್ನು ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String get chatEmojiTooltip => 'ಎಮೋಜಿ';

  @override
  String get statusPending => 'ಬಾಕಿಯಿದೆ';

  @override
  String get statusSent => 'ಕಳುಹಿಸಲಾಗಿದೆ';

  @override
  String get statusRelayed => 'ಪ್ರಸಾರ ಮಾಡಲಾಗಿದೆ';

  @override
  String get statusDelivered => 'ವಿತರಿಸಲಾಗಿದೆ';

  @override
  String get statusRead => 'ಓದು';

  @override
  String get statusFailed => 'ವಿಫಲವಾಗಿದೆ';

  @override
  String get chatCopy => 'ನಕಲು ಮಾಡಿ';

  @override
  String get chatDeleteLocal => 'ಈ ಸಾಧನದಲ್ಲಿ ಅಳಿಸಿ';

  @override
  String get chatDeletedLocalSnack => 'ಈ ಸಾಧನದಲ್ಲಿ ಅಳಿಸಲಾಗಿದೆ';

  @override
  String get chatRetry => 'ಮರುಪ್ರಯತ್ನಿಸಿ';

  @override
  String get chatSendFailed => 'ವಿತರಿಸಲಾಗಿಲ್ಲ - ಮರುಪ್ರಯತ್ನಿಸಿ ಟ್ಯಾಪ್ ಮಾಡಿ';

  @override
  String get chatImageNeedInternet =>
      'ಚಿತ್ರಗಳನ್ನು ಕಳುಹಿಸಲು ಇಂಟರ್ನೆಟ್‌ಗೆ ಸಂಪರ್ಕಪಡಿಸಿ';

  @override
  String get chatImageTooLargeOnline =>
      'ಕಳುಹಿಸಲು ಸಾಕಷ್ಟು ಚಿತ್ರವನ್ನು ಕುಗ್ಗಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ';

  @override
  String get chatOpenLinkFailed => 'ಲಿಂಕ್ ತೆರೆಯಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ';

  @override
  String get identityTitle => 'ಗುರುತು';

  @override
  String get identityScanTooltip => 'ಕ್ಯಾಮೆರಾದೊಂದಿಗೆ QR ಅನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get identityCopiedHash => 'ಸಾರ್ವಜನಿಕ ಕೀ ಹ್ಯಾಶ್ ನಕಲಿಸಲಾಗಿದೆ';

  @override
  String get identityPeerSaved => 'QR ನಿಂದ ಪೀರ್ ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get identityGalleryDenied => 'ಫೋಟೋ ಲೈಬ್ರರಿ ಅನುಮತಿಯನ್ನು ನಿರಾಕರಿಸಲಾಗಿದೆ';

  @override
  String get identityQrSaved => 'QR ಅನ್ನು ಫೋಟೋ ಲೈಬ್ರರಿಗೆ ಉಳಿಸಲಾಗಿದೆ';

  @override
  String identityQrSaveFailed(String error) {
    return 'QR ಅನ್ನು ಉಳಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String get peersTitle => 'ನೆಟ್ವರ್ಕ್ ಸದಸ್ಯರು';

  @override
  String get qrScanTitle => 'ಸ್ನೇಹಿತರನ್ನು ಸೇರಿಸಲು QR ಅನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get qrInvalid => 'ಸ್ಕ್ಯಾನ್ ವಿಫಲವಾಗಿದೆ: ಅಮಾನ್ಯ QR';

  @override
  String get qrIdKeyMismatch =>
      'QR ತಿರಸ್ಕರಿಸಲಾಗಿದೆ: ಐಡಿ ಸಾರ್ವಜನಿಕ ಕೀಗೆ ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String get qrCameraNotReady => 'ಕ್ಯಾಮರಾ ಸಿದ್ಧವಾಗಿಲ್ಲ';

  @override
  String get qrRetrySettings => 'ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ / ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ತೆರೆಯಿರಿ';

  @override
  String qrCameraOpenFailed(String error) {
    return 'ಕ್ಯಾಮರಾವನ್ನು ತೆರೆಯಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String get qrScanAlignHint => 'ಫ್ರೇಮ್ ಒಳಗೆ QR ಕೋಡ್ ಅನ್ನು ಹೊಂದಿಸಿ';

  @override
  String get firmwareDownloadTitle => 'ESP32 ಫರ್ಮ್‌ವೇರ್ ಅನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಿ';

  @override
  String get firmwareSourceOnline => 'ಇತ್ತೀಚಿನ (ಆನ್‌ಲೈನ್)';

  @override
  String get firmwareSourceCached => 'ಉಳಿಸಿದ ನಕಲು (ಆಫ್‌ಲೈನ್)';

  @override
  String get firmwareSourceBaseline => 'ಬಂಡಲ್ ಬೇಸ್‌ಲೈನ್ (ಆಫ್‌ಲೈನ್)';

  @override
  String get firmwareSourceUnavailable => 'ಯಾವುದೇ ಫರ್ಮ್‌ವೇರ್ ಲಭ್ಯವಿಲ್ಲ';

  @override
  String get firmwareBaselineIncompatible =>
      'ಬಂಡಲ್ ಮಾಡಿದ ಫರ್ಮ್‌ವೇರ್ ತುಂಬಾ ಹಳೆಯದಾಗಿದೆ - ಹೊಸ ಆವೃತ್ತಿಯನ್ನು ಡೌನ್‌ಲೋಡ್ ಮಾಡಲು ಇಂಟರ್ನೆಟ್‌ಗೆ ಸಂಪರ್ಕಪಡಿಸಿ';

  @override
  String get firmwareChecksumFailed =>
      'ಫರ್ಮ್‌ವೇರ್ ಸಮಗ್ರತೆಯ ಪರಿಶೀಲನೆ ವಿಫಲವಾಗಿದೆ - ಮಿನುಗುವಿಕೆಯನ್ನು ನಿರ್ಬಂಧಿಸಲಾಗಿದೆ';

  @override
  String firmwareReadyFromSource(String source) {
    return 'ಫರ್ಮ್‌ವೇರ್ ಸಿದ್ಧವಾಗಿದೆ: $source';
  }

  @override
  String get peersRefreshTooltip => 'ರಿಫ್ರೆಶ್ ಮಾಡಿ';

  @override
  String get peersBlocked => 'ನಿರ್ಬಂಧಿಸಲಾಗಿದೆ';

  @override
  String get peersNearbyBle => 'ಹತ್ತಿರದ (BLE)';

  @override
  String get peersRecentlyOnline => 'ಇತ್ತೀಚೆಗೆ ಆನ್‌ಲೈನ್';

  @override
  String get peersOnlineInArea => 'ಪ್ರದೇಶದಲ್ಲಿ ಆನ್‌ಲೈನ್';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return '$minutes ನಿಮಿಷಗಳ ಹಿಂದೆ ನೋಡಲಾಗಿದೆ';
  }

  @override
  String get peersOffline => 'ಆಫ್‌ಲೈನ್';

  @override
  String peersBlockedSnack(String id) {
    return 'ನಿರ್ಬಂಧಿಸಲಾಗಿದೆ $id';
  }

  @override
  String get peersUnblockedSnack => 'ಅನಿರ್ಬಂಧಿಸಲಾಗಿದೆ';

  @override
  String get peersEmpty =>
      'ಡೇಟಾಬೇಸ್‌ನಲ್ಲಿ ಇನ್ನೂ ಯಾವುದೇ ಸದಸ್ಯರು ಇಲ್ಲ\nQR ಅನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ ಅಥವಾ BLE ಮೆಶ್ ಅನ್ವೇಷಣೆಗಾಗಿ ನಿರೀಕ್ಷಿಸಿ';

  @override
  String get peersOpenChat => 'ಚಾಟ್ ತೆರೆಯಿರಿ';

  @override
  String get peersBlockAction => 'ನಿರ್ಬಂಧಿಸಿ';

  @override
  String get peersUnblockAction => 'ಅನಿರ್ಬಂಧಿಸಿ';

  @override
  String get channelPickerTooltip => 'ಚಾಟ್ / #ಮೆಶ್ / ಪ್ರದೇಶ';

  @override
  String get locationPickerTooltip => 'ಸ್ಥಳ ಚಾನಲ್';

  @override
  String get transportPickerTooltip => 'ಮೆಶ್ / ಇಂಟರ್ನೆಟ್ / ಆಟೋ';

  @override
  String get onlinePeopleTooltip => 'ಜನರು ಆನ್ಲೈನ್';

  @override
  String get unreadDirectsTooltipEmpty => 'ಖಾಸಗಿ ಸಂದೇಶಗಳು';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count ಓದದಿರುವ ಖಾಸಗಿ ಸಂದೇಶಗಳು';
  }

  @override
  String get onlinePeopleTitle => 'ಜನರು';

  @override
  String get onlinePeopleEmpty => 'ಇಲ್ಲಿ ಇನ್ನೂ ಯಾರೂ ಆನ್‌ಲೈನ್‌ನಲ್ಲಿಲ್ಲ';

  @override
  String onlinePeopleCount(int count) {
    return '$count ಆನ್‌ಲೈನ್';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · ಹತ್ತಿರದ + ಪ್ರದೇಶ';

  @override
  String get peerOnlineMeshTitle => 'ಮೆಶ್‌ನಲ್ಲಿ ಹತ್ತಿರದಲ್ಲಿ ಯಾರೋ ಒಬ್ಬರು';

  @override
  String peerOnlineMeshBody(String name) {
    return 'ಮೆಶ್‌ನಲ್ಲಿ $name ಸಮೀಪದಲ್ಲಿದೆ';
  }

  @override
  String get peerOnlineAreaTitle => 'ಪ್ರದೇಶದಲ್ಲಿ ಆನ್‌ಲೈನ್‌ನಲ್ಲಿ ಯಾರಾದರೂ';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name Nostr ಮೂಲಕ ಆನ್‌ಲೈನ್ ಆಗಿದೆ';
  }

  @override
  String get locationSheetTitle => '#ಸ್ಥಳ ಚಾನಲ್‌ಗಳು';

  @override
  String get channelPinsTitle => 'ಪಿನ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String get channelPinsHint =>
      'ನೀವು ಆಗಾಗ್ಗೆ ಬಳಸುವ ಚಾನಲ್‌ಗಳನ್ನು ಪಿನ್ ಮಾಡಿ - ಅವುಗಳು ಮೇಲ್ಭಾಗದಲ್ಲಿ ಉಳಿಯುತ್ತವೆ';

  @override
  String get channelPinTooltip => 'ಈ ಚಾನಲ್ ಅನ್ನು ಪಿನ್ ಮಾಡಿ';

  @override
  String get channelUnpinTooltip => 'ಅನ್‌ಪಿನ್ ಮಾಡಿ';

  @override
  String get locationSheetIntro =>
      'ಒರಟಾದ ಜಿಯೋಹಾಶ್ ಅನ್ನು ಬಳಸಿಕೊಂಡು ಹತ್ತಿರದ ಜನರೊಂದಿಗೆ ಚಾಟ್ ಮಾಡಿ — ನಿಖರವಾದ GPS ಅಲ್ಲ. ಇಂಟರ್ನೆಟ್‌ನಲ್ಲಿ ಇರುವಿಕೆಯು ಅನಾಮಧೇಯ Nostr ಕೀಗಳನ್ನು ಬಳಸುತ್ತದೆ.';

  @override
  String get locationMeshSubtitle => '#ಬ್ಲೂಟೂತ್ • ~10–50 ಮೀ';

  @override
  String get locationTeleportHint => '#ಜಿಯೋಹಾಶ್';

  @override
  String get locationTeleport => 'ಟೆಲಿಪೋರ್ಟ್';

  @override
  String homeComposeHint(String channel) {
    return 'ಸಂದೇಶ $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return '$channel ಗೆ ಕಳುಹಿಸಿ — ಸಾರ್ವಜನಿಕ';
  }

  @override
  String get messageExpiryTitle => 'ರಲ್ಲಿ ಮುಕ್ತಾಯಗೊಳ್ಳುತ್ತದೆ';

  @override
  String get voiceRecordTapToStart =>
      'ಧ್ವನಿ ಸಂದೇಶವನ್ನು ರೆಕಾರ್ಡ್ ಮಾಡಲು ಟ್ಯಾಪ್ ಮಾಡಿ';

  @override
  String get voiceRecordTooShort =>
      'ರೆಕಾರ್ಡಿಂಗ್ ತುಂಬಾ ಚಿಕ್ಕದಾಗಿದೆ - ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get voiceRecordFailed =>
      'ರೆಕಾರ್ಡಿಂಗ್ ಅನ್ನು ಉಳಿಸಲಾಗಲಿಲ್ಲ - ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get voicePttHold => 'ರೆಕಾರ್ಡ್ ಮಾಡಲು ಹಿಡಿದುಕೊಳ್ಳಿ';

  @override
  String get voicePttRelease => 'ಪೂರ್ವವೀಕ್ಷಣೆಗಾಗಿ ಬಿಡುಗಡೆ ಮಾಡಿ';

  @override
  String get voicePttRecording => 'ರೆಕಾರ್ಡಿಂಗ್…';

  @override
  String get voicePttDraftReady => 'ಧ್ವನಿ ಟಿಪ್ಪಣಿ ಸಿದ್ಧವಾಗಿದೆ';

  @override
  String get voicePttDiscard => 'ತಿರಸ್ಕರಿಸು';

  @override
  String get voicePttReRecord => 'ಮತ್ತೆ ರೆಕಾರ್ಡ್ ಮಾಡಿ';

  @override
  String get voicePttSend => 'ಧ್ವನಿ ಟಿಪ್ಪಣಿಯನ್ನು ಕಳುಹಿಸಿ';

  @override
  String get voicePttPlayPreview => 'ಪೂರ್ವವೀಕ್ಷಣೆ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get voicePttStopPreview => 'ಪೂರ್ವವೀಕ್ಷಣೆ ನಿಲ್ಲಿಸಿ';

  @override
  String get noticesBackfilling => 'ಸೂಚನೆಗಳನ್ನು ಲೋಡ್ ಮಾಡಲಾಗುತ್ತಿದೆ...';

  @override
  String get noticesNostrOnline => 'Nostr ಆನ್‌ಲೈನ್';

  @override
  String get noticesNostrOffline =>
      'Nostr ಆಫ್‌ಲೈನ್ - ಬುಲೆಟಿನ್‌ಗೆ ಇಂಟರ್ನೆಟ್ ಅಗತ್ಯವಿದೆ';

  @override
  String noticesBackfillLoaded(int count) {
    return '$count ಸೂಚನೆಗಳನ್ನು ಲೋಡ್ ಮಾಡಲಾಗಿದೆ';
  }

  @override
  String get noticePublishFailed =>
      'ಪ್ರದೇಶ ಮಂಡಳಿಗೆ ಸೂಚನೆ ಪ್ರಕಟಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ. Nostr ಸಂಪರ್ಕವನ್ನು ಪರಿಶೀಲಿಸಿ.';

  @override
  String get noticeMeshPublishNoLink =>
      'ಸ್ಥಳೀಯವಾಗಿ ಉಳಿಸಲಾಗಿದೆ. ಹತ್ತಿರದ ಮೆಶ್ ರೇಡಿಯೊಕ್ಕೆ (ಅಥವಾ Wi‑Fi ಗೇಟ್‌ವೇ) ಸಂಪರ್ಕಪಡಿಸಿ ಇದರಿಂದ ಇತರರು ಅದನ್ನು ಸ್ವೀಕರಿಸಬಹುದು.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'BLE ಕ್ಕಿಂತ $count ಹತ್ತಿರದ ಸಾಧನ(ಗಳಿಗೆ) ಬುಲೆಟಿನ್ ಕಳುಹಿಸಲಾಗಿದೆ.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'ಹತ್ತಿರದ ರೇಡಿಯೋಗಳನ್ನು ನೋಡಲಾಗಿದೆ, ಆದರೆ BLE ಬರೆಯಲು ವಿಫಲವಾಗಿದೆ. ಸೂಚನೆಗಳ ಪರದೆಯಲ್ಲಿ ಎರಡೂ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ತೆರೆಯಿರಿ ಮತ್ತು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ (ಅಥವಾ ESP32 ರಿಲೇ ಬಳಸಿ).';

  @override
  String get noticeMeshPublishNoGatt =>
      'ಈ ಸಾಧನದ BLE ರಿಸೀವರ್ ಸಿದ್ಧವಾಗಿಲ್ಲ. ಬ್ಲೂಟೂತ್ ಅನ್ನು ಟಾಗಲ್ ಮಾಡಿ ಮತ್ತು ನೋಟಿಸ್‌ಗಳನ್ನು ಪುನಃ ತೆರೆಯಿರಿ.';

  @override
  String get noticeDelete => 'ಸೂಚನೆ ಅಳಿಸಿ';

  @override
  String get noticeDeleteConfirmTitle => 'ಈ ಸೂಚನೆಯನ್ನು ಅಳಿಸುವುದೇ?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'ಇದು ಈ ಸಾಧನದಲ್ಲಿ ಮಾತ್ರ ಅದನ್ನು ತೆಗೆದುಹಾಕುತ್ತದೆ. ಈಗಾಗಲೇ ಅದನ್ನು ಸ್ವೀಕರಿಸಿದ ಇತರರು ಅದನ್ನು ಇನ್ನೂ ನೋಡುತ್ತಾರೆ.';

  @override
  String get noticeDeleted => 'ಸೂಚನೆ ಅಳಿಸಲಾಗಿದೆ';

  @override
  String get chatNoticeHidden => 'ಪ್ರದೇಶ ಸೂಚನೆ - ತೆರೆದ ಸೂಚನೆಗಳು';

  @override
  String get identityDisplayNameTitle => 'ಪ್ರದರ್ಶನ ಹೆಸರು';

  @override
  String get identitySaveName => 'ಹೆಸರನ್ನು ಉಳಿಸಿ';

  @override
  String get identityUserIdLabel => 'ಬಳಕೆದಾರ ಐಡಿ (ಸಾರ್ವಜನಿಕ ಕೀ ಹ್ಯಾಶ್)';

  @override
  String get identityCopyHashTooltip => 'ಸಾರ್ವಜನಿಕ ಕೀ ಹ್ಯಾಶ್ ಅನ್ನು ನಕಲಿಸಿ';

  @override
  String get identityMyQrTitle => 'ನನ್ನ QR (id + pubKey + ಹೆಸರು)';

  @override
  String identityQrFailed(String error) {
    return 'QR ರಚಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ\n$error';
  }

  @override
  String get identitySaving => 'ಉಳಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get identitySaveQr => 'ಫೋಟೋ ಲೈಬ್ರರಿಗೆ QR ಅನ್ನು ಉಳಿಸಿ';

  @override
  String get identityOpenScanner => 'QR ಅನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಲು ಕ್ಯಾಮರಾ ತೆರೆಯಿರಿ';

  @override
  String get identityQrHelp =>
      'ನಿಮ್ಮ ಸಾರ್ವಜನಿಕ ಕೀಲಿಯನ್ನು ಉಳಿಸಲು ಮತ್ತು (ಅಗತ್ಯವಿದ್ದರೆ) ನಿಮ್ಮನ್ನು ಪರಿಶೀಲಿಸಿದ ವಿತರಕರಾಗಿ ಹೊಂದಿಸಲು ಸ್ನೇಹಿತರಿಗೆ ಇದನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get identityChatTip =>
      'ಸಲಹೆ: E2EE ಗಾಗಿ ಸಾರ್ವಜನಿಕ ಕೀಲಿಯನ್ನು ಸೇರಿಸಲು ನೀವು ಚಾಟ್‌ನಲ್ಲಿ QR ಅನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಬಹುದು';

  @override
  String get infoOpen => 'ಬಗ್ಗೆ / ಮಾಹಿತಿ';

  @override
  String get docsGuideTitle => 'ಬಳಕೆದಾರ ಮಾರ್ಗದರ್ಶಿ';

  @override
  String get docsGuideSubtitle => 'ಬ್ರೌಸರ್‌ನಲ್ಲಿ ತೆರೆಯುತ್ತದೆ';

  @override
  String get docsOpenAction => 'ಮಾರ್ಗದರ್ಶಿ ತೆರೆಯಿರಿ';

  @override
  String get docsOpenFailed => 'ಬಳಕೆದಾರರ ಮಾರ್ಗದರ್ಶಿ ತೆರೆಯಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ';

  @override
  String get firmwareOtaGuideTitle => 'ಫ್ಲ್ಯಾಶ್ ಗೈಡ್ ಮತ್ತು OTA ಪ್ರೋಟೋಕಾಲ್';

  @override
  String get firmwareOtaGuideSubtitle =>
      'ವೆಬ್ ಮಾರ್ಗದರ್ಶಿ ತೆರೆಯುತ್ತದೆ — .bin ಡೌನ್‌ಲೋಡ್‌ಗಳು ಮತ್ತು ಪೂರ್ಣ ಹಂತಗಳು';

  @override
  String get firmwareWebDownloadsTitle => 'ವೆಬ್‌ನಲ್ಲಿ ಫರ್ಮ್‌ವೇರ್ ಡೌನ್‌ಲೋಡ್‌ಗಳು';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'ಡಾಕ್ಸ್ ಸೈಟ್‌ನಲ್ಲಿ ಪ್ರತಿ-ವರ್ಷದ ಲಿಂಕ್‌ಗಳು ಮತ್ತು ಚೆಕ್ಸಮ್‌ಗಳು';

  @override
  String get inviteCopyShortLink => 'ಕಿರು ಲಿಂಕ್ ನಕಲಿಸಿ';

  @override
  String get inviteShareLink => 'ಲಿಂಕ್ ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String get inviteShowFullLink => 'ಪೂರ್ಣ ಲಿಂಕ್';

  @override
  String get inviteCopyFullLink => 'ಸಂಪೂರ್ಣ ಲಿಂಕ್ ಅನ್ನು ನಕಲಿಸಿ';

  @override
  String get inviteLinkCopied => 'ಲಿಂಕ್ ಕಾಪಿ ಮಾಡಲಾಗಿದೆ!';

  @override
  String get inviteLongPressHint => 'ಲಿಂಕ್ ಕ್ರಿಯೆಗಳಿಗೆ ದೀರ್ಘ-ಪ್ರೆಸ್';

  @override
  String get inviteSendInChat => 'ResilNet ಚಾಟ್‌ನಲ್ಲಿ ಕಳುಹಿಸಿ...';

  @override
  String get inviteSendInChatHint =>
      'ನೀವು ಈಗಾಗಲೇ ಸಾರ್ವಜನಿಕ ಕೀ ಹೊಂದಿರುವ ಜನರಿಗೆ ಮಾತ್ರ';

  @override
  String get inviteSendInChatEmpty =>
      'ಇನ್ನೂ ಯಾವುದೇ ಸಂದೇಶ ಕಳುಹಿಸಬಹುದಾದ ಚಾಟ್‌ಗಳಿಲ್ಲ.\nQR ಅನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ, ಪ್ರದೇಶ/ಮೆಶ್ ತೆರೆಯಿರಿ ಅಥವಾ ಅಪ್ಲಿಕೇಶನ್‌ನ ಹೊರಗೆ ಲಿಂಕ್ ಅನ್ನು ಮೊದಲು ಹಂಚಿಕೊಳ್ಳಿ.';

  @override
  String get inviteSentToChat => 'ಆಹ್ವಾನವನ್ನು ಚಾಟ್‌ನಲ್ಲಿ ಕಳುಹಿಸಲಾಗಿದೆ';

  @override
  String get infoTabInfo => 'ಮಾಹಿತಿ';

  @override
  String get infoTabSettingsHint =>
      'ಭಾಷೆ, E2EE ಮತ್ತು ಡೇಟಾ ಪರಿಕರಗಳಿಗಾಗಿ ಮೆನುವಿನಿಂದ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ತೆರೆಯಿರಿ';

  @override
  String get infoHowToTitle => 'ಹೇಗೆ ಬಳಸುವುದು';

  @override
  String get infoHowToBody =>
      '• ಚಾಟ್ / #ಮೆಶ್ / ಏರಿಯಾ ಬದಲಾಯಿಸಲು ಚಾನಲ್ ಐಕಾನ್ ಅನ್ನು ಟ್ಯಾಪ್ ಮಾಡಿ\n• ಜಿಯೋಹಾಶ್ ಗಾತ್ರವನ್ನು ಆಯ್ಕೆ ಮಾಡಲು ಸ್ಥಳವನ್ನು ಟ್ಯಾಪ್ ಮಾಡಿ\n• ಸದಸ್ಯರಿಗಾಗಿ ಅಥವಾ ಆನ್‌ಲೈನ್‌ನಲ್ಲಿರುವ ಜನರನ್ನು ಟ್ಯಾಪ್ ಮಾಡಿ\n• ವೈಯಕ್ತಿಕವಾಗಿ ಕೀಗಳನ್ನು ವಿನಿಮಯ ಮಾಡಿಕೊಳ್ಳಲು ⋮ ನಿಂದ ಗುರುತು/QR ತೆರೆಯಿರಿ\n• ಪ್ರದೇಶ \"ಸಾರ್ವಜನಿಕ\" ಪ್ರತಿ ಆನ್‌ಲೈನ್ ಪೀರ್‌ಗೆ ಮೊಹರು ಮಾಡಿದ E2EE ಅನ್ನು ಕಳುಹಿಸುತ್ತದೆ - ಸರಳ ಪಠ್ಯ ಕೊಠಡಿ ಅಲ್ಲ';

  @override
  String get infoFeaturesTitle => 'ವೈಶಿಷ್ಟ್ಯಗಳು';

  @override
  String get infoFeatureOffline =>
      'ಬ್ಲೂಟೂತ್ ಲೋ ಎನರ್ಜಿ ಮೂಲಕ ಆಫ್‌ಲೈನ್ ಸಂದೇಶ ಕಳುಹಿಸುವಿಕೆ';

  @override
  String get infoFeatureE2ee =>
      'RSA-OAEP + AES-GCM ನೊಂದಿಗೆ ಎಂಡ್-ಟು-ಎಂಡ್ ಎನ್‌ಕ್ರಿಪ್ಶನ್ (ಶಬ್ದವಲ್ಲ)';

  @override
  String get infoFeatureMultihop =>
      'ದೂರದವರೆಗೆ ಹೋಗಲು ಹತ್ತಿರದ ಗೆಳೆಯರ ಮೂಲಕ ಸಂದೇಶಗಳು ಹಾಪ್ ಆಗಬಹುದು';

  @override
  String get infoFeatureBridge =>
      'ಮುಚ್ಚಿದ ಲಕೋಟೆಗಳಿಗಾಗಿ ಹೈಬ್ರಿಡ್ ಮೆಶ್ ↔ ಇಂಟರ್ನೆಟ್ (Nostr).';

  @override
  String get infoFeatureGeo =>
      'ಹತ್ತಿರದ ಜನರಿಗಾಗಿ ಸ್ಥಳೀಯ ಜಿಯೋಹಾಶ್ ಚಾನಲ್‌ಗಳು (ಡಿಸ್ಕವರಿ UX)';

  @override
  String get infoFeatureNotices =>
      '#ಮೆಶ್ ಮತ್ತು ಪ್ರದೇಶಕ್ಕೆ ಮುಕ್ತಾಯದೊಂದಿಗೆ ಸೂಚನೆಗಳು';

  @override
  String get infoPrivacyTitle => 'ಗೌಪ್ಯತೆ';

  @override
  String get infoPrivacyNoRoom =>
      'ತಂತಿಯ ಮೇಲೆ ಸರಳ ಪಠ್ಯ ಗ್ರಾಮ / ಸಾರ್ವಜನಿಕ ಚಾಟ್ ರೂಮ್ ಇಲ್ಲ';

  @override
  String get infoPrivacyFanout =>
      'ತಿಳಿದಿರುವ ಸಾರ್ವಜನಿಕ ಕೀಗಳನ್ನು ಹೊಂದಿರುವ ಗೆಳೆಯರಿಗೆ ಪ್ರದೇಶ ಕಳುಹಿಸುವಿಕೆ = 1:1 ಫ್ಯಾನ್-ಔಟ್ ಮೊಹರು';

  @override
  String get infoPrivacyPresence =>
      'ಇಂಟರ್ನೆಟ್ ಪ್ರದೇಶದ ಉಪಸ್ಥಿತಿಯು ಅಲ್ಪಕಾಲಿಕ Nostr ಕೀಗಳನ್ನು ಬಳಸುತ್ತದೆ';

  @override
  String get infoSymbolsTitle => 'ಚಿಹ್ನೆಗಳು';

  @override
  String get infoSymBle => 'ನೇರ ಬ್ಲೂಟೂತ್ ಲಿಂಕ್';

  @override
  String get infoSymMesh => 'ಮೆಶ್ ಮೂಲಕ ತಲುಪಬಹುದು (ಇತರರು ಮುಂದಕ್ಕೆ)';

  @override
  String get infoSymInternet => 'ಇಂಟರ್ನೆಟ್ ಮೂಲಕ (Nostr) — ಮುಚ್ಚಿದ ಲಕೋಟೆಗಳು';

  @override
  String get infoSymBridge => 'ಮೆಶ್↔ಇಂಟರ್ನೆಟ್ ಸೇತುವೆ ಮಾರ್ಗದ ಮೂಲಕ ಆಗಮಿಸಿದೆ';

  @override
  String get infoSymOffline => 'ಆಫ್‌ಲೈನ್ - ಇದೀಗ ತಲುಪಲು ಸಾಧ್ಯವಿಲ್ಲ';

  @override
  String get infoSymInArea => 'ಈ ಸ್ಥಳ ಚಾನಲ್‌ನ ಪ್ರದೇಶದಲ್ಲಿ';

  @override
  String get infoSymE2eeOk => 'ಎಂಡ್-ಟು-ಎಂಡ್ ಎನ್‌ಕ್ರಿಪ್ಟ್ ಮಾಡಿದ ಸೆಷನ್';

  @override
  String get infoSymE2eeFail =>
      'ಎನ್‌ಕ್ರಿಪ್ಶನ್ ಲಭ್ಯವಿಲ್ಲ - ಸೂಕ್ಷ್ಮ ಪಠ್ಯವನ್ನು ಕಳುಹಿಸಬೇಡಿ';

  @override
  String get infoSymVerified => 'ಗುರುತು ಪರಿಶೀಲಿಸಲಾಗಿದೆ / ತಿಳಿದಿರುವ ಕೀ';

  @override
  String get infoSymBlocked => 'ನಿರ್ಬಂಧಿಸಲಾಗಿದೆ';

  @override
  String get infoSymUnread => 'ಓದದ ಖಾಸಗಿ ಸಂದೇಶ';

  @override
  String get infoEmergencyTitle => 'ತುರ್ತು ಮೋಡ್';

  @override
  String get infoEmergencyBody =>
      'ಈ ಸಾಧನದಲ್ಲಿ ಸಂದೇಶಗಳು, ಕೀಗಳು ಮತ್ತು ಗುರುತನ್ನು ಅಳಿಸಲು ಮುಖಪುಟ ಪರದೆಯಲ್ಲಿ ResilNet ಶೀರ್ಷಿಕೆಯನ್ನು ಮೂರು ಬಾರಿ ಟ್ಯಾಪ್ ಮಾಡಿ.';

  @override
  String get infoLegendNote =>
      'ಸ್ಪಷ್ಟತೆಗಾಗಿ ಕೆಲವು ಮಾರ್ಗ ಐಕಾನ್‌ಗಳನ್ನು ಇಲ್ಲಿ ದಾಖಲಿಸಲಾಗಿದೆ; ಚಾಟ್‌ನಲ್ಲಿನ ಡೆಲಿವರಿ ಟಿಕ್‌ಗಳು ಪ್ರಾಥಮಿಕ ಕಳುಹಿಸುವ ಸ್ಥಿತಿಯಾಗಿ ಉಳಿಯುತ್ತವೆ.';

  @override
  String get dangerZoneTitle => 'ಅಪಾಯದ ವಲಯ';

  @override
  String get dangerZoneSubtitle =>
      'ಈ ಸಾಧನದಲ್ಲಿ ಸಂದೇಶಗಳು, ಎನ್‌ಕ್ರಿಪ್ಶನ್ ಕೀಗಳು, Nostr ಗುರುತು, ಗೆಳೆಯರು ಮತ್ತು ಅಡ್ಡಹೆಸರುಗಳನ್ನು ಅಳಿಸುತ್ತದೆ. ನೀವು ಮತ್ತೆ ಹೊಂದಿಸುವಿರಿ.';

  @override
  String get panicWipeTitle => 'ತುರ್ತು ಒರೆಸುವಿಕೆ';

  @override
  String get panicWipeSubtitle =>
      'ಸ್ಥಳೀಯ ಎಲ್ಲವನ್ನೂ ಅಳಿಸಿ - ಮನೆಯ ಶೀರ್ಷಿಕೆಯನ್ನು ಮೂರು ಬಾರಿ ಟ್ಯಾಪ್ ಮಾಡುವಂತೆಯೇ (ಡಬಲ್-ಟ್ಯಾಪ್ ರೇಡಿಯೊಗಳನ್ನು ರಿಫ್ರೆಶ್ ಮಾಡುತ್ತದೆ)';

  @override
  String get panicWipeConfirmTitle => 'ಎಲ್ಲಾ ಸ್ಥಳೀಯ ಡೇಟಾವನ್ನು ಅಳಿಸುವುದೇ?';

  @override
  String get panicWipeConfirmBody =>
      'ಇದು ಈ ಫೋನ್‌ನಲ್ಲಿರುವ ಚಾಟ್‌ಗಳು, ಕೀಗಳು ಮತ್ತು ಗುರುತನ್ನು ಶಾಶ್ವತವಾಗಿ ಅಳಿಸುತ್ತದೆ.\nಗೆಳೆಯರು ನಿಮ್ಮ ಹೊಸ ಗುರುತಿನೊಂದಿಗೆ QR ಕೀಗಳನ್ನು ಮರು ವಿನಿಮಯ ಮಾಡಿಕೊಳ್ಳಬೇಕು.\nಇದನ್ನು ರದ್ದುಗೊಳಿಸಲಾಗುವುದಿಲ್ಲ.';

  @override
  String get panicWipeAction => 'ಎಲ್ಲವನ್ನೂ ಒರೆಸಿ';

  @override
  String get panicWipeSnack =>
      'ಸ್ಥಳೀಯ ಗುರುತನ್ನು ಅಳಿಸಿಹಾಕಲಾಗಿದೆ - ಮತ್ತೆ ಹೊಂದಿಸಲಾಗಿದೆ';

  @override
  String panicWipeFailed(String error) {
    return 'ಅಳಿಸುವಿಕೆ ವಿಫಲವಾಗಿದೆ: $error';
  }

  @override
  String get meshBridgeTitle => 'ಜಾಲರಿ ಸೇತುವೆ';

  @override
  String get meshBridgeSubtitle =>
      'ಆನ್ ಆಗಿರುವಾಗ (ಡೀಫಾಲ್ಟ್), ಮೊಹರು ಮಾಡಿದ ಲಕೋಟೆಗಳು BLE ಮೆಶ್ ಮತ್ತು ಇಂಟರ್ನೆಟ್ (Nostr) ಎರಡನ್ನೂ ಒಟ್ಟಿಗೆ ಬಳಸಬಹುದು ಆದ್ದರಿಂದ ಹತ್ತಿರದ ಮೆಶ್ ದ್ವೀಪಗಳು ಸಂಪರ್ಕಿಸಬಹುದು. ಆಫ್ ಆಗಿರುವಾಗ, ಕಳುಹಿಸುವಿಕೆಯು ಒಂದು ಮಾರ್ಗವನ್ನು ಮಾತ್ರ ಬಳಸುತ್ತದೆ - ಎಂದಿಗೂ ಸರಳ ಪಠ್ಯವನ್ನು ತಂತಿಯ ಮೇಲೆ ಇರಿಸುವುದಿಲ್ಲ.';

  @override
  String get favoritesTitle => 'ಮೆಚ್ಚಿನವುಗಳು';

  @override
  String get favoritesAdd => 'ಮೆಚ್ಚಿನವುಗಳಿಗೆ ಸೇರಿಸಿ';

  @override
  String get favoritesRemove => 'ಮೆಚ್ಚಿನವುಗಳಿಂದ ತೆಗೆದುಹಾಕಿ';

  @override
  String get favoritesEmpty =>
      'ಇನ್ನೂ ಯಾವುದೇ ಮೆಚ್ಚಿನವುಗಳಿಲ್ಲ - ಸದಸ್ಯರ ಪಟ್ಟಿಯಿಂದ ಒಬ್ಬ ಗೆಳೆಯನಿಗೆ ನಕ್ಷತ್ರ ಹಾಕಿ';

  @override
  String get favoritesNearbyTitle => 'ಹತ್ತಿರದ ನೆಚ್ಚಿನ';

  @override
  String favoritesNearbyBody(String name) {
    return 'ಮೆಶ್‌ನಲ್ಲಿ $name ಸಮೀಪದಲ್ಲಿದೆ';
  }

  @override
  String get favoritesInAreaTitle => 'ಪ್ರದೇಶದಲ್ಲಿ ನೆಚ್ಚಿನ';

  @override
  String favoritesInAreaBody(String name) {
    return 'ಈ ಪ್ರದೇಶದಲ್ಲಿ $name ಆನ್‌ಲೈನ್‌ನಲ್ಲಿದೆ';
  }

  @override
  String get topologyTitle => 'ಮೆಶ್ ಟೋಪೋಲಜಿ';

  @override
  String get topologySubtitle =>
      'ಮೆಶ್‌ನಿಂದ ಗೆಳೆಯರು ಮತ್ತು ಸಂಪರ್ಕದ ಸುಳಿವುಗಳನ್ನು ಪ್ರಕಟಿಸಿ (ಓದಲು ಮಾತ್ರ)';

  @override
  String get topologyConnectedNow => 'ಈಗ ಸಂಪರ್ಕಗೊಂಡಿದೆ (BLE)';

  @override
  String get topologyNearby => 'ಹತ್ತಿರದ (BLE)';

  @override
  String get topologyKnown => 'ಪರಿಚಿತ ಗೆಳೆಯರು';

  @override
  String get topologyEmpty =>
      'ಯಾವುದೇ ಗೆಳೆಯರು ಇನ್ನೂ ಕಲಿತಿಲ್ಲ - BLE ಆನ್‌ನೊಂದಿಗೆ ಹತ್ತಿರದಲ್ಲಿರಿ';

  @override
  String get topologyYou => 'ನೀವು';

  @override
  String topologyStats(int peers, int links) {
    return '$peers ಗೆಳೆಯರು · $links ಲಿಂಕ್‌ಗಳು';
  }

  @override
  String get topologyGraphHint =>
      'ಹತ್ತಿರದ ಮೆಶ್ ಅನ್ವೇಷಣೆಯಿಂದ ಅಂದಾಜಿಸಲಾಗಿದೆ — ನಿಮ್ಮ ಸಾಧನವನ್ನು ಹೈಲೈಟ್ ಮಾಡಲಾಗಿದೆ. ಚಾಟ್ ತೆರೆಯಲು ಪೀರ್ ಅನ್ನು ಟ್ಯಾಪ್ ಮಾಡಿ.';

  @override
  String get topologyOpen => 'ಮೆಶ್ ಟೋಪೋಲಜಿ';

  @override
  String get slashHelpTitle => 'ಆಜ್ಞೆಗಳು';

  @override
  String get slashHelpBody =>
      '/ ಸಹಾಯ - ಈ ಪಟ್ಟಿ\n/ ಯಾರು - ಪ್ರಸ್ತುತ ಚಾನಲ್‌ನಲ್ಲಿ ಆನ್‌ಲೈನ್ ಜನರು\n/ ಡ್ರಾಪ್ <text> — ಇಲ್ಲಿ ಮೊಹರು ಮಾಡಿದ ಸೂಚನೆಯನ್ನು ಪಿನ್ ಮಾಡಿ (E2EE ಫ್ಯಾನ್-ಔಟ್)\n\nಪೂರ್ಣ ಮಾರ್ಗದರ್ಶಿ: ಕೆಳಗೆ ತೆರೆದ ಮಾರ್ಗದರ್ಶಿ ಬಳಸಿ, ಅಥವಾ ಸೆಟ್ಟಿಂಗ್‌ಗಳು → ಬಳಕೆದಾರ ಮಾರ್ಗದರ್ಶಿ.';

  @override
  String get slashWhoEmpty => 'ಈ ಚಾನಲ್‌ನಲ್ಲಿ ಇದೀಗ ಆನ್‌ಲೈನ್‌ನಲ್ಲಿ ಯಾರೂ ಇಲ್ಲ';

  @override
  String slashWhoTitle(int count) {
    return 'ಆನ್‌ಲೈನ್ ($count)';
  }

  @override
  String get slashDropNeedText => 'ಬಳಕೆ: / ನಿಮ್ಮ ಟಿಪ್ಪಣಿ ಪಠ್ಯವನ್ನು ಬಿಡಿ';

  @override
  String slashDropDone(String channel) {
    return '$channel ರಂದು ಸೂಚನೆಯನ್ನು ಕೈಬಿಡಲಾಗಿದೆ';
  }

  @override
  String get slashUnknown => 'ಅಜ್ಞಾತ ಆಜ್ಞೆ - ಪ್ರಯತ್ನಿಸಿ / ಸಹಾಯ';

  @override
  String get announceOpen => 'ಪ್ರಕಟಣೆಗಳು';

  @override
  String get announceTitle => 'ಪ್ರಕಟಣೆಗಳು';

  @override
  String get announceEmpty =>
      'ಇನ್ನೂ ಯಾವುದೇ ಬೋರ್ಡ್‌ಗಳಿಲ್ಲ - ಲಾಕ್ ಮಾಡಿದ ಅಥವಾ ತೆರೆದ ಸೂಚನೆಗಳನ್ನು ಪೋಸ್ಟ್ ಮಾಡಲು ಒಂದನ್ನು ರಚಿಸಿ';

  @override
  String get announceCreate => 'ಬೋರ್ಡ್ ರಚಿಸಿ';

  @override
  String get announceCreateHint => 'ಬೋರ್ಡ್ ಹೆಸರು';

  @override
  String get announceDefaultTitle => 'ಸಮುದಾಯ ಮಂಡಳಿ';

  @override
  String get announceSettings => 'ಬೋರ್ಡ್ ಸೆಟ್ಟಿಂಗ್ಗಳು';

  @override
  String get announceAllowLocked =>
      'ಲಾಕ್ ಮಾಡಿದ (ಎನ್‌ಕ್ರಿಪ್ಟ್ ಮಾಡಿದ) ಪೋಸ್ಟ್‌ಗಳನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get announceAllowLockedSub =>
      'ಬೋರ್ಡ್ ಕೀಗೆ ಎನ್‌ಕ್ರಿಪ್ಟ್ ಮಾಡಲಾಗಿದೆ - ಓದುಗರಿಗೆ ಪ್ರವೇಶದ ಅಗತ್ಯವಿದೆ';

  @override
  String get announceAllowOpen => 'ತೆರೆದ (ಸಾದಾ ಪಠ್ಯ) ಪೋಸ್ಟ್‌ಗಳನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get announceAllowOpenSub =>
      'E2EE ಅಲ್ಲ - ಮೆಶ್/ರಿಲೇಗಳಲ್ಲಿ ಓದಬಹುದಾಗಿದೆ. ಡೀಫಾಲ್ಟ್ ಆಗಿ ಆಫ್.';

  @override
  String get announceComposeHint => 'ಪ್ರಕಟಣೆಯನ್ನು ಬರೆಯಿರಿ...';

  @override
  String get announceMediaInternetOnly =>
      'ಫೋಟೋ/ಧ್ವನಿ ಪ್ರಕಟಣೆಗಳನ್ನು ಇಂಟರ್ನೆಟ್ ಮೂಲಕ ಕಳುಹಿಸಲಾಗುತ್ತದೆ (BLE ಅಲ್ಲ)';

  @override
  String get announceNeedInternet =>
      'ಫೋಟೋ ಅಥವಾ ಧ್ವನಿ ಪ್ರಕಟಣೆಗಳನ್ನು ಕಳುಹಿಸಲು ಇಂಟರ್ನೆಟ್‌ಗೆ ಸಂಪರ್ಕಪಡಿಸಿ';

  @override
  String announceVoiceFailed(String error) {
    return 'ಧ್ವನಿಯನ್ನು ರೆಕಾರ್ಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String get announceImageTooLarge =>
      'ಚಿತ್ರ ತುಂಬಾ ದೊಡ್ಡದಾಗಿದೆ (ಗರಿಷ್ಠ ~180 KB)';

  @override
  String get announcePlayVoice => 'ಧ್ವನಿ ಟಿಪ್ಪಣಿಯನ್ನು ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get announceImageLabel => '📷 ಚಿತ್ರ';

  @override
  String get announceAudioLabel => '🎤 ಧ್ವನಿ ಟಿಪ್ಪಣಿ';

  @override
  String get announceModeLocked => 'ಲಾಕ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String get announceModeOpen => 'ತೆರೆಯಿರಿ';

  @override
  String get announceOpenBadge => 'ತೆರೆಯಲಾಗಿದೆ · ಎನ್‌ಕ್ರಿಪ್ಟ್ ಮಾಡಲಾಗಿಲ್ಲ';

  @override
  String get announceLockedBadge => 'ಲಾಕ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String get announceLockedPlaceholder =>
      'ಎನ್‌ಕ್ರಿಪ್ಟ್ ಮಾಡಲಾಗಿದೆ - ಓದಲು ಪ್ರವೇಶವನ್ನು ವಿನಂತಿಸಿ';

  @override
  String get announceRequestAccess => 'ಪ್ರವೇಶವನ್ನು ವಿನಂತಿಸಿ';

  @override
  String get announceRequestSent =>
      'ಪ್ರವೇಶ ವಿನಂತಿಯನ್ನು ಮಂಡಳಿಯ ಮಾಲೀಕರಿಗೆ ಕಳುಹಿಸಲಾಗಿದೆ';

  @override
  String get announceRequestFailed =>
      'ಪ್ರವೇಶವನ್ನು ವಿನಂತಿಸಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ (ಮಾಲೀಕರ ಸಾರ್ವಜನಿಕ ಕೀ ಅಗತ್ಯವಿದೆ)';

  @override
  String get announceOpenConfirmTitle =>
      'ಎನ್‌ಕ್ರಿಪ್ಶನ್ ಇಲ್ಲದೆ ಪೋಸ್ಟ್ ಮಾಡುವುದೇ?';

  @override
  String get announceOpenConfirmBody =>
      'ತೆರೆದ ಪೋಸ್ಟ್‌ಗಳು E2EE ಅಲ್ಲ. ಹಾದಿಯಲ್ಲಿರುವ ಯಾರಾದರೂ (ಮೆಶ್ / ರಿಲೇಗಳು) ಅವುಗಳನ್ನು ಓದಬಹುದು. ಮುಂದುವರಿಸುವುದೇ?';

  @override
  String get announcePostAction => 'ಪೋಸ್ಟ್ ಮಾಡಿ';

  @override
  String get announcePendingRequests => 'ಪ್ರವೇಶ ವಿನಂತಿಗಳು';

  @override
  String get announceApprove => 'ಅನುಮೋದಿಸಿ';

  @override
  String get announceDeny => 'ನಿರಾಕರಿಸು';

  @override
  String get announceGranted =>
      'ಈ ಬೋರ್ಡ್‌ನಲ್ಲಿ ನೀವು ಲಾಕ್ ಪೋಸ್ಟ್‌ಗಳನ್ನು ಓದಬಹುದು';

  @override
  String get announceOwner => 'ನೀವು ಈ ಬೋರ್ಡ್ ಅನ್ನು ಹೊಂದಿದ್ದೀರಿ';

  @override
  String get announceCopyInvite => 'ಆಹ್ವಾನ ಪಠ್ಯವನ್ನು ನಕಲಿಸಿ';

  @override
  String get announceShowInviteQr => 'ಆಹ್ವಾನ QR ತೋರಿಸಿ';

  @override
  String get announceScanInviteQr => 'ಸ್ಕ್ಯಾನ್ ಬೋರ್ಡ್ QR ಆಹ್ವಾನ';

  @override
  String get announceFollow => 'ಆಹ್ವಾನದಿಂದ ಬೋರ್ಡ್ ಅನ್ನು ಅನುಸರಿಸಿ';

  @override
  String get announceFollowHint =>
      'ಮಾಲೀಕರಿಂದ ಆಹ್ವಾನ ಪಠ್ಯ ಅಥವಾ ResilNet ಲಿಂಕ್ ಅನ್ನು ಅಂಟಿಸಿ';

  @override
  String get announceFollowOk => 'ಕೆಳಗಿನ ಬೋರ್ಡ್';

  @override
  String announceFollowOkNamed(String title) {
    return 'ಈಗ ಅನುಸರಿಸುತ್ತಿರುವ “$title”';
  }

  @override
  String get announceFollowFail => 'ಆಹ್ವಾನವು ಅಮಾನ್ಯವಾಗಿದೆ ಅಥವಾ ಹಾನಿಯಾಗಿದೆ';

  @override
  String get announceInviteCopied => 'ಆಹ್ವಾನ ಪಠ್ಯವನ್ನು ನಕಲಿಸಲಾಗಿದೆ';

  @override
  String get announceInviteSaveQr => 'QR ಉಳಿಸಿ';

  @override
  String get announceInviteShare => 'ಆಹ್ವಾನವನ್ನು ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String get announceFollowFromCompose =>
      'ಸಂದೇಶ ಪೆಟ್ಟಿಗೆಯಲ್ಲಿ ಬೋರ್ಡ್ ಆಹ್ವಾನ ಪತ್ತೆಯಾಗಿದೆ';

  @override
  String get peerConfirmAddTitle => 'ನೆಟ್‌ವರ್ಕ್ ಸದಸ್ಯರನ್ನು ಸೇರಿಸುವುದೇ?';

  @override
  String peerConfirmAddBody(String name) {
    return 'ಅವರ ಸಾರ್ವಜನಿಕ ಕೀಲಿಯೊಂದಿಗೆ \"$name\" ಅನ್ನು ಸೇರಿಸಿ ಇದರಿಂದ ನೀವು ಅವರಿಗೆ ಖಾಸಗಿಯಾಗಿ ಸಂದೇಶ ಕಳುಹಿಸಬಹುದೇ?';
  }

  @override
  String get peerConfirmAdd => 'ಸದಸ್ಯರನ್ನು ಸೇರಿಸಿ';

  @override
  String peerAddedOk(String name) {
    return 'ನೆಟ್‌ವರ್ಕ್ ಸದಸ್ಯರಿಗೆ $name ಅನ್ನು ಸೇರಿಸಲಾಗಿದೆ';
  }

  @override
  String get peerAddFromCompose =>
      'ಸಂದೇಶ ಪೆಟ್ಟಿಗೆಯಲ್ಲಿ ಗುರುತು / ಸಾರ್ವಜನಿಕ ಕೀ ಪತ್ತೆ';

  @override
  String get peerHashCopied => 'ಸಾರ್ವಜನಿಕ ಕೀ ಹ್ಯಾಶ್ ನಕಲಿಸಲಾಗಿದೆ';

  @override
  String get peerHashOpenChat => 'ಚಾಟ್ ತೆರೆಯಿರಿ';

  @override
  String get peerHashAddHint =>
      'ಹ್ಯಾಶ್ ನಕಲಿಸಿದ್ದಾರೆ. ಅವರ ಗುರುತಿನ ಲಿಂಕ್ ಅಥವಾ QR ಅನ್ನು ಹಂಚಿಕೊಳ್ಳಲು ಅವರನ್ನು ಕೇಳಿ ಇದರಿಂದ ನೀವು E2EE ಗಾಗಿ ಸಂಪೂರ್ಣ ಸಾರ್ವಜನಿಕ ಕೀಲಿಯನ್ನು ಸೇರಿಸಬಹುದು.';

  @override
  String get peerQrNoCode => 'ಈ ಚಿತ್ರದಲ್ಲಿ ಯಾವುದೇ ResilNet QR ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet ಗುರುತು: “$name”\nಲಿಂಕ್ ತೆರೆಯಿರಿ ಅಥವಾ ಅದನ್ನು ಚಾಟ್‌ನಲ್ಲಿ ಅಂಟಿಸಿ → ಸದಸ್ಯರನ್ನು ಸೇರಿಸಿ\nಅಥವಾ ಗುರುತು QR ಅನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ.';
  }

  @override
  String get identityShareInvite => 'ಗುರುತಿನ ಲಿಂಕ್ ಅನ್ನು ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String get identityInviteCopied => 'ಗುರುತಿನ ಲಿಂಕ್ ಅನ್ನು ನಕಲಿಸಲಾಗಿದೆ';

  @override
  String announceInviteSharePreamble(String title) {
    return 'ಮಂಡಳಿಯ ಆಹ್ವಾನ: “$title”\nResilNet → ಸಮುದಾಯ ಬೋರ್ಡ್‌ಗಳನ್ನು ತೆರೆಯಿರಿ → ಆಹ್ವಾನದಿಂದ ಅನುಸರಿಸಿ\nಅಥವಾ QR ಅನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ / ಕೆಳಗಿನ ಲಿಂಕ್ ಅನ್ನು ಟ್ಯಾಪ್ ಮಾಡಿ.';
  }

  @override
  String get announceConfirmFollowTitle => 'ಈ ಬೋರ್ಡ್ ಅನ್ನು ಅನುಸರಿಸುವುದೇ?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'ಈ ಆಹ್ವಾನದಿಂದ \"$title\" ಅನ್ನು ಅನುಸರಿಸುವುದೇ?';
  }

  @override
  String get announceConfirmFollow => 'ಅನುಸರಿಸಿ';
}

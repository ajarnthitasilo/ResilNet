// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'ریفریش ہو رہا ہے ResilNet…';

  @override
  String get appRefreshed =>
      'تازہ کاری ہوئی — ریڈیو اور دریافت دوبارہ شروع ہو گئی۔';

  @override
  String appRefreshFailed(String error) {
    return 'ریفریش ناکام: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'ڈبل ٹیپ = نرم ریفریش۔ لانگ پریس = مشکل سے بازیافت۔ ٹرپل ٹیپ = ایمرجنسی وائپ۔';

  @override
  String get softRefreshTipTitle => 'اگر ResilNet پھنس محسوس ہوتا ہے۔';

  @override
  String get softRefreshTipBody =>
      'نرم ریڈیو ریفریش کے لیے ResilNet (اوپر سے بائیں) پر دو بار تھپتھپائیں۔ اگر اب بھی پھنس گیا ہے: عنوان کو دیر تک دبائیں، ⋮ → ہارڈ ریکوری، یا سیٹنگز استعمال کریں۔ ٹرپل ٹیپ صرف ایمرجنسی وائپ ہے۔';

  @override
  String get softRefreshTipGotIt => 'سمجھ گیا';

  @override
  String get infoSoftRefreshTitle => 'اگر ایپ پھنس محسوس کرتی ہے۔';

  @override
  String get infoSoftRefreshStepRefresh =>
      'دو بار تھپتھپائیں ResilNet (اوپر سے بائیں) → نرم ریفریش ریڈیوز اور قریبی لوگ';

  @override
  String get infoSoftRefreshStepHard =>
      'اب بھی پھنس گئے؟ ٹائٹل کو دیر تک دبائیں، یا ⋮ / سیٹنگز → مشکل سے بازیافت';

  @override
  String get infoSoftRefreshStepWait =>
      'نتیجہ سنیک بار کا انتظار کریں، پھر دوبارہ کوشش کریں۔ سیشن ری سیٹ آپ کی چابیاں رکھتا ہے۔';

  @override
  String get infoSoftRefreshStepWipe =>
      'ٹرپل ٹیپ = ایمرجنسی وائپ (مقامی ڈیٹا کو حذف کرتا ہے) — صرف جان بوجھ کر';

  @override
  String get appRecoverySection => 'ایپ کی بازیابی۔';

  @override
  String get appRecoverySectionSubtitle =>
      'ایپ کو منجمد محسوس ہونے پر استعمال کریں۔ نرم = عنوان ڈبل تھپتھپائیں۔ مشکل کی وصولی مضبوط ہے. سیشن ری سیٹ کلیدوں کو صاف کیے بغیر خدمات کو دوبارہ شروع کرتا ہے۔';

  @override
  String get appHardRecoverAction => 'مشکل سے بازیافت';

  @override
  String get appHardRecovering => 'مشکل سے بازیابی…';

  @override
  String get appSessionResetAction => 'سیشن کو دوبارہ ترتیب دیں۔';

  @override
  String get appSessionResetRunning => 'سیشن کو دوبارہ ترتیب دیا جا رہا ہے…';

  @override
  String get appSessionResetConfirmTitle => 'سیشن ری سیٹ کریں؟';

  @override
  String get appSessionResetConfirmBody =>
      'اس آلہ پر ResilNet سروسز کو دوبارہ شروع کرتا ہے۔ آپ کی شناخت کی چابیاں رکھی جاتی ہیں۔';

  @override
  String get appRecoveryBusy => 'ریکوری پہلے سے چل رہی ہے…';

  @override
  String get appRecoveryOk => 'بازیابی ختم ہوگئی';

  @override
  String get appRecoveryPartial =>
      'کچھ قدموں کو چھوڑ کر ریکوری مکمل ہو گئی — اگر اب بھی پھنس گئے ہیں تو دوبارہ کوشش کریں۔';

  @override
  String get appRecoveryFailed =>
      'بازیابی ناکام ہوگئی — سیشن کو دوبارہ ترتیب دینے کی کوشش کریں، یا OS سے ایپ کو زبردستی چھوڑ دیں۔';

  @override
  String get localWifiTitle => 'مقامی Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'انٹرنیٹ کے بغیر قریبی آلات کو لنک کریں — جیسا کہ ایک LAN پر ہونا۔';

  @override
  String get localWifiNotGatewayHint =>
      'ESP32 LoRa گیٹ وے SoftAP نہیں۔ یہ صرف فون↔فون / LAN ہے۔';

  @override
  String get localWifiUnavailable =>
      'مقامی Wi‑Fi ابھی تیار نہیں ہے — ایپ شروع ہونے کا انتظار کریں۔';

  @override
  String get lxmfBridgeTitle => 'ہوم نوڈ';

  @override
  String get lxmfBridgeSubtitle =>
      'آپ کے Wi‑Fi پر اختیاری Mac یا Pi جو سیل شدہ چیٹس کو ریلے کرتا ہے۔ بطور ڈیفالٹ آف۔ اینڈ ٹو اینڈ انکرپشن کو تبدیل نہیں کرتا ہے۔';

  @override
  String get lxmfBridgeEnable => 'ہوم نوڈ استعمال کریں۔';

  @override
  String get lxmfBridgeDisabledHint =>
      'صرف اس وقت آن کریں جب برج ایپ اس نیٹ ورک پر Mac یا Pi پر چل رہی ہو۔';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'آن لائن — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'ہوم نوڈ تک نہیں پہنچ سکتا — $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'ہوم نوڈ کا پتہ';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP یا http://IP:port — مثال 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'پیر → LXMF منزل (JSON)';

  @override
  String get lxmfBridgeRefresh => 'اسٹیٹس کو محفوظ کریں اور ریفریش کریں۔';

  @override
  String get lxmfBridgeLabHint => 'اعلی درجے کی: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'ہوم نوڈ کی ترتیبات';

  @override
  String get lxmfBridgeCheckConnection => 'کنکشن چیک کریں۔';

  @override
  String get lxmfBridgeStatusOnline => 'ہوم نوڈ سے منسلک';

  @override
  String get lxmfBridgeStatusOffline => 'ہوم نوڈ قابل رسائی نہیں ہے۔';

  @override
  String get lxmfBridgeYourDest => 'اس نوڈ کا پتہ (دوستوں کے ساتھ شئیر کریں)';

  @override
  String get lxmfBridgeCopyDest => 'ایڈریس کاپی کریں۔';

  @override
  String get lxmfBridgeDestCopied => 'پتہ کاپی ہو گیا۔';

  @override
  String get lxmfBridgeLinkedPeers => 'جڑے ہوئے دوست';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'ہر دوست کو ایک بار اپنے گھر کے نوڈ ایڈریس کی ضرورت ہوتی ہے۔ پھر سیل شدہ چیٹس اس راستے کو استعمال کر سکتے ہیں۔';

  @override
  String get lxmfBridgeNoLinks => 'ابھی تک کوئی دوست منسلک نہیں ہے۔';

  @override
  String get lxmfBridgeAddLink => 'کسی دوست کو لنک کریں۔';

  @override
  String get lxmfBridgePickPeer => 'دوست';

  @override
  String get lxmfBridgePeerDest => 'ان کے گھر کا پتہ';

  @override
  String get lxmfBridgePeerDestHint => 'ان کی ہوم نوڈ اسکرین سے 32-حروف کا کوڈ';

  @override
  String get lxmfBridgeInvalidDest =>
      'وہ پتہ درست نہیں لگتا۔ ان کے ہوم نوڈ سے مکمل کوڈ چسپاں کریں۔';

  @override
  String get lxmfBridgeRemoveLink => 'لنک ختم کریں۔';

  @override
  String get lxmfBridgeSaveLink => 'محفوظ کریں۔';

  @override
  String get lxmfBridgeLinkSaved => 'دوست منسلک';

  @override
  String get lxmfBridgeNoPeers =>
      'ابھی تک کوئی پیغام دینے والا رابطہ نہیں ہے — پہلے ایک دوست شامل کریں۔';

  @override
  String get lxmfBridgeHelp =>
      'پل کو Mac/Pi پر چلتے رہیں۔ یہ راستہ آپ کے LAN پر رہتا ہے — یہ LoRa نہیں ہے اور انٹرنیٹ یا بلوٹوتھ میش کو تبدیل نہیں کرتا ہے۔';

  @override
  String get localWifiModeHotspot => 'آس پاس';

  @override
  String get localWifiModeRouter => 'راؤٹر';

  @override
  String get localWifiHotspotIntro =>
      'ایک آلہ ذاتی ہاٹ سپاٹ کا اشتراک کرتا ہے۔ دوسرے اس ہاٹ اسپاٹ میں شامل ہوتے ہیں، پھر ResilNet انہیں مقامی نیٹ ورک پر تلاش کرتا ہے۔';

  @override
  String get localWifiHostAction => 'نیٹ ورک بنائیں (میزبان)';

  @override
  String get localWifiJoinAction => 'نیٹ ورک میں شامل ہوں۔';

  @override
  String get localWifiHostSteps =>
      '1. iOS/Android کی ترتیبات کھولیں اور پرسنل ہاٹ اسپاٹ (یا انٹرنیٹ شیئرنگ) کو آن کریں۔\n2. دوستوں کو ہاٹ اسپاٹ کا نام (اور پاس ورڈ) بتائیں۔\n3. یہاں واپس آئیں اور \"ہاٹ سپاٹ آن ہے - انتظار شروع کریں\" پر ٹیپ کریں۔';

  @override
  String get localWifiHostReady => 'ہاٹ سپاٹ آن ہے - انتظار شروع کریں۔';

  @override
  String get localWifiHostWaiting => 'دوستوں کے شامل ہونے کا انتظار ہے…';

  @override
  String get localWifiJoinSteps =>
      '1. سسٹم کی ترتیبات کھولیں اور اپنے دوست کے ذاتی ہاٹ سپاٹ میں شامل ہوں۔\n2. یہاں واپس جائیں اور \"میں منسلک ہوں — تلاش کریں\" پر ٹیپ کریں۔';

  @override
  String get localWifiJoinReady => 'میں منسلک ہوں — تلاش کریں۔';

  @override
  String get localWifiRouterIntro =>
      'ہر ڈیوائس کو اسی Wi‑Fi راؤٹر/AP سے جوڑیں۔ روٹر کو انٹرنیٹ کی ضرورت نہیں ہے - صرف ایک مشترکہ مقامی نیٹ ورک۔';

  @override
  String get localWifiRouterSearch => 'اس Wi‑Fi پر تلاش کریں۔';

  @override
  String get localWifiRefreshNetwork => 'Wi‑Fi معلومات ریفریش کریں۔';

  @override
  String get localWifiRouterNoWifiTitle => 'Wi‑Fi پر نہیں۔';

  @override
  String get localWifiRouterNoWifiBody =>
      'سسٹم سیٹنگز میں روٹر کے Wi‑Fi میں شامل ہوں، پھر دوبارہ تلاش کریں۔';

  @override
  String get localWifiDiscovering => 'مقامی Wi‑Fi پر تلاش کر رہا ہے…';

  @override
  String get localWifiPeersFound => 'اس نیٹ ورک پر موجود آلات';

  @override
  String get localWifiStop => 'رک جاؤ';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi نام دستیاب نہیں ہے۔';

  @override
  String get localWifiStubBanner => 'LAN ساکٹ کا انتظار کر رہا ہے…';

  @override
  String get localWifiLiveBanner =>
      'LAN دریافت لائیو (UDP) — اس Wi‑Fi پر + سیل شدہ چیٹ کا اعلان کریں۔';

  @override
  String get localWifiEmptyHotspot =>
      'ابھی تک کوئی آلات نہیں ہیں۔\nچیک کریں کہ دوست آپ کے ہاٹ اسپاٹ میں شامل ہوئے ہیں اور مقامی نیٹ ورک تک رسائی کی اجازت دی ہے۔';

  @override
  String get localWifiEmptyRouter =>
      'ابھی تک کوئی آلات نہیں ہیں۔\nایک ہی SSID؟ مقامی نیٹ ورک کی اجازت ہے؟ کچھ راؤٹرز ڈیوائس ٹو ڈیوائس ٹریفک (AP تنہائی) کو روکتے ہیں۔';

  @override
  String get localWifiIsolationHelp => 'ہم ایک دوسرے کو کیوں نہیں ڈھونڈ سکتے؟';

  @override
  String get localWifiIsolationTitle => 'راؤٹر کلائنٹس کو الگ تھلگ کر سکتا ہے۔';

  @override
  String get localWifiIsolationBody =>
      'اگر AP/کلائنٹ آئسولیشن (یا مہمان نیٹ ورک) آن ہے، تو اسی Wi‑Fi پر موجود فونز بات نہیں کر سکتے۔ آئسولیشن آف کریں، مین SSID استعمال کریں، یا Nearby (Hotspot) موڈ پر سوئچ کریں۔';

  @override
  String get localWifiPeerReady => 'چیٹ کے لیے تیار (کلید ہے)';

  @override
  String get localWifiPeerNeedKey =>
      'ملا — چابیاں تبدیل کرنے کے لیے QR اسکین کریں۔';

  @override
  String get localWifiErrorTitle => 'مقامی Wi‑Fi خرابی۔';

  @override
  String get localWifiErrorBody => 'کچھ غلط ہو گیا۔ رکیں اور دوبارہ کوشش کریں۔';

  @override
  String get preparingSystem => 'نظام تیار ہو رہا ہے…';

  @override
  String get bootFailedTitle => 'شروع نہیں ہو سکا';

  @override
  String get retry => 'دوبارہ کوشش کریں۔';

  @override
  String get bootRecoveryAction => 'نئی شناخت شروع کریں (مقامی ڈیٹا مٹائیں)';

  @override
  String get bootRecoveryConfirmTitle => 'نئی شناخت شروع کریں؟';

  @override
  String get bootRecoveryConfirmBody =>
      'یہ اس آلہ پر مقامی چیٹس، کیز اور شناخت کو مستقل طور پر مٹا دے گا۔\nساتھیوں کو آپ کی نئی شناخت کے ساتھ آپ کا QR دوبارہ اسکین کرنا چاہیے۔\nاسے کالعدم نہیں کیا جا سکتا۔';

  @override
  String get bootRecoveryRunning =>
      'مقامی شناخت کو دوبارہ ترتیب دیا جا رہا ہے…';

  @override
  String get bootRecoverySuccess => 'مقامی شناخت کی دوبارہ ترتیب مکمل ہو گئی۔';

  @override
  String bootRecoveryFailed(String error) {
    return 'شناخت کو دوبارہ ترتیب نہیں دیا جا سکا: $error';
  }

  @override
  String get cancel => 'منسوخ کریں۔';

  @override
  String get save => 'محفوظ کریں۔';

  @override
  String get close => 'بند';

  @override
  String get start => 'شروع کریں۔';

  @override
  String get send => 'بھیجیں۔';

  @override
  String get settings => 'ترتیبات';

  @override
  String get language => 'زبان';

  @override
  String get languageSubtitle =>
      'بطور ڈیفالٹ ایپ آپ کے فون کی زبان کی پیروی کرتی ہے (جب تعاون یافتہ ہو)۔ دوسری زبانیں انگریزی میں واپس آتی ہیں۔ آپ یہاں زبان کو لاک بھی کر سکتے ہیں۔';

  @override
  String get languageSystem => 'سسٹم ڈیفالٹ';

  @override
  String get languageThai => 'تھائی';

  @override
  String get languageEnglish => 'انگریزی';

  @override
  String get notificationsTooltip => 'اطلاع کی ترتیبات';

  @override
  String get enableMessageNotifications => 'پیغام کی اطلاعات کو فعال کریں۔';

  @override
  String get settingsNotificationsSubtitle =>
      '1:1 پیغامات اور لوگ آن لائن (مقامی الرٹس)';

  @override
  String get networkMembersTooltip => 'نیٹ ورک کے اراکین';

  @override
  String get identityQrTooltip => 'شناخت / کیو آر';

  @override
  String get feedDirects => 'گپ شپ';

  @override
  String get feedMesh => '#میش';

  @override
  String get feedGeo => 'علاقہ';

  @override
  String get feedDirectsSubtitle => 'نجی E2EE پیغامات';

  @override
  String get feedMeshSubtitle => 'قریبی ساتھی (BLE)';

  @override
  String get feedGeoSubtitle => 'جیوہاش دریافت چینل';

  @override
  String get peerIdHint =>
      'چیٹ شروع کرنے کے لیے وصول کنندہ ID (پبلک کی ہیش) چسپاں کریں۔';

  @override
  String get directsEmpty =>
      'ابھی تک کوئی چیٹس نہیں ہیں — شروع کرنے کے لیے QR اسکین کریں یا وصول کنندہ ID چسپاں کریں۔\nپیغامات بھیجنے سے پہلے E2EE کے ساتھ سیل کر دیے جاتے ہیں (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • چیٹ کھولنے کے لیے تھپتھپائیں۔';

  @override
  String get meshIntro =>
      'BLE رینج میں ساتھی — نجی E2EE چیٹ کے لیے تھپتھپائیں (#mesh پر کوئی عوامی تحریر نہیں)\nہائبرڈ راؤٹر کے ذریعے بھیجتا ہے (BLE + LoRa + Nostr آن لائن ہونے پر)';

  @override
  String get meshEmptyRunning =>
      'ابھی تک کوئی قریبی ساتھی نہیں — BLE رینج کے اندر کسی دوسرے آلے پر ایپ کھولیں۔';

  @override
  String get meshEmptyStopped =>
      'BLE نہیں چل رہا ہے — بلوٹوتھ / مقام کی اجازت دیں۔';

  @override
  String get meshNearbyPrefix => 'آس پاس';

  @override
  String get meshRetentionTitle => 'پیغامات کو خود بخود حذف کریں۔';

  @override
  String get meshRetentionSubtitle =>
      'پرانی مقامی چیٹ کی تاریخ خود بخود ہٹا دی جاتی ہے۔';

  @override
  String get meshRetentionKeep => 'رکھو';

  @override
  String get meshRetention1Day => '1 دن';

  @override
  String get meshRetention3Days => '3 دن';

  @override
  String get meshRetention7Days => '7 دن';

  @override
  String get refreshLocationTooltip => 'مقام کو تازہ کریں۔';

  @override
  String get geoIntro =>
      'اس geohash میں آن لائن لوگوں کو 1:1 پر یا ایک ایریا پبلک فین آؤٹ کے ساتھ میسج کیا جا سکتا ہے (ابھی تک E2EE فی پیئر پر مہر لگا دی گئی ہے - سادہ متن نہیں)';

  @override
  String geoEmpty(String channel) {
    return '$channel میں ابھی تک کوئی آن لائن نہیں ہے۔\nٹرانسپورٹ → انٹرنیٹ/آٹو استعمال کریں، Nostr کا انتظار کریں، مقام ریفریش کریں۔';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return '$channel میں آن لائن • 1:1 E2EE کے لیے تھپتھپائیں۔';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'قریبی (علاقے کی موجودگی کا انتظار) • 1:1 E2EE کے لیے تھپتھپائیں۔';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return '$channel میں Nostr پر دیکھا گیا • صرف دریافت (وراثت)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'میراثی گمنام موجودگی — ایک پابند ہم مرتبہ کا انتظار کریں یا QR کا تبادلہ کریں۔';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE قریبی — 1:1 E2EE شروع کرنے کے لیے QR اسکین کریں۔';

  @override
  String get geoInternetDiscoverHint =>
      'ایریا انٹرنیٹ دریافت کی ضرورت ہے Nostr منسلک (ترتیبات → ٹرانسپورٹ → انٹرنیٹ/آٹو)';

  @override
  String get geoEmptyNoLocation =>
      'مقام ابھی حل نہیں ہوا — جی پی ایس کی اجازت دیں اور اپنے جیوہاش کو Nostr پر شائع کرنے کے لیے ریفریش کریں';

  @override
  String get geoEmptyNeedsPermission =>
      'مقام کی اجازت سے انکار کر دیا گیا — ترتیبات → رازداری → مقام میں ResilNet کی اجازت دیں';

  @override
  String get geoEmptyServicesDisabled =>
      'مقام کی خدمات بند ہیں — انہیں ترتیبات میں آن کریں۔';

  @override
  String get geoEmptyNoGpsFix =>
      'GPS فکس حاصل نہیں ہو سکا (Wi‑Fi iPads پر عام) — نیچے جیوہاش کو دستی طور پر سیٹ کریں';

  @override
  String get geoEmptyTeleportHint =>
      'جگہ کے آئیکن کو تھپتھپائیں ← جیوہاش درج کریں (جیسے w5) → ٹیلی پورٹ';

  @override
  String get geoSetGeohashManually => 'geohash سیٹ کریں۔';

  @override
  String get geoTeleportHint =>
      'GPS نہیں ہے؟ geohash سابقہ ​​درج کریں (2–7 حروف، جیسے w5) اور ٹیلی پورٹ کو تھپتھپائیں';

  @override
  String get geoTeleportInvalid =>
      'غلط geohash — صرف بیس 32 حروف/نمبر استعمال کریں (جیسے w5 یا w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'رقبہ $channel پر سیٹ ہے۔';
  }

  @override
  String geoManualActive(String channel) {
    return 'دستی علاقہ: $channel (GPS ریفریش اوور رائڈ ہو جائے گا)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr تیار نہیں — دوبارہ جڑیں پر ٹیپ کریں (0/0 جب تک کہ init کامیاب نہ ہو جائے)';

  @override
  String get geoEmptyMeshOnly =>
      'ٹرانسپورٹ صرف میش کے لیے ہے — Nostr سے زیادہ کے ساتھیوں کو تلاش کرنے کے لیے انٹرنیٹ یا آٹو پر سوئچ کریں۔';

  @override
  String geoEmptyWaiting(String channel) {
    return 'ابھی تک $channel میں کوئی نہیں ہے — دونوں ڈیوائسز پر ایریا + انٹرنیٹ کھلا رکھیں اور ~60 کا انتظار کریں۔';
  }

  @override
  String get geoChannelFallback => '#علاقہ';

  @override
  String get geoRefreshLocation => 'مقام کو تازہ کریں۔';

  @override
  String get settingsClearLocationTitle => 'مقام صاف کریں۔';

  @override
  String get settingsClearLocationSubtitle =>
      'GPS / teleport geohash کو ہٹا دیں (رقبہ #— بن جاتا ہے)';

  @override
  String get settingsClearLocationConfirmTitle => 'مقام صاف کریں؟';

  @override
  String get settingsClearLocationConfirmBody =>
      'اس آلہ پر ذخیرہ شدہ جیوہاش کو حذف کرتا ہے۔ آپ اس کے بعد دوبارہ GPS یا ٹیلی پورٹ کو ریفریش کر سکتے ہیں۔';

  @override
  String get settingsClearLocationAction => 'مقام صاف کریں۔';

  @override
  String get settingsClearLocationSnack => 'مقام صاف ہو گیا۔';

  @override
  String get chatVoiceTooLarge =>
      'صوتی نوٹ بہت بڑا ہے — زیادہ سے زیادہ ~30 سیکنڈ';

  @override
  String get chatVoiceNeedInternet =>
      'صوتی نوٹ کو انٹرنیٹ کی ضرورت ہے (Nostr) — اکیلے BLE کے لیے بہت بڑا ہے۔';

  @override
  String get chatVoiceSentInternet => 'انٹرنیٹ کے ذریعے صوتی نوٹ بھیجا گیا۔';

  @override
  String get noticeAnonMention => 'ذکر';

  @override
  String get noticeAnonDm => 'براہ راست پیغام';

  @override
  String get noticeAnonHug => 'گلے لگانا';

  @override
  String get noticeAnonSlap => 'تھپڑ';

  @override
  String get noticeAnonBlock => 'بلاک';

  @override
  String get noticeAnonNeedKey =>
      'ابھی تک کوئی عوامی کلید نہیں — 1:1 کے لیے پہلے QR کا تبادلہ کریں۔';

  @override
  String get noticeAnonActionSent => 'بھیجا';

  @override
  String noticeAnonBlocked(String anon) {
    return 'مسدود $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* گلے لگانا $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* تھپڑ $anon *';
  }

  @override
  String get geoReconnectNostr => 'دوبارہ منسلک کریں Nostr';

  @override
  String get nostrSectionTitle => 'Nostr ریلے';

  @override
  String get nostrSectionSubtitle =>
      'انٹرنیٹ پیغام رسانی اور علاقے کی دریافت ان ریلے کا استعمال کرتے ہیں۔ اگر اسٹیٹس آف لائن رہتا ہے تو دوبارہ جڑیں پر ٹیپ کریں۔';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'منسلک $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'آف لائن - ریلے درج ہیں لیکن کوئی منسلک نہیں ہے۔';

  @override
  String get nostrStatusNotInit =>
      'شروع نہیں ہوا (0/0) — شروع کرنے کے لیے دوبارہ جڑیں پر ٹیپ کریں۔';

  @override
  String get nostrReconnectAction => 'دوبارہ منسلک کریں Nostr';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr منسلک ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'ابھی بھی آف لائن — Wi‑Fi/cellular چیک کریں یا دوبارہ کوشش کریں۔';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'ناکام: $error';
  }

  @override
  String get nostrReconnecting => 'ریلے سے منسلک ہو رہا ہے…';

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
    return 'انٹرنیٹ (Nostr) $channel میں • سیل شدہ چیٹ تیار ہے۔';
  }

  @override
  String get transportModeTitle => 'ایریا ٹرانسپورٹ';

  @override
  String get transportModeSubtitle =>
      'میش = BLE قریبی (ریڈیو) جب نہیں Nostr · انٹرنیٹ اور آٹو = Nostr لوگوں کی فہرست';

  @override
  String get transportModeMesh => 'میش';

  @override
  String get transportModeInternet => 'انٹرنیٹ';

  @override
  String get transportModeAuto => 'آٹو';

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
  String get geoPublicHint => 'اس علاقے میں آن لائن ہر کسی کے لیے عوامی پیغام';

  @override
  String get geoPublicSend => 'عوامی';

  @override
  String geoPublicHelp(int count) {
    return '$count آن لائن ساتھیوں کو سیل شدہ فین آؤٹ - ہر ایک کو ایک نجی لفافہ ملتا ہے';
  }

  @override
  String geoPublicSent(int count) {
    return 'اس علاقے میں $count ساتھیوں کو بھیجا گیا۔';
  }

  @override
  String get geoPublicSentNone =>
      'آن لائن پیغام دینے والا کوئی ساتھی نہیں — ایریا/میش کو ان ہم مرتبہ کے ساتھ کھولیں جن کے پاس چابیاں ہیں، یا BLE/Nostr کا انتظار کریں';

  @override
  String get areaPublicBadge => 'علاقہ عوام';

  @override
  String get geoErrorPermission =>
      'مقام پڑھا نہیں جا سکا — مقام کی اجازت چیک کریں۔';

  @override
  String get geoPrecisionRegion => 'علاقہ';

  @override
  String get geoPrecisionProvince => 'صوبہ';

  @override
  String get geoPrecisionCity => 'شہر';

  @override
  String get geoPrecisionNeighborhood => 'محلہ';

  @override
  String get geoPrecisionBlock => 'بلاک';

  @override
  String get aliasTitle => 'عرفی نام مقرر کریں (رابطہ عرف)';

  @override
  String get aliasHintBody =>
      'یہ عرف صرف اس ڈیوائس پر محفوظ ہے (صرف مقامی)\nاسے کبھی بھی E2EE ٹریفک کے ساتھ نہیں بھیجا جاتا ہے۔';

  @override
  String get aliasLabel => 'عرفی نام';

  @override
  String get aliasHint => 'جیسے \"گاؤں کا سربراہ\"، \"پ سومچائی\"…';

  @override
  String get settingsDevices => 'آلات';

  @override
  String get settingsFirmwareTitle => 'ESP32 فرم ویئر ڈاؤن لوڈ / اپ ڈیٹ کریں۔';

  @override
  String get settingsFirmwareSubtitle =>
      '.bin فائلیں ڈاؤن لوڈ کریں اور OTA کے ذریعے ESP32 بورڈ کو اپ ڈیٹ کریں۔';

  @override
  String get mtBridgeTitle => 'Meshtastic پل';

  @override
  String get mtBridgeSettingsSubtitle =>
      'صرف ٹیکسٹ A/B پل — نہیں ResilNet E2EE';

  @override
  String get mtBridgeIntro =>
      'مختصر سادہ متن کو Meshtastic اور ResilNet کے درمیان منتقل کریں۔ موڈ A اور B ایک ہی وقت میں نہیں چل سکتے۔ یہ اینڈ ٹو اینڈ انکرپشن نہیں ہے۔';

  @override
  String get mtBridgeModeLabel => 'موڈ';

  @override
  String get mtBridgeModeOff => 'آف';

  @override
  String get mtBridgeModeA => 'اے پینا';

  @override
  String get mtBridgeModeB => 'ایگریس بی';

  @override
  String get mtBridgeModeOffShort => 'آف';

  @override
  String get mtBridgeModeAShort => 'اے میں';

  @override
  String get mtBridgeModeBShort => 'آؤٹ بی';

  @override
  String get mtBridgeMutexHint =>
      'ایک موڈ کو منتخب کرنے سے دوسرا خود بخود بند ہوجاتا ہے۔ بیک وقت A+B تعاون یافتہ نہیں ہے۔';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'ڈیمو (لاگنگ)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'ان باؤنڈ ٹیکسٹ نوٹس کے تحت #meshtastic کے طور پر ظاہر ہوتا ہے۔ میش ریلے اختیاری ہے (بذریعہ ڈیفالٹ آف)۔';

  @override
  String get mtBridgeRelayTitle => 'ResilNet میش پر بھی ریلے کریں۔';

  @override
  String get mtBridgeRelayHint =>
      'آن ہونے پر، دستخط شدہ عوامی بلیٹن نشر کیے جاتے ہیں۔ آف = صرف اس فون کے نوٹس۔';

  @override
  String get mtBridgeSimulateHint => 'ڈیمو پیغام';

  @override
  String get mtBridgeSimulate => 'Meshtastic پیغام کی نقل کریں۔';

  @override
  String get mtBridgeIngestOk => 'نوٹس میں داخل کیا گیا (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'انتباہ: یہاں بھیجے گئے پیغامات ResilNet E2EE نہیں ہیں۔ Meshtastic راستے پر موجود کوئی بھی انہیں پڑھ سکتا ہے۔';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'شائع کرنے کے لیے متن';

  @override
  String get mtBridgeSend => 'Meshtastic کو بھیجیں۔';

  @override
  String get mtBridgeEgressOk =>
      'Meshtastic کے لیے قطار میں (دیکھیں لاگ / تاریخ)';

  @override
  String get mtBridgeLastEgress => 'آخری اخراج';

  @override
  String get mtBridgeEgressHistory => 'حالیہ اخراج';

  @override
  String get mtBridgeOffHint =>
      'پل استعمال کرنے کے لیے Ingest (A) یا Egress (B) کو آن کریں۔';

  @override
  String get mtBridgeNoticeBadge => 'میشٹاسٹک · E2EE نہیں۔';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'MQTT ٹرانسپورٹ استعمال کریں۔';

  @override
  String get mtBridgeUseMqttHint =>
      'آف = صرف ڈیمو لاگنگ (MQTT ان باؤنڈ نظر انداز)۔ آن = MQTT اندراج/نکالنے کے لیے منسلک ہونے پر۔';

  @override
  String get mtBridgeMqttHost => 'بروکر میزبان';

  @override
  String get mtBridgeMqttPort => 'بندرگاہ';

  @override
  String get mtBridgeMqttTls => 'TLS (mqtts) استعمال کریں';

  @override
  String get mtBridgeMqttTlsHint =>
      'عام پورٹ 8883۔ سسٹم سرٹیفکیٹ استعمال کرتا ہے۔ مصافحہ کی غلطیوں پر نرمی ناکام ہوجاتی ہے۔';

  @override
  String get mtBridgeMqttAutoReconnect => 'خودکار دوبارہ جڑیں۔';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'آن ہونے پر، کلائنٹ ڈراپ کے بعد دوبارہ جڑنے کی کوشش کرتا ہے۔ بحال ہونے تک اسٹیٹس کنیکٹنگ دکھاتا ہے۔';

  @override
  String get mtBridgeMqttTopicHelpers => 'موضوع کے مددگار';

  @override
  String get mtBridgeMqttRegion => 'علاقہ کا سابقہ ​​(اختیاری)';

  @override
  String get mtBridgeMqttRegionHint =>
      'سیٹ ہونے پر، rebuilds root کو msh/<region>/2/json کے طور پر لاگو کریں (موضوع کی جڑ کو اوور رائیڈ کرتا ہے)۔';

  @override
  String get mtBridgeMqttTopicRoot => 'JSON موضوع کی جڑ';

  @override
  String get mtBridgeMqttDownlinkChannel => 'ڈاؤن لنک چینل کا نام';

  @override
  String get mtBridgeMqttApplyTopics =>
      'جڑ کا اطلاق کریں → سبسکرائب کریں / عنوانات شائع کریں۔';

  @override
  String get mtBridgeMqttAdvanced => 'اعلی درجے کی MQTT';

  @override
  String get mtBridgeMqttAdvancedHint => 'TLS، دوبارہ جڑیں، عنوانات، اسناد';

  @override
  String get mtBridgeMqttTopicIn => 'موضوع کو سبسکرائب کریں۔';

  @override
  String get mtBridgeMqttTopicOut => 'موضوع شائع کریں۔';

  @override
  String get mtBridgeMqttGatewayFrom => 'گیٹ وے نوڈ آئی ڈی (منجانب)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'ڈیسیمل آئی ڈی یا ! ہیکس — بھیجنے کے لیے ڈاؤن لنک کی ضرورت ہے۔';

  @override
  String get mtBridgeMqttChannelIndex => 'میش چینل انڈیکس (اختیاری 0–7)';

  @override
  String get mtBridgeMqttUser => 'صارف نام (اختیاری)';

  @override
  String get mtBridgeMqttPass => 'پاس ورڈ (اختیاری)';

  @override
  String get mtBridgeMqttPassStored =>
      'اس ڈیوائس پر پاس ورڈ محفوظ ہے (نہیں دکھایا گیا)۔';

  @override
  String get mtBridgeMqttPassReplace =>
      'نیا پاس ورڈ (رکھنے کے لیے خالی چھوڑ دیں)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'ذخیرہ شدہ پاس ورڈ رکھنے کے لیے خالی چھوڑ دیں۔';

  @override
  String get mtBridgeMqttPassClear => 'پاس ورڈ صاف کریں۔';

  @override
  String get mtBridgeMqttSave => 'MQTT ترتیبات کو محفوظ کریں۔';

  @override
  String get mtBridgeMqttSaved => 'MQTT ترتیبات محفوظ ہو گئیں۔';

  @override
  String get mtBridgeMqttConnect => 'جڑیں۔';

  @override
  String get mtBridgeMqttDisconnect => 'منقطع کرنا';

  @override
  String get mtBridgeMqttConnected => 'MQTT منسلک ہے۔';

  @override
  String get mtBridgeMqttConnecting => 'MQTT منسلک ہو رہا ہے…';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT منقطع ہو گیا۔';

  @override
  String get mtBridgeMqttError => 'MQTT خرابی۔';

  @override
  String get mtBridgeErrModeIngest => 'پہلے Ingest (A) پر سوئچ کریں۔';

  @override
  String get mtBridgeErrModeEgress => 'پہلے Egress (B) پر جائیں۔';

  @override
  String get mtBridgeErrRate => 'سست - شرح محدود';

  @override
  String get mtBridgeErrDedupe => 'ڈپلیکیٹ پیغام کو نظر انداز کر دیا گیا۔';

  @override
  String get mtBridgeErrLoop => 'پل لوپ کو روکنے کے لیے گرا دیا گیا۔';

  @override
  String get mtBridgeErrEmpty => 'پیغام خالی ہے۔';

  @override
  String get mtBridgeErrPublish => 'شائع کرنا ناکام ہو گیا۔';

  @override
  String get mtBridgeErrNotConnected => 'MQTT منسلک نہیں ہے۔';

  @override
  String get mtBridgeErrMissingHost => 'MQTT بروکر ہوسٹ درج کریں۔';

  @override
  String get mtBridgeErrMissingTopic => 'سبسکرائب کریں اور عنوانات شائع کریں۔';

  @override
  String get mtBridgeErrMissingFromNode =>
      'بھیجنے کے لیے گیٹ وے نوڈ آئی ڈی (منجانب) درج کریں۔';

  @override
  String get mtBridgeErrConnect => 'MQTT رابطہ ناکام ہوگیا۔';

  @override
  String get mtBridgeErrConnectTls => 'MQTT TLS کنیکٹ ناکام ہو گیا۔';

  @override
  String get settingsData => 'ڈیٹا';

  @override
  String get settingsDataHint =>
      'ڈیٹابیس کو سکڑنے کے لیے مقامی پیغامات کو حذف کریں — شناخت، چابیاں، اور ساتھی رکھے جاتے ہیں۔';

  @override
  String get settingsSaveHistoryTitle => 'پیغام کی تاریخ کو محفوظ کریں۔';

  @override
  String get settingsSaveHistorySubtitle =>
      'آف ہونے پر، پیغامات E2EE تار پر رہتے ہیں اور صرف اس سیشن کے لیے رکھے جاتے ہیں (مقامی چیٹ کی تاریخ میں نہیں)۔ آپ کا اپنا متن اب بھی اس ڈیوائس پر سادہ متن کے طور پر ظاہر ہوتا ہے۔';

  @override
  String get settingsPrivacy => 'رازداری';

  @override
  String get settingsE2eeTitle => 'اینڈ ٹو اینڈ انکرپشن';

  @override
  String get settingsE2eeSubtitle =>
      'ہمیشہ آن — پیغامات بھیجنے سے پہلے RSA-OAEP + AES-GCM کے ساتھ سیل کر دیے جاتے ہیں۔ ریلے اور قریبی ہاپس مواد نہیں پڑھ سکتے ہیں۔';

  @override
  String get settingsScreenshotTitle => 'اسکرین شاٹ الرٹس';

  @override
  String get settingsScreenshotSubtitle =>
      'جب یہ آلہ اسکرین کو پکڑتا ہے تو چیٹ میں سسٹم لائن دکھائیں۔';

  @override
  String get settingsNostrExpiryTitle => 'Nostr پیغام وقت رکھیں';

  @override
  String get settingsNostrExpirySubtitle =>
      'Nostr کے ذریعے آن لائن ہونے پر مہر بند لفافے مقامی طور پر کتنی دیر تک رہنے چاہئیں';

  @override
  String get noticeExpiresIn => 'میں میعاد ختم ہو جاتی ہے۔';

  @override
  String get noticesTitle => 'نوٹس';

  @override
  String get noticesMeshIntro =>
      'عوامی بلیٹن — ریڈیو رینج میں ہر کسی کے لیے مرئی، خفیہ کردہ نہیں۔ یہ فون ٹو فون آف لائن ہوپ کرتا ہے، اور قریبی ResilNet ریلے بکس ایک کاپی رکھتے ہیں تاکہ بعد میں آنے والے لوگ اسے دیکھ سکیں۔';

  @override
  String get noticesMeshPublicBadge => 'عوامی · خفیہ کردہ نہیں ہے۔';

  @override
  String get noticesGeoIntro =>
      'اس جگہ کے لیے مختصر نوٹس شامل کریں تاکہ دوسرے زائرین انہیں تلاش کر سکیں۔';

  @override
  String get noticesEmpty => 'ابھی تک کوئی نوٹس نہیں';

  @override
  String get noticesEmptyHint => 'یہاں کے لوگوں کے لیے پہلا نوٹس پن کریں۔';

  @override
  String get noticesComposeHint => 'ایک نوٹس پوسٹ کریں...';

  @override
  String get noticesUrgent => 'فوری';

  @override
  String get noticesOpen => 'نوٹس';

  @override
  String get screenshotTaken => '*آپ نے اسکرین شاٹ لیا*';

  @override
  String get chatAttachImage => 'تصویر منسلک کریں۔';

  @override
  String get chatImageLabel => 'تصویر';

  @override
  String get chatImageTooLarge => 'تصویر بہت بڑی ہے — دوسری تصویر آزمائیں۔';

  @override
  String get chatNostrExpiry => 'Nostr رکھیں';

  @override
  String geoPublicComposeHint(String channel) {
    return '$channel کو بھیجیں — عوامی';
  }

  @override
  String get settingsClearTitle => 'تمام پیغامات صاف کریں۔';

  @override
  String get settingsClearSubtitle => 'اس ڈیوائس پر تمام چیٹس کو حذف کریں۔';

  @override
  String get settingsClearConfirmTitle => 'تمام پیغامات صاف کریں؟';

  @override
  String get settingsClearConfirmBody =>
      'یہ اس ڈیوائس پر موجود تمام چیٹ پیغامات کو حذف کر دیتا ہے۔\nساتھی اور عرفی نام نہیں ہٹائے جاتے ہیں۔';

  @override
  String get settingsClearAction => 'ڈیٹا صاف کریں۔';

  @override
  String get settingsClearedSnack => 'ڈیٹا صاف ہو گیا۔';

  @override
  String settingsVersion(String version) {
    return 'ورژن $version';
  }

  @override
  String get meshBleScanning => 'BLE: نوڈس کے لیے اسکیننگ';

  @override
  String get meshBleEsp32Scanning => 'ESP32: قریبی نوڈ کی تلاش';

  @override
  String get meshBleSyncing => 'BLE: ESP32 کے ساتھ مطابقت پذیر';

  @override
  String get meshNostrPublishing => 'Nostr: اشاعت';

  @override
  String get meshBleIdle => 'BLE میش آن — ابھی تک کوئی قریبی فون نہیں ہے۔';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE میش - $count فون (فونز) قریبی';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: اجازت درکار ہے۔';

  @override
  String get meshBlePausedCamera =>
      'BLE کیمرے کے لیے روک دیا گیا — شروع کریں پر ٹیپ کریں BLE';

  @override
  String get meshBleStopped =>
      'BLE آف ہے — چیک کریں کہ بلوٹوتھ آن ہے، پھر اسٹارٹ BLE کو تھپتھپائیں۔';

  @override
  String get meshBleRestart => 'شروع کریں BLE';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'اجازتیں چیک کریں اور شروع کریں BLE';

  @override
  String get meshNostrOffline => 'Nostr آف لائن';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count قریبی ساتھی • LoRa $lora • مطابقت پذیری ~${meters}m';
  }

  @override
  String get meshLoraReady => 'تیار';

  @override
  String get meshLoraNotReady => 'تیار نہیں';

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
    return 'گیٹ وے UDP: $label';
  }

  @override
  String get meshGatewayReady => 'گیٹ وے UDP: تیار ہے۔';

  @override
  String get permissionTitle =>
      'BLE میش نیٹ ورک کو شروع کرنے کے لیے رسائی کی اجازت دیں۔';

  @override
  String get permissionBody =>
      'ایپ کو کمیونٹی میسجنگ کے لیے بلوٹوتھ (اسکین/کنیکٹ/اشتہار)، لوکیشن (پرانے اینڈرائیڈ ڈیوائسز کے لیے) اور مائیکروفون (چیٹ اور اعلانات میں صوتی نوٹ کے لیے) کی ضرورت ہے۔';

  @override
  String get permissionE2ee =>
      'اینڈ ٹو اینڈ انکرپشن (E2EE)\nریلے نوڈس پیغام کے مواد کو نہیں پڑھ سکتے ہیں۔';

  @override
  String get permissionReady => 'اجازتیں تیار ہیں۔';

  @override
  String get permissionRequest => 'اجازت دیں اور جاری رکھیں';

  @override
  String get permissionNotReadySnack =>
      'سسٹم ابھی تیار نہیں ہے — ایک لمحہ انتظار کریں اور دوبارہ کوشش کریں۔';

  @override
  String get permissionDeniedSnack =>
      'اجازت نامکمل - ترتیبات > ResilNet کھولیں اور بلوٹوتھ / مقام / مائیکروفون کی اجازت دیں';

  @override
  String get permissionMicDenied =>
      'مائیکروفون تک رسائی سے انکار کر دیا گیا — اسے سیٹنگز میں صوتی نوٹ ریکارڈ کرنے کی اجازت دیں۔';

  @override
  String get permissionMicOpenSettings => 'ترتیبات';

  @override
  String get permissionCameraDenied =>
      'کیمرے تک رسائی سے انکار کر دیا گیا — اسے سیٹنگز میں QR کوڈز اسکین کرنے کی اجازت دیں۔';

  @override
  String get permissionCameraFailed =>
      'کیو آر کوڈز کو اسکین کرنے کے لیے کیمرے کی اجازت درکار ہے۔';

  @override
  String get permissionCameraOpenSettings => 'ترتیبات';

  @override
  String get permissionPhotosDenied =>
      'فوٹو لائبریری تک رسائی سے انکار کر دیا گیا — اسے سیٹنگز میں اپنا QR کوڈ محفوظ کرنے کی اجازت دیں۔';

  @override
  String get permissionPhotosFailed =>
      'آپ کے QR کوڈ کو محفوظ کرنے کے لیے فوٹو لائبریری کی اجازت درکار ہے۔';

  @override
  String get permissionPhotosOpenSettings => 'ترتیبات';

  @override
  String permissionFailedSnack(String error) {
    return 'اجازت کی درخواست ناکام ہوگئی: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet آرکیٹیکچر • اسٹور اور فارورڈ ملٹی ہاپ';

  @override
  String get onboardingSkip => 'چھوڑیں۔';

  @override
  String get onboardingNext => 'اگلا';

  @override
  String get onboardingStart => 'شروع کریں';

  @override
  String get onboardingWelcomeTitle => 'ResilNet میں خوش آمدید';

  @override
  String get onboardingWelcomeBody =>
      'ایک میش نیٹ ورک پر ResilNet پر چیٹ کریں — یہاں تک کہ انٹرنیٹ کے بغیر';

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
  String get onboardingChannelsTitle => 'خفیہ کردہ چیٹ + قریبی چینلز';

  @override
  String get onboardingChannelsBody =>
      'قریبی ساتھیوں کو تلاش کرنے کے لیے #mesh / ایریا (geohash) کو سوئچ کریں — پیغامات E2EE BLE میش اور Nostr پر رہتے ہیں۔';

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
  String get chatTitle => 'چیٹ (E2EE)';

  @override
  String get chatScanTooltip => 'ہم مرتبہ کو شامل کرنے کے لیے QR اسکین کریں۔';

  @override
  String get chatBlockTooltip => 'اس بھیجنے والے کو مسدود کریں۔';

  @override
  String get chatBlockedSnack => 'مسدود: کوئی اطلاع نہیں / کوئی ریلے نہیں۔';

  @override
  String get chatAliasTooltip => 'عرفی نام مقرر کریں۔';

  @override
  String get chatReceiverPemLabel => 'وصول کنندہ عوامی کلید (PEM)';

  @override
  String get chatReceiverPemHint =>
      'اپنے دوست کی عوامی کلید چسپاں کریں (QR / مشترکہ فائل سے)';

  @override
  String get chatNeedPeerKey =>
      'اس ہم مرتبہ کا QR پہلے اسکین کریں (تصدیق شدہ عوامی کلید درکار ہے)';

  @override
  String get chatPeerKeyMismatch =>
      'ذخیرہ شدہ عوامی کلید اس ہم مرتبہ کی شناخت سے مماثل نہیں ہے۔';

  @override
  String chatVoiceFailed(String error) {
    return 'آڈیو ریکارڈ نہیں کیا جا سکا: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'صوتی نوٹ نہیں چل سکا: $error';
  }

  @override
  String get chatPlayVoice => 'صوتی نوٹ چلائیں۔';

  @override
  String get chatPauseVoice => 'توقف';

  @override
  String get chatVoiceLabelSent => '🎤 صوتی نوٹ (مہر بند)';

  @override
  String get chatVoiceLabel => '🎤 وائس نوٹ';

  @override
  String get chatDecryptFailed => '[ڈیکرپشن ناکام]';

  @override
  String chatSentSealed(String preview) {
    return '[سیل بند • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[سیل شدہ]';

  @override
  String get chatComposeHint =>
      'ایک پیغام ٹائپ کریں… (بھیجنے پر مہر لگا دی گئی)';

  @override
  String get chatEmptyThread =>
      'ابھی تک کوئی پیغامات نہیں ہیں۔\nمیش پر بھیجنے کے لیے نیچے ٹائپ کریں۔';

  @override
  String chatLoadFailed(String error) {
    return 'گفتگو لوڈ نہیں ہو سکی: $error';
  }

  @override
  String get chatEmojiTooltip => 'ایموجی';

  @override
  String get statusPending => 'زیر التواء';

  @override
  String get statusSent => 'بھیجا';

  @override
  String get statusRelayed => 'ریلے';

  @override
  String get statusDelivered => 'پہنچایا';

  @override
  String get statusRead => 'پڑھیں';

  @override
  String get statusFailed => 'ناکام';

  @override
  String get chatCopy => 'کاپی';

  @override
  String get chatDeleteLocal => 'اس ڈیوائس پر حذف کریں۔';

  @override
  String get chatDeletedLocalSnack => 'اس آلہ پر حذف کر دیا گیا۔';

  @override
  String get chatRetry => 'دوبارہ کوشش کریں۔';

  @override
  String get chatSendFailed => 'ڈیلیور نہیں ہوا — دوبارہ کوشش پر ٹیپ کریں۔';

  @override
  String get chatImageNeedInternet => 'تصاویر بھیجنے کے لیے انٹرنیٹ سے جڑیں۔';

  @override
  String get chatImageTooLargeOnline =>
      'بھیجنے کے لیے تصویر کو کافی کمپریس نہیں کیا جا سکا';

  @override
  String get chatOpenLinkFailed => 'لنک نہیں کھول سکا';

  @override
  String get identityTitle => 'شناخت';

  @override
  String get identityScanTooltip => 'کیمرے کے ساتھ QR اسکین کریں۔';

  @override
  String get identityCopiedHash => 'عوامی کلید ہیش کاپی ہو گئی۔';

  @override
  String get identityPeerSaved => 'پیر کو QR سے محفوظ کیا گیا۔';

  @override
  String get identityGalleryDenied => 'فوٹو لائبریری کی اجازت مسترد کر دی گئی۔';

  @override
  String get identityQrSaved => 'QR فوٹو لائبریری میں محفوظ ہو گیا۔';

  @override
  String identityQrSaveFailed(String error) {
    return 'QR کو محفوظ نہیں کیا جا سکا: $error';
  }

  @override
  String get peersTitle => 'نیٹ ورک کے اراکین';

  @override
  String get qrScanTitle => 'دوست کو شامل کرنے کے لیے QR اسکین کریں۔';

  @override
  String get qrInvalid => 'اسکین ناکام: غلط QR';

  @override
  String get qrIdKeyMismatch => 'QR مسترد: id عوامی کلید سے مماثل نہیں ہے۔';

  @override
  String get qrCameraNotReady => 'کیمرہ تیار نہیں ہے۔';

  @override
  String get qrRetrySettings => 'دوبارہ کوشش کریں / ترتیبات کھولیں۔';

  @override
  String qrCameraOpenFailed(String error) {
    return 'کیمرہ نہیں کھولا جا سکا: $error';
  }

  @override
  String get qrScanAlignHint => 'QR کوڈ کو فریم کے اندر سیدھ کریں۔';

  @override
  String get firmwareDownloadTitle => 'ESP32 فرم ویئر ڈاؤن لوڈ کریں۔';

  @override
  String get firmwareSourceOnline => 'تازہ ترین (آن لائن)';

  @override
  String get firmwareSourceCached => 'محفوظ شدہ کاپی (آف لائن)';

  @override
  String get firmwareSourceBaseline => 'بنڈل بیس لائن (آف لائن)';

  @override
  String get firmwareSourceUnavailable => 'کوئی فرم ویئر دستیاب نہیں ہے۔';

  @override
  String get firmwareBaselineIncompatible =>
      'بنڈل فرم ویئر بہت پرانا ہے — ایک نیا ورژن ڈاؤن لوڈ کرنے کے لیے انٹرنیٹ سے جڑیں۔';

  @override
  String get firmwareChecksumFailed =>
      'فرم ویئر کی سالمیت کی جانچ میں ناکامی - چمکتا ہوا مسدود';

  @override
  String firmwareReadyFromSource(String source) {
    return 'فرم ویئر تیار: $source';
  }

  @override
  String get peersRefreshTooltip => 'ریفریش کریں۔';

  @override
  String get peersBlocked => 'مسدود';

  @override
  String get peersNearbyBle => 'قریبی (BLE)';

  @override
  String get peersRecentlyOnline => 'حال ہی میں آن لائن';

  @override
  String get peersOnlineInArea => 'علاقے میں آن لائن';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return '$minutes منٹ پہلے دیکھا';
  }

  @override
  String get peersOffline => 'آف لائن';

  @override
  String peersBlockedSnack(String id) {
    return 'مسدود $id';
  }

  @override
  String get peersUnblockedSnack => 'غیر مسدود';

  @override
  String get peersEmpty =>
      'ڈیٹا بیس میں ابھی تک کوئی ممبر نہیں ہے۔\nQR اسکین کریں یا BLE میش دریافت کا انتظار کریں۔';

  @override
  String get peersOpenChat => 'چیٹ کھولیں۔';

  @override
  String get peersBlockAction => 'بلاک';

  @override
  String get peersUnblockAction => 'غیر مسدود کریں۔';

  @override
  String get channelPickerTooltip => 'چیٹ / #mesh / ایریا';

  @override
  String get locationPickerTooltip => 'مقام چینل';

  @override
  String get transportPickerTooltip => 'میش / انٹرنیٹ / آٹو';

  @override
  String get onlinePeopleTooltip => 'لوگ آن لائن';

  @override
  String get unreadDirectsTooltipEmpty => 'نجی پیغامات';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count بغیر پڑھے ہوئے نجی پیغامات';
  }

  @override
  String get onlinePeopleTitle => 'لوگ';

  @override
  String get onlinePeopleEmpty => 'یہاں ابھی تک کوئی آن لائن نہیں ہے۔';

  @override
  String onlinePeopleCount(int count) {
    return '$count آن لائن';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · قریبی + علاقہ';

  @override
  String get peerOnlineMeshTitle => 'میش پر قریبی کوئی';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name میش پر قریب ہی ہے۔';
  }

  @override
  String get peerOnlineAreaTitle => 'علاقے میں کوئی آن لائن';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name Nostr کے ذریعے آن لائن ہے۔';
  }

  @override
  String get locationSheetTitle => '#مقام کے چینلز';

  @override
  String get channelPinsTitle => 'پن لگا ہوا';

  @override
  String get channelPinsHint =>
      'ان چینلز کو پن کریں جنہیں آپ اکثر استعمال کرتے ہیں — وہ سب سے اوپر رہتے ہیں۔';

  @override
  String get channelPinTooltip => 'اس چینل کو پن کریں۔';

  @override
  String get channelUnpinTooltip => 'پن کھول دیں۔';

  @override
  String get locationSheetIntro =>
      'موٹے جیوہاش کا استعمال کرتے ہوئے آس پاس کے لوگوں کے ساتھ چیٹ کریں — درست GPS نہیں۔ انٹرنیٹ پر موجودگی گمنام Nostr کلیدوں کا استعمال کرتی ہے۔';

  @override
  String get locationMeshSubtitle => 'بلوٹوتھ • ~10–50 میٹر';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => 'ٹیلی پورٹ';

  @override
  String homeComposeHint(String channel) {
    return 'پیغام $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return 'عوام $channel کو بھیجیں';
  }

  @override
  String get messageExpiryTitle => 'میں میعاد ختم ہو جاتی ہے۔';

  @override
  String get voiceRecordTapToStart =>
      'صوتی پیغام ریکارڈ کرنے کے لیے تھپتھپائیں۔';

  @override
  String get voiceRecordTooShort => 'ریکارڈنگ بہت مختصر ہے — دوبارہ کوشش کریں۔';

  @override
  String get voiceRecordFailed =>
      'ریکارڈنگ محفوظ نہیں ہو سکی — دوبارہ کوشش کریں۔';

  @override
  String get voicePttHold => 'ریکارڈ کرنے کے لیے پکڑو';

  @override
  String get voicePttRelease => 'پیش نظارہ کے لیے ریلیز کریں۔';

  @override
  String get voicePttRecording => 'ریکارڈنگ…';

  @override
  String get voicePttDraftReady => 'صوتی نوٹ تیار ہے۔';

  @override
  String get voicePttDiscard => 'خارج کردیں';

  @override
  String get voicePttReRecord => 'دوبارہ ریکارڈ کریں۔';

  @override
  String get voicePttSend => 'صوتی نوٹ بھیجیں۔';

  @override
  String get voicePttPlayPreview => 'پیش نظارہ کھیلیں';

  @override
  String get voicePttStopPreview => 'پیش نظارہ بند کریں۔';

  @override
  String get noticesBackfilling => 'نوٹسز لوڈ ہو رہے ہیں…';

  @override
  String get noticesNostrOnline => 'Nostr آن لائن';

  @override
  String get noticesNostrOffline =>
      'Nostr آف لائن — بلیٹن کو انٹرنیٹ کی ضرورت ہے۔';

  @override
  String noticesBackfillLoaded(int count) {
    return 'لوڈ کیے گئے $count نوٹس';
  }

  @override
  String get noticePublishFailed =>
      'ایریا بورڈ کو نوٹس شائع نہیں کیا جا سکا۔ Nostr کنکشن چیک کریں۔';

  @override
  String get noticeMeshPublishNoLink =>
      'مقامی طور پر محفوظ کیا گیا۔ قریبی میش ریڈیو (یا Wi‑Fi گیٹ وے) سے جڑیں تاکہ دوسرے اسے وصول کر سکیں۔';

  @override
  String noticeMeshPublishSent(int count) {
    return 'بلیٹن BLE سے زیادہ $count قریبی ڈیوائس (آلات) کو بھیجا گیا۔';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'قریبی ریڈیو دیکھے گئے، لیکن BLE لکھنا ناکام ہوگیا۔ نوٹس اسکرین پر دونوں ایپس کو کھلا رکھیں اور دوبارہ کوشش کریں (یا ESP32 ریلے استعمال کریں)۔';

  @override
  String get noticeMeshPublishNoGatt =>
      'اس ڈیوائس کا BLE ریسیور تیار نہیں ہے۔ بلوٹوتھ ٹوگل کریں اور نوٹسز کو دوبارہ کھولیں۔';

  @override
  String get noticeDelete => 'نوٹس حذف کریں۔';

  @override
  String get noticeDeleteConfirmTitle => 'اس نوٹس کو حذف کریں؟';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'یہ اسے صرف اس ڈیوائس پر ہٹاتا ہے۔ دوسرے جنہوں نے پہلے ہی اسے حاصل کیا ہے وہ اب بھی اسے دیکھیں گے۔';

  @override
  String get noticeDeleted => 'نوٹس حذف کر دیا گیا۔';

  @override
  String get chatNoticeHidden => 'ایریا نوٹس - کھلے نوٹس';

  @override
  String get identityDisplayNameTitle => 'ڈسپلے کا نام';

  @override
  String get identitySaveName => 'نام محفوظ کریں۔';

  @override
  String get identityUserIdLabel => 'یوزر آئی ڈی (عوامی کلید ہیش)';

  @override
  String get identityCopyHashTooltip => 'عوامی کلید ہیش کو کاپی کریں۔';

  @override
  String get identityMyQrTitle => 'میرا QR (id + pubKey + نام)';

  @override
  String identityQrFailed(String error) {
    return 'QR نہیں بنایا جا سکا\n$error';
  }

  @override
  String get identitySaving => 'محفوظ ہو رہا ہے…';

  @override
  String get identitySaveQr => 'QR کو فوٹو لائبریری میں محفوظ کریں۔';

  @override
  String get identityOpenScanner => 'QR اسکین کرنے کے لیے کیمرہ کھولیں۔';

  @override
  String get identityQrHelp =>
      'اپنی عوامی کلید کو محفوظ کرنے کے لیے کسی دوست سے اسے اسکین کرنے کو کہیں اور (اگر ضرورت ہو) آپ کو تصدیق شدہ جاری کنندہ کے طور پر سیٹ کریں۔';

  @override
  String get identityChatTip =>
      'مشورہ: آپ E2EE کے لیے عوامی کلید شامل کرنے کے لیے چیٹ میں QR بھی اسکین کر سکتے ہیں۔';

  @override
  String get infoOpen => 'کے بارے میں / معلومات';

  @override
  String get docsGuideTitle => 'صارف گائیڈ';

  @override
  String get docsGuideSubtitle => 'براؤزر میں کھلتا ہے۔';

  @override
  String get docsOpenAction => 'گائیڈ کھولیں۔';

  @override
  String get docsOpenFailed => 'صارف گائیڈ نہیں کھول سکا';

  @override
  String get firmwareOtaGuideTitle => 'فلیش گائیڈ اور او ٹی اے پروٹوکول';

  @override
  String get firmwareOtaGuideSubtitle =>
      'ویب گائیڈ کھولتا ہے — .bin ڈاؤن لوڈز اور مکمل مراحل';

  @override
  String get firmwareWebDownloadsTitle => 'ویب پر فرم ویئر ڈاؤن لوڈز';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'دستاویزات کی سائٹ پر فی ورژن لنکس اور چیکسم';

  @override
  String get inviteCopyShortLink => 'مختصر لنک کاپی کریں۔';

  @override
  String get inviteShareLink => 'لنک شیئر کریں۔';

  @override
  String get inviteShowFullLink => 'مکمل لنک';

  @override
  String get inviteCopyFullLink => 'مکمل لنک کاپی کریں۔';

  @override
  String get inviteLinkCopied => 'لنک کاپی ہو گیا۔';

  @override
  String get inviteLongPressHint => 'لنک کی کارروائیوں کے لیے دیر تک دبائیں۔';

  @override
  String get inviteSendInChat => 'ResilNet چیٹ میں بھیجیں…';

  @override
  String get inviteSendInChatHint =>
      'صرف ان لوگوں کے لیے جو آپ کے پاس پہلے سے ہی عوامی کلید ہے۔';

  @override
  String get inviteSendInChatEmpty =>
      'ابھی تک کوئی پیغام رسانی چیٹ نہیں ہے۔\nQR اسکین کریں، ایریا/میش کھولیں، یا پہلے ایپ سے باہر لنک کا اشتراک کریں۔';

  @override
  String get inviteSentToChat => 'دعوت نامہ چیٹ میں بھیجا گیا۔';

  @override
  String get infoTabInfo => 'معلومات';

  @override
  String get infoTabSettingsHint =>
      'زبان، E2EE، اور ڈیٹا ٹولز کے لیے مینو سے ترتیبات کھولیں۔';

  @override
  String get infoHowToTitle => 'استعمال کرنے کا طریقہ';

  @override
  String get infoHowToBody =>
      '• چیٹ / #mesh / ایریا کو تبدیل کرنے کے لیے چینل آئیکن کو تھپتھپائیں۔\n• جیوہاش سائز منتخب کرنے کے لیے جگہ کو تھپتھپائیں۔\n• ممبران یا جو آن لائن ہیں کے لیے لوگوں کو تھپتھپائیں۔\n• ذاتی طور پر چابیاں کا تبادلہ کرنے کے لیے ⋮ سے شناخت/QR کھولیں۔\n• ایریا \"عوامی\" ہر آن لائن ساتھی کو سیل بند E2EE بھیجتا ہے - سادہ متن والے کمرے کو نہیں۔';

  @override
  String get infoFeaturesTitle => 'خصوصیات';

  @override
  String get infoFeatureOffline =>
      'بلوٹوتھ لو انرجی کے ذریعے آف لائن پیغام رسانی';

  @override
  String get infoFeatureE2ee =>
      'RSA-OAEP + AES-GCM کے ساتھ اینڈ ٹو اینڈ انکرپشن (شور نہیں)';

  @override
  String get infoFeatureMultihop =>
      'پیغامات قریبی ساتھیوں کے ذریعے آگے بڑھ سکتے ہیں۔';

  @override
  String get infoFeatureBridge =>
      'ہائبرڈ میش ↔ انٹرنیٹ (Nostr) سیل بند لفافوں کے لیے';

  @override
  String get infoFeatureGeo =>
      'قریبی لوگوں کے لیے مقامی جیوہاش چینلز (دریافت UX)';

  @override
  String get infoFeatureNotices =>
      'میش اور ایریا کے لیے میعاد ختم ہونے والے نوٹس';

  @override
  String get infoPrivacyTitle => 'رازداری';

  @override
  String get infoPrivacyNoRoom =>
      'تار پر کوئی سادہ متن گاؤں / عوامی چیٹ روم نہیں ہے۔';

  @override
  String get infoPrivacyFanout =>
      'ایریا بھیجیں = سیل شدہ 1:1 فین آؤٹ معلوم عوامی کلیدوں کے ساتھ ساتھیوں کو';

  @override
  String get infoPrivacyPresence =>
      'انٹرنیٹ کے علاقے میں موجودگی عارضی Nostr کلیدوں کا استعمال کرتی ہے۔';

  @override
  String get infoSymbolsTitle => 'علامتیں';

  @override
  String get infoSymBle => 'براہ راست بلوٹوتھ لنک';

  @override
  String get infoSymMesh => 'میش کے ذریعے قابل رسائی (دیگر آگے)';

  @override
  String get infoSymInternet => 'انٹرنیٹ کے ذریعے (Nostr) — مہر بند لفافے۔';

  @override
  String get infoSymBridge => 'میش↔انٹرنیٹ برج پاتھ کے ذریعے پہنچا';

  @override
  String get infoSymOffline => 'آف لائن — ابھی قابل رسائی نہیں ہے۔';

  @override
  String get infoSymInArea => 'اس مقام چینل کے علاقے میں';

  @override
  String get infoSymE2eeOk => 'اینڈ ٹو اینڈ انکرپٹڈ سیشن';

  @override
  String get infoSymE2eeFail =>
      'خفیہ کاری دستیاب نہیں ہے - حساس متن نہ بھیجیں۔';

  @override
  String get infoSymVerified => 'شناخت کی تصدیق شدہ / معلوم کلید';

  @override
  String get infoSymBlocked => 'مسدود';

  @override
  String get infoSymUnread => 'بغیر پڑھا ہوا نجی پیغام';

  @override
  String get infoEmergencyTitle => 'ایمرجنسی موڈ';

  @override
  String get infoEmergencyBody =>
      'اس ڈیوائس پر پیغامات، کلیدوں اور شناخت کو صاف کرنے کے لیے ہوم اسکرین پر ResilNet ٹائٹل کو تین بار تھپتھپائیں۔';

  @override
  String get infoLegendNote =>
      'کچھ راستے کی شبیہیں یہاں وضاحت کے لیے دستاویزی ہیں؛ چیٹ میں ڈیلیوری ٹِکس بنیادی بھیجنے کی حیثیت بنی ہوئی ہیں۔';

  @override
  String get dangerZoneTitle => 'خطرہ زون';

  @override
  String get dangerZoneSubtitle =>
      'اس ڈیوائس پر پیغامات، انکرپشن کیز، Nostr شناخت، ہم عمر افراد اور عرفی نام کو حذف کرتا ہے۔ آپ دوبارہ ترتیب دیں گے۔';

  @override
  String get panicWipeTitle => 'ہنگامی مسح';

  @override
  String get panicWipeSubtitle =>
      'مقامی ہر چیز کو مٹا دیں — ہوم ٹائٹل کو ٹرپل ٹیپ کرنے کی طرح (ڈبل ٹیپ ریڈیوز کو ریفریش کرتا ہے)';

  @override
  String get panicWipeConfirmTitle => 'تمام مقامی ڈیٹا کو صاف کریں؟';

  @override
  String get panicWipeConfirmBody =>
      'یہ اس فون پر چیٹس، کیز اور شناخت کو مستقل طور پر حذف کر دیتا ہے۔\nساتھیوں کو آپ کی نئی شناخت کے ساتھ QR کلیدوں کا دوبارہ تبادلہ کرنا چاہیے۔\nاسے کالعدم نہیں کیا جا سکتا۔';

  @override
  String get panicWipeAction => 'سب کچھ صاف کریں۔';

  @override
  String get panicWipeSnack => 'مقامی شناخت مٹا دی گئی — دوبارہ سیٹ اپ';

  @override
  String panicWipeFailed(String error) {
    return 'مسح کرنا ناکام ہو گیا: $error';
  }

  @override
  String get meshBridgeTitle => 'میش پل';

  @override
  String get meshBridgeSubtitle =>
      'آن ہونے پر (پہلے سے طے شدہ)، مہر بند لفافے BLE میش اور انٹرنیٹ (Nostr) دونوں کو ایک ساتھ استعمال کر سکتے ہیں تاکہ قریبی میش جزیرے آپس میں جڑ سکیں۔ بند ہونے پر بھیجتا ہے صرف ایک راستہ استعمال کرتا ہے — کبھی بھی تار پر سادہ متن نہیں رکھتا ہے۔';

  @override
  String get favoritesTitle => 'پسندیدہ';

  @override
  String get favoritesAdd => 'پسندیدہ میں شامل کریں۔';

  @override
  String get favoritesRemove => 'پسندیدہ سے ہٹا دیں۔';

  @override
  String get favoritesEmpty =>
      'ابھی تک کوئی پسندیدہ نہیں ہے - ممبر لسٹ سے ایک ہم مرتبہ کو ستارہ بنائیں';

  @override
  String get favoritesNearbyTitle => 'قریبی پسندیدہ';

  @override
  String favoritesNearbyBody(String name) {
    return '$name میش پر قریب ہی ہے۔';
  }

  @override
  String get favoritesInAreaTitle => 'علاقے میں پسندیدہ';

  @override
  String favoritesInAreaBody(String name) {
    return '$name اس علاقے میں آن لائن ہے۔';
  }

  @override
  String get topologyTitle => 'میش ٹوپولوجی';

  @override
  String get topologySubtitle =>
      'میش کی طرف سے ساتھیوں اور کنکشن کے اشارے (صرف پڑھنے کے لیے)';

  @override
  String get topologyConnectedNow => 'ابھی منسلک ہے (BLE)';

  @override
  String get topologyNearby => 'قریبی (BLE)';

  @override
  String get topologyKnown => 'جانے پہچانے ساتھی';

  @override
  String get topologyEmpty =>
      'ابھی تک کوئی ساتھی نہیں سیکھا — BLE آن کے ساتھ قریب رہیں';

  @override
  String get topologyYou => 'آپ';

  @override
  String topologyStats(int peers, int links) {
    return '$peers ساتھی · $links لنکس';
  }

  @override
  String get topologyGraphHint =>
      'قریبی میش دریافت سے اندازہ لگایا گیا ہے — آپ کا آلہ نمایاں ہے۔ چیٹ کھولنے کے لیے ہم مرتبہ کو تھپتھپائیں۔';

  @override
  String get topologyOpen => 'میش ٹوپولوجی';

  @override
  String get slashHelpTitle => 'احکام';

  @override
  String get slashHelpBody =>
      '/مدد - یہ فہرست\n/who — موجودہ چینل میں آن لائن لوگ\n/ڈراپ <text> — یہاں ایک مہر بند نوٹس پن کریں (E2EE فین آؤٹ)\n\nمکمل گائیڈ: نیچے کھولیں گائیڈ، یا سیٹنگز → صارف گائیڈ استعمال کریں۔';

  @override
  String get slashWhoEmpty => 'اس چینل میں اس وقت کوئی بھی آن لائن نہیں ہے۔';

  @override
  String slashWhoTitle(int count) {
    return 'آن لائن ($count)';
  }

  @override
  String get slashDropNeedText => 'استعمال: /اپنے نوٹ کا متن چھوڑ دیں۔';

  @override
  String slashDropDone(String channel) {
    return '$channel پر نوٹس چھوڑا گیا۔';
  }

  @override
  String get slashUnknown => 'نامعلوم کمانڈ - کوشش کریں /مدد کریں۔';

  @override
  String get announceOpen => 'اعلانات';

  @override
  String get announceTitle => 'اعلانات';

  @override
  String get announceEmpty =>
      'ابھی تک کوئی بورڈ نہیں ہے — لاک یا کھلے نوٹس پوسٹ کرنے کے لیے ایک بنائیں';

  @override
  String get announceCreate => 'بورڈ بنائیں';

  @override
  String get announceCreateHint => 'بورڈ کا نام';

  @override
  String get announceDefaultTitle => 'کمیونٹی بورڈ';

  @override
  String get announceSettings => 'بورڈ کی ترتیبات';

  @override
  String get announceAllowLocked => 'مقفل (انکرپٹڈ) پوسٹس کی اجازت دیں۔';

  @override
  String get announceAllowLockedSub =>
      'بورڈ کی کلید پر خفیہ کردہ — قارئین کو رسائی کی ضرورت ہے۔';

  @override
  String get announceAllowOpen => 'کھلی (سادہ تحریر) پوسٹس کی اجازت دیں۔';

  @override
  String get announceAllowOpenSub =>
      'E2EE نہیں — میش/ریلے پر پڑھنے کے قابل۔ بطور ڈیفالٹ آف۔';

  @override
  String get announceComposeHint => 'ایک اعلان لکھیں…';

  @override
  String get announceMediaInternetOnly =>
      'تصویر/صوتی اعلانات انٹرنیٹ پر بھیجے جاتے ہیں (BLE نہیں)';

  @override
  String get announceNeedInternet =>
      'تصویر یا صوتی اعلانات بھیجنے کے لیے انٹرنیٹ سے جڑیں۔';

  @override
  String announceVoiceFailed(String error) {
    return 'آواز کو ریکارڈ نہیں کیا جا سکا: $error';
  }

  @override
  String get announceImageTooLarge =>
      'تصویر بہت بڑی ہے (زیادہ سے زیادہ ~180 KB)';

  @override
  String get announcePlayVoice => 'صوتی نوٹ چلائیں۔';

  @override
  String get announceImageLabel => '📷 تصویر';

  @override
  String get announceAudioLabel => '🎤 وائس نوٹ';

  @override
  String get announceModeLocked => 'مقفل';

  @override
  String get announceModeOpen => 'کھولیں۔';

  @override
  String get announceOpenBadge => 'OPEN · خفیہ کردہ نہیں ہے۔';

  @override
  String get announceLockedBadge => 'مقفل';

  @override
  String get announceLockedPlaceholder =>
      'خفیہ کردہ — پڑھنے کے لیے رسائی کی درخواست کریں۔';

  @override
  String get announceRequestAccess => 'رسائی کی درخواست کریں۔';

  @override
  String get announceRequestSent =>
      'بورڈ کے مالک کو رسائی کی درخواست بھیجی گئی۔';

  @override
  String get announceRequestFailed =>
      'رسائی کی درخواست نہیں کی جا سکی (مالک کی عوامی کلید کی ضرورت ہے)';

  @override
  String get announceOpenConfirmTitle => 'خفیہ کاری کے بغیر پوسٹ کریں؟';

  @override
  String get announceOpenConfirmBody =>
      'کھلی پوسٹس E2EE نہیں ہیں۔ راستے میں کوئی بھی شخص (میش / ریلے) انہیں پڑھ سکتا ہے۔ جاری رکھیں؟';

  @override
  String get announcePostAction => 'پوسٹ';

  @override
  String get announcePendingRequests => 'رسائی کی درخواستیں۔';

  @override
  String get announceApprove => 'منظور کرو';

  @override
  String get announceDeny => 'انکار کرنا';

  @override
  String get announceGranted => 'آپ اس بورڈ پر مقفل پوسٹس پڑھ سکتے ہیں۔';

  @override
  String get announceOwner => 'آپ اس بورڈ کے مالک ہیں۔';

  @override
  String get announceCopyInvite => 'دعوت نامہ کاپی کریں۔';

  @override
  String get announceShowInviteQr => 'دعوت QR دکھائیں۔';

  @override
  String get announceScanInviteQr => 'اسکین بورڈ انوائٹ QR';

  @override
  String get announceFollow => 'دعوت نامے سے بورڈ کی پیروی کریں۔';

  @override
  String get announceFollowHint =>
      'مدعو متن یا مالک کی طرف سے ResilNet لنک پیسٹ کریں۔';

  @override
  String get announceFollowOk => 'مندرجہ ذیل بورڈ';

  @override
  String announceFollowOkNamed(String title) {
    return 'اب \"$title\" کی پیروی کریں';
  }

  @override
  String get announceFollowFail => 'دعوت غلط ہے یا خراب ہے۔';

  @override
  String get announceInviteCopied => 'مدعو متن کاپی ہو گیا۔';

  @override
  String get announceInviteSaveQr => 'QR محفوظ کریں۔';

  @override
  String get announceInviteShare => 'دعوت کا اشتراک کریں۔';

  @override
  String get announceFollowFromCompose =>
      'میسج باکس میں بورڈ کے دعوت نامے کا پتہ چلا';

  @override
  String get peerConfirmAddTitle => 'نیٹ ورک ممبر شامل کریں؟';

  @override
  String peerConfirmAddBody(String name) {
    return '\"$name\" کو ان کی عوامی کلید کے ساتھ شامل کریں تاکہ آپ انہیں نجی طور پر پیغام بھیج سکیں؟';
  }

  @override
  String get peerConfirmAdd => 'ممبر شامل کریں۔';

  @override
  String peerAddedOk(String name) {
    return 'نیٹ ورک کے اراکین میں $name کو شامل کیا گیا۔';
  }

  @override
  String get peerAddFromCompose =>
      'میسج باکس میں شناخت / عوامی کلید کا پتہ چلا';

  @override
  String get peerHashCopied => 'عوامی کلید ہیش کاپی ہو گئی۔';

  @override
  String get peerHashOpenChat => 'چیٹ کھولیں۔';

  @override
  String get peerHashAddHint =>
      'ہیش کاپی ہو گیا۔ ان سے اپنا شناختی لنک یا QR شیئر کرنے کو کہیں تاکہ آپ E2EE کے لیے مکمل عوامی کلید شامل کر سکیں۔';

  @override
  String get peerQrNoCode => 'اس تصویر میں کوئی ResilNet QR نہیں ملا';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet شناخت: \"$name\"\nلنک کو کھولیں یا اسے چیٹ میں پیسٹ کریں → ممبر شامل کریں۔\nیا شناختی QR اسکین کریں۔';
  }

  @override
  String get identityShareInvite => 'شناختی لنک شیئر کریں۔';

  @override
  String get identityInviteCopied => 'شناختی لنک کاپی ہو گیا۔';

  @override
  String announceInviteSharePreamble(String title) {
    return 'بورڈ کی دعوت: \"$title\"\nکھولیں ResilNet → کمیونٹی بورڈز → دعوت سے پیروی کریں۔\nیا QR اسکین کریں / نیچے دیئے گئے لنک پر ٹیپ کریں۔';
  }

  @override
  String get announceConfirmFollowTitle => 'اس بورڈ کی پیروی کریں؟';

  @override
  String announceConfirmFollowBody(String title) {
    return 'اس دعوت سے \"$title\" کی پیروی کریں؟';
  }

  @override
  String get announceConfirmFollow => 'پیروی کریں۔';
}

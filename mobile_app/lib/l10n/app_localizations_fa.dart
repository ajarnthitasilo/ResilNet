// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'در حال بازخوانی ResilNet…';

  @override
  String get appRefreshed => 'تازه - رادیوها و اکتشاف دوباره راه اندازی شد';

  @override
  String appRefreshFailed(String error) {
    return 'بازخوانی انجام نشد: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'دو بار ضربه بزنید = تازه کردن نرم. فشار طولانی = بازیابی سخت. سه ضربه = پاک کردن اضطراری.';

  @override
  String get softRefreshTipTitle => 'اگر ResilNet احساس کند گیر کرده است';

  @override
  String get softRefreshTipBody =>
      'برای تازه‌سازی رادیویی نرم، روی ResilNet (بالا سمت چپ) دو ضربه بزنید. اگر همچنان گیر کرده اید: عنوان را طولانی فشار دهید، از ⋮ → بازیابی سخت یا تنظیمات استفاده کنید. سه ضربه فقط پاک کردن اضطراری است.';

  @override
  String get softRefreshTipGotIt => 'متوجه شدم';

  @override
  String get infoSoftRefreshTitle => 'اگر برنامه احساس می کند گیر کرده است';

  @override
  String get infoSoftRefreshStepRefresh =>
      'دو ضربه سریع روی ResilNet (بالا سمت چپ) ← رادیوهای تازه سازی نرم و افراد اطراف';

  @override
  String get infoSoftRefreshStepHard =>
      'هنوز گیر کرده اید؟ عنوان را فشار دهید، یا ⋮ / تنظیمات → بازیابی سخت';

  @override
  String get infoSoftRefreshStepWait =>
      'منتظر اسنکبار نتیجه باشید، سپس دوباره امتحان کنید. تنظیم مجدد جلسه کلیدهای شما را نگه می دارد.';

  @override
  String get infoSoftRefreshStepWipe =>
      'سه ضربه = پاک کردن اضطراری (داده های محلی را حذف می کند) - فقط در صورت عمدی';

  @override
  String get appRecoverySection => 'بازیابی برنامه';

  @override
  String get appRecoverySectionSubtitle =>
      'زمانی استفاده کنید که برنامه احساس می‌کند منجمد شده است. نرم = عنوان دو ضربه سریع. بازیابی سخت قوی تر است. بازنشانی جلسه خدمات را بدون پاک کردن کلیدها مجدداً راه اندازی می کند.';

  @override
  String get appHardRecoverAction => 'ریکاوری سخت';

  @override
  String get appHardRecovering => 'بهبودی سخت…';

  @override
  String get appSessionResetAction => 'بازنشانی جلسه';

  @override
  String get appSessionResetRunning => 'بازنشانی جلسه…';

  @override
  String get appSessionResetConfirmTitle => 'بازنشانی جلسه؟';

  @override
  String get appSessionResetConfirmBody =>
      'خدمات ResilNet را در این دستگاه مجدداً راه اندازی می کند. کلیدهای هویت شما حفظ می شود.';

  @override
  String get appRecoveryBusy => 'بازیابی از قبل در حال اجراست…';

  @override
  String get appRecoveryOk => 'ریکاوری تمام شد';

  @override
  String get appRecoveryPartial =>
      'بازیابی با رد شدن برخی از مراحل به پایان رسید - اگر هنوز گیر کرده اید دوباره امتحان کنید';

  @override
  String get appRecoveryFailed =>
      'بازیابی انجام نشد - بازنشانی جلسه را امتحان کنید، یا برنامه را به اجبار از سیستم عامل خارج کنید';

  @override
  String get localWifiTitle => 'محلی Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'دستگاه‌های اطراف را بدون اینترنت پیوند دهید - مانند اینکه در یک LAN باشید.';

  @override
  String get localWifiNotGatewayHint =>
      'نه دروازه ESP32 LoRa SoftAP. این فقط تلفن ↔ تلفن / LAN است.';

  @override
  String get localWifiUnavailable =>
      'Wi‑Fi محلی هنوز آماده نیست — منتظر راه اندازی برنامه باشید.';

  @override
  String get lxmfBridgeTitle => 'گره خانه';

  @override
  String get lxmfBridgeSubtitle =>
      'Mac یا Pi اختیاری در Wi‑Fi شما که چت های مهر و موم شده را پخش می کند. به طور پیش فرض خاموش است. جایگزین رمزگذاری انتها به انتها نمی شود.';

  @override
  String get lxmfBridgeEnable => 'از گره خانگی استفاده کنید';

  @override
  String get lxmfBridgeDisabledHint =>
      'فقط زمانی روشن شود که برنامه بریج روی Mac یا Pi در این شبکه اجرا شود.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'آنلاین — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'نمی توان به گره اصلی رسید - $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'آدرس گره خانه';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP یا http://IP:port — مثال 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'همتا → LXMF مقصد (JSON)';

  @override
  String get lxmfBridgeRefresh => 'وضعیت ذخیره و بازخوانی';

  @override
  String get lxmfBridgeLabHint => 'پیشرفته: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'تنظیمات گره خانه';

  @override
  String get lxmfBridgeCheckConnection => 'اتصال را بررسی کنید';

  @override
  String get lxmfBridgeStatusOnline => 'به گره خانه متصل شد';

  @override
  String get lxmfBridgeStatusOffline => 'گره اصلی قابل دسترسی نیست';

  @override
  String get lxmfBridgeYourDest => 'آدرس این گره (به اشتراک گذاری با دوستان)';

  @override
  String get lxmfBridgeCopyDest => 'آدرس را کپی کنید';

  @override
  String get lxmfBridgeDestCopied => 'آدرس کپی شد';

  @override
  String get lxmfBridgeLinkedPeers => 'دوستان لینک شده';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'هر دوست یک بار به آدرس گره خانه خود نیاز دارد. سپس چت های مهر و موم شده می توانند از این مسیر استفاده کنند.';

  @override
  String get lxmfBridgeNoLinks => 'هنوز هیچ دوستی لینک نشده است.';

  @override
  String get lxmfBridgeAddLink => 'پیوند یک دوست';

  @override
  String get lxmfBridgePickPeer => 'دوست';

  @override
  String get lxmfBridgePeerDest => 'آدرس گره خانه آنها';

  @override
  String get lxmfBridgePeerDestHint => 'کد 32 کاراکتری از صفحه گره اصلی آنها';

  @override
  String get lxmfBridgeInvalidDest =>
      'آن آدرس معتبر به نظر نمی رسد. کد کامل را از گره اصلی خود جایگذاری کنید.';

  @override
  String get lxmfBridgeRemoveLink => 'لغو پیوند';

  @override
  String get lxmfBridgeSaveLink => 'ذخیره کنید';

  @override
  String get lxmfBridgeLinkSaved => 'دوست لینک شد';

  @override
  String get lxmfBridgeNoPeers =>
      'هنوز مخاطبی قابل پیام نیست — ابتدا یک دوست اضافه کنید.';

  @override
  String get lxmfBridgeHelp =>
      'پل را روی Mac/Pi در حال اجرا نگه دارید. این مسیر در LAN شما باقی می ماند — LoRa نیست و جایگزین اینترنت یا مش بلوتوث نمی شود.';

  @override
  String get localWifiModeHotspot => 'همین نزدیکی';

  @override
  String get localWifiModeRouter => 'روتر';

  @override
  String get localWifiHotspotIntro =>
      'یک دستگاه یک Hotspot شخصی را به اشتراک می گذارد. دیگران به آن نقطه اتصال می‌پیوندند، سپس ResilNet آنها را در شبکه محلی پیدا می‌کند.';

  @override
  String get localWifiHostAction => 'ایجاد شبکه (میزبان)';

  @override
  String get localWifiJoinAction => 'به شبکه بپیوندید';

  @override
  String get localWifiHostSteps =>
      '1. تنظیمات iOS/Android را باز کرده و Personal Hotspot (یا به اشتراک گذاری اینترنت) را روشن کنید.\n2. نام (و رمز عبور) هات اسپات را به دوستان بگویید.\n3. به اینجا بازگردید و روی \"Hotspot is on - start انتظار\" ضربه بزنید.';

  @override
  String get localWifiHostReady => 'نقطه اتصال روشن است - شروع به انتظار کنید';

  @override
  String get localWifiHostWaiting => 'منتظر عضویت دوستان…';

  @override
  String get localWifiJoinSteps =>
      '1. تنظیمات سیستم را باز کنید و به Hotspot شخصی دوست خود بپیوندید.\n2. به اینجا برگردید و روی «I\'m connect — search» ضربه بزنید.';

  @override
  String get localWifiJoinReady => 'من متصل هستم - جستجو کنید';

  @override
  String get localWifiRouterIntro =>
      'هر دستگاه را به همان Wi‑Fi روتر/AP متصل کنید. روتر به اینترنت نیاز ندارد - فقط یک شبکه محلی مشترک.';

  @override
  String get localWifiRouterSearch => 'در این Wi‑Fi جستجو کنید';

  @override
  String get localWifiRefreshNetwork => 'بازخوانی اطلاعات Wi‑Fi';

  @override
  String get localWifiRouterNoWifiTitle => 'نه در Wi‑Fi';

  @override
  String get localWifiRouterNoWifiBody =>
      'به Wi‑Fi روتر در تنظیمات سیستم بپیوندید، سپس دوباره جستجو کنید.';

  @override
  String get localWifiDiscovering => 'در حال جستجو در Wi‑Fi محلی…';

  @override
  String get localWifiPeersFound => 'دستگاه های موجود در این شبکه';

  @override
  String get localWifiStop => 'توقف کنید';

  @override
  String get localWifiSsidUnknown => 'نام Wi‑Fi در دسترس نیست';

  @override
  String get localWifiStubBanner => 'در انتظار سوکت LAN…';

  @override
  String get localWifiLiveBanner =>
      'کشف LAN زنده (UDP) - چت + مهر و موم شده را در این Wi‑Fi اعلام کنید';

  @override
  String get localWifiEmptyHotspot =>
      'هنوز دستگاهی وجود ندارد.\nبررسی کنید که دوستان به نقطه اتصال شما بپیوندند و به شبکه محلی اجازه دسترسی داشته باشند.';

  @override
  String get localWifiEmptyRouter =>
      'هنوز دستگاهی وجود ندارد.\nهمان SSID؟ شبکه محلی مجاز است؟ برخی از روترها ترافیک دستگاه به دستگاه را مسدود می کنند (ایزوله AP).';

  @override
  String get localWifiIsolationHelp => 'چرا ما نمی توانیم همدیگر را پیدا کنیم؟';

  @override
  String get localWifiIsolationTitle => 'روتر ممکن است کلاینت ها را ایزوله کند';

  @override
  String get localWifiIsolationBody =>
      'اگر جداسازی AP/Client (یا یک شبکه مهمان) روشن باشد، تلفن‌های روی همان Wi‑Fi نمی‌توانند صحبت کنند. ایزوله را خاموش کنید، از SSID اصلی استفاده کنید یا به حالت Nearby (Hotspot) بروید.';

  @override
  String get localWifiPeerReady => 'آماده برای چت (دارای کلید)';

  @override
  String get localWifiPeerNeedKey =>
      'پیدا شد - برای تبادل کلیدها، QR را اسکن کنید';

  @override
  String get localWifiErrorTitle => 'خطای محلی Wi‑Fi';

  @override
  String get localWifiErrorBody =>
      'مشکلی پیش آمد. توقف کنید و دوباره امتحان کنید.';

  @override
  String get preparingSystem => 'در حال آماده سازی سیستم…';

  @override
  String get bootFailedTitle => 'شروع نشد';

  @override
  String get retry => 'دوباره امتحان کنید';

  @override
  String get bootRecoveryAction => 'شروع هویت جدید (پاک کردن داده های محلی)';

  @override
  String get bootRecoveryConfirmTitle => 'شروع هویت جدید؟';

  @override
  String get bootRecoveryConfirmBody =>
      'با این کار چت‌های محلی، کلیدها و هویت این دستگاه برای همیشه پاک می‌شود.\nهمتایان باید QR شما را دوباره با هویت جدیدتان اسکن کنند.\nاین قابل واگرد نیست.';

  @override
  String get bootRecoveryRunning => 'بازنشانی هویت محلی…';

  @override
  String get bootRecoverySuccess => 'بازنشانی هویت محلی کامل شد';

  @override
  String bootRecoveryFailed(String error) {
    return 'هویت بازنشانی نشد: $error';
  }

  @override
  String get cancel => 'لغو کنید';

  @override
  String get save => 'ذخیره کنید';

  @override
  String get close => 'بستن';

  @override
  String get start => 'شروع کنید';

  @override
  String get send => 'ارسال کنید';

  @override
  String get settings => 'تنظیمات';

  @override
  String get language => 'زبان';

  @override
  String get languageSubtitle =>
      'به طور پیش فرض برنامه از زبان تلفن شما (در صورت پشتیبانی) پیروی می کند. زبان های دیگر به انگلیسی باز می گردند. همچنین می توانید یک زبان را در اینجا قفل کنید.';

  @override
  String get languageSystem => 'پیش فرض سیستم';

  @override
  String get languageThai => 'تایلندی';

  @override
  String get languageEnglish => 'انگلیسی';

  @override
  String get notificationsTooltip => 'تنظیمات اعلان';

  @override
  String get enableMessageNotifications => 'اعلان های پیام را فعال کنید';

  @override
  String get settingsNotificationsSubtitle =>
      'پیام‌ها و افراد آنلاین 1:1 (هشدارهای محلی)';

  @override
  String get networkMembersTooltip => 'اعضای شبکه';

  @override
  String get identityQrTooltip => 'هویت / QR';

  @override
  String get feedDirects => 'چت کنید';

  @override
  String get feedMesh => '#مش';

  @override
  String get feedGeo => 'منطقه';

  @override
  String get feedDirectsSubtitle => 'پیام های خصوصی E2EE';

  @override
  String get feedMeshSubtitle => 'همتایان نزدیک (BLE)';

  @override
  String get feedGeoSubtitle => 'کانال کشف Geohash';

  @override
  String get peerIdHint =>
      'شناسه گیرنده (هش کلید عمومی) را برای شروع چت جای‌گذاری کنید';

  @override
  String get directsEmpty =>
      'هنوز چت وجود ندارد - برای شروع یک QR را اسکن کنید یا شناسه گیرنده را جایگذاری کنید\nپیام‌ها قبل از ارسال با E2EE مهر و موم می‌شوند (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • برای باز کردن چت ضربه بزنید';

  @override
  String get meshIntro =>
      'همتایان در محدوده BLE — برای یک چت خصوصی E2EE ضربه بزنید (بدون نوشتن عمومی در #mesh)\nارسال از طریق روتر هیبریدی (BLE + LoRa + Nostr وقتی آنلاین است)';

  @override
  String get meshEmptyRunning =>
      'هنوز همتای نزدیکی وجود ندارد - برنامه را در دستگاه دیگری در محدوده BLE باز کنید';

  @override
  String get meshEmptyStopped =>
      'BLE در حال اجرا نیست — اجازه بلوتوث / موقعیت مکانی را بدهید';

  @override
  String get meshNearbyPrefix => 'همین نزدیکی';

  @override
  String get meshRetentionTitle => 'حذف خودکار پیام ها';

  @override
  String get meshRetentionSubtitle =>
      'سابقه چت محلی قدیمی به صورت خودکار حذف می شود';

  @override
  String get meshRetentionKeep => 'نگه دارید';

  @override
  String get meshRetention1Day => '1 روز';

  @override
  String get meshRetention3Days => '3 روز';

  @override
  String get meshRetention7Days => '7 روز';

  @override
  String get refreshLocationTooltip => 'بازخوانی مکان';

  @override
  String get geoIntro =>
      'به افراد آنلاین در این ژئوهش می‌توان پیام 1:1 یا با یک فن‌آوت عمومی منطقه ارسال کرد (هنوز E2EE مهر و موم شده در هر همتا - نه متن ساده)';

  @override
  String geoEmpty(String channel) {
    return 'هنوز کسی در $channel آنلاین نیست\nاز Transport → Internet/Auto استفاده کنید، منتظر Nostr باشید، مکان را بازخوانی کنید';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'آنلاین در $channel • برای E2EE 1:1 ضربه بزنید';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'نزدیک (در انتظار حضور در منطقه) • برای E2EE 1:1 ضربه بزنید';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'مشاهده شده در Nostr در $channel • فقط کشف (میراث)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'حضور ناشناس قدیمی - منتظر یک همتای محدود شده باشید یا QR را مبادله کنید';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE در نزدیکی — برای شروع 1:1 E2EE QR را اسکن کنید';

  @override
  String get geoInternetDiscoverHint =>
      'منطقه کشف اینترنت نیاز به اتصال Nostr دارد (تنظیمات → حمل و نقل → اینترنت/خودکار)';

  @override
  String get geoEmptyNoLocation =>
      'مکان هنوز حل نشده است - به GPS و refresh اجازه دهید تا geohash شما را در Nostr منتشر کند';

  @override
  String get geoEmptyNeedsPermission =>
      'اجازه مکان رد شد - ResilNet را در تنظیمات → حریم خصوصی → موقعیت مکانی مجاز کنید';

  @override
  String get geoEmptyServicesDisabled =>
      'خدمات موقعیت مکانی خاموش است - آنها را در تنظیمات روشن کنید';

  @override
  String get geoEmptyNoGpsFix =>
      'نمی‌توان یک تعمیر GPS دریافت کرد (معمول در iPadهای Wi‑Fi) - geohash را به صورت دستی در زیر تنظیم کنید';

  @override
  String get geoEmptyTeleportHint =>
      'روی نماد مکان ضربه بزنید ← وارد کردن یک ژئوهش (به عنوان مثال w5) ← Teleport';

  @override
  String get geoSetGeohashManually => 'ژئوهش را تنظیم کنید';

  @override
  String get geoTeleportHint =>
      'جی پی اس نداره؟ پیشوند geohash را وارد کنید (2 تا 7 نویسه، به عنوان مثال w5) و روی Teleport ضربه بزنید';

  @override
  String get geoTeleportInvalid =>
      'ژئوهش نامعتبر - فقط از حروف/اعداد base32 استفاده کنید (مانند w5 یا w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'ناحیه روی $channel تنظیم شده است';
  }

  @override
  String geoManualActive(String channel) {
    return 'ناحیه دستی: $channel (بازسازی GPS لغو خواهد شد)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr آماده نیست — روی اتصال مجدد ضربه بزنید (0/0 تا زمانی که init موفق شود)';

  @override
  String get geoEmptyMeshOnly =>
      'حمل و نقل فقط مش است — برای کشف همتایان بیش از Nostr به اینترنت یا خودکار بروید';

  @override
  String geoEmptyWaiting(String channel) {
    return 'هنوز کسی در $channel نیست — Area + Internet را در هر دو دستگاه باز نگه دارید و 60 ثانیه صبر کنید';
  }

  @override
  String get geoChannelFallback => '#منطقه';

  @override
  String get geoRefreshLocation => 'بازخوانی مکان';

  @override
  String get settingsClearLocationTitle => 'پاک کردن مکان';

  @override
  String get settingsClearLocationSubtitle =>
      'ژئوهش GPS / تله پورت را بردارید (منطقه می شود #—)';

  @override
  String get settingsClearLocationConfirmTitle => 'مکان پاک شود؟';

  @override
  String get settingsClearLocationConfirmBody =>
      'ژئوهش ذخیره شده در این دستگاه را حذف می کند. بعد از آن می توانید GPS یا تله پورت را دوباره به روز کنید.';

  @override
  String get settingsClearLocationAction => 'پاک کردن مکان';

  @override
  String get settingsClearLocationSnack => 'مکان پاک شد';

  @override
  String get chatVoiceTooLarge => 'نت صوتی خیلی بزرگ است - حداکثر 30 ثانیه';

  @override
  String get chatVoiceNeedInternet =>
      'یادداشت صوتی به اینترنت نیاز دارد (Nostr) — به تنهایی برای BLE خیلی بزرگ است';

  @override
  String get chatVoiceSentInternet => 'یادداشت صوتی ارسال شده از طریق اینترنت';

  @override
  String get noticeAnonMention => 'ذکر کنید';

  @override
  String get noticeAnonDm => 'پیام مستقیم';

  @override
  String get noticeAnonHug => 'بغل کردن';

  @override
  String get noticeAnonSlap => 'سیلی زدن';

  @override
  String get noticeAnonBlock => 'مسدود کردن';

  @override
  String get noticeAnonNeedKey =>
      'هنوز کلید عمومی وجود ندارد - ابتدا QR را با 1:1 تعویض کنید';

  @override
  String get noticeAnonActionSent => 'ارسال شد';

  @override
  String noticeAnonBlocked(String anon) {
    return '$anon مسدود شده است';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* بغل کردن $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* سیلی $anon *';
  }

  @override
  String get geoReconnectNostr => 'Nostr را دوباره وصل کنید';

  @override
  String get nostrSectionTitle => 'رله های Nostr';

  @override
  String get nostrSectionSubtitle =>
      'پیام های اینترنتی و کشف منطقه از این رله ها استفاده می کنند. در صورت آفلاین ماندن وضعیت، روی اتصال مجدد ضربه بزنید.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return '$connected/$total متصل شد';
  }

  @override
  String get nostrStatusOffline =>
      'آفلاین - رله‌ها فهرست شده‌اند اما هیچ‌کدام متصل نیستند';

  @override
  String get nostrStatusNotInit =>
      'شروع نشده (0/0) - برای مقداردهی اولیه روی اتصال مجدد ضربه بزنید';

  @override
  String get nostrReconnectAction => 'Nostr را دوباره وصل کنید';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr متصل شد ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'هنوز آفلاین است - بررسی کنیدWi‑Fi /cellular یا دوباره امتحان کنید';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'ناموفق: $error';
  }

  @override
  String get nostrReconnecting => 'در حال اتصال به رله…';

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
    return 'اینترنت (Nostr) در $channel • چت مهر و موم شده آماده است';
  }

  @override
  String get transportModeTitle => 'حمل و نقل منطقه';

  @override
  String get transportModeSubtitle =>
      'مش = BLE نزدیک (رادیو) وقتی Nostr وجود ندارد · اینترنت و خودکار = Nostr لیست افراد';

  @override
  String get transportModeMesh => 'مش';

  @override
  String get transportModeInternet => 'اینترنت';

  @override
  String get transportModeAuto => 'خودکار';

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
  String get geoPublicHint => 'پیام عمومی برای همه افراد آنلاین در این زمینه';

  @override
  String get geoPublicSend => 'عمومی';

  @override
  String geoPublicHelp(int count) {
    return 'فن اوت مهر و موم شده به $count همتا(های) آنلاین - هر کدام یک پاکت خصوصی دریافت می کنند';
  }

  @override
  String geoPublicSent(int count) {
    return 'برای $count همتا(های) این ناحیه ارسال شد';
  }

  @override
  String get geoPublicSentNone =>
      'همتاهای قابل پیام آنلاین وجود ندارد — Area/Mesh را با همتاهایی که دارای کلید هستند باز کنید یا منتظر BLE/Nostr باشید.';

  @override
  String get areaPublicBadge => 'منطقه عمومی';

  @override
  String get geoErrorPermission => 'مکان خوانده نشد - مجوز مکان را بررسی کنید';

  @override
  String get geoPrecisionRegion => 'منطقه';

  @override
  String get geoPrecisionProvince => 'استان';

  @override
  String get geoPrecisionCity => 'شهر';

  @override
  String get geoPrecisionNeighborhood => 'محله';

  @override
  String get geoPrecisionBlock => 'مسدود کردن';

  @override
  String get aliasTitle => 'تنظیم نام مستعار (نام مستعار تماس)';

  @override
  String get aliasHintBody =>
      'این نام مستعار فقط در این دستگاه ذخیره می‌شود (فقط محلی)\nهرگز با ترافیک E2EE ارسال نمی شود';

  @override
  String get aliasLabel => 'نام مستعار';

  @override
  String get aliasHint => 'به عنوان مثال \"رئیس دهکده\"، \"P’Somchai\"…';

  @override
  String get settingsDevices => 'دستگاه ها';

  @override
  String get settingsFirmwareTitle => 'دانلود / به روز رسانی ESP32 میان افزار';

  @override
  String get settingsFirmwareSubtitle =>
      'فایل های .bin را دانلود کنید و برد ESP32 را از طریق OTA به روز کنید';

  @override
  String get mtBridgeTitle => 'Meshtastic پل';

  @override
  String get mtBridgeSettingsSubtitle => 'پل A/B فقط متنی — نه ResilNet E2EE';

  @override
  String get mtBridgeIntro =>
      'متن ساده کوتاه را بین Meshtastic و ResilNet حرکت دهید. حالت های A و B نمی توانند همزمان اجرا شوند. این رمزگذاری سرتاسر نیست.';

  @override
  String get mtBridgeModeLabel => 'حالت';

  @override
  String get mtBridgeModeOff => 'خاموش';

  @override
  String get mtBridgeModeA => 'مصرف A';

  @override
  String get mtBridgeModeB => 'خروج B';

  @override
  String get mtBridgeModeOffShort => 'خاموش';

  @override
  String get mtBridgeModeAShort => 'در A';

  @override
  String get mtBridgeModeBShort => 'خارج B';

  @override
  String get mtBridgeMutexHint =>
      'انتخاب یک حالت حالت دیگر را به طور خودکار خاموش می کند. A+B همزمان پشتیبانی نمی شود.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'نسخه ی نمایشی (ورود به سیستم)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'متن ورودی در زیر Notices به صورت #meshtastic ظاهر می شود. رله مش اختیاری است (به طور پیش فرض خاموش).';

  @override
  String get mtBridgeRelayTitle => 'همچنین روی مش ResilNet رله کنید';

  @override
  String get mtBridgeRelayHint =>
      'وقتی روشن است، بولتن های عمومی امضا شده پخش می شود. خاموش = فقط اعلامیه های این تلفن.';

  @override
  String get mtBridgeSimulateHint => 'پیام نمایشی';

  @override
  String get mtBridgeSimulate => 'پیام Meshtastic را شبیه سازی کنید';

  @override
  String get mtBridgeIngestOk => 'وارد اعلامیه‌ها (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'هشدار: پیام های ارسال شده در اینجا ResilNet E2EE نیستند. هر کسی در مسیر Meshtastic می تواند آنها را بخواند.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'متن برای انتشار';

  @override
  String get mtBridgeSend => 'ارسال به Meshtastic';

  @override
  String get mtBridgeEgressOk =>
      'صف کشیده برایMeshtastic (به گزارش / تاریخچه مراجعه کنید)';

  @override
  String get mtBridgeLastEgress => 'آخرین خروج';

  @override
  String get mtBridgeEgressHistory => 'خروجی اخیر';

  @override
  String get mtBridgeOffHint =>
      'Ingest (A) یا Egress (B) را برای استفاده از پل روشن کنید.';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTIC · نه E2EE';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'از حمل و نقل MQTT استفاده کنید';

  @override
  String get mtBridgeUseMqttHint =>
      'خاموش = فقط ورود به سیستم نمایشی (MQTT ورودی نادیده گرفته شد). روشن = MQTT برای ورود/خروج هنگام اتصال.';

  @override
  String get mtBridgeMqttHost => 'میزبان کارگزار';

  @override
  String get mtBridgeMqttPort => 'بندر';

  @override
  String get mtBridgeMqttTls => 'استفاده از TLS (mqtts)';

  @override
  String get mtBridgeMqttTlsHint =>
      'پورت معمولی 8883. از گواهینامه های سیستم استفاده می کند. در خطاهای دست دادن نرم شکست می خورد.';

  @override
  String get mtBridgeMqttAutoReconnect => 'اتصال مجدد خودکار';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'وقتی روشن است، کلاینت سعی می کند پس از افت دوباره وصل شود. وضعیت اتصال تا زمان بازیابی را نشان می دهد.';

  @override
  String get mtBridgeMqttTopicHelpers => 'کمک کنندگان موضوع';

  @override
  String get mtBridgeMqttRegion => 'پیشوند منطقه (اختیاری)';

  @override
  String get mtBridgeMqttRegionHint =>
      'وقتی تنظیم شد، Apply ریشه را به صورت msh/<region>/2/json بازسازی می‌کند (ریشه موضوع را لغو می‌کند).';

  @override
  String get mtBridgeMqttTopicRoot => 'ریشه موضوع JSON';

  @override
  String get mtBridgeMqttDownlinkChannel => 'نام کانال داونلینک';

  @override
  String get mtBridgeMqttApplyTopics =>
      'درخواست root → اشتراک / انتشار موضوعات';

  @override
  String get mtBridgeMqttAdvanced => 'پیشرفته MQTT';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'TLS، اتصال مجدد، موضوعات، اعتبارنامه ها';

  @override
  String get mtBridgeMqttTopicIn => 'اشتراک موضوع';

  @override
  String get mtBridgeMqttTopicOut => 'موضوع را منتشر کنید';

  @override
  String get mtBridgeMqttGatewayFrom => 'شناسه گره دروازه (از)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'شناسه اعشاری یا !hex - برای ارسال متن ارسالی لازم است';

  @override
  String get mtBridgeMqttChannelIndex => 'شاخص کانال مش (اختیاری 0-7)';

  @override
  String get mtBridgeMqttUser => 'نام کاربری (اختیاری)';

  @override
  String get mtBridgeMqttPass => 'رمز عبور (اختیاری)';

  @override
  String get mtBridgeMqttPassStored =>
      'یک رمز عبور در این دستگاه ذخیره می شود (نشان داده نمی شود).';

  @override
  String get mtBridgeMqttPassReplace =>
      'رمز عبور جدید (برای نگه داشتن آن خالی بگذارید)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'برای حفظ رمز عبور ذخیره شده خالی بگذارید.';

  @override
  String get mtBridgeMqttPassClear => 'رمز عبور را پاک کنید';

  @override
  String get mtBridgeMqttSave => 'تنظیمات MQTT را ذخیره کنید';

  @override
  String get mtBridgeMqttSaved => 'تنظیمات MQTT ذخیره شد';

  @override
  String get mtBridgeMqttConnect => 'اتصال';

  @override
  String get mtBridgeMqttDisconnect => 'قطع کن';

  @override
  String get mtBridgeMqttConnected => 'MQTT متصل شد';

  @override
  String get mtBridgeMqttConnecting => 'MQTT در حال اتصال…';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT قطع شد';

  @override
  String get mtBridgeMqttError => 'خطای MQTT';

  @override
  String get mtBridgeErrModeIngest => 'ابتدا به Ingest (A) بروید';

  @override
  String get mtBridgeErrModeEgress => 'ابتدا به خروجی (B) بروید';

  @override
  String get mtBridgeErrRate => 'آهسته - سرعت محدود است';

  @override
  String get mtBridgeErrDedupe => 'پیام تکراری نادیده گرفته شد';

  @override
  String get mtBridgeErrLoop => 'برای جلوگیری از حلقه پل افتاد';

  @override
  String get mtBridgeErrEmpty => 'پیام خالی است';

  @override
  String get mtBridgeErrPublish => 'انتشار ناموفق بود';

  @override
  String get mtBridgeErrNotConnected => 'MQTT متصل نیست';

  @override
  String get mtBridgeErrMissingHost => 'میزبان بروکر MQTT را وارد کنید';

  @override
  String get mtBridgeErrMissingTopic =>
      'اشتراک را وارد کنید و موضوعات را منتشر کنید';

  @override
  String get mtBridgeErrMissingFromNode =>
      'شناسه گره دروازه (از) را برای متن ارسالی وارد کنید';

  @override
  String get mtBridgeErrConnect => 'MQTT اتصال ناموفق بود';

  @override
  String get mtBridgeErrConnectTls => 'MQTT اتصال TLS ناموفق بود';

  @override
  String get settingsData => 'داده ها';

  @override
  String get settingsDataHint =>
      'پیام های محلی را حذف کنید تا پایگاه داده کوچک شود - هویت، کلیدها و همتاها حفظ می شوند';

  @override
  String get settingsSaveHistoryTitle => 'ذخیره تاریخچه پیام';

  @override
  String get settingsSaveHistorySubtitle =>
      'وقتی خاموش است، پیام‌ها E2EE روی سیم باقی می‌مانند و فقط برای این جلسه (نه در سابقه چت محلی) نگهداری می‌شوند. نوشتار خودتان همچنان به‌عنوان متن ساده در این دستگاه نشان داده می‌شود.';

  @override
  String get settingsPrivacy => 'حریم خصوصی';

  @override
  String get settingsE2eeTitle => 'رمزگذاری انتها به انتها';

  @override
  String get settingsE2eeSubtitle =>
      'همیشه روشن — پیام ها قبل از ارسال با RSA-OAEP + AES-GCM مهر و موم می شوند. رله ها و پرش های نزدیک نمی توانند مطالب را بخوانند.';

  @override
  String get settingsScreenshotTitle => 'هشدارهای اسکرین شات';

  @override
  String get settingsScreenshotSubtitle =>
      'هنگامی که این دستگاه از صفحه نمایش عکس می گیرد، یک خط سیستم را در چت نشان دهید';

  @override
  String get settingsNostrExpiryTitle => 'زمان نگه داشتن پیام Nostr';

  @override
  String get settingsNostrExpirySubtitle =>
      'چه مدت پاکت های مهر و موم شده باید به صورت محلی در هنگام آنلاین بودن از طریق Nostr باقی بمانند';

  @override
  String get noticeExpiresIn => 'منقضی می شود';

  @override
  String get noticesTitle => 'اطلاعیه ها';

  @override
  String get noticesMeshIntro =>
      'بولتن عمومی - قابل مشاهده برای همه در محدوده رادیویی، نه رمزگذاری شده. تلفن به تلفن آفلاین می‌رود، و جعبه‌های رله ResilNet یک نسخه را نگه می‌دارند تا افرادی که دیرتر وارد می‌شوند همچنان آن را ببینند.';

  @override
  String get noticesMeshPublicBadge => 'عمومی · رمزگذاری نشده است';

  @override
  String get noticesGeoIntro =>
      'یادداشت های کوتاهی برای این مکان اضافه کنید تا سایر بازدیدکنندگان بتوانند آنها را پیدا کنند.';

  @override
  String get noticesEmpty => 'هنوز هیچ اطلاعیه ای وجود ندارد';

  @override
  String get noticesEmptyHint =>
      'اولین اطلاعیه را برای افراد اطراف اینجا پین کنید.';

  @override
  String get noticesComposeHint => 'ارسال یک اطلاعیه ...';

  @override
  String get noticesUrgent => 'فوری';

  @override
  String get noticesOpen => 'اطلاعیه ها';

  @override
  String get screenshotTaken => '* اسکرین شات گرفتید *';

  @override
  String get chatAttachImage => 'تصویر را پیوست کنید';

  @override
  String get chatImageLabel => 'تصویر';

  @override
  String get chatImageTooLarge =>
      'تصویر خیلی بزرگ است - عکس دیگری را امتحان کنید';

  @override
  String get chatNostrExpiry => 'Nostr نگه دارید';

  @override
  String geoPublicComposeHint(String channel) {
    return 'ارسال به $channel — عمومی';
  }

  @override
  String get settingsClearTitle => 'تمام پیام ها را پاک کنید';

  @override
  String get settingsClearSubtitle => 'تمام چت های این دستگاه را حذف کنید';

  @override
  String get settingsClearConfirmTitle => 'همه پیام ها پاک شود؟';

  @override
  String get settingsClearConfirmBody =>
      'با این کار همه پیام‌های چت در این دستگاه حذف می‌شوند.\nهمتایان و نام مستعار حذف نمی شوند.';

  @override
  String get settingsClearAction => 'داده ها را پاک کنید';

  @override
  String get settingsClearedSnack => 'داده ها پاک شد';

  @override
  String settingsVersion(String version) {
    return 'نسخه $version';
  }

  @override
  String get meshBleScanning => 'BLE: اسکن گره ها';

  @override
  String get meshBleEsp32Scanning => 'ESP32: به دنبال یک گره نزدیک است';

  @override
  String get meshBleSyncing => 'BLE: همگام سازی با ESP32';

  @override
  String get meshNostrPublishing => 'Nostr: انتشار';

  @override
  String get meshBleIdle =>
      'مش BLE روشن است - هنوز تلفنی در این نزدیکی وجود ندارد';

  @override
  String meshBlePeersNearby(int count) {
    return 'مش BLE — $count تلفن(های) نزدیک';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: اجازه لازم است';

  @override
  String get meshBlePausedCamera =>
      'BLE برای دوربین متوقف شد — روی شروع BLE ضربه بزنید';

  @override
  String get meshBleStopped =>
      'BLE خاموش است — بررسی کنید بلوتوث روشن است، سپس روی Start BLE ضربه بزنید';

  @override
  String get meshBleRestart => 'BLE را شروع کنید';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'مجوزها را بررسی کنید و BLE را شروع کنید';

  @override
  String get meshNostrOffline => 'Nostr آفلاین';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count همتایان نزدیک • LoRa $lora • همگام سازی ~$metersمتر';
  }

  @override
  String get meshLoraReady => 'آماده';

  @override
  String get meshLoraNotReady => 'آماده نیست';

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
    return 'UDP دروازه: $label';
  }

  @override
  String get meshGatewayReady => 'Gateway UDP: آماده است';

  @override
  String get permissionTitle => 'اجازه دسترسی برای راه اندازی شبکه مش BLE';

  @override
  String get permissionBody =>
      'این برنامه به بلوتوث (اسکن / اتصال / تبلیغ)، مکان (برای دستگاه‌های Android قدیمی) و میکروفون (برای یادداشت‌های صوتی در چت و اطلاعیه‌ها) برای پیام‌رسانی به جامعه نیاز دارد.';

  @override
  String get permissionE2ee =>
      'رمزگذاری سرتاسر (E2EE)\nگره های رله نمی توانند محتوای پیام را بخوانند';

  @override
  String get permissionReady => 'مجوزها آماده است';

  @override
  String get permissionRequest => 'اجازه دهید و ادامه دهید';

  @override
  String get permissionNotReadySnack =>
      'سیستم هنوز آماده نیست - یک لحظه صبر کنید و دوباره امتحان کنید';

  @override
  String get permissionDeniedSnack =>
      'مجوزها ناقص هستند - تنظیمات > ResilNet را باز کنید و بلوتوث / مکان / میکروفون را مجاز کنید';

  @override
  String get permissionMicDenied =>
      'دسترسی به میکروفون ممنوع شد - در تنظیمات به آن اجازه دهید یادداشت‌های صوتی را ضبط کند';

  @override
  String get permissionMicOpenSettings => 'تنظیمات';

  @override
  String get permissionCameraDenied =>
      'دسترسی به دوربین رد شد - در تنظیمات به آن اجازه دهید کدهای QR را اسکن کند';

  @override
  String get permissionCameraFailed =>
      'مجوز دوربین برای اسکن کدهای QR مورد نیاز است';

  @override
  String get permissionCameraOpenSettings => 'تنظیمات';

  @override
  String get permissionPhotosDenied =>
      'دسترسی به کتابخانه عکس رد شد - در تنظیمات به آن اجازه دهید تا کد QR شما را ذخیره کند';

  @override
  String get permissionPhotosFailed =>
      'مجوز کتابخانه عکس برای ذخیره کد QR شما مورد نیاز است';

  @override
  String get permissionPhotosOpenSettings => 'تنظیمات';

  @override
  String permissionFailedSnack(String error) {
    return 'درخواست مجوز ناموفق بود: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet معماری • Store-and-Forward Multi-Hop';

  @override
  String get onboardingSkip => 'پرش کنید';

  @override
  String get onboardingNext => 'بعدی';

  @override
  String get onboardingStart => 'شروع کنید';

  @override
  String get onboardingWelcomeTitle => 'به ResilNet خوش آمدید';

  @override
  String get onboardingWelcomeBody =>
      'در ResilNet از طریق شبکه مش - حتی بدون اینترنت گپ بزنید';

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
  String get onboardingChannelsTitle => 'چت رمزگذاری شده + کانال های نزدیک';

  @override
  String get onboardingChannelsBody =>
      '#mesh / Area (geohash) را برای پیدا کردن همتایان نزدیک تغییر دهید — پیام‌ها E2EE روی BLE مش و Nostr باقی می‌مانند';

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
  String get chatTitle => 'چت (E2EE)';

  @override
  String get chatScanTooltip => 'برای افزودن همتا، QR را اسکن کنید';

  @override
  String get chatBlockTooltip => 'این فرستنده را مسدود کنید';

  @override
  String get chatBlockedSnack => 'مسدود شده: بدون اطلاعیه / بدون رله';

  @override
  String get chatAliasTooltip => 'نام مستعار را تنظیم کنید';

  @override
  String get chatReceiverPemLabel => 'کلید عمومی گیرنده (PEM)';

  @override
  String get chatReceiverPemHint =>
      'کلید عمومی دوست خود را (از QR / فایل مشترک) جای‌گذاری کنید';

  @override
  String get chatNeedPeerKey =>
      'ابتدا QR این همتا را اسکن کنید (کلید عمومی تأیید شده لازم است)';

  @override
  String get chatPeerKeyMismatch =>
      'کلید عمومی ذخیره شده با این شناسه همتا مطابقت ندارد';

  @override
  String chatVoiceFailed(String error) {
    return 'صدا ضبط نشد: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'نت صوتی پخش نشد: $error';
  }

  @override
  String get chatPlayVoice => 'پخش یادداشت صوتی';

  @override
  String get chatPauseVoice => 'مکث کنید';

  @override
  String get chatVoiceLabelSent => '🎤 یادداشت صوتی (مهر شده)';

  @override
  String get chatVoiceLabel => '🎤 یادداشت صوتی';

  @override
  String get chatDecryptFailed => '[رمزگشایی انجام نشد]';

  @override
  String chatSentSealed(String preview) {
    return '[مهر شده • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[مهر شده]';

  @override
  String get chatComposeHint => 'یک پیام تایپ کنید… (مهر شده در هنگام ارسال)';

  @override
  String get chatEmptyThread =>
      'هنوز پیامی وجود ندارد\nبرای ارسال روی مش، زیر را تایپ کنید';

  @override
  String chatLoadFailed(String error) {
    return 'مکالمه بارگیری نشد: $error';
  }

  @override
  String get chatEmojiTooltip => 'ایموجی';

  @override
  String get statusPending => 'در انتظار';

  @override
  String get statusSent => 'ارسال شد';

  @override
  String get statusRelayed => 'رله شده';

  @override
  String get statusDelivered => 'تحویل داده شد';

  @override
  String get statusRead => 'بخوانید';

  @override
  String get statusFailed => 'شکست خورد';

  @override
  String get chatCopy => 'کپی کنید';

  @override
  String get chatDeleteLocal => 'در این دستگاه حذف کنید';

  @override
  String get chatDeletedLocalSnack => 'در این دستگاه حذف شد';

  @override
  String get chatRetry => 'دوباره امتحان کنید';

  @override
  String get chatSendFailed => 'تحویل داده نشد - روی سعی مجدد ضربه بزنید';

  @override
  String get chatImageNeedInternet => 'برای ارسال تصاویر به اینترنت متصل شوید';

  @override
  String get chatImageTooLargeOnline =>
      'نمی توان تصویر را به اندازه کافی برای ارسال فشرده کرد';

  @override
  String get chatOpenLinkFailed => 'لینک باز نشد';

  @override
  String get identityTitle => 'هویت';

  @override
  String get identityScanTooltip => 'QR را با دوربین اسکن کنید';

  @override
  String get identityCopiedHash => 'هش کلید عمومی کپی شد';

  @override
  String get identityPeerSaved => 'همتا از QR ذخیره شد';

  @override
  String get identityGalleryDenied => 'مجوز کتابخانه عکس رد شد';

  @override
  String get identityQrSaved => 'QR در کتابخانه عکس ذخیره شد';

  @override
  String identityQrSaveFailed(String error) {
    return 'QR ذخیره نشد: $error';
  }

  @override
  String get peersTitle => 'اعضای شبکه';

  @override
  String get qrScanTitle => 'برای افزودن دوست، QR را اسکن کنید';

  @override
  String get qrInvalid => 'اسکن انجام نشد: QR نامعتبر است';

  @override
  String get qrIdKeyMismatch => 'QR رد شد: شناسه با کلید عمومی مطابقت ندارد';

  @override
  String get qrCameraNotReady => 'دوربین آماده نیست';

  @override
  String get qrRetrySettings => 'دوباره امتحان کنید / تنظیمات را باز کنید';

  @override
  String qrCameraOpenFailed(String error) {
    return 'دوربین باز نشد: $error';
  }

  @override
  String get qrScanAlignHint => 'کد QR را در داخل قاب تراز کنید';

  @override
  String get firmwareDownloadTitle => 'سیستم عامل ESP32 را دانلود کنید';

  @override
  String get firmwareSourceOnline => 'جدیدترین (آنلاین)';

  @override
  String get firmwareSourceCached => 'کپی ذخیره شده (آفلاین)';

  @override
  String get firmwareSourceBaseline => 'خط پایه دسته‌بندی شده (آفلاین)';

  @override
  String get firmwareSourceUnavailable => 'سیستم عامل موجود نیست';

  @override
  String get firmwareBaselineIncompatible =>
      'سیستم عامل همراه بسیار قدیمی است — برای دانلود نسخه جدیدتر به اینترنت متصل شوید';

  @override
  String get firmwareChecksumFailed =>
      'بررسی یکپارچگی سیستم عامل ناموفق - چشمک زدن مسدود شده است';

  @override
  String firmwareReadyFromSource(String source) {
    return 'سفت‌افزار آماده است: $source';
  }

  @override
  String get peersRefreshTooltip => 'تازه کردن';

  @override
  String get peersBlocked => 'مسدود شده است';

  @override
  String get peersNearbyBle => 'نزدیک (BLE)';

  @override
  String get peersRecentlyOnline => 'اخیرا آنلاین';

  @override
  String get peersOnlineInArea => 'آنلاین در منطقه';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return '$minutes دقیقه پیش دیده شد';
  }

  @override
  String get peersOffline => 'آفلاین';

  @override
  String peersBlockedSnack(String id) {
    return '$id مسدود شده است';
  }

  @override
  String get peersUnblockedSnack => 'رفع انسداد';

  @override
  String get peersEmpty =>
      'هنوز هیچ عضوی در پایگاه داده وجود ندارد\nیک QR را اسکن کنید یا منتظر کشف مش BLE باشید';

  @override
  String get peersOpenChat => 'گپ را باز کنید';

  @override
  String get peersBlockAction => 'مسدود کردن';

  @override
  String get peersUnblockAction => 'رفع انسداد';

  @override
  String get channelPickerTooltip => 'چت / #مش / منطقه';

  @override
  String get locationPickerTooltip => 'کانال مکان';

  @override
  String get transportPickerTooltip => 'مش / اینترنت / خودکار';

  @override
  String get onlinePeopleTooltip => 'افراد آنلاین';

  @override
  String get unreadDirectsTooltipEmpty => 'پیام های خصوصی';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count پیام های خصوصی خوانده نشده';
  }

  @override
  String get onlinePeopleTitle => 'مردم';

  @override
  String get onlinePeopleEmpty => 'هنوز کسی اینجا آنلاین نیست';

  @override
  String onlinePeopleCount(int count) {
    return '$count آنلاین';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · نزدیک + منطقه';

  @override
  String get peerOnlineMeshTitle => 'شخصی در نزدیکی مش';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name روی مش نزدیک است';
  }

  @override
  String get peerOnlineAreaTitle => 'شخصی آنلاین در منطقه';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name از طریق Nostr آنلاین است';
  }

  @override
  String get locationSheetTitle => 'کانال های #مکان';

  @override
  String get channelPinsTitle => 'پین شده';

  @override
  String get channelPinsHint =>
      'کانال‌هایی را که اغلب استفاده می‌کنید پین کنید - آنها در بالا باقی می‌مانند';

  @override
  String get channelPinTooltip => 'این کانال را پین کنید';

  @override
  String get channelUnpinTooltip => 'پین را بردارید';

  @override
  String get locationSheetIntro =>
      'با استفاده از ژئوهش درشت - نه GPS دقیق - با افراد اطراف گپ بزنید. حضور در اینترنت از کلیدهای ناشناس Nostr استفاده می کند.';

  @override
  String get locationMeshSubtitle => '#بلوتوث • ~10-50 متر';

  @override
  String get locationTeleportHint => '#ژئوهش';

  @override
  String get locationTeleport => 'تله پورت';

  @override
  String homeComposeHint(String channel) {
    return 'پیام $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return 'ارسال به $channel — عمومی';
  }

  @override
  String get messageExpiryTitle => 'منقضی می شود';

  @override
  String get voiceRecordTapToStart => 'برای ضبط پیام صوتی ضربه بزنید';

  @override
  String get voiceRecordTooShort => 'ضبط خیلی کوتاه است - دوباره امتحان کنید';

  @override
  String get voiceRecordFailed => 'ضبط ذخیره نشد - دوباره امتحان کنید';

  @override
  String get voicePttHold => 'برای ضبط نگه دارید';

  @override
  String get voicePttRelease => 'برای پیش نمایش رها کنید';

  @override
  String get voicePttRecording => 'در حال ضبط…';

  @override
  String get voicePttDraftReady => 'یادداشت صوتی آماده است';

  @override
  String get voicePttDiscard => 'دور انداختن';

  @override
  String get voicePttReRecord => 'دوباره ضبط کن';

  @override
  String get voicePttSend => 'ارسال یادداشت صوتی';

  @override
  String get voicePttPlayPreview => 'پخش پیش نمایش';

  @override
  String get voicePttStopPreview => 'توقف پیش نمایش';

  @override
  String get noticesBackfilling => 'در حال بارگیری اعلامیه ها…';

  @override
  String get noticesNostrOnline => 'Nostr آنلاین';

  @override
  String get noticesNostrOffline => 'Nostr آفلاین — بولتن به اینترنت نیاز دارد';

  @override
  String noticesBackfillLoaded(int count) {
    return 'اخطارهای $count بارگیری شد';
  }

  @override
  String get noticePublishFailed =>
      'نمی توان اخطاریه را برای هیئت مدیره منطقه منتشر کرد. اتصال Nostr را بررسی کنید.';

  @override
  String get noticeMeshPublishNoLink =>
      'به صورت محلی ذخیره شده است. به رادیوی مشبک نزدیک (یا دروازه Wi‑Fi) متصل شوید تا دیگران بتوانند آن را دریافت کنند.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'بولتن به $count دستگاه(های) نزدیک بیش از BLE ارسال شد.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'رادیوهای نزدیک دیده شدند، اما نوشتن BLE ناموفق بود. هر دو برنامه را در صفحه اعلامیه ها باز نگه دارید و دوباره امتحان کنید (یا از رله ESP32 استفاده کنید).';

  @override
  String get noticeMeshPublishNoGatt =>
      'گیرنده BLE این دستگاه آماده نیست. بلوتوث را روشن کنید و Notices را دوباره باز کنید.';

  @override
  String get noticeDelete => 'اطلاعیه را حذف کنید';

  @override
  String get noticeDeleteConfirmTitle => 'این اطلاعیه حذف شود؟';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'این فقط در این دستگاه حذف می شود. دیگرانی که قبلاً آن را دریافت کرده‌اند، همچنان آن را خواهند دید.';

  @override
  String get noticeDeleted => 'اطلاعیه حذف شد';

  @override
  String get chatNoticeHidden => 'اطلاعیه منطقه - اعلامیه ها را باز کنید';

  @override
  String get identityDisplayNameTitle => 'نام نمایشی';

  @override
  String get identitySaveName => 'ذخیره نام';

  @override
  String get identityUserIdLabel => 'شناسه کاربر (هش کلید عمومی)';

  @override
  String get identityCopyHashTooltip => 'هش کلید عمومی را کپی کنید';

  @override
  String get identityMyQrTitle => 'QR من (id + pubKey + نام)';

  @override
  String identityQrFailed(String error) {
    return 'QR ایجاد نشد\n$error';
  }

  @override
  String get identitySaving => 'در حال ذخیره…';

  @override
  String get identitySaveQr => 'QR را در کتابخانه عکس ذخیره کنید';

  @override
  String get identityOpenScanner => 'دوربین را برای اسکن QR باز کنید';

  @override
  String get identityQrHelp =>
      'از یک دوست بخواهید این را اسکن کند تا کلید عمومی شما ذخیره شود و (در صورت نیاز) شما را به عنوان صادرکننده تأیید شده تعیین کند';

  @override
  String get identityChatTip =>
      'نکته: همچنین می توانید یک QR را در چت اسکن کنید تا یک کلید عمومی برای E2EE اضافه کنید';

  @override
  String get infoOpen => 'درباره / اطلاعات';

  @override
  String get docsGuideTitle => 'راهنمای کاربر';

  @override
  String get docsGuideSubtitle => 'در مرورگر باز می شود';

  @override
  String get docsOpenAction => 'راهنما را باز کنید';

  @override
  String get docsOpenFailed => 'راهنمای کاربر باز نشد';

  @override
  String get firmwareOtaGuideTitle => 'راهنمای فلش و پروتکل OTA';

  @override
  String get firmwareOtaGuideSubtitle =>
      'راهنمای وب — دانلودهای .bin و مراحل کامل را باز می کند';

  @override
  String get firmwareWebDownloadsTitle => 'بارگیری سیستم عامل در وب';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'پیوندهای هر نسخه و چک جمع ها در سایت اسناد';

  @override
  String get inviteCopyShortLink => 'لینک کوتاه را کپی کنید';

  @override
  String get inviteShareLink => 'لینک را به اشتراک بگذارید';

  @override
  String get inviteShowFullLink => 'لینک کامل';

  @override
  String get inviteCopyFullLink => 'لینک کامل را کپی کنید';

  @override
  String get inviteLinkCopied => 'لینک کپی شد';

  @override
  String get inviteLongPressHint => 'برای اقدامات پیوند، طولانی فشار دهید';

  @override
  String get inviteSendInChat => 'ارسال در چت ResilNet…';

  @override
  String get inviteSendInChatHint =>
      'فقط افرادی که از قبل برایشان کلید عمومی دارید';

  @override
  String get inviteSendInChatEmpty =>
      'هنوز چت قابل پیامی وجود ندارد.\nابتدا یک QR را اسکن کنید، Area/Mesh را باز کنید یا پیوند را در خارج از برنامه به اشتراک بگذارید.';

  @override
  String get inviteSentToChat => 'دعوتنامه در چت ارسال شد';

  @override
  String get infoTabInfo => 'اطلاعات';

  @override
  String get infoTabSettingsHint =>
      'تنظیمات را از منو برای ابزارهای زبان، E2EE و داده باز کنید';

  @override
  String get infoHowToTitle => 'نحوه استفاده';

  @override
  String get infoHowToBody =>
      '• روی نماد کانال ضربه بزنید تا Chat / #mesh / Area را تغییر دهید\n• برای انتخاب اندازه ژئوهش روی محل ضربه بزنید\n• برای اعضا یا افرادی که آنلاین هستند ضربه بزنید\n• شناسه/QR را از ⋮ باز کنید تا شخصاً کلیدها را مبادله کنید\n• منطقه \"عمومی\" E2EE مهر و موم شده را برای هر همتای آنلاین ارسال می کند - نه یک اتاق متن ساده';

  @override
  String get infoFeaturesTitle => 'ویژگی ها';

  @override
  String get infoFeatureOffline => 'پیام رسانی آفلاین از طریق بلوتوث کم انرژی';

  @override
  String get infoFeatureE2ee =>
      'رمزگذاری سرتاسر با RSA-OAEP + AES-GCM (نه نویز)';

  @override
  String get infoFeatureMultihop =>
      'پیام‌ها می‌توانند از طریق همتایان نزدیک خود عبور کنند تا دورتر بروند';

  @override
  String get infoFeatureBridge =>
      'مش هیبریدی ↔ اینترنت (Nostr) برای پاکت های مهر و موم شده';

  @override
  String get infoFeatureGeo =>
      'کانال‌های geohash محلی برای افراد اطراف (کاوشگر UX)';

  @override
  String get infoFeatureNotices => 'اعلامیه هایی با انقضا برای #mesh و Area';

  @override
  String get infoPrivacyTitle => 'حریم خصوصی';

  @override
  String get infoPrivacyNoRoom =>
      'دهکده متن ساده / اتاق چت عمومی روی سیم وجود ندارد';

  @override
  String get infoPrivacyFanout =>
      'ارسال منطقه ای = مهر و موم شده 1:1 به همتایان با کلیدهای عمومی شناخته شده';

  @override
  String get infoPrivacyPresence =>
      'حضور در منطقه اینترنت از کلیدهای زودگذر Nostr استفاده می کند';

  @override
  String get infoSymbolsTitle => 'نمادها';

  @override
  String get infoSymBle => 'لینک مستقیم بلوتوث';

  @override
  String get infoSymMesh => 'قابل دسترسی از طریق مش (سایر به جلو)';

  @override
  String get infoSymInternet =>
      'از طریق اینترنت (Nostr) - پاکت های مهر و موم شده';

  @override
  String get infoSymBridge => 'از طریق مش↔مسیر پل اینترنتی وارد شد';

  @override
  String get infoSymOffline => 'آفلاین - در حال حاضر قابل دسترسی نیست';

  @override
  String get infoSymInArea => 'در منطقه کانال این مکان';

  @override
  String get infoSymE2eeOk => 'جلسه رمزگذاری شده سرتاسر';

  @override
  String get infoSymE2eeFail =>
      'رمزگذاری در دسترس نیست - متن حساس را ارسال نکنید';

  @override
  String get infoSymVerified => 'هویت تأیید شده / کلید شناخته شده';

  @override
  String get infoSymBlocked => 'مسدود شده است';

  @override
  String get infoSymUnread => 'پیام خصوصی خوانده نشده';

  @override
  String get infoEmergencyTitle => 'حالت اضطراری';

  @override
  String get infoEmergencyBody =>
      'برای پاک کردن پیام‌ها، کلیدها و هویت در این دستگاه، روی عنوان ResilNet در صفحه اصلی سه ضربه بزنید.';

  @override
  String get infoLegendNote =>
      'برخی از نمادهای مسیر برای وضوح در اینجا مستند شده اند. تیک های تحویل در چت وضعیت ارسال اولیه باقی می ماند.';

  @override
  String get dangerZoneTitle => 'منطقه خطر';

  @override
  String get dangerZoneSubtitle =>
      'پیام‌ها، کلیدهای رمزگذاری، هویت Nostr، همتایان و نام‌های مستعار را در این دستگاه حذف می‌کند. دوباره راه اندازی خواهید کرد.';

  @override
  String get panicWipeTitle => 'پاک کن اضطراری';

  @override
  String get panicWipeSubtitle =>
      'همه چیز محلی را پاک کنید - مانند سه بار ضربه زدن به عنوان خانه (دو ضربه سریع رادیوها را تازه می کند)';

  @override
  String get panicWipeConfirmTitle => 'تمام داده های محلی پاک شود؟';

  @override
  String get panicWipeConfirmBody =>
      'با این کار چت ها، کلیدها و هویت این گوشی برای همیشه حذف می شود.\nهمتایان باید دوباره کلیدهای QR را با هویت جدید شما مبادله کنند.\nاین قابل واگرد نیست.';

  @override
  String get panicWipeAction => 'همه چیز را پاک کن';

  @override
  String get panicWipeSnack => 'هویت محلی پاک شد - دوباره راه اندازی کنید';

  @override
  String panicWipeFailed(String error) {
    return 'پاک کردن ناموفق بود: $error';
  }

  @override
  String get meshBridgeTitle => 'پل مشبک';

  @override
  String get meshBridgeSubtitle =>
      'وقتی روشن است (پیش‌فرض)، پاکت‌های مهر و موم شده ممکن است از مش BLE و اینترنت (Nostr) با هم استفاده کنند تا جزایر مش نزدیک بتوانند به هم متصل شوند. وقتی خاموش است، ارسال‌ها فقط از یک مسیر استفاده می‌کنند — هرگز متن ساده را روی سیم قرار نمی‌دهند.';

  @override
  String get favoritesTitle => 'موارد دلخواه';

  @override
  String get favoritesAdd => 'به علاقه مندی ها اضافه کنید';

  @override
  String get favoritesRemove => 'حذف از موارد دلخواه';

  @override
  String get favoritesEmpty =>
      'هنوز موارد دلخواه وجود ندارد - یک همتا را از لیست اعضا ستاره دهید';

  @override
  String get favoritesNearbyTitle => 'مورد علاقه در نزدیکی';

  @override
  String favoritesNearbyBody(String name) {
    return '$name روی مش نزدیک است';
  }

  @override
  String get favoritesInAreaTitle => 'مورد علاقه در منطقه';

  @override
  String favoritesInAreaBody(String name) {
    return '$name در این منطقه آنلاین است';
  }

  @override
  String get topologyTitle => 'توپولوژی مش';

  @override
  String get topologySubtitle =>
      'همتایان و نکات اتصال از مش اعلام (فقط خواندنی)';

  @override
  String get topologyConnectedNow => 'اکنون متصل شد (BLE)';

  @override
  String get topologyNearby => 'نزدیک (BLE)';

  @override
  String get topologyKnown => 'همسالان شناخته شده';

  @override
  String get topologyEmpty =>
      'هنوز همتایان یاد نگرفته اند - با BLE روشن در نزدیکی خود بمانید';

  @override
  String get topologyYou => 'شما';

  @override
  String topologyStats(int peers, int links) {
    return '$peers همتایان · $links پیوندها';
  }

  @override
  String get topologyGraphHint =>
      'تخمین زده شده از کشف مش نزدیک - دستگاه شما برجسته شده است. برای باز کردن چت روی همتا ضربه بزنید.';

  @override
  String get topologyOpen => 'توپولوژی مش';

  @override
  String get slashHelpTitle => 'دستورات';

  @override
  String get slashHelpBody =>
      '/help - این لیست\n/who - افراد آنلاین در کانال فعلی\n/drop <text> - یک اعلامیه مهر و موم شده را در اینجا پین کنید (E2EE fan-out)\n\nراهنمای کامل: از راهنمای باز کردن در زیر یا تنظیمات → راهنمای کاربر استفاده کنید.';

  @override
  String get slashWhoEmpty => 'در حال حاضر کسی در این کانال آنلاین نیست';

  @override
  String slashWhoTitle(int count) {
    return 'آنلاین ($count)';
  }

  @override
  String get slashDropNeedText => 'استفاده: /قطع متن یادداشت خود را';

  @override
  String slashDropDone(String channel) {
    return 'اعلامیه در $channel حذف شد';
  }

  @override
  String get slashUnknown => 'دستور ناشناخته - سعی کنید / help';

  @override
  String get announceOpen => 'اطلاعیه ها';

  @override
  String get announceTitle => 'اطلاعیه ها';

  @override
  String get announceEmpty =>
      'هنوز تابلویی وجود ندارد - برای ارسال اعلامیه های قفل شده یا باز، تابلویی ایجاد کنید';

  @override
  String get announceCreate => 'تابلو ایجاد کنید';

  @override
  String get announceCreateHint => 'نام تابلو';

  @override
  String get announceDefaultTitle => 'هیئت انجمن';

  @override
  String get announceSettings => 'تنظیمات برد';

  @override
  String get announceAllowLocked =>
      'به پست های قفل شده (رمزگذاری شده) اجازه دهید';

  @override
  String get announceAllowLockedSub =>
      'رمزگذاری شده روی کلید برد - خوانندگان نیاز به دسترسی دارند';

  @override
  String get announceAllowOpen => 'به پست‌های باز (متن ساده) اجازه دهید';

  @override
  String get announceAllowOpenSub =>
      'نه E2EE - قابل خواندن روی مش/رله. به طور پیش فرض خاموش است.';

  @override
  String get announceComposeHint => 'نوشتن اطلاعیه…';

  @override
  String get announceMediaInternetOnly =>
      'ارسال اعلان‌های عکس/صدا از طریق اینترنت (نه BLE)';

  @override
  String get announceNeedInternet =>
      'برای ارسال اعلان های عکس یا صوتی به اینترنت متصل شوید';

  @override
  String announceVoiceFailed(String error) {
    return 'صدا ضبط نشد: $error';
  }

  @override
  String get announceImageTooLarge =>
      'تصویر خیلی بزرگ است (حداکثر ~180 کیلوبایت)';

  @override
  String get announcePlayVoice => 'پخش یادداشت صوتی';

  @override
  String get announceImageLabel => '📷 تصویر';

  @override
  String get announceAudioLabel => '🎤 یادداشت صوتی';

  @override
  String get announceModeLocked => 'قفل شده است';

  @override
  String get announceModeOpen => 'باز کنید';

  @override
  String get announceOpenBadge => 'باز · رمزگذاری نشده';

  @override
  String get announceLockedBadge => 'قفل شده است';

  @override
  String get announceLockedPlaceholder =>
      'رمزگذاری شده - درخواست دسترسی برای خواندن';

  @override
  String get announceRequestAccess => 'درخواست دسترسی';

  @override
  String get announceRequestSent => 'درخواست دسترسی برای صاحب تابلو ارسال شد';

  @override
  String get announceRequestFailed =>
      'درخواست دسترسی امکان‌پذیر نیست (به کلید عمومی مالک نیاز است)';

  @override
  String get announceOpenConfirmTitle => 'پست بدون رمزگذاری؟';

  @override
  String get announceOpenConfirmBody =>
      'پست های باز E2EE نیستند. هر کسی در مسیر (مش / رله) ممکن است آنها را بخواند. ادامه دهید؟';

  @override
  String get announcePostAction => 'ارسال کنید';

  @override
  String get announcePendingRequests => 'درخواست های دسترسی';

  @override
  String get announceApprove => 'تایید کنید';

  @override
  String get announceDeny => 'تکذیب کنید';

  @override
  String get announceGranted =>
      'می توانید پست های قفل شده را در این تابلو بخوانید';

  @override
  String get announceOwner => 'شما صاحب این تابلو هستید';

  @override
  String get announceCopyInvite => 'متن دعوت را کپی کنید';

  @override
  String get announceShowInviteQr => 'نمایش QR دعوت';

  @override
  String get announceScanInviteQr => 'اسکن QR دعوت هیئت مدیره';

  @override
  String get announceFollow => 'هیئت مدیره را از دعوت دنبال کنید';

  @override
  String get announceFollowHint =>
      'متن دعوت یا پیوند ResilNet را از مالک جای‌گذاری کنید';

  @override
  String get announceFollowOk => 'هیئت دنباله دار';

  @override
  String announceFollowOkNamed(String title) {
    return 'اکنون «$title» را دنبال می‌کنید';
  }

  @override
  String get announceFollowFail => 'دعوت نامعتبر یا آسیب دیده است';

  @override
  String get announceInviteCopied => 'متن دعوت کپی شد';

  @override
  String get announceInviteSaveQr => 'QR را ذخیره کنید';

  @override
  String get announceInviteShare => 'دعوت را به اشتراک بگذارید';

  @override
  String get announceFollowFromCompose =>
      'دعوت هیئت مدیره در کادر پیام شناسایی شد';

  @override
  String get peerConfirmAddTitle => 'عضو شبکه اضافه شود؟';

  @override
  String peerConfirmAddBody(String name) {
    return '\"$name\" را با کلید عمومی آنها اضافه کنید تا بتوانید به صورت خصوصی به آنها پیام دهید؟';
  }

  @override
  String get peerConfirmAdd => 'اضافه کردن عضو';

  @override
  String peerAddedOk(String name) {
    return '$name به اعضای شبکه اضافه شد';
  }

  @override
  String get peerAddFromCompose => 'هویت/کلید عمومی در کادر پیام شناسایی شد';

  @override
  String get peerHashCopied => 'هش کلید عمومی کپی شد';

  @override
  String get peerHashOpenChat => 'گپ را باز کنید';

  @override
  String get peerHashAddHint =>
      'هش کپی شد. از آنها بخواهید پیوند هویت یا QR خود را به اشتراک بگذارند تا بتوانید کلید عمومی کامل را برای E2EE اضافه کنید.';

  @override
  String get peerQrNoCode => 'هیچ ResilNet QR در این تصویر یافت نشد';

  @override
  String identityInviteSharePreamble(String name) {
    return 'هویت ResilNet: \"$name\"\nپیوند را باز کنید یا در چت ← افزودن عضو پیست کنید\nیا QR هویت را اسکن کنید.';
  }

  @override
  String get identityShareInvite => 'پیوند هویت را به اشتراک بگذارید';

  @override
  String get identityInviteCopied => 'پیوند هویت کپی شد';

  @override
  String announceInviteSharePreamble(String title) {
    return 'دعوت هیئت مدیره: \"$title\"\nResilNet → تابلوهای انجمن → دنبال کردن از دعوت را باز کنید\nیا QR را اسکن کنید / روی پیوند زیر ضربه بزنید.';
  }

  @override
  String get announceConfirmFollowTitle => 'این تابلو را دنبال کنید؟';

  @override
  String announceConfirmFollowBody(String title) {
    return '«$title» را از این دعوت دنبال کنید؟';
  }

  @override
  String get announceConfirmFollow => 'دنبال کنید';
}

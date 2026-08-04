// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'جارٍ التحديث ResilNet...';

  @override
  String get appRefreshed =>
      'تم التحديث - تم إعادة تشغيل أجهزة الراديو والاكتشاف';

  @override
  String appRefreshFailed(String error) {
    return 'فشل التحديث: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'النقر المزدوج = التحديث الناعم. الضغط لفترة طويلة = استرداد صعب. النقر الثلاثي = مسح الطوارئ.';

  @override
  String get softRefreshTipTitle => 'إذا شعر ResilNet بأنه عالق';

  @override
  String get softRefreshTipBody =>
      'انقر نقرًا مزدوجًا فوق ResilNet (أعلى اليسار) لتحديث الراديو بشكل بسيط. إذا كان لا يزال عالقًا: اضغط لفترة طويلة على العنوان أو استخدم ⋮ → Hard Recovery أو الإعدادات. النقر الثلاثي هو مسح للطوارئ فقط.';

  @override
  String get softRefreshTipGotIt => 'فهمتها';

  @override
  String get infoSoftRefreshTitle => 'إذا كان التطبيق عالقًا';

  @override
  String get infoSoftRefreshStepRefresh =>
      'انقر نقرًا مزدوجًا على ResilNet (أعلى اليسار) ← تحديث بسيط لأجهزة الراديو والأشخاص القريبين';

  @override
  String get infoSoftRefreshStepHard =>
      'لا تزال عالقة؟ اضغط لفترة طويلة على العنوان، أو ⋮ / الإعدادات → استرداد القرص الصلب';

  @override
  String get infoSoftRefreshStepWait =>
      'انتظر نتيجة الوجبات الخفيفة، ثم حاول مرة أخرى. إعادة ضبط الجلسة تحافظ على مفاتيحك.';

  @override
  String get infoSoftRefreshStepWipe =>
      'النقر الثلاثي = مسح الطوارئ (يحذف البيانات المحلية) — فقط إذا كان مقصودًا';

  @override
  String get appRecoverySection => 'استرداد التطبيق';

  @override
  String get appRecoverySectionSubtitle =>
      'يُستخدم عندما يشعر التطبيق بالتجميد. Soft = النقر المزدوج على العنوان. التعافي الصعب أقوى. تؤدي إعادة تعيين الجلسة إلى إعادة تشغيل الخدمات دون مسح المفاتيح.';

  @override
  String get appHardRecoverAction => 'التعافي الصعب';

  @override
  String get appHardRecovering => 'التعافي صعب…';

  @override
  String get appSessionResetAction => 'إعادة تعيين الجلسة';

  @override
  String get appSessionResetRunning => 'جارٍ إعادة ضبط الجلسة...';

  @override
  String get appSessionResetConfirmTitle => 'إعادة ضبط الجلسة؟';

  @override
  String get appSessionResetConfirmBody =>
      'إعادة تشغيل خدمات ResilNet على هذا الجهاز. يتم الاحتفاظ بمفاتيح الهوية الخاصة بك.';

  @override
  String get appRecoveryBusy => 'الاسترداد قيد التشغيل بالفعل...';

  @override
  String get appRecoveryOk => 'انتهى الاسترداد';

  @override
  String get appRecoveryPartial =>
      'انتهت عملية الاسترداد مع تخطي بعض الخطوات - حاول مرة أخرى إذا كنت لا تزال عالقًا';

  @override
  String get appRecoveryFailed =>
      'فشل الاسترداد - حاول إعادة ضبط الجلسة، أو قم بإنهاء التطبيق من نظام التشغيل بالقوة';

  @override
  String get localWifiTitle => 'محلي Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'قم بربط الأجهزة القريبة بدون الإنترنت — تمامًا كما لو كنت متصلاً بشبكة LAN واحدة.';

  @override
  String get localWifiNotGatewayHint =>
      'ليست البوابة ESP32 LoRa SoftAP. هذا هو الهاتف↔الهاتف/الشبكة المحلية فقط.';

  @override
  String get localWifiUnavailable =>
      'المحلي Wi‑Fi ليس جاهزًا بعد - انتظر بدء تشغيل التطبيق.';

  @override
  String get lxmfBridgeTitle => 'العقدة الرئيسية';

  @override
  String get lxmfBridgeSubtitle =>
      'جهاز Mac أو Pi اختياري على جهاز Wi‑Fi الذي ينقل الدردشات المغلقة. إيقاف بشكل افتراضي. لا يحل محل التشفير من طرف إلى طرف.';

  @override
  String get lxmfBridgeEnable => 'استخدم العقدة الرئيسية';

  @override
  String get lxmfBridgeDisabledHint =>
      'يتم تشغيله فقط عند تشغيل تطبيق Bridge على جهاز Mac أو Pi على هذه الشبكة.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'متصل بالإنترنت - $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'لا يمكن الوصول إلى عقدة الصفحة الرئيسية — $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'عنوان العقدة الرئيسية';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP أو http://IP:port — مثال 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'النظير → LXMF الوجهة (JSON)';

  @override
  String get lxmfBridgeRefresh => 'حفظ وتحديث الحالة';

  @override
  String get lxmfBridgeLabHint => 'متقدم: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'إعدادات العقدة الرئيسية';

  @override
  String get lxmfBridgeCheckConnection => 'تحقق من الاتصال';

  @override
  String get lxmfBridgeStatusOnline => 'متصل بالعقدة الرئيسية';

  @override
  String get lxmfBridgeStatusOffline => 'العقدة الرئيسية غير قابلة للوصول';

  @override
  String get lxmfBridgeYourDest => 'عنوان هذه العقدة (مشاركتها مع الأصدقاء)';

  @override
  String get lxmfBridgeCopyDest => 'انسخ العنوان';

  @override
  String get lxmfBridgeDestCopied => 'تم نسخ العنوان';

  @override
  String get lxmfBridgeLinkedPeers => 'أصدقاء مرتبطون';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'يحتاج كل صديق إلى عنوان عقدة المنزل الخاص به مرة واحدة. ثم يمكن للدردشات المختومة استخدام هذا المسار.';

  @override
  String get lxmfBridgeNoLinks => 'لم يتم ربط أي أصدقاء حتى الآن.';

  @override
  String get lxmfBridgeAddLink => 'ربط صديق';

  @override
  String get lxmfBridgePickPeer => 'صديق';

  @override
  String get lxmfBridgePeerDest => 'عنوان عقدة منزلهم';

  @override
  String get lxmfBridgePeerDestHint =>
      'رمز مكون من 32 حرفًا من شاشة العقدة الرئيسية الخاصة بهم';

  @override
  String get lxmfBridgeInvalidDest =>
      'لا يبدو هذا العنوان صالحًا. الصق الكود الكامل من العقدة الرئيسية الخاصة بهم.';

  @override
  String get lxmfBridgeRemoveLink => 'إلغاء الارتباط';

  @override
  String get lxmfBridgeSaveLink => 'يحفظ';

  @override
  String get lxmfBridgeLinkSaved => 'صديق مرتبط';

  @override
  String get lxmfBridgeNoPeers =>
      'لا توجد جهات اتصال قابلة للمراسلة حتى الآن — قم بإضافة صديق أولاً.';

  @override
  String get lxmfBridgeHelp =>
      'استمر في تشغيل الجسر على جهاز Mac/Pi. يبقى هذا المسار على شبكة LAN الخاصة بك — فهو ليس LoRa ولا يحل محل الإنترنت أو شبكة Bluetooth.';

  @override
  String get localWifiModeHotspot => 'قريب';

  @override
  String get localWifiModeRouter => 'جهاز التوجيه';

  @override
  String get localWifiHotspotIntro =>
      'يشترك أحد الأجهزة في نقطة اتصال شخصية. ينضم الآخرون إلى نقطة الاتصال تلك، ثم يجدهم ResilNet على الشبكة المحلية.';

  @override
  String get localWifiHostAction => 'إنشاء شبكة (مضيف)';

  @override
  String get localWifiJoinAction => 'الانضمام إلى الشبكة';

  @override
  String get localWifiHostSteps =>
      '1. افتح إعدادات iOS/Android وقم بتشغيل نقطة الاتصال الشخصية (أو مشاركة الإنترنت).\n2. أخبر الأصدقاء باسم نقطة الاتصال (وكلمة المرور).\n3. عد إلى هنا وانقر على \"نقطة الاتصال قيد التشغيل - ابدأ الانتظار\".';

  @override
  String get localWifiHostReady => 'نقطة الاتصال قيد التشغيل - ابدأ الانتظار';

  @override
  String get localWifiHostWaiting => 'في انتظار انضمام الأصدقاء...';

  @override
  String get localWifiJoinSteps =>
      '1. افتح إعدادات النظام وانضم إلى نقطة الاتصال الشخصية لصديقك.\n2. ارجع إلى هنا وانقر على \"أنا متصل - بحث\".';

  @override
  String get localWifiJoinReady => 'أنا متصل – ابحث';

  @override
  String get localWifiRouterIntro =>
      'قم بتوصيل كل جهاز بنفس جهاز التوجيه/نقطة الوصول Wi‑Fi. لا يحتاج جهاز التوجيه إلى الإنترنت، بل يحتاج فقط إلى شبكة محلية مشتركة.';

  @override
  String get localWifiRouterSearch => 'ابحث في هذا Wi‑Fi';

  @override
  String get localWifiRefreshNetwork => 'قم بتحديث معلومات Wi‑Fi';

  @override
  String get localWifiRouterNoWifiTitle => 'ليس على Wi‑Fi';

  @override
  String get localWifiRouterNoWifiBody =>
      'انضم إلى Wi‑Fi الخاص بالموجه في إعدادات النظام، ثم ابحث مرة أخرى.';

  @override
  String get localWifiDiscovering => 'البحث على Wi‑Fi المحلي...';

  @override
  String get localWifiPeersFound => 'الأجهزة الموجودة على هذه الشبكة';

  @override
  String get localWifiStop => 'قف';

  @override
  String get localWifiSsidUnknown => 'اسم Wi‑Fi غير متاح';

  @override
  String get localWifiStubBanner => 'في انتظار مقبس LAN...';

  @override
  String get localWifiLiveBanner =>
      'اكتشاف LAN المباشر (UDP) - الإعلان عن الدردشة المختومة على هذا Wi‑Fi';

  @override
  String get localWifiEmptyHotspot =>
      'لا توجد أجهزة حتى الآن.\nتأكد من انضمام الأصدقاء إلى نقطة الاتصال الخاصة بك والسماح لهم بالوصول إلى الشبكة المحلية.';

  @override
  String get localWifiEmptyRouter =>
      'لا توجد أجهزة حتى الآن.\nنفس SSID؟ الشبكة المحلية مسموح بها؟ تقوم بعض أجهزة التوجيه بحظر حركة المرور من جهاز إلى جهاز (عزل AP).';

  @override
  String get localWifiIsolationHelp => 'لماذا لا نستطيع أن نجد بعضنا البعض؟';

  @override
  String get localWifiIsolationTitle => 'قد يقوم جهاز التوجيه بعزل العملاء';

  @override
  String get localWifiIsolationBody =>
      'إذا كان عزل نقطة الوصول/العميل (أو شبكة الضيف) قيد التشغيل، فلن تتمكن الهواتف الموجودة على نفس Wi‑Fi من التحدث. قم بإيقاف تشغيل العزل، أو استخدم SSID الرئيسي، أو قم بالتبديل إلى الوضع القريب (نقطة الاتصال).';

  @override
  String get localWifiPeerReady => 'جاهز للدردشة (لديه مفتاح)';

  @override
  String get localWifiPeerNeedKey =>
      'تم العثور عليه - قم بمسح QR لتبادل المفاتيح';

  @override
  String get localWifiErrorTitle => 'خطأ Wi‑Fi محلي';

  @override
  String get localWifiErrorBody => 'حدث خطأ ما. توقف وحاول مرة أخرى.';

  @override
  String get preparingSystem => 'تحضير النظام…';

  @override
  String get bootFailedTitle => 'لا يمكن البدء';

  @override
  String get retry => 'حاول ثانية';

  @override
  String get bootRecoveryAction => 'بدء هوية جديدة (محو البيانات المحلية)';

  @override
  String get bootRecoveryConfirmTitle => 'بدء هوية جديدة؟';

  @override
  String get bootRecoveryConfirmBody =>
      'سيؤدي هذا إلى مسح الدردشات المحلية والمفاتيح والهوية الموجودة على هذا الجهاز بشكل دائم.\nيجب على الزملاء مسح QR الخاص بك مرة أخرى باستخدام هويتك الجديدة.\nلا يمكن التراجع عن هذا.';

  @override
  String get bootRecoveryRunning => 'إعادة ضبط الهوية المحلية...';

  @override
  String get bootRecoverySuccess => 'اكتملت إعادة تعيين الهوية المحلية';

  @override
  String bootRecoveryFailed(String error) {
    return 'تعذر إعادة تعيين الهوية: $error';
  }

  @override
  String get cancel => 'يلغي';

  @override
  String get save => 'يحفظ';

  @override
  String get close => 'يغلق';

  @override
  String get start => 'يبدأ';

  @override
  String get send => 'يرسل';

  @override
  String get settings => 'إعدادات';

  @override
  String get language => 'لغة';

  @override
  String get languageSubtitle =>
      'افتراضيًا، يتبع التطبيق لغة هاتفك (عندما يكون مدعومًا). اللغات الأخرى تعود إلى اللغة الإنجليزية. يمكنك أيضًا قفل اللغة هنا.';

  @override
  String get languageSystem => 'الافتراضي للنظام';

  @override
  String get languageThai => 'التايلاندية';

  @override
  String get languageEnglish => 'إنجليزي';

  @override
  String get notificationsTooltip => 'إعدادات الإخطار';

  @override
  String get enableMessageNotifications => 'تمكين إشعارات الرسائل';

  @override
  String get settingsNotificationsSubtitle =>
      'رسائل 1:1 والأشخاص عبر الإنترنت (التنبيهات المحلية)';

  @override
  String get networkMembersTooltip => 'أعضاء الشبكة';

  @override
  String get identityQrTooltip => 'الهوية / QR';

  @override
  String get feedDirects => 'محادثة';

  @override
  String get feedMesh => '#شبكة';

  @override
  String get feedGeo => 'منطقة';

  @override
  String get feedDirectsSubtitle => 'رسائل E2EE الخاصة';

  @override
  String feedMeshSubtitle(Object ble) {
    return 'النظراء القريبون (BLE)';
  }

  @override
  String get feedGeoSubtitle => 'قناة اكتشاف جيوهاش';

  @override
  String get peerIdHint =>
      'الصق معرف المتلقي (تجزئة المفتاح العام) لبدء الدردشة';

  @override
  String get directsEmpty =>
      'لا توجد محادثات حتى الآن - قم بمسح QR أو لصق معرف المتلقي للبدء\nيتم ختم الرسائل بـ E2EE قبل إرسالها (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • انقر لفتح الدردشة';

  @override
  String get meshIntro =>
      'النظراء في النطاق BLE - انقر لإجراء محادثة E2EE خاصة (لا توجد إمكانية إنشاء عامة على #mesh)\nيتم الإرسال عبر جهاز التوجيه المختلط (BLE + LoRa + Nostr عند الاتصال بالإنترنت)';

  @override
  String get meshEmptyRunning =>
      'لا يوجد أقران قريبون حتى الآن - افتح التطبيق على جهاز آخر ضمن نطاق BLE';

  @override
  String get meshEmptyStopped => 'BLE لا يعمل - امنح إذن Bluetooth / الموقع';

  @override
  String get meshNearbyPrefix => 'قريب';

  @override
  String get meshRetentionTitle => 'الحذف التلقائي للرسائل';

  @override
  String get meshRetentionSubtitle =>
      'تتم إزالة سجل الدردشة المحلي الأقدم تلقائيًا';

  @override
  String get meshRetentionKeep => 'يحفظ';

  @override
  String get meshRetention1Day => 'يوم واحد';

  @override
  String get meshRetention3Days => '3 أيام';

  @override
  String get meshRetention7Days => '7 أيام';

  @override
  String get refreshLocationTooltip => 'تحديث الموقع';

  @override
  String get geoIntro =>
      'يمكن مراسلة الأشخاص المتصلين بالإنترنت في هذا Geohash 1: 1 أو مع منطقة عامة منتشرة (لا تزال مختومة E2EE لكل نظير - وليس نصًا عاديًا)';

  @override
  String geoEmpty(String channel) {
    return 'لا يوجد أحد متصل في $channel حتى الآن\nاستخدم النقل → الإنترنت/السيارات، انتظر Nostr، وقم بتحديث الموقع';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'متصل بالإنترنت في $channel • اضغط على 1:1 E2EE';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'قريب (في انتظار التواجد في المنطقة) • انقر لـ 1:1 E2EE';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'تمت مشاهدته على Nostr في $channel • الاكتشاف فقط (قديم)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'الحضور المجهول القديم - انتظر نظيرًا مقيدًا أو استبدل QR';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE قريب — امسح QR ضوئيًا لبدء 1:1 E2EE';

  @override
  String get geoInternetDiscoverHint =>
      'يحتاج اكتشاف الإنترنت في المنطقة إلى اتصال Nostr (الإعدادات ← النقل ← الإنترنت/التلقائي)';

  @override
  String get geoEmptyNoLocation =>
      'لم يتم حل الموقع بعد - اسمح لنظام تحديد المواقع العالمي (GPS) وقم بالتحديث لنشر Geohash الخاص بك على Nostr';

  @override
  String get geoEmptyNeedsPermission =>
      'تم رفض إذن الموقع - اسمح بـ ResilNet في الإعدادات ← الخصوصية ← الموقع';

  @override
  String get geoEmptyServicesDisabled =>
      'خدمات الموقع متوقفة - قم بتشغيلها في الإعدادات';

  @override
  String get geoEmptyNoGpsFix =>
      'تعذر الحصول على إصلاح GPS (شائع في أجهزة iPad Wi‑Fi) - قم بتعيين Geohash يدويًا أدناه';

  @override
  String get geoEmptyTeleportHint =>
      'اضغط على أيقونة المكان ← أدخل Geohash (على سبيل المثال، W5) ← النقل الفوري';

  @override
  String get geoSetGeohashManually => 'تعيين جيوهاش';

  @override
  String get geoTeleportHint =>
      'لا يوجد نظام تحديد المواقع؟ أدخل بادئة Geohash (2–7 أحرف، على سبيل المثال w5) ثم انقر فوق النقل الآني';

  @override
  String get geoTeleportInvalid =>
      'Geohash غير صالح - استخدم الأحرف/الأرقام الأساسية 32 فقط (على سبيل المثال، w5 أو w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'تم ضبط المنطقة على $channel';
  }

  @override
  String geoManualActive(String channel) {
    return 'المنطقة اليدوية: $channel (سيتم تجاوز تحديث GPS)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr غير جاهز — انقر فوق إعادة الاتصال (0/0 حتى ينجح الحرف الأول)';

  @override
  String get geoEmptyMeshOnly =>
      'النقل عبارة عن شبكة فقط - قم بالتبديل إلى الإنترنت أو التلقائي لاكتشاف الأقران عبر Nostr';

  @override
  String geoEmptyWaiting(String channel) {
    return 'لا يوجد أحد في $channel حتى الآن — اترك المنطقة + الإنترنت مفتوحًا على كلا الجهازين وانتظر حوالي 60 ثانية';
  }

  @override
  String get geoChannelFallback => '#منطقة';

  @override
  String get geoRefreshLocation => 'تحديث الموقع';

  @override
  String get settingsClearLocationTitle => 'موقع واضح';

  @override
  String get settingsClearLocationSubtitle =>
      'إزالة GPS / النقل الفضائي Geohash (تصبح المنطقة #—)';

  @override
  String get settingsClearLocationConfirmTitle => 'هل تريد مسح الموقع؟';

  @override
  String get settingsClearLocationConfirmBody =>
      'يحذف Geohash المخزنة على هذا الجهاز. يمكنك تحديث نظام تحديد المواقع العالمي (GPS) أو النقل الفوري مرة أخرى بعد ذلك.';

  @override
  String get settingsClearLocationAction => 'موقع واضح';

  @override
  String get settingsClearLocationSnack => 'تم محو الموقع';

  @override
  String get chatVoiceTooLarge =>
      'الملاحظة الصوتية كبيرة جدًا - بحد أقصى 30 ثانية تقريبًا';

  @override
  String get chatVoiceNeedInternet =>
      'تحتاج الملاحظة الصوتية إلى الإنترنت (Nostr) — وهي كبيرة جدًا بالنسبة لـ BLE وحده';

  @override
  String get chatVoiceSentInternet => 'ملاحظة صوتية تم إرسالها عبر الإنترنت';

  @override
  String get noticeAnonMention => 'يذكر';

  @override
  String get noticeAnonDm => 'رسالة مباشرة';

  @override
  String get noticeAnonHug => 'حضن';

  @override
  String get noticeAnonSlap => 'يصفع';

  @override
  String get noticeAnonBlock => 'حاجز';

  @override
  String get noticeAnonNeedKey =>
      'لا يوجد مفتاح عام حتى الآن — استبدل QR أولاً بـ 1:1';

  @override
  String get noticeAnonActionSent => 'مرسل';

  @override
  String noticeAnonBlocked(String anon) {
    return 'تم حظر $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* العناق $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* الصفعات $anon *';
  }

  @override
  String get geoReconnectNostr => 'أعد الاتصال Nostr';

  @override
  String get nostrSectionTitle => 'Nostr المرحلات';

  @override
  String get nostrSectionSubtitle =>
      'تستخدم رسائل الإنترنت واكتشاف المنطقة هذه المرحلات. انقر فوق إعادة الاتصال إذا ظلت الحالة غير متصلة بالإنترنت.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'متصل $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'غير متصل - المرحلات مدرجة ولكن لا يوجد شيء متصل';

  @override
  String get nostrStatusNotInit =>
      'لم يبدأ (0/0) — انقر فوق إعادة الاتصال للتهيئة';

  @override
  String get nostrReconnectAction => 'أعد الاتصال Nostr';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr متصل ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'لا يزال غير متصل بالإنترنت - تحقق من Wi‑Fi/cello أو حاول مرة أخرى';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'فشل: $error';
  }

  @override
  String get nostrReconnecting => 'الاتصال بالمرحلات…';

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return 'الانترنت (Nostr) في $channel • الدردشة المختومة جاهزة';
  }

  @override
  String get transportModeTitle => 'النقل بالمنطقة';

  @override
  String get transportModeSubtitle =>
      'الشبكة = BLE قريب (الراديو) عند عدم وجود Nostr · الإنترنت والتلقائي = Nostr قائمة الأشخاص';

  @override
  String get transportModeMesh => 'مش';

  @override
  String get transportModeInternet => 'إنترنت';

  @override
  String get transportModeAuto => 'آلي';

  @override
  String get geoPublicHint =>
      'رسالة عامة إلى الجميع على الانترنت في هذا المجال';

  @override
  String get geoPublicSend => 'عام';

  @override
  String geoPublicHelp(int count) {
    return 'توزيع مغلق إلى $count الأقران عبر الإنترنت — يتلقى كل منهم مظروفًا خاصًا';
  }

  @override
  String geoPublicSent(int count) {
    return 'تم الإرسال إلى $count النظير(النظراء) في هذه المنطقة';
  }

  @override
  String get geoPublicSentNone =>
      'لا يوجد أقران يمكن مراسلتهم عبر الإنترنت — افتح المنطقة/الشبكة مع الأقران الذين لديهم مفاتيح، أو انتظر BLE/Nostr';

  @override
  String get areaPublicBadge => 'المنطقة عامة';

  @override
  String get geoErrorPermission => 'تعذرت قراءة الموقع — تحقق من إذن الموقع';

  @override
  String get geoPrecisionRegion => 'منطقة';

  @override
  String get geoPrecisionProvince => 'مقاطعة';

  @override
  String get geoPrecisionCity => 'مدينة';

  @override
  String get geoPrecisionNeighborhood => 'حيّ';

  @override
  String get geoPrecisionBlock => 'حاجز';

  @override
  String get aliasTitle => 'تعيين اللقب (الاسم المستعار لجهة الاتصال)';

  @override
  String get aliasHintBody =>
      'يتم تخزين هذا الاسم المستعار على هذا الجهاز فقط (محلي فقط)\nولا يتم إرساله مطلقًا مع حركة مرور E2EE';

  @override
  String get aliasLabel => 'كنية';

  @override
  String get aliasHint => 'على سبيل المثال \"رئيس القرية\"، \"بسومتشاي\"...';

  @override
  String get settingsDevices => 'الأجهزة';

  @override
  String get settingsFirmwareTitle => 'تنزيل/تحديث البرنامج الثابت ESP32';

  @override
  String get settingsFirmwareSubtitle =>
      'قم بتنزيل ملفات .bin وقم بتحديث لوحة ESP32 عبر OTA';

  @override
  String get mtBridgeTitle => 'Meshtastic الجسر';

  @override
  String get mtBridgeSettingsSubtitle =>
      'جسر A/B للنص فقط — وليس ResilNet E2EE';

  @override
  String get mtBridgeIntro =>
      'انقل النص العادي القصير بين Meshtastic وResilNet. لا يمكن تشغيل الوضعين A وB في نفس الوقت. هذا ليس تشفيرًا من طرف إلى طرف.';

  @override
  String get mtBridgeModeLabel => 'وضع';

  @override
  String get mtBridgeModeOff => 'عن';

  @override
  String get mtBridgeModeA => 'استيعاب أ';

  @override
  String get mtBridgeModeB => 'الخروج ب';

  @override
  String get mtBridgeModeOffShort => 'عن';

  @override
  String get mtBridgeModeAShort => 'في أ';

  @override
  String get mtBridgeModeBShort => 'خارج ب';

  @override
  String get mtBridgeMutexHint =>
      'يؤدي تحديد أحد الأوضاع إلى إيقاف تشغيل الوضع الآخر تلقائيًا. لا يتم دعم A+B المتزامن.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'العرض التوضيحي (التسجيل)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'يظهر النص الوارد ضمن الإشعارات باسم #meshtastic. يعد تتابع الشبكة اختياريًا (يتم إيقاف تشغيله افتراضيًا).';

  @override
  String get mtBridgeRelayTitle => 'قم بالترحيل أيضًا على شبكة ResilNet';

  @override
  String get mtBridgeRelayHint =>
      'عند التشغيل، يتم بث النشرات العامة الموقعة. إيقاف = إشعارات هذا الهاتف فقط.';

  @override
  String get mtBridgeSimulateHint => 'رسالة تجريبية';

  @override
  String get mtBridgeSimulate => 'محاكاة رسالة Meshtastic';

  @override
  String get mtBridgeIngestOk => 'تم استيعابها في الإشعارات (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'تحذير: الرسائل المرسلة هنا ليست ResilNet E2EE. يمكن لأي شخص على المسار Meshtastic قراءتها.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'نص للنشر';

  @override
  String get mtBridgeSend => 'أرسل إلى Meshtastic';

  @override
  String get mtBridgeEgressOk =>
      'في قائمة الانتظار لـ Meshtastic (راجع السجل/السجل)';

  @override
  String get mtBridgeLastEgress => 'الخروج الأخير';

  @override
  String get mtBridgeEgressHistory => 'الخروج الأخير';

  @override
  String get mtBridgeOffHint =>
      'قم بتشغيل الإدخال (A) أو الخروج (B) لاستخدام الجسر.';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTIC · ليس E2EE';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'استخدم النقل MQTT';

  @override
  String get mtBridgeUseMqttHint =>
      'إيقاف = التسجيل التجريبي فقط (تم تجاهل MQTT الوارد). On = MQTT للدخول/الخروج عند الاتصال.';

  @override
  String get mtBridgeMqttHost => 'مضيف الوسيط';

  @override
  String get mtBridgeMqttPort => 'ميناء';

  @override
  String get mtBridgeMqttTls => 'استخدم TLS (mqtts)';

  @override
  String get mtBridgeMqttTlsHint =>
      'المنفذ النموذجي 8883. يستخدم شهادات النظام؛ فشل في أخطاء المصافحة.';

  @override
  String get mtBridgeMqttAutoReconnect => 'إعادة الاتصال التلقائي';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'عند التشغيل، يحاول العميل إعادة الاتصال بعد انقطاع الاتصال. تظهر الحالة جاري الاتصال حتى يتم استعادته.';

  @override
  String get mtBridgeMqttTopicHelpers => 'مساعدين الموضوع';

  @override
  String get mtBridgeMqttRegion => 'بادئة المنطقة (اختياري)';

  @override
  String get mtBridgeMqttRegionHint =>
      'عند التعيين، يؤدي تطبيق إلى إعادة بناء الجذر كـ msh/<region>/2/json (يتجاوز جذر الموضوع).';

  @override
  String get mtBridgeMqttTopicRoot => 'جذر موضوع JSON';

  @override
  String get mtBridgeMqttDownlinkChannel => 'اسم قناة الوصلة الهابطة';

  @override
  String get mtBridgeMqttApplyTopics => 'تطبيق الجذر → الاشتراك / نشر المواضيع';

  @override
  String get mtBridgeMqttAdvanced => 'متقدم MQTT';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'TLS، إعادة الاتصال، المواضيع، بيانات الاعتماد';

  @override
  String get mtBridgeMqttTopicIn => 'موضوع الاشتراك';

  @override
  String get mtBridgeMqttTopicOut => 'نشر الموضوع';

  @override
  String get mtBridgeMqttGatewayFrom => 'معرف عقدة البوابة (من)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'المعرف العشري أو !hex — مطلوب للوصلة الهابطة sendtext';

  @override
  String get mtBridgeMqttChannelIndex => 'مؤشر قناة الشبكة (اختياري 0-7)';

  @override
  String get mtBridgeMqttUser => 'اسم المستخدم (اختياري)';

  @override
  String get mtBridgeMqttPass => 'كلمة المرور (اختيارية)';

  @override
  String get mtBridgeMqttPassStored =>
      'يتم تخزين كلمة المرور على هذا الجهاز (غير موضحة).';

  @override
  String get mtBridgeMqttPassReplace =>
      'كلمة المرور الجديدة (اتركها فارغة للاحتفاظ بها)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'اتركه فارغًا للاحتفاظ بكلمة المرور المخزنة.';

  @override
  String get mtBridgeMqttPassClear => 'مسح كلمة المرور';

  @override
  String get mtBridgeMqttSave => 'احفظ إعدادات MQTT';

  @override
  String get mtBridgeMqttSaved => 'تم حفظ إعدادات MQTT';

  @override
  String get mtBridgeMqttConnect => 'يتصل';

  @override
  String get mtBridgeMqttDisconnect => 'قطع الاتصال';

  @override
  String get mtBridgeMqttConnected => 'MQTT متصل';

  @override
  String get mtBridgeMqttConnecting => 'MQTT جارٍ الاتصال...';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT غير متصل';

  @override
  String get mtBridgeMqttError => 'خطأ MQTT';

  @override
  String get mtBridgeErrModeIngest => 'قم بالتبديل إلى Ingest (A) أولاً';

  @override
  String get mtBridgeErrModeEgress => 'قم بالتبديل إلى الخروج (B) أولاً';

  @override
  String get mtBridgeErrRate => 'أبطئ — المعدل محدود';

  @override
  String get mtBridgeErrDedupe => 'تم تجاهل الرسالة المكررة';

  @override
  String get mtBridgeErrLoop => 'أسقطت لمنع حلقة الجسر';

  @override
  String get mtBridgeErrEmpty => 'الرسالة فارغة';

  @override
  String get mtBridgeErrPublish => 'فشل النشر';

  @override
  String get mtBridgeErrNotConnected => 'MQTT غير متصل';

  @override
  String get mtBridgeErrMissingHost => 'أدخل مضيف الوسيط MQTT';

  @override
  String get mtBridgeErrMissingTopic => 'أدخل الاشتراك ونشر المواضيع';

  @override
  String get mtBridgeErrMissingFromNode =>
      'أدخل معرف عقدة البوابة (من) لـ sendtext';

  @override
  String get mtBridgeErrConnect => 'فشل الاتصال MQTT';

  @override
  String get mtBridgeErrConnectTls => 'MQTT فشل اتصال TLS';

  @override
  String get settingsData => 'بيانات';

  @override
  String get settingsDataHint =>
      'احذف الرسائل المحلية لتقليص قاعدة البيانات - يتم الاحتفاظ بالهوية والمفاتيح والأقران';

  @override
  String get settingsSaveHistoryTitle => 'حفظ سجل الرسائل';

  @override
  String get settingsSaveHistorySubtitle =>
      'عند إيقاف التشغيل، تظل الرسائل E2EE على السلك ويتم الاحتفاظ بها لهذه الجلسة فقط (وليس في سجل الدردشة المحلي). لا يزال النص الخاص بك يظهر كنص عادي على هذا الجهاز.';

  @override
  String get settingsPrivacy => 'خصوصية';

  @override
  String get settingsE2eeTitle => 'التشفير من النهاية إلى النهاية';

  @override
  String get settingsE2eeSubtitle =>
      'قيد التشغيل دائمًا — يتم ختم الرسائل باستخدام RSA-OAEP + AES-GCM قبل إرسالها. لا تستطيع المرحلات والقفزات القريبة قراءة المحتويات.';

  @override
  String get settingsScreenshotTitle => 'تنبيهات لقطة الشاشة';

  @override
  String get settingsScreenshotSubtitle =>
      'إظهار خط النظام في الدردشة عندما يلتقط هذا الجهاز الشاشة';

  @override
  String get settingsNostrExpiryTitle => 'Nostr رسالة الحفاظ على الوقت';

  @override
  String get settingsNostrExpirySubtitle =>
      'المدة التي يجب أن تظل فيها المظاريف المختومة محليًا عند الاتصال بالإنترنت عبر Nostr';

  @override
  String get noticeExpiresIn => 'تنتهي في';

  @override
  String get noticesTitle => 'إشعارات';

  @override
  String get noticesMeshIntro =>
      'النشرة العامة — مرئية للجميع في نطاق الراديو، وليست مشفرة. فهو ينتقل من هاتف إلى هاتف في وضع عدم الاتصال، وتحتفظ صناديق الترحيل ResilNet القريبة بنسخة حتى يتمكن الأشخاص الذين يصلون لاحقًا من رؤيتها.';

  @override
  String get noticesMeshPublicBadge => 'عامة · غير مشفرة';

  @override
  String get noticesGeoIntro =>
      'أضف ملاحظات قصيرة لهذا المكان حتى يتمكن الزوار الآخرون من العثور عليها.';

  @override
  String get noticesEmpty => 'لا إشعارات حتى الآن';

  @override
  String get noticesEmptyHint =>
      'قم بتثبيت الإشعار الأول للأشخاص الموجودين هنا.';

  @override
  String get noticesComposeHint => 'نشر إشعار...';

  @override
  String get noticesUrgent => 'عاجل';

  @override
  String get noticesOpen => 'إشعارات';

  @override
  String get screenshotTaken => '* لقد التقطت لقطة شاشة *';

  @override
  String get chatAttachImage => 'إرفاق الصورة';

  @override
  String get chatImageLabel => 'صورة';

  @override
  String get chatImageTooLarge => 'الصورة كبيرة جدًا — حاول استخدام صورة أخرى';

  @override
  String get chatNostrExpiry => 'Nostr احتفظ به';

  @override
  String geoPublicComposeHint(String channel) {
    return 'أرسل إلى $channel - عام';
  }

  @override
  String get settingsClearTitle => 'مسح كافة الرسائل';

  @override
  String get settingsClearSubtitle =>
      'احذف جميع الدردشات الموجودة على هذا الجهاز';

  @override
  String get settingsClearConfirmTitle => 'مسح كافة الرسائل؟';

  @override
  String get settingsClearConfirmBody =>
      'يؤدي هذا إلى حذف جميع رسائل الدردشة على هذا الجهاز.\nلا تتم إزالة الأقران والألقاب.';

  @override
  String get settingsClearAction => 'مسح البيانات';

  @override
  String get settingsClearedSnack => 'تم مسح البيانات';

  @override
  String settingsVersion(String version) {
    return 'الإصدار $version';
  }

  @override
  String get meshBleScanning => 'BLE: البحث عن العقد';

  @override
  String get meshBleEsp32Scanning => 'ESP32: البحث عن عقدة قريبة';

  @override
  String get meshBleSyncing => 'BLE: المزامنة مع ESP32';

  @override
  String get meshNostrPublishing => 'Nostr: النشر';

  @override
  String get meshBleIdle =>
      'شبكة BLE قيد التشغيل — لا توجد هواتف قريبة حتى الآن';

  @override
  String meshBlePeersNearby(int count) {
    return 'شبكة BLE — هاتف (هواتف) $count مجاورة';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: الإذن مطلوب';

  @override
  String get meshBlePausedCamera =>
      'تم إيقاف BLE مؤقتًا للكاميرا — انقر فوق ابدأ BLE';

  @override
  String get meshBleStopped =>
      'تم إيقاف تشغيل BLE — تحقق من تشغيل Bluetooth، ثم انقر فوق ابدأ BLE';

  @override
  String get meshBleRestart => 'ابدأ BLE';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · الموقع $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'تحقق من الأذونات وابدأ BLE';

  @override
  String get meshNostrOffline => 'Nostr غير متصل';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count الأقران القريبون • LoRa $lora • المزامنة ~${meters}m';
  }

  @override
  String get meshLoraReady => 'مستعد';

  @override
  String get meshLoraNotReady => 'غير جاهز';

  @override
  String meshGatewayProgress(String label) {
    return 'بوابة UDP: $label';
  }

  @override
  String get meshGatewayReady => 'بوابة UDP: جاهزة';

  @override
  String get permissionTitle => 'السماح بالوصول لبدء الشبكة المتداخلة BLE';

  @override
  String get permissionBody =>
      'يحتاج التطبيق إلى تقنية Bluetooth (المسح / الاتصال / الإعلان)، والموقع (لأجهزة Android الأقدم)، والميكروفون (للملاحظات الصوتية في الدردشة والإعلانات) لمراسلة المجتمع.';

  @override
  String get permissionE2ee =>
      'التشفير الشامل (E2EE)\nلا تستطيع عقد الترحيل قراءة محتويات الرسالة';

  @override
  String get permissionReady => 'الأذونات جاهزة';

  @override
  String get permissionRequest => 'السماح والمتابعة';

  @override
  String get permissionNotReadySnack =>
      'النظام ليس جاهزًا بعد - انتظر لحظة وحاول مرة أخرى';

  @override
  String get permissionDeniedSnack =>
      'الأذونات غير مكتملة — افتح الإعدادات > ResilNet واسمح بالبلوتوث / الموقع / الميكروفون';

  @override
  String get permissionMicDenied =>
      'تم رفض الوصول إلى الميكروفون - اسمح له في الإعدادات بتسجيل الملاحظات الصوتية';

  @override
  String get permissionMicOpenSettings => 'إعدادات';

  @override
  String get permissionCameraDenied =>
      'تم رفض الوصول إلى الكاميرا - اسمح لها في الإعدادات بمسح رموز QR ضوئيًا';

  @override
  String get permissionCameraFailed => 'مطلوب إذن الكاميرا لمسح رموز QR';

  @override
  String get permissionCameraOpenSettings => 'إعدادات';

  @override
  String get permissionPhotosDenied =>
      'تم رفض الوصول إلى مكتبة الصور - اسمح بذلك في الإعدادات لحفظ رمز الاستجابة السريعة الخاص بك';

  @override
  String get permissionPhotosFailed =>
      'مطلوب إذن مكتبة الصور لحفظ رمز الاستجابة السريعة الخاص بك';

  @override
  String get permissionPhotosOpenSettings => 'إعدادات';

  @override
  String permissionFailedSnack(String error) {
    return 'فشل طلب الإذن: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet الهندسة المعمارية • القفزات المتعددة للتخزين وإعادة التوجيه';

  @override
  String get onboardingSkip => 'يتخطى';

  @override
  String get onboardingNext => 'التالي';

  @override
  String get onboardingStart => 'ابدأ';

  @override
  String get onboardingWelcomeTitle => 'مرحبًا بك في ResilNet';

  @override
  String get onboardingWelcomeBody =>
      'قم بالدردشة على ResilNet عبر شبكة متداخلة — حتى بدون الاتصال بالإنترنت';

  @override
  String get onboardingFriendsTitle => 'أضف أصدقاء بسهولة';

  @override
  String get onboardingFriendsBody =>
      'قم بمشاركة QR من Identity، أو قم بمسح QR الخاص بصديق لتبادل المفاتيح العامة';

  @override
  String get onboardingChannelsTitle => 'دردشة مشفرة + القنوات القريبة';

  @override
  String get onboardingChannelsBody =>
      'قم بتبديل #mesh / Area (geohash) للعثور على أقران قريبين - تظل الرسائل E2EE عبر شبكة BLE وNostr';

  @override
  String get chatTitle => 'الدردشة (E2EE)';

  @override
  String get chatScanTooltip => 'مسح QR لإضافة نظير';

  @override
  String get chatBlockTooltip => 'حظر هذا المرسل';

  @override
  String get chatBlockedSnack => 'محظور: لا توجد إخطارات / لا يوجد ترحيل';

  @override
  String get chatAliasTooltip => 'تعيين اللقب';

  @override
  String get chatReceiverPemLabel => 'المفتاح العام للمستلم (PEM)';

  @override
  String get chatReceiverPemHint =>
      'الصق المفتاح العام لصديقك (من ملف QR / المشترك)';

  @override
  String get chatNeedPeerKey =>
      'قم بمسح QR الخاص بهذا النظير أولاً (يتطلب المفتاح العام الذي تم التحقق منه)';

  @override
  String get chatPeerKeyMismatch =>
      'المفتاح العام المخزن لا يتطابق مع معرف النظير هذا';

  @override
  String chatVoiceFailed(String error) {
    return 'تعذر تسجيل الصوت: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'تعذر تشغيل الملاحظة الصوتية: $error';
  }

  @override
  String get chatPlayVoice => 'تشغيل الملاحظة الصوتية';

  @override
  String get chatPauseVoice => 'يوقف';

  @override
  String get chatVoiceLabelSent => '🎤 ملاحظة صوتية (مختومة)';

  @override
  String get chatVoiceLabel => '🎤 ملاحظة صوتية';

  @override
  String get chatDecryptFailed => '[فشل فك التشفير]';

  @override
  String chatSentSealed(String preview) {
    return '[مختومة • قيراط=$preview]';
  }

  @override
  String get chatSentSealedShort => '[مختوم]';

  @override
  String get chatComposeHint => 'اكتب رسالة... (مختومة عند الإرسال)';

  @override
  String get chatEmptyThread =>
      'لا توجد رسائل حتى الآن\nاكتب أدناه لإرسال عبر الشبكة';

  @override
  String chatLoadFailed(String error) {
    return 'تعذر تحميل المحادثة: $error';
  }

  @override
  String get chatEmojiTooltip => 'الرموز التعبيرية';

  @override
  String get statusPending => 'قيد الانتظار';

  @override
  String get statusSent => 'مرسل';

  @override
  String get statusRelayed => 'ترحيل';

  @override
  String get statusDelivered => 'تم التوصيل';

  @override
  String get statusRead => 'يقرأ';

  @override
  String get statusFailed => 'فشل';

  @override
  String get chatCopy => 'ينسخ';

  @override
  String get chatDeleteLocal => 'الحذف على هذا الجهاز';

  @override
  String get chatDeletedLocalSnack => 'تم الحذف على هذا الجهاز';

  @override
  String get chatRetry => 'أعد المحاولة';

  @override
  String get chatSendFailed => 'لم يتم التسليم — اضغط على إعادة المحاولة';

  @override
  String get chatImageNeedInternet => 'اتصل بالإنترنت لإرسال الصور';

  @override
  String get chatImageTooLargeOnline =>
      'لا يمكن ضغط الصورة بدرجة كافية لإرسالها';

  @override
  String get chatOpenLinkFailed => 'لا يمكن فتح الرابط';

  @override
  String get identityTitle => 'هوية';

  @override
  String get identityScanTooltip => 'مسح QR بالكاميرا';

  @override
  String get identityCopiedHash => 'تم نسخ تجزئة المفتاح العام';

  @override
  String get identityPeerSaved => 'تم حفظ النظير من QR';

  @override
  String get identityGalleryDenied => 'تم رفض إذن مكتبة الصور';

  @override
  String get identityQrSaved => 'تم حفظ QR في مكتبة الصور';

  @override
  String identityQrSaveFailed(String error) {
    return 'تعذر حفظ QR: $error';
  }

  @override
  String get peersTitle => 'أعضاء الشبكة';

  @override
  String get qrScanTitle => 'مسح QR لإضافة صديق';

  @override
  String get qrInvalid => 'فشل المسح: QR غير صالح';

  @override
  String get qrIdKeyMismatch => 'تم رفض QR: المعرف لا يتطابق مع المفتاح العام';

  @override
  String get qrCameraNotReady => 'الكاميرا غير جاهزة';

  @override
  String get qrRetrySettings => 'حاول مرة أخرى / افتح الإعدادات';

  @override
  String qrCameraOpenFailed(String error) {
    return 'تعذر فتح الكاميرا: $error';
  }

  @override
  String get qrScanAlignHint => 'قم بمحاذاة رمز الاستجابة السريعة داخل الإطار';

  @override
  String get firmwareDownloadTitle => 'قم بتنزيل البرنامج الثابت ESP32';

  @override
  String get firmwareSourceOnline => 'الأحدث (عبر الإنترنت)';

  @override
  String get firmwareSourceCached => 'نسخة محفوظة (غير متصل)';

  @override
  String get firmwareSourceBaseline => 'خط الأساس المجمع (غير متصل)';

  @override
  String get firmwareSourceUnavailable => 'لا توجد برامج ثابتة متاحة';

  @override
  String get firmwareBaselineIncompatible =>
      'البرامج الثابتة المجمعة قديمة جدًا — اتصل بالإنترنت لتنزيل إصدار أحدث';

  @override
  String get firmwareChecksumFailed =>
      'فشل التحقق من سلامة البرامج الثابتة — تم حظر الوميض';

  @override
  String firmwareReadyFromSource(String source) {
    return 'البرامج الثابتة جاهزة: $source';
  }

  @override
  String get peersRefreshTooltip => 'ينعش';

  @override
  String get peersBlocked => 'محظور';

  @override
  String peersNearbyBle(Object ble) {
    return 'قريب (BLE)';
  }

  @override
  String get peersRecentlyOnline => 'مؤخرا على الانترنت';

  @override
  String get peersOnlineInArea => 'اون لاين في المنطقة';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return 'تمت المشاهدة منذ $minutes دقيقة';
  }

  @override
  String get peersOffline => 'غير متصل';

  @override
  String peersBlockedSnack(String id) {
    return 'تم حظر $id';
  }

  @override
  String get peersUnblockedSnack => 'غير محظور';

  @override
  String get peersEmpty =>
      'لا يوجد أعضاء في قاعدة البيانات حتى الآن\nقم بمسح QR ضوئيًا أو انتظر اكتشاف الشبكة BLE';

  @override
  String get peersOpenChat => 'افتح الدردشة';

  @override
  String get peersBlockAction => 'حاجز';

  @override
  String get peersUnblockAction => 'إلغاء الحظر';

  @override
  String get channelPickerTooltip => 'دردشة / #شبكة / منطقة';

  @override
  String get locationPickerTooltip => 'قناة الموقع';

  @override
  String get transportPickerTooltip => 'شبكة / إنترنت / تلقائي';

  @override
  String get onlinePeopleTooltip => 'الناس على الانترنت';

  @override
  String get unreadDirectsTooltipEmpty => 'رسائل خاصة';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count الرسائل الخاصة غير المقروءة';
  }

  @override
  String get onlinePeopleTitle => 'الناس';

  @override
  String get onlinePeopleEmpty => 'لا يوجد أحد هنا على الإنترنت حتى الآن';

  @override
  String onlinePeopleCount(int count) {
    return '$count متصل';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · قريب + منطقة';

  @override
  String get peerOnlineMeshTitle => 'شخص قريب على الشبكة';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name قريب على الشبكة';
  }

  @override
  String get peerOnlineAreaTitle => 'شخص ما على الإنترنت في المنطقة';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name متصل عبر Nostr';
  }

  @override
  String get locationSheetTitle => '#قنوات الموقع';

  @override
  String get channelPinsTitle => 'مثبت';

  @override
  String get channelPinsHint =>
      'قم بتثبيت القنوات التي تستخدمها كثيرًا، حيث تظل في الأعلى';

  @override
  String get channelPinTooltip => 'ثبت هذه القناة';

  @override
  String get channelUnpinTooltip => 'إزالة التثبيت';

  @override
  String get locationSheetIntro =>
      'قم بالدردشة مع الأشخاص القريبين باستخدام Geohash الخشن - وليس نظام تحديد المواقع العالمي (GPS) الدقيق. يستخدم التواجد على الإنترنت مفاتيح Nostr مجهولة.';

  @override
  String get locationMeshSubtitle => '#بلوتوث • ~10-50 م';

  @override
  String get locationTeleportHint => '#جيوهاش';

  @override
  String get locationTeleport => 'النقل الفوري';

  @override
  String homeComposeHint(String channel) {
    return 'الرسالة $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return 'أرسل إلى $channel - عام';
  }

  @override
  String get messageExpiryTitle => 'تنتهي في';

  @override
  String get voiceRecordTapToStart => 'انقر لتسجيل الرسالة الصوتية';

  @override
  String get voiceRecordTooShort => 'التسجيل قصير جدًا — حاول مرة أخرى';

  @override
  String get voiceRecordFailed => 'تعذر حفظ التسجيل - حاول مرة أخرى';

  @override
  String get voicePttHold => 'اضغط للتسجيل';

  @override
  String get voicePttRelease => 'الافراج عن المعاينة';

  @override
  String get voicePttRecording => 'تسجيل…';

  @override
  String get voicePttDraftReady => 'مذكرة صوتية جاهزة';

  @override
  String get voicePttDiscard => 'ينبذ';

  @override
  String get voicePttReRecord => 'سجل مرة أخرى';

  @override
  String get voicePttSend => 'أرسل ملاحظة صوتية';

  @override
  String get voicePttPlayPreview => 'تشغيل المعاينة';

  @override
  String get voicePttStopPreview => 'إيقاف المعاينة';

  @override
  String get noticesBackfilling => 'جارٍ تحميل الإشعارات…';

  @override
  String get noticesNostrOnline => 'Nostr متصل';

  @override
  String get noticesNostrOffline =>
      'Nostr غير متصل — تحتاج النشرة إلى الإنترنت';

  @override
  String noticesBackfillLoaded(int count) {
    return 'تم تحميل إشعارات $count';
  }

  @override
  String get noticePublishFailed =>
      'لا يمكن نشر إشعار إلى مجلس المنطقة. تحقق من اتصال Nostr.';

  @override
  String get noticeMeshPublishNoLink =>
      'تم الحفظ محليًا. اتصل بجهاز راديو شبكي قريب (أو بوابة Wi‑Fi) حتى يتمكن الآخرون من استقباله.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'تم إرسال النشرة إلى $count جهاز (أجهزة) مجاورة عبر BLE.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'تمت رؤية أجهزة الراديو القريبة، ولكن فشلت الكتابة BLE. اترك كلا التطبيقين مفتوحين على شاشة الإشعارات وحاول مرة أخرى (أو استخدم مرحل ESP32).';

  @override
  String get noticeMeshPublishNoGatt =>
      'جهاز الاستقبال BLE لهذا الجهاز غير جاهز. قم بتبديل البلوتوث وإعادة فتح الإشعارات.';

  @override
  String get noticeDelete => 'حذف الإشعار';

  @override
  String get noticeDeleteConfirmTitle => 'هل تريد حذف هذا الإشعار؟';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'يؤدي هذا إلى إزالته فقط على هذا الجهاز. وسيظل بإمكان الآخرين الذين استلموها بالفعل رؤيتها.';

  @override
  String get noticeDeleted => 'تم حذف الإشعار';

  @override
  String get chatNoticeHidden => 'إشعار المنطقة - الإشعارات المفتوحة';

  @override
  String get identityDisplayNameTitle => 'اسم العرض';

  @override
  String get identitySaveName => 'حفظ الاسم';

  @override
  String get identityUserIdLabel => 'معرف المستخدم (تجزئة المفتاح العام)';

  @override
  String get identityCopyHashTooltip => 'انسخ تجزئة المفتاح العام';

  @override
  String get identityMyQrTitle => 'QR الخاص بي (المعرف + pubKey + الاسم)';

  @override
  String identityQrFailed(String error) {
    return 'لا يمكن إنشاء QR\n$error';
  }

  @override
  String get identitySaving => 'توفير…';

  @override
  String get identitySaveQr => 'حفظ QR إلى مكتبة الصور';

  @override
  String get identityOpenScanner => 'افتح الكاميرا لمسح QR';

  @override
  String get identityQrHelp =>
      'اطلب من صديق أن يقوم بمسح هذا ضوئيًا لحفظ مفتاحك العام و(إذا لزم الأمر) تعيينك كمصدر معتمد';

  @override
  String get identityChatTip =>
      'نصيحة: يمكنك أيضًا مسح QR في الدردشة لإضافة مفتاح عام لـ E2EE';

  @override
  String get infoOpen => 'حول / معلومات';

  @override
  String get docsGuideTitle => 'دليل المستخدم';

  @override
  String get docsGuideSubtitle => 'يفتح في المتصفح';

  @override
  String get docsOpenAction => 'دليل مفتوح';

  @override
  String get docsOpenFailed => 'لا يمكن فتح دليل المستخدم';

  @override
  String get firmwareOtaGuideTitle => 'دليل الفلاش وبروتوكول OTA';

  @override
  String get firmwareOtaGuideSubtitle =>
      'يفتح دليل الويب - تنزيلات .bin والخطوات الكاملة';

  @override
  String get firmwareWebDownloadsTitle => 'تنزيلات البرامج الثابتة على الويب';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'الروابط والمجاميع الاختبارية لكل إصدار على موقع المستندات';

  @override
  String get inviteCopyShortLink => 'انسخ الرابط القصير';

  @override
  String get inviteShareLink => 'مشاركة الرابط';

  @override
  String get inviteShowFullLink => 'الرابط الكامل';

  @override
  String get inviteCopyFullLink => 'انسخ الرابط كاملا';

  @override
  String get inviteLinkCopied => 'تم نسخ الرابط';

  @override
  String get inviteLongPressHint => 'اضغط لفترة طويلة لإجراءات الارتباط';

  @override
  String get inviteSendInChat => 'إرسال في دردشة ResilNet...';

  @override
  String get inviteSendInChatHint =>
      'فقط الأشخاص الذين لديك بالفعل مفتاح عام لهم';

  @override
  String get inviteSendInChatEmpty =>
      'لا توجد محادثات قابلة للمراسلة حتى الآن.\nامسح QR ضوئيًا، أو افتح المنطقة/الشبكة، أو شارك الرابط خارج التطبيق أولاً.';

  @override
  String get inviteSentToChat => 'تم إرسال الدعوة في الدردشة';

  @override
  String get infoTabInfo => 'معلومات';

  @override
  String get infoTabSettingsHint =>
      'افتح الإعدادات من القائمة الخاصة بأدوات اللغة وE2EE والبيانات';

  @override
  String get infoHowToTitle => 'كيفية الاستخدام';

  @override
  String get infoHowToBody =>
      '• اضغط على أيقونة القناة لتبديل الدردشة / #mesh / المنطقة\n• اضغط على المكان لاختيار حجم Geohash\n• اضغط على الأشخاص للأعضاء أو المتصلين بالإنترنت\n• افتح Identity/QR من ⋮ لتبادل المفاتيح شخصيًا\n• تقوم المنطقة \"العامة\" بإرسال E2EE مختومًا إلى كل نظير عبر الإنترنت - وليس غرفة نص عادي';

  @override
  String get infoFeaturesTitle => 'سمات';

  @override
  String get infoFeatureOffline =>
      'المراسلة دون اتصال بالإنترنت عبر تقنية Bluetooth منخفضة الطاقة';

  @override
  String get infoFeatureE2ee =>
      'التشفير من طرف إلى طرف باستخدام RSA-OAEP + AES-GCM (بدون ضوضاء)';

  @override
  String get infoFeatureMultihop =>
      'يمكن للرسائل أن تنتقل عبر أقرانها القريبين لتذهب أبعد';

  @override
  String get infoFeatureBridge => 'شبكة هجينة ↔ إنترنت (Nostr) للأظرف المختومة';

  @override
  String get infoFeatureGeo =>
      'قنوات Geohash المحلية للأشخاص القريبين (discovery UX)';

  @override
  String get infoFeatureNotices => 'إشعارات بانتهاء صلاحية #الشبكة والمنطقة';

  @override
  String get infoPrivacyTitle => 'خصوصية';

  @override
  String get infoPrivacyNoRoom =>
      'لا توجد قرية نصية / غرفة دردشة عامة على السلك';

  @override
  String get infoPrivacyFanout =>
      'إرسال المنطقة = توزيع موسع بنسبة 1:1 إلى النظراء الذين لديهم مفاتيح عامة معروفة';

  @override
  String get infoPrivacyPresence =>
      'يستخدم التواجد في منطقة الإنترنت مفاتيح Nostr المؤقتة';

  @override
  String get infoSymbolsTitle => 'الرموز';

  @override
  String get infoSymBle => 'رابط بلوتوث مباشر';

  @override
  String get infoSymMesh => 'يمكن الوصول إليه عبر الشبكة (الآخرون للأمام)';

  @override
  String get infoSymInternet => 'عبر الإنترنت (Nostr) — مظاريف مختومة';

  @override
  String get infoSymBridge => 'وصلت عبر مسار جسر شبكة الإنترنت';

  @override
  String get infoSymOffline => 'غير متصل - لا يمكن الوصول إليه الآن';

  @override
  String get infoSymInArea => 'في منطقة قناة الموقع هذا';

  @override
  String get infoSymE2eeOk => 'جلسة مشفرة من طرف إلى طرف';

  @override
  String get infoSymE2eeFail => 'التشفير غير متاح — لا ترسل نصًا حساسًا';

  @override
  String get infoSymVerified => 'مفتاح تم التحقق من الهوية/ معروف';

  @override
  String get infoSymBlocked => 'محظور';

  @override
  String get infoSymUnread => 'رسالة خاصة غير مقروءة';

  @override
  String get infoEmergencyTitle => 'وضع الطوارئ';

  @override
  String get infoEmergencyBody =>
      'انقر ثلاث مرات على العنوان ResilNet على الشاشة الرئيسية لمسح الرسائل والمفاتيح والهوية على هذا الجهاز.';

  @override
  String get infoLegendNote =>
      'تم توثيق بعض أيقونات المسار هنا من أجل الوضوح؛ تظل علامات التسليم في الدردشة هي حالة الإرسال الأساسية.';

  @override
  String get dangerZoneTitle => 'منطقة الخطر';

  @override
  String get dangerZoneSubtitle =>
      'يحذف الرسائل ومفاتيح التشفير وهوية Nostr والأقران والألقاب الموجودة على هذا الجهاز. سوف تقوم بالإعداد مرة أخرى.';

  @override
  String get panicWipeTitle => 'مسح الطوارئ';

  @override
  String get panicWipeSubtitle =>
      'مسح كل شيء محليًا - مثل النقر الثلاثي على عنوان المنزل (النقر المزدوج لتحديث أجهزة الراديو)';

  @override
  String get panicWipeConfirmTitle => 'هل تريد مسح جميع البيانات المحلية؟';

  @override
  String get panicWipeConfirmBody =>
      'يؤدي هذا إلى حذف الدردشات والمفاتيح والهوية الموجودة على هذا الهاتف نهائيًا.\nيجب على الزملاء إعادة استبدال مفاتيح QR بهويتك الجديدة.\nلا يمكن التراجع عن هذا.';

  @override
  String get panicWipeAction => 'امسح كل شيء';

  @override
  String get panicWipeSnack => 'تم مسح الهوية المحلية — تم الإعداد مرة أخرى';

  @override
  String panicWipeFailed(String error) {
    return 'فشل المسح: $error';
  }

  @override
  String get meshBridgeTitle => 'جسر شبكي';

  @override
  String get meshBridgeSubtitle =>
      'عند التشغيل (افتراضي)، قد تستخدم الأظرف المختومة كلاً من الشبكة BLE والإنترنت (Nostr) معًا حتى تتمكن الجزر الشبكية القريبة من الاتصال. عند إيقاف التشغيل، يستخدم الإرسال مسارًا واحدًا فقط - ولا يضع نصًا عاديًا على السلك مطلقًا.';

  @override
  String get favoritesTitle => 'المفضلة';

  @override
  String get favoritesAdd => 'أضف إلى المفضلة';

  @override
  String get favoritesRemove => 'إزالة من المفضلة';

  @override
  String get favoritesEmpty =>
      'لا توجد مفضلات بعد - قم بتمييز أحد الأقران من قائمة الأعضاء';

  @override
  String get favoritesNearbyTitle => 'المفضلة القريبة';

  @override
  String favoritesNearbyBody(String name) {
    return '$name قريب على الشبكة';
  }

  @override
  String get favoritesInAreaTitle => 'المفضلة في المنطقة';

  @override
  String favoritesInAreaBody(String name) {
    return '$name موجود في هذه المنطقة';
  }

  @override
  String get topologyTitle => 'طوبولوجيا الشبكة';

  @override
  String get topologySubtitle =>
      'تلميحات الأقران والاتصال من شبكة الإعلان (للقراءة فقط)';

  @override
  String get topologyConnectedNow => 'متصل الآن (BLE)';

  @override
  String get topologyNearby => 'قريب (BLE)';

  @override
  String get topologyKnown => 'أقرانهم المعروفون';

  @override
  String get topologyEmpty =>
      'لم يتعلم أي أقران حتى الآن — ابق على مقربة منك مع تشغيل BLE';

  @override
  String get topologyYou => 'أنت';

  @override
  String topologyStats(int peers, int links) {
    return '$peers أقران · روابط $links';
  }

  @override
  String get topologyGraphHint =>
      'تم تقديره من خلال اكتشاف الشبكات القريبة — يتم تمييز جهازك. اضغط على أحد الأقران لفتح الدردشة.';

  @override
  String get topologyOpen => 'طوبولوجيا الشبكة';

  @override
  String get slashHelpTitle => 'الأوامر';

  @override
  String get slashHelpBody =>
      '/ مساعدة - هذه القائمة\n/ من — الأشخاص المتصلين بالإنترنت في القناة الحالية\n/drop <text> - قم بتثبيت إشعار مختوم هنا (مروحة E2EE)\n\nالدليل الكامل: استخدم الدليل المفتوح أدناه، أو الإعدادات → دليل المستخدم.';

  @override
  String get slashWhoEmpty => 'لا يوجد أحد متواجد في هذه القناة الآن';

  @override
  String slashWhoTitle(int count) {
    return 'متصل بالإنترنت ($count)';
  }

  @override
  String get slashDropNeedText =>
      'الاستخدام: / قم بإسقاط نص الملاحظة الخاصة بك';

  @override
  String slashDropDone(String channel) {
    return 'تم إسقاط الإشعار على $channel';
  }

  @override
  String get slashUnknown => 'أمر غير معروف - حاول / مساعدة';

  @override
  String get announceOpen => 'إعلانات';

  @override
  String get announceTitle => 'الإعلانات';

  @override
  String get announceEmpty =>
      'لا توجد لوحات حتى الآن — أنشئ واحدة لنشر الإشعارات المقفلة أو المفتوحة';

  @override
  String get announceCreate => 'إنشاء لوحة';

  @override
  String get announceCreateHint => 'اسم المجلس';

  @override
  String get announceDefaultTitle => 'مجلس المجتمع';

  @override
  String get announceSettings => 'إعدادات اللوحة';

  @override
  String get announceAllowLocked => 'السماح بالمشاركات المقفلة (المشفرة).';

  @override
  String get announceAllowLockedSub =>
      'مشفر بمفتاح اللوحة - يحتاج القراء إلى الوصول';

  @override
  String get announceAllowOpen => 'السماح بالمشاركات المفتوحة (النص العادي).';

  @override
  String get announceAllowOpenSub =>
      'ليس E2EE - يمكن قراءته على الشبكة/المرحلات. إيقاف بشكل افتراضي.';

  @override
  String get announceComposeHint => 'أكتب إعلان...';

  @override
  String get announceMediaInternetOnly =>
      'يتم إرسال الإعلانات المصورة/الصوتية عبر الإنترنت (وليس BLE)';

  @override
  String get announceNeedInternet =>
      'اتصل بالإنترنت لإرسال إعلانات الصور أو الصوت';

  @override
  String announceVoiceFailed(String error) {
    return 'تعذر تسجيل الصوت: $error';
  }

  @override
  String get announceImageTooLarge =>
      'الصورة كبيرة جدًا (الحد الأقصى ~180 كيلوبايت)';

  @override
  String get announcePlayVoice => 'تشغيل الملاحظة الصوتية';

  @override
  String get announceImageLabel => '📷 صورة';

  @override
  String get announceAudioLabel => '🎤 ملاحظة صوتية';

  @override
  String get announceModeLocked => 'مغلق';

  @override
  String get announceModeOpen => 'يفتح';

  @override
  String get announceOpenBadge => 'مفتوح · غير مشفر';

  @override
  String get announceLockedBadge => 'مغلق';

  @override
  String get announceLockedPlaceholder => 'مشفرة - طلب الوصول للقراءة';

  @override
  String get announceRequestAccess => 'طلب الوصول';

  @override
  String get announceRequestSent => 'تم إرسال طلب الوصول إلى مالك اللوحة';

  @override
  String get announceRequestFailed =>
      'تعذر طلب الوصول (بحاجة إلى المفتاح العام للمالك)';

  @override
  String get announceOpenConfirmTitle => 'هل تريد النشر بدون تشفير؟';

  @override
  String get announceOpenConfirmBody =>
      'المشاركات المفتوحة ليست E2EE. يمكن لأي شخص على المسار (الشبكة/المرحلات) قراءتها. يكمل؟';

  @override
  String get announcePostAction => 'بريد';

  @override
  String get announcePendingRequests => 'طلبات الوصول';

  @override
  String get announceApprove => 'يعتمد';

  @override
  String get announceDeny => 'ينكر';

  @override
  String get announceGranted => 'يمكنك قراءة المشاركات المقفلة في هذا المنتدى';

  @override
  String get announceOwner => 'أنت تملك هذا المجلس';

  @override
  String get announceCopyInvite => 'انسخ نص الدعوة';

  @override
  String get announceShowInviteQr => 'إظهار دعوة QR';

  @override
  String get announceScanInviteQr => 'مسح لوحة دعوة QR';

  @override
  String get announceFollow => 'متابعة اللوحة من الدعوة';

  @override
  String get announceFollowHint =>
      'الصق نص الدعوة أو الرابط ResilNet من المالك';

  @override
  String get announceFollowOk => 'المجلس التالي';

  @override
  String announceFollowOkNamed(String title) {
    return 'أتابع الآن \"$title\"';
  }

  @override
  String get announceFollowFail => 'الدعوة غير صالحة أو تالفة';

  @override
  String get announceInviteCopied => 'تم نسخ نص الدعوة';

  @override
  String get announceInviteSaveQr => 'حفظ ريال قطري';

  @override
  String get announceInviteShare => 'مشاركة الدعوة';

  @override
  String get announceFollowFromCompose =>
      'تم اكتشاف دعوة مجلس الإدارة في مربع الرسالة';

  @override
  String get peerConfirmAddTitle => 'إضافة عضو في الشبكة؟';

  @override
  String peerConfirmAddBody(String name) {
    return 'هل ترغب في إضافة \"$name\" مع مفتاحهم العام حتى تتمكن من مراسلتهم بشكل خاص؟';
  }

  @override
  String get peerConfirmAdd => 'إضافة عضو';

  @override
  String peerAddedOk(String name) {
    return 'تمت إضافة $name إلى أعضاء الشبكة';
  }

  @override
  String get peerAddFromCompose =>
      'تم اكتشاف الهوية/المفتاح العام في مربع الرسالة';

  @override
  String get peerHashCopied => 'تم نسخ تجزئة المفتاح العام';

  @override
  String get peerHashOpenChat => 'افتح الدردشة';

  @override
  String get peerHashAddHint =>
      'تم نسخ التجزئة. اطلب منهم مشاركة رابط هويتهم أو QR حتى تتمكن من إضافة المفتاح العام الكامل لـ E2EE.';

  @override
  String get peerQrNoCode => 'لم يتم العثور على ResilNet QR في هذه الصورة';

  @override
  String identityInviteSharePreamble(String name) {
    return 'هوية ResilNet: \"$name\"\nافتح الرابط أو الصقه في الدردشة → إضافة عضو\nأو مسح الهوية QR.';
  }

  @override
  String get identityShareInvite => 'مشاركة رابط الهوية';

  @override
  String get identityInviteCopied => 'تم نسخ رابط الهوية';

  @override
  String announceInviteSharePreamble(String title) {
    return 'دعوة مجلس الإدارة: \"$title\"\nافتح ResilNet → لوحات المجتمع → متابعة من الدعوة\nأو قم بمسح QR / اضغط على الرابط أدناه.';
  }

  @override
  String get announceConfirmFollowTitle => 'اتبع هذا المجلس؟';

  @override
  String announceConfirmFollowBody(String title) {
    return 'هل تريد متابعة \"$title\" من هذه الدعوة؟';
  }

  @override
  String get announceConfirmFollow => 'يتبع';
}

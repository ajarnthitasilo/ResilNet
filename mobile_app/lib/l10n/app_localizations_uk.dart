// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'Оновлення ResilNet…';

  @override
  String get appRefreshed => 'Оновлено — радіо та Discovery перезапущено';

  @override
  String appRefreshFailed(String error) {
    return 'Не вдалося оновити: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'Подвійне торкання = м\'яке оновлення. Тривале натискання = сильне відновлення. Потрійне натискання = екстрене стирання.';

  @override
  String get softRefreshTipTitle => 'Якщо ResilNet відчуває, що застряг';

  @override
  String get softRefreshTipBody =>
      'Двічі торкніться ResilNet (верхній лівий кут) для м’якого оновлення радіо. Якщо проблема все ще зависла: натисніть і утримуйте назву, скористайтеся ⋮ → Жорстке відновлення або Налаштування. Потрійне торкання – це лише екстрене стирання.';

  @override
  String get softRefreshTipGotIt => 'зрозумів';

  @override
  String get infoSoftRefreshTitle => 'Якщо програма зависла';

  @override
  String get infoSoftRefreshStepRefresh =>
      'Двічі торкніться ResilNet (верхній лівий кут) → програмне оновлення радіо та людей поблизу';

  @override
  String get infoSoftRefreshStepHard =>
      'Все ще застряг? Утримуйте заголовок або ⋮ / Налаштування → Жорстке відновлення';

  @override
  String get infoSoftRefreshStepWait =>
      'Зачекайте на панелі завантажень результатів, а потім повторіть спробу. Скидання сеансу зберігає ваші ключі.';

  @override
  String get infoSoftRefreshStepWipe =>
      'Потрійне торкання = екстрене стирання (видалення локальних даних) — лише якщо навмисно';

  @override
  String get appRecoverySection => 'Відновлення програми';

  @override
  String get appRecoverySectionSubtitle =>
      'Використовуйте, коли програма зависла. Soft = двічі торкніться заголовка. Важке відновлення сильніше. Скидання сеансу перезапускає служби без стирання ключів.';

  @override
  String get appHardRecoverAction => 'Важко відновитися';

  @override
  String get appHardRecovering => 'Важко відновлюється…';

  @override
  String get appSessionResetAction => 'Скинути сеанс';

  @override
  String get appSessionResetRunning => 'Скидання сеансу…';

  @override
  String get appSessionResetConfirmTitle => 'Скинути сеанс?';

  @override
  String get appSessionResetConfirmBody =>
      'Перезапускає служби ResilNet на цьому пристрої. Ваші ідентифікаційні ключі зберігаються.';

  @override
  String get appRecoveryBusy => 'Відновлення вже запущено…';

  @override
  String get appRecoveryOk => 'Відновлення завершено';

  @override
  String get appRecoveryPartial =>
      'Відновлення завершено, деякі кроки пропущено — спробуйте ще раз, якщо проблема все ще зависла';

  @override
  String get appRecoveryFailed =>
      'Помилка відновлення — спробуйте скинути сеанс або примусово закрийте програму з ОС';

  @override
  String get localWifiTitle => 'Локальний Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'Підключайте пристрої поблизу без Інтернету — це те ж саме, що перебуваєте в одній локальній мережі.';

  @override
  String get localWifiNotGatewayHint =>
      'Не ESP32 LoRa шлюз SoftAP. Це лише телефон↔телефон/LAN.';

  @override
  String get localWifiUnavailable =>
      'Локальний Wi‑Fi ще не готовий — зачекайте на запуск програми.';

  @override
  String get lxmfBridgeTitle => 'Домашній вузол';

  @override
  String get lxmfBridgeSubtitle =>
      'Додатковий Mac або Pi на вашому Wi‑Fi, який передає закриті чати. Вимкнено за замовчуванням. Не замінює наскрізне шифрування.';

  @override
  String get lxmfBridgeEnable => 'Використовуйте домашній вузол';

  @override
  String get lxmfBridgeDisabledHint =>
      'Увімкніть, лише коли програма Bridge запущена на Mac або Pi у цій мережі.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'Онлайн — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'Неможливо зв’язатися з домашнім вузлом — $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'Адреса домашнього вузла';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP або http://IP:порт — приклад 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'Одноранговий → LXMF dest (JSON)';

  @override
  String get lxmfBridgeRefresh => 'Зберегти та оновити статус';

  @override
  String get lxmfBridgeLabHint => 'Додатково: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'Налаштування домашнього вузла';

  @override
  String get lxmfBridgeCheckConnection => 'Перевірити з’ єднання';

  @override
  String get lxmfBridgeStatusOnline => 'Підключено до домашнього вузла';

  @override
  String get lxmfBridgeStatusOffline => 'Домашній вузол недоступний';

  @override
  String get lxmfBridgeYourDest => 'Адреса цього вузла (поділіться з друзями)';

  @override
  String get lxmfBridgeCopyDest => 'Скопіюйте адресу';

  @override
  String get lxmfBridgeDestCopied => 'Адресу скопійовано';

  @override
  String get lxmfBridgeLinkedPeers => 'Пов\'язані друзі';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'Кожному другу потрібна адреса домашнього вузла один раз. Тоді закриті чати можуть використовувати цей шлях.';

  @override
  String get lxmfBridgeNoLinks => 'Друзів ще немає.';

  @override
  String get lxmfBridgeAddLink => 'Посилання друга';

  @override
  String get lxmfBridgePickPeer => 'Друг';

  @override
  String get lxmfBridgePeerDest => 'Адреса їх домашнього вузла';

  @override
  String get lxmfBridgePeerDestHint =>
      '32-символьний код із екрана домашнього вузла';

  @override
  String get lxmfBridgeInvalidDest =>
      'Ця адреса виглядає недійсною. Вставте повний код із домашнього вузла.';

  @override
  String get lxmfBridgeRemoveLink => 'Від’єднати';

  @override
  String get lxmfBridgeSaveLink => 'зберегти';

  @override
  String get lxmfBridgeLinkSaved => 'Друг пов’язаний';

  @override
  String get lxmfBridgeNoPeers =>
      'Поки що немає контактів для надсилання повідомлень — спочатку додайте друга.';

  @override
  String get lxmfBridgeHelp =>
      'Підтримуйте роботу моста на Mac/Pi. Цей шлях залишається у вашій локальній мережі — він не LoRa і не замінює мережу Інтернет чи Bluetooth.';

  @override
  String get localWifiModeHotspot => 'Поруч';

  @override
  String get localWifiModeRouter => 'Маршрутизатор';

  @override
  String get localWifiHotspotIntro =>
      'Один пристрій має спільну особисту точку доступу. Інші приєднуються до цієї точки доступу, а потім ResilNet знаходить їх у локальній мережі.';

  @override
  String get localWifiHostAction => 'Створити мережу (хост)';

  @override
  String get localWifiJoinAction => 'Приєднатися до мережі';

  @override
  String get localWifiHostSteps =>
      '1. Відкрийте налаштування iOS/Android і ввімкніть «Особиста точка доступу» (або «Спільний доступ до Інтернету»).\n2. Повідомте друзям назву (та пароль) точки доступу.\n3. Поверніться сюди та натисніть «Точка доступу увімкнена — почніть очікувати».';

  @override
  String get localWifiHostReady => 'Точка доступу увімкнена — почніть чекати';

  @override
  String get localWifiHostWaiting => 'Чекаю на приєднання друзів…';

  @override
  String get localWifiJoinSteps =>
      '1. Відкрийте налаштування системи та приєднайтеся до особистої точки доступу вашого друга.\n2. Поверніться сюди та натисніть «Я підключений — пошук».';

  @override
  String get localWifiJoinReady => 'Я підключений — пошук';

  @override
  String get localWifiRouterIntro =>
      'Підключіть усі пристрої до одного маршрутизатора/AP Wi‑Fi. Роутеру не потрібен інтернет — тільки спільна локальна мережа.';

  @override
  String get localWifiRouterSearch => 'Шукати на цьому Wi‑Fi';

  @override
  String get localWifiRefreshNetwork => 'Оновити інформацію Wi‑Fi';

  @override
  String get localWifiRouterNoWifiTitle => 'Не на Wi‑Fi';

  @override
  String get localWifiRouterNoWifiBody =>
      'Приєднайтеся до маршрутизатора Wi‑Fi у системних налаштуваннях, а потім повторіть пошук.';

  @override
  String get localWifiDiscovering => 'Пошук на місцевому Wi‑Fi…';

  @override
  String get localWifiPeersFound => 'Пристрої в цій мережі';

  @override
  String get localWifiStop => 'СТІЙ';

  @override
  String get localWifiSsidUnknown => 'Ім\'я Wi‑Fi недоступне';

  @override
  String get localWifiStubBanner => 'Очікування гнізда LAN…';

  @override
  String get localWifiLiveBanner =>
      'Відкриття локальної мережі в реальному часі (UDP) — оголошення + закритий чат на цьому Wi‑Fi';

  @override
  String get localWifiEmptyHotspot =>
      'Пристроїв ще немає.\nПереконайтеся, що друзі приєдналися до вашої точки доступу та дали доступ до локальної мережі.';

  @override
  String get localWifiEmptyRouter =>
      'Пристроїв ще немає.\nТой самий SSID? Локальна мережа дозволена? Деякі маршрутизатори блокують трафік між пристроями (ізоляція AP).';

  @override
  String get localWifiIsolationHelp => 'Чому ми не можемо знайти один одного?';

  @override
  String get localWifiIsolationTitle => 'Маршрутизатор може ізолювати клієнтів';

  @override
  String get localWifiIsolationBody =>
      'Якщо ізоляцію точки доступу/клієнта (або гостьову мережу) увімкнено, телефони на одному Wi‑Fi не можуть спілкуватися. Вимкніть ізоляцію, використовуйте головний SSID або перейдіть у режим поблизу (точка доступу).';

  @override
  String get localWifiPeerReady => 'Готовий до чату (є ключ)';

  @override
  String get localWifiPeerNeedKey =>
      'Знайдено — скануйте QR для обміну ключами';

  @override
  String get localWifiErrorTitle => 'Локальна помилка Wi‑Fi';

  @override
  String get localWifiErrorBody =>
      'Щось пішло не так. Зупиніть і спробуйте ще раз.';

  @override
  String get preparingSystem => 'Підготовка системи…';

  @override
  String get bootFailedTitle => 'Не вдалося запустити';

  @override
  String get retry => 'Спробуйте знову';

  @override
  String get bootRecoveryAction => 'Створити нову особу (стерти локальні дані)';

  @override
  String get bootRecoveryConfirmTitle => 'Створити нову ідентичність?';

  @override
  String get bootRecoveryConfirmBody =>
      'Це назавжди видалить локальні чати, ключі та ідентифікаційні дані на цьому пристрої.\nКолективи повинні ще раз відсканувати ваш QR-код із вашим новим ідентифікатором.\nЦе неможливо скасувати.';

  @override
  String get bootRecoveryRunning => 'Скидання локальної ідентичності…';

  @override
  String get bootRecoverySuccess =>
      'Скидання локальної ідентифікації завершено';

  @override
  String bootRecoveryFailed(String error) {
    return 'Не вдалося скинути ідентифікатор: $error';
  }

  @override
  String get cancel => 'Скасувати';

  @override
  String get save => 'зберегти';

  @override
  String get close => 'Закрити';

  @override
  String get start => 'Почніть';

  @override
  String get send => 'Надіслати';

  @override
  String get settings => 'Налаштування';

  @override
  String get language => 'Мова';

  @override
  String get languageSubtitle =>
      'За замовчуванням програма відповідає мові вашого телефону (якщо підтримується). Інші мови повертаються до англійської. Тут також можна заблокувати мову.';

  @override
  String get languageSystem => 'Система за замовчуванням';

  @override
  String get languageThai => 'тайська';

  @override
  String get languageEnglish => 'англійська';

  @override
  String get notificationsTooltip => 'Налаштування сповіщень';

  @override
  String get enableMessageNotifications =>
      'Увімкнути сповіщення про повідомлення';

  @override
  String get settingsNotificationsSubtitle =>
      'Повідомлення 1:1 і люди онлайн (локальні сповіщення)';

  @override
  String get networkMembersTooltip => 'Учасники мережі';

  @override
  String get identityQrTooltip => 'Ідентичність / QR';

  @override
  String get feedDirects => 'Чат';

  @override
  String get feedMesh => '#сітка';

  @override
  String get feedGeo => 'Площа';

  @override
  String get feedDirectsSubtitle => 'Приватні повідомлення E2EE';

  @override
  String get feedMeshSubtitle => 'Найближчі аналоги (BLE)';

  @override
  String get feedGeoSubtitle => 'Канал виявлення Geohash';

  @override
  String get peerIdHint =>
      'Вставте ідентифікатор отримувача (хеш відкритого ключа), щоб почати чат';

  @override
  String get directsEmpty =>
      'Поки що немає чатів — відскануйте QR або вставте ідентифікатор одержувача, щоб почати\nПовідомлення закриваються E2EE перед надсиланням (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • натисніть, щоб відкрити чат';

  @override
  String get meshIntro =>
      'Однорангові пристрої в діапазоні BLE — торкніться для приватного чату E2EE (без публічного створення на #mesh)\nНадсилає через гібридний маршрутизатор (BLE + LoRa + Nostr у мережі)';

  @override
  String get meshEmptyRunning =>
      'Поблизу ще немає аналогів — відкрийте програму на іншому пристрої в межах BLE';

  @override
  String get meshEmptyStopped =>
      'BLE не запущено — надайте дозвіл Bluetooth/локації';

  @override
  String get meshNearbyPrefix => 'Поруч';

  @override
  String get meshRetentionTitle => 'Автоматичне видалення повідомлень';

  @override
  String get meshRetentionSubtitle =>
      'Старіша історія локального чату видаляється автоматично';

  @override
  String get meshRetentionKeep => 'Тримайте';

  @override
  String get meshRetention1Day => '1 день';

  @override
  String get meshRetention3Days => '3 дні';

  @override
  String get meshRetention7Days => '7 днів';

  @override
  String get refreshLocationTooltip => 'Оновити розташування';

  @override
  String get geoIntro =>
      'Людям, які знаходяться в Інтернеті, у цьому геохеш-коді можна надсилати повідомлення 1:1 або з загальнодоступною зоною розгортання (все ще запечатаний E2EE на однорангового користувача — не відкритий текст)';

  @override
  String geoEmpty(String channel) {
    return 'Ще нікого в мережі в $channel\nВикористовуйте Транспорт → Інтернет/Авто, зачекайте Nostr, оновіть розташування';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'Онлайн через $channel • натисніть для 1:1 E2EE';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'Поруч (присутність зони очікування) • натисніть для 1:1 E2EE';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'Виявлено на Nostr в $channel • лише виявлення (застаріле)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'Застаріла анонімна присутність — зачекайте прив’язаного однорангового користувача або обміняйтеся QR';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE поруч — відскануйте QR, щоб почати E2EE 1:1';

  @override
  String get geoInternetDiscoverHint =>
      'Зона виявлення Інтернету потребує підключення Nostr (Налаштування → Транспорт → Інтернет/Авто)';

  @override
  String get geoEmptyNoLocation =>
      'Місцезнаходження ще не визначено — дозвольте GPS і оновіть, щоб опублікувати геохеш на Nostr';

  @override
  String get geoEmptyNeedsPermission =>
      'У дозволі на місцезнаходження відмовлено — дозвольте ResilNet у Налаштуваннях → Конфіденційність → Розташування';

  @override
  String get geoEmptyServicesDisabled =>
      'Служби локації вимкнено — увімкніть їх у налаштуваннях';

  @override
  String get geoEmptyNoGpsFix =>
      'Не вдалося отримати GPS-фікс (типово на Wi‑Fi iPad) — установіть геохеш вручну нижче';

  @override
  String get geoEmptyTeleportHint =>
      'Торкніться значка місця → введіть геохеш (наприклад, w5) → Телепорт';

  @override
  String get geoSetGeohashManually => 'Встановити геохеш';

  @override
  String get geoTeleportHint =>
      'Немає GPS? Введіть префікс геохеш (2–7 символів, наприклад, w5) і натисніть «Телепорт».';

  @override
  String get geoTeleportInvalid =>
      'Недійсний геохеш — використовуйте лише літери/цифри base32 (наприклад, w5 або w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'Для області встановлено $channel';
  }

  @override
  String geoManualActive(String channel) {
    return 'Зона вручну: $channel (оновлення GPS матиме перевагу)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr не готовий — торкніться Reconnect (0/0, доки ініціалізація не вдасться)';

  @override
  String get geoEmptyMeshOnly =>
      'Транспорт — це лише мережева мережа — перемкніться в Інтернет або Авто, щоб виявити однорангові пристрої понад Nostr';

  @override
  String geoEmptyWaiting(String channel) {
    return 'Ще нікого в $channel — залиште зону + Інтернет відкритою на обох пристроях і зачекайте ~60 с';
  }

  @override
  String get geoChannelFallback => '#область';

  @override
  String get geoRefreshLocation => 'Оновити розташування';

  @override
  String get settingsClearLocationTitle => 'Чітке розташування';

  @override
  String get settingsClearLocationSubtitle =>
      'Видалити геохеш GPS/телепорт (зона стає #—)';

  @override
  String get settingsClearLocationConfirmTitle => 'Очистити місцезнаходження?';

  @override
  String get settingsClearLocationConfirmBody =>
      'Видаляє геохеш, збережений на цьому пристрої. Ви можете оновити GPS або знову телепортуватися пізніше.';

  @override
  String get settingsClearLocationAction => 'Чітке розташування';

  @override
  String get settingsClearLocationSnack => 'Розташування очищено';

  @override
  String get chatVoiceTooLarge =>
      'Голосова нотатка завелика — максимум ~30 секунд';

  @override
  String get chatVoiceNeedInternet =>
      'Голосова нотатка потребує Інтернету (Nostr) — занадто велика для BLE';

  @override
  String get chatVoiceSentInternet =>
      'Голосова нотатка, надіслана через Інтернет';

  @override
  String get noticeAnonMention => 'згадка';

  @override
  String get noticeAnonDm => 'пряме повідомлення';

  @override
  String get noticeAnonHug => 'обійми';

  @override
  String get noticeAnonSlap => 'ляпас';

  @override
  String get noticeAnonBlock => 'блокувати';

  @override
  String get noticeAnonNeedKey =>
      'Ще немає відкритого ключа — спочатку обміняйте QR на 1:1';

  @override
  String get noticeAnonActionSent => 'Надіслано';

  @override
  String noticeAnonBlocked(String anon) {
    return 'Заблоковано $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* обійми $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* ляпас $anon *';
  }

  @override
  String get geoReconnectNostr => 'Повторно підключіться Nostr';

  @override
  String get nostrSectionTitle => 'Nostr реле';

  @override
  String get nostrSectionSubtitle =>
      'Інтернет-повідомлення та визначення зони використовують ці реле. Торкніться повторно підключитися, якщо статус залишається офлайн.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'Підключено $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'Офлайн — реле вказано, але жодне не підключено';

  @override
  String get nostrStatusNotInit =>
      'Не розпочато (0/0) — торкніться Reconnect, щоб ініціалізувати';

  @override
  String get nostrReconnectAction => 'Повторно підключіться Nostr';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr підключено ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'Все ще офлайн — перевірте Wi‑Fi/cellular або повторіть спробу';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'Помилка: $error';
  }

  @override
  String get nostrReconnecting => 'Підключення до реле…';

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return 'Інтернет (Nostr) в $channel • готовий закритий чат';
  }

  @override
  String get transportModeTitle => 'Місцевий транспорт';

  @override
  String get transportModeSubtitle =>
      'Сітка = BLE поруч (радіо), якщо немає Nostr · Інтернет і авто = Nostr список людей';

  @override
  String get transportModeMesh => 'Сітка';

  @override
  String get transportModeInternet => 'Інтернет';

  @override
  String get transportModeAuto => 'Авто';

  @override
  String get geoPublicHint =>
      'Публічне повідомлення для всіх онлайн у цій зоні';

  @override
  String get geoPublicSend => 'Громадський';

  @override
  String geoPublicHelp(int count) {
    return 'Запечатаний фанат до $count онлайн-партнера(ів) — кожен отримує приватний конверт';
  }

  @override
  String geoPublicSent(int count) {
    return 'Надіслано $count одноранговому(-им) у цій області';
  }

  @override
  String get geoPublicSentNone =>
      'Немає однорангових вузлів, доступних для повідомлень, у мережі — відкрийте Area/Mesh з одноранговими вузлами, які мають ключі, або зачекайте BLE/Nostr';

  @override
  String get areaPublicBadge => 'Зона громадська';

  @override
  String get geoErrorPermission =>
      'Не вдалося прочитати місцезнаходження — перевірте дозвіл на місцезнаходження';

  @override
  String get geoPrecisionRegion => 'Регіон';

  @override
  String get geoPrecisionProvince => 'Провінція';

  @override
  String get geoPrecisionCity => 'місто';

  @override
  String get geoPrecisionNeighborhood => 'Околиці';

  @override
  String get geoPrecisionBlock => 'Блокувати';

  @override
  String get aliasTitle => 'Встановити псевдонім (псевдонім контакту)';

  @override
  String get aliasHintBody =>
      'Цей псевдонім зберігається лише на цьому пристрої (лише локально)\nВін ніколи не надсилається з трафіком E2EE';

  @override
  String get aliasLabel => 'псевдонім';

  @override
  String get aliasHint => 'напр. «Сільський голова», «П’Сомчай»…';

  @override
  String get settingsDevices => 'Пристрої';

  @override
  String get settingsFirmwareTitle => 'Завантажити/оновити мікропрограму ESP32';

  @override
  String get settingsFirmwareSubtitle =>
      'Завантажте файли .bin і оновіть плату ESP32 через OTA';

  @override
  String get mtBridgeTitle => 'Meshtastic міст';

  @override
  String get mtBridgeSettingsSubtitle =>
      'Лише текстовий міст A/B — не ResilNet E2EE';

  @override
  String get mtBridgeIntro =>
      'Перемістити короткий відкритий текст між Meshtastic і ResilNet. Режими A і B не можуть працювати одночасно. Це не наскрізне шифрування.';

  @override
  String get mtBridgeModeLabel => 'Режим';

  @override
  String get mtBridgeModeOff => 'Вимкнено';

  @override
  String get mtBridgeModeA => 'Проковтнути А';

  @override
  String get mtBridgeModeB => 'Виїзд Б';

  @override
  String get mtBridgeModeOffShort => 'Вимкнено';

  @override
  String get mtBridgeModeAShort => 'В А';

  @override
  String get mtBridgeModeBShort => 'Вихід Б';

  @override
  String get mtBridgeMutexHint =>
      'Вибір режиму автоматично вимикає інший. Одночасний A+B не підтримується.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'Демо (реєстрація)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'Вхідний текст відображається в розділі «Повідомлення» як #meshtastic. Сітчасте реле є необов’язковим (за умовчанням вимкнено).';

  @override
  String get mtBridgeRelayTitle => 'Також реле на сітці ResilNet';

  @override
  String get mtBridgeRelayHint =>
      'Коли ввімкнено, транслюються підписані публічні бюлетені. Вимкнено = лише повідомлення для цього телефону.';

  @override
  String get mtBridgeSimulateHint => 'Демонстраційне повідомлення';

  @override
  String get mtBridgeSimulate => 'Симулювати повідомлення Meshtastic';

  @override
  String get mtBridgeIngestOk => 'Введено в повідомлення (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'Попередження: повідомлення, надіслані тут, НЕ ResilNet E2EE. Будь-хто на шляху Meshtastic може прочитати їх.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'Текст для публікації';

  @override
  String get mtBridgeSend => 'Надіслати до Meshtastic';

  @override
  String get mtBridgeEgressOk =>
      'У черзі для Meshtastic (перегляньте журнал/історію)';

  @override
  String get mtBridgeLastEgress => 'Останній вихід';

  @override
  String get mtBridgeEgressHistory => 'Недавній вихід';

  @override
  String get mtBridgeOffHint =>
      'Увімкніть Ingest (A) або Egress (B), щоб скористатися мостом.';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTIC · не E2EE';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'Використовуйте транспорт MQTT';

  @override
  String get mtBridgeUseMqttHint =>
      'Вимкнено = лише протоколювання демонстрації (MQTT вхідні ігноруються). Увімк. = MQTT для прийому/виходу під час підключення.';

  @override
  String get mtBridgeMqttHost => 'Хост брокера';

  @override
  String get mtBridgeMqttPort => 'Порт';

  @override
  String get mtBridgeMqttTls => 'Використовуйте TLS (mqtts)';

  @override
  String get mtBridgeMqttTlsHint =>
      'Типовий порт 8883. Використовує системні сертифікати; не працює м’яко при помилках рукостискання.';

  @override
  String get mtBridgeMqttAutoReconnect => 'Автоматичне повторне підключення';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'Коли ввімкнено, клієнт намагається повторно підключитися після розривів. Статус показує Підключення до відновлення.';

  @override
  String get mtBridgeMqttTopicHelpers => 'Тематичні помічники';

  @override
  String get mtBridgeMqttRegion => 'Префікс регіону (необов\'язково)';

  @override
  String get mtBridgeMqttRegionHint =>
      'Якщо встановлено, «Застосувати» перебудовує кореневу папку як msh/<регіон>/2/json (перевизначає корінь теми).';

  @override
  String get mtBridgeMqttTopicRoot => 'Корінь теми JSON';

  @override
  String get mtBridgeMqttDownlinkChannel => 'Назва каналу низхідного каналу';

  @override
  String get mtBridgeMqttApplyTopics =>
      'Застосувати root → підписатися / публікувати теми';

  @override
  String get mtBridgeMqttAdvanced => 'Розширений MQTT';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'TLS, повторне підключення, теми, облікові дані';

  @override
  String get mtBridgeMqttTopicIn => 'Підписатися на тему';

  @override
  String get mtBridgeMqttTopicOut => 'Опублікувати тему';

  @override
  String get mtBridgeMqttGatewayFrom => 'Ідентифікатор вузла шлюзу (від)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'Десятковий ідентифікатор або !hex — необхідний для відправлення тексту вниз';

  @override
  String get mtBridgeMqttChannelIndex =>
      'Індекс каналу сітки (необов \'язково 0–7)';

  @override
  String get mtBridgeMqttUser => 'Ім\'я користувача (необов\'язково)';

  @override
  String get mtBridgeMqttPass => 'Пароль (необов\'язково)';

  @override
  String get mtBridgeMqttPassStored =>
      'На цьому пристрої зберігається пароль (не показано).';

  @override
  String get mtBridgeMqttPassReplace =>
      'Новий пароль (залиште порожнім, щоб зберегти)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'Залиште порожнім, щоб зберегти збережений пароль.';

  @override
  String get mtBridgeMqttPassClear => 'Очистити пароль';

  @override
  String get mtBridgeMqttSave => 'Зберегти налаштування MQTT';

  @override
  String get mtBridgeMqttSaved => 'Налаштування збережено';

  @override
  String get mtBridgeMqttConnect => 'Підключитися';

  @override
  String get mtBridgeMqttDisconnect => 'Відключити';

  @override
  String get mtBridgeMqttConnected => 'MQTT підключено';

  @override
  String get mtBridgeMqttConnecting => 'MQTT підключення…';

  @override
  String get mtBridgeMqttDisconnected => 'Роз\'єднано';

  @override
  String get mtBridgeMqttError => 'MQTT помилка';

  @override
  String get mtBridgeErrModeIngest =>
      'Спочатку перейдіть до режиму «Ковтати» (A).';

  @override
  String get mtBridgeErrModeEgress => 'Спочатку перейдіть на вихід (B).';

  @override
  String get mtBridgeErrRate => 'Уповільнення — швидкість обмежена';

  @override
  String get mtBridgeErrDedupe => 'Дубльоване повідомлення проігноровано';

  @override
  String get mtBridgeErrLoop => 'Впав, щоб запобігти петлі мосту';

  @override
  String get mtBridgeErrEmpty => 'Повідомлення порожнє';

  @override
  String get mtBridgeErrPublish => 'Помилка публікації';

  @override
  String get mtBridgeErrNotConnected => 'MQTT не підключено';

  @override
  String get mtBridgeErrMissingHost => 'Введіть хост брокера MQTT';

  @override
  String get mtBridgeErrMissingTopic => 'Введіть підписку та публікацію тем';

  @override
  String get mtBridgeErrMissingFromNode =>
      'Введіть ідентифікатор вузла шлюзу (від) для надсилання тексту';

  @override
  String get mtBridgeErrConnect => 'Не вдалося підключитися MQTT';

  @override
  String get mtBridgeErrConnectTls => 'MQTT Помилка підключення TLS';

  @override
  String get settingsData => 'Дані';

  @override
  String get settingsDataHint =>
      'Видаліть локальні повідомлення, щоб зменшити базу даних — ідентифікаційні дані, ключі та однорангові пристрої зберігаються';

  @override
  String get settingsSaveHistoryTitle => 'Зберегти історію повідомлень';

  @override
  String get settingsSaveHistorySubtitle =>
      'Якщо вимкнено, повідомлення залишаються E2EE на дроті та зберігаються лише протягом цього сеансу (не в історії локального чату). Ваш власний текст все ще відображається як відкритий текст на цьому пристрої.';

  @override
  String get settingsPrivacy => 'Конфіденційність';

  @override
  String get settingsE2eeTitle => 'Наскрізне шифрування';

  @override
  String get settingsE2eeSubtitle =>
      'Завжди ввімкнено — повідомлення запечатуються RSA-OAEP + AES-GCM перед надсиланням. Реле та сусідні переходи не можуть читати вміст.';

  @override
  String get settingsScreenshotTitle => 'Сповіщення про знімок екрана';

  @override
  String get settingsScreenshotSubtitle =>
      'Показувати системну лінію в чаті, коли цей пристрій знімає екран';

  @override
  String get settingsNostrExpiryTitle => 'Час зберігання повідомлення Nostr';

  @override
  String get settingsNostrExpirySubtitle =>
      'Як довго запечатані конверти повинні зберігатися локально, коли вони онлайн через Nostr';

  @override
  String get noticeExpiresIn => 'закінчується через';

  @override
  String get noticesTitle => 'Повідомлення';

  @override
  String get noticesMeshIntro =>
      'Загальнодоступний бюлетень — видимий для всіх у радіусі дії, не зашифрований. Він перемикається з телефону на телефон в автономному режимі, а сусідні ретрансляційні блоки ResilNet зберігають копію, щоб люди, які приходять пізніше, все одно бачили її.';

  @override
  String get noticesMeshPublicBadge => 'PUBLIC · не зашифровано';

  @override
  String get noticesGeoIntro =>
      'Додайте короткі нотатки для цього місця, щоб інші відвідувачі могли їх знайти.';

  @override
  String get noticesEmpty => 'ще немає повідомлень';

  @override
  String get noticesEmptyHint =>
      'закріпити перше сповіщення для людей навколо.';

  @override
  String get noticesComposeHint => 'опублікувати повідомлення...';

  @override
  String get noticesUrgent => 'терміновий';

  @override
  String get noticesOpen => 'Повідомлення';

  @override
  String get screenshotTaken => '* ти зробив скріншот *';

  @override
  String get chatAttachImage => 'Прикріпити зображення';

  @override
  String get chatImageLabel => 'Зображення';

  @override
  String get chatImageTooLarge => 'Зображення завелике — спробуйте інше фото';

  @override
  String get chatNostrExpiry => 'Nostr зберегти';

  @override
  String geoPublicComposeHint(String channel) {
    return 'Надіслати до $channel — публічно';
  }

  @override
  String get settingsClearTitle => 'Очистити всі повідомлення';

  @override
  String get settingsClearSubtitle => 'Видалити всі чати на цьому пристрої';

  @override
  String get settingsClearConfirmTitle => 'Спорожнити журнал повідомлень.';

  @override
  String get settingsClearConfirmBody =>
      'Буде видалено всі повідомлення чату на цьому пристрої.\nОднолітки та псевдоніми не видаляються.';

  @override
  String get settingsClearAction => 'Очистити дані';

  @override
  String get settingsClearedSnack => 'Дані видалено';

  @override
  String settingsVersion(String version) {
    return 'версія $version';
  }

  @override
  String get meshBleScanning => 'BLE: пошук вузлів';

  @override
  String get meshBleEsp32Scanning => 'ESP32: пошук вузла поблизу';

  @override
  String get meshBleSyncing => 'BLE: синхронізація з ESP32';

  @override
  String get meshNostrPublishing => 'Nostr: публікація';

  @override
  String get meshBleIdle => 'Сітку BLE увімкнено — телефонів поблизу ще немає';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE mesh — $count телефонів поблизу';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: потрібен дозвіл';

  @override
  String get meshBlePausedCamera =>
      'BLE призупинено для камери — натисніть «Пуск» BLE';

  @override
  String get meshBleStopped =>
      'BLE вимкнено — перевірте, чи Bluetooth увімкнено, а потім натисніть «Пуск» BLE';

  @override
  String get meshBleRestart => 'Почніть BLE';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'Перевірте дозволи та запустіть BLE';

  @override
  String get meshNostrOffline => 'Nostr офлайн';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count найближчі однорангові пристрої • LoRa $lora • синхронізація ~${meters}m';
  }

  @override
  String get meshLoraReady => 'готовий';

  @override
  String get meshLoraNotReady => 'не готовий';

  @override
  String meshGatewayProgress(String label) {
    return 'Шлюз UDP: $label';
  }

  @override
  String get meshGatewayReady => 'Шлюз UDP: готовий';

  @override
  String get permissionTitle =>
      'Дозвольте доступ для запуску сітчастої мережі BLE';

  @override
  String get permissionBody =>
      'Додатку потрібен Bluetooth (сканування/підключення/реклама), місцезнаходження (для старіших пристроїв Android) і мікрофон (для голосових нотаток у чаті та оголошень) для обміну повідомленнями спільноти.';

  @override
  String get permissionE2ee =>
      'Наскрізне шифрування (E2EE)\nВузли ретрансляції не можуть читати вміст повідомлення';

  @override
  String get permissionReady => 'Дозволи готові';

  @override
  String get permissionRequest => 'Дозволити та продовжити';

  @override
  String get permissionNotReadySnack =>
      'Система ще не готова — зачекайте хвилинку та повторіть спробу';

  @override
  String get permissionDeniedSnack =>
      'Немає дозволів — відкрийте «Налаштування» > ResilNet і дозвольте Bluetooth / Місцезнаходження / Мікрофон';

  @override
  String get permissionMicDenied =>
      'Доступ до мікрофона заборонено — дозвольте йому в налаштуваннях записувати голосові нотатки';

  @override
  String get permissionMicOpenSettings => 'Налаштування';

  @override
  String get permissionCameraDenied =>
      'Доступ до камери заборонено — дозвольте сканувати QR-коди в налаштуваннях';

  @override
  String get permissionCameraFailed =>
      'Для сканування QR-кодів потрібен дозвіл камери';

  @override
  String get permissionCameraOpenSettings => 'Налаштування';

  @override
  String get permissionPhotosDenied =>
      'Доступ до бібліотеки фотографій заборонено — дозвольте в налаштуваннях, щоб зберегти ваш QR-код';

  @override
  String get permissionPhotosFailed =>
      'Щоб зберегти ваш QR-код, потрібен дозвіл бібліотеки фотографій';

  @override
  String get permissionPhotosOpenSettings => 'Налаштування';

  @override
  String permissionFailedSnack(String error) {
    return 'Не вдалося отримати дозвіл: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet Архітектура • Store-and-Forward Multi-hop';

  @override
  String get onboardingSkip => 'Пропустити';

  @override
  String get onboardingNext => 'Далі';

  @override
  String get onboardingStart => 'Почніть роботу';

  @override
  String get onboardingWelcomeTitle => 'Ласкаво просимо до ResilNet';

  @override
  String get onboardingWelcomeBody =>
      'Спілкуйтеся в чаті на ResilNet через сітчасту мережу — навіть без Інтернету';

  @override
  String get onboardingFriendsTitle => 'Легко додавайте друзів';

  @override
  String get onboardingFriendsBody =>
      'Поділіться QR із Identity або відскануйте QR друга, щоб обмінятися відкритими ключами';

  @override
  String get onboardingChannelsTitle => 'Зашифрований чат + найближчі канали';

  @override
  String get onboardingChannelsBody =>
      'Перемикайте #mesh / Area (geohash), щоб знайти найближчі однорангові пристрої — повідомлення залишаються E2EE через BLE mesh і Nostr';

  @override
  String get chatTitle => 'Чат (E2EE)';

  @override
  String get chatScanTooltip => 'Відскануйте QR, щоб додати партнера';

  @override
  String get chatBlockTooltip => 'Заблокувати цього відправника';

  @override
  String get chatBlockedSnack =>
      'Заблоковано: немає сповіщень / немає ретрансляції';

  @override
  String get chatAliasTooltip => 'Встановити псевдонім';

  @override
  String get chatReceiverPemLabel => 'Відкритий ключ одержувача (PEM)';

  @override
  String get chatReceiverPemHint =>
      'Вставте відкритий ключ вашого друга (з QR/спільного файлу)';

  @override
  String get chatNeedPeerKey =>
      'Спершу відскануйте QR цього вузла (потрібен підтверджений відкритий ключ)';

  @override
  String get chatPeerKeyMismatch =>
      'Збережений відкритий ключ не відповідає цьому ідентифікатору вузла';

  @override
  String chatVoiceFailed(String error) {
    return 'Не вдалося записати звук: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'Не вдалося відтворити голосову нотатку: $error';
  }

  @override
  String get chatPlayVoice => 'Відтворити голосову нотатку';

  @override
  String get chatPauseVoice => 'Пауза';

  @override
  String get chatVoiceLabelSent => '🎤 Голосова нотатка (запечатана)';

  @override
  String get chatVoiceLabel => '🎤 Голосова нотатка';

  @override
  String get chatDecryptFailed => '[не вдалося розшифрувати]';

  @override
  String chatSentSealed(String preview) {
    return '[запечатано • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[запечатано]';

  @override
  String get chatComposeHint =>
      'Введіть повідомлення… (запечатано під час надсилання)';

  @override
  String get chatEmptyThread =>
      'Повідомлень ще немає\nВведіть нижче, щоб надіслати сіть';

  @override
  String chatLoadFailed(String error) {
    return 'Не вдалося завантажити бесіду: $error';
  }

  @override
  String get chatEmojiTooltip => 'Emoji';

  @override
  String get statusPending => 'В очікуванні';

  @override
  String get statusSent => 'Надіслано';

  @override
  String get statusRelayed => 'Естафетний';

  @override
  String get statusDelivered => 'Доставлено';

  @override
  String get statusRead => 'Прочитайте';

  @override
  String get statusFailed => 'Не вдалося';

  @override
  String get chatCopy => 'Копія';

  @override
  String get chatDeleteLocal => 'Видалити на цьому пристрої';

  @override
  String get chatDeletedLocalSnack => 'Видалено на цьому пристрої';

  @override
  String get chatRetry => 'Повторіть спробу';

  @override
  String get chatSendFailed => 'Не доставлено — натисніть Повторити';

  @override
  String get chatImageNeedInternet =>
      'Щоб надіслати зображення, підключіться до Інтернету';

  @override
  String get chatImageTooLargeOnline =>
      'Не вдалося стиснути зображення достатньо для надсилання';

  @override
  String get chatOpenLinkFailed => 'Не вдалося відкрити посилання';

  @override
  String get identityTitle => 'Ідентичність';

  @override
  String get identityScanTooltip => 'Скануйте QR камерою';

  @override
  String get identityCopiedHash => 'Хеш відкритого ключа скопійовано';

  @override
  String get identityPeerSaved => 'Пір збережено з QR';

  @override
  String get identityGalleryDenied =>
      'Відмовлено в дозволі бібліотеки фотографій';

  @override
  String get identityQrSaved => 'QR збережено в бібліотеці фотографій';

  @override
  String identityQrSaveFailed(String error) {
    return 'Не вдалося зберегти QR: $error';
  }

  @override
  String get peersTitle => 'Учасники мережі';

  @override
  String get qrScanTitle => 'Відскануйте QR, щоб додати друга';

  @override
  String get qrInvalid => 'Помилка сканування: недійсний QR-код';

  @override
  String get qrIdKeyMismatch =>
      'QR відхилено: ідентифікатор не відповідає відкритому ключу';

  @override
  String get qrCameraNotReady => 'Камера не готова';

  @override
  String get qrRetrySettings => 'Повторіть спробу / відкрийте налаштування';

  @override
  String qrCameraOpenFailed(String error) {
    return 'Не вдалося відкрити камеру: $error';
  }

  @override
  String get qrScanAlignHint => 'Вирівняйте QR-код у рамці';

  @override
  String get firmwareDownloadTitle => 'Завантажити мікропрограму ESP32';

  @override
  String get firmwareSourceOnline => 'Останні (онлайн)';

  @override
  String get firmwareSourceCached => 'Збережена копія (офлайн)';

  @override
  String get firmwareSourceBaseline => 'Базовий пакет (офлайн)';

  @override
  String get firmwareSourceUnavailable => 'Прошивка недоступна';

  @override
  String get firmwareBaselineIncompatible =>
      'Мікропрограмне забезпечення в комплекті застаріле — підключіться до Інтернету, щоб завантажити новішу версію';

  @override
  String get firmwareChecksumFailed =>
      'Прошивка не перевірила цілісність — миготіння заблоковано';

  @override
  String firmwareReadyFromSource(String source) {
    return 'Прошивка готова: $source';
  }

  @override
  String get peersRefreshTooltip => 'Оновити';

  @override
  String get peersBlocked => 'заблоковано';

  @override
  String get peersNearbyBle => 'Поруч (BLE)';

  @override
  String get peersRecentlyOnline => 'Нещодавно онлайн';

  @override
  String get peersOnlineInArea => 'Онлайн в області';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return 'Було $minutes хв тому';
  }

  @override
  String get peersOffline => 'Особисто';

  @override
  String peersBlockedSnack(String id) {
    return 'Заблоковано $id';
  }

  @override
  String get peersUnblockedSnack => 'Розблоковано';

  @override
  String get peersEmpty =>
      'У базі даних ще немає учасників\nВідскануйте QR або зачекайте на виявлення сітки BLE';

  @override
  String get peersOpenChat => 'Відкрити чат';

  @override
  String get peersBlockAction => 'Блокувати';

  @override
  String get peersUnblockAction => 'Розблокувати';

  @override
  String get channelPickerTooltip => 'Чат / #mesh / Площа';

  @override
  String get locationPickerTooltip => 'Канал розташування';

  @override
  String get transportPickerTooltip => 'Сітка / Інтернет / Авто';

  @override
  String get onlinePeopleTooltip => 'Люди онлайн';

  @override
  String get unreadDirectsTooltipEmpty => 'Приватні повідомлення';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count непрочитаних особистих повідомлень';
  }

  @override
  String get onlinePeopleTitle => 'людей';

  @override
  String get onlinePeopleEmpty => 'Тут ще нікого в мережі';

  @override
  String onlinePeopleCount(int count) {
    return '$count онлайн';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · поблизу + площа';

  @override
  String get peerOnlineMeshTitle => 'Хтось поруч на сітці';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name знаходиться поруч на сітці';
  }

  @override
  String get peerOnlineAreaTitle => 'Хтось онлайн в цьому районі';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name онлайн через Nostr';
  }

  @override
  String get locationSheetTitle => '#локаційні канали';

  @override
  String get channelPinsTitle => 'Закріплено';

  @override
  String get channelPinsHint =>
      'Закріпіть канали, якими ви часто користуєтеся — вони залишаються вгорі';

  @override
  String get channelPinTooltip => 'Закріпити цей канал';

  @override
  String get channelUnpinTooltip => 'Відкріпити';

  @override
  String get locationSheetIntro =>
      'Спілкуйтеся з людьми поблизу, використовуючи грубий геохеш — не точний GPS. Присутність в Інтернеті використовує анонімні ключі Nostr.';

  @override
  String get locationMeshSubtitle => '#bluetooth • ~10–50 м';

  @override
  String get locationTeleportHint => '#геохеш';

  @override
  String get locationTeleport => 'Телепорт';

  @override
  String homeComposeHint(String channel) {
    return 'Повідомлення $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return 'Надіслати до $channel — публічно';
  }

  @override
  String get messageExpiryTitle => 'закінчується через';

  @override
  String get voiceRecordTapToStart =>
      'Натисніть, щоб записати голосове повідомлення';

  @override
  String get voiceRecordTooShort => 'Запис надто короткий — повторіть спробу';

  @override
  String get voiceRecordFailed =>
      'Не вдалося зберегти запис — повторіть спробу';

  @override
  String get voicePttHold => 'Утримуйте для запису';

  @override
  String get voicePttRelease => 'Відпустіть для попереднього перегляду';

  @override
  String get voicePttRecording => 'Запис...';

  @override
  String get voicePttDraftReady => 'Голосова нотатка готова';

  @override
  String get voicePttDiscard => 'Відкинути';

  @override
  String get voicePttReRecord => 'Запис знову';

  @override
  String get voicePttSend => 'Надіслати голосову нотатку';

  @override
  String get voicePttPlayPreview => 'Відтворити попередній перегляд';

  @override
  String get voicePttStopPreview => 'Зупинити попередній перегляд';

  @override
  String get noticesBackfilling => 'Завантаження повідомлень…';

  @override
  String get noticesNostrOnline => 'Nostr онлайн';

  @override
  String get noticesNostrOffline =>
      'Nostr офлайн — для бюлетеня потрібен Інтернет';

  @override
  String noticesBackfillLoaded(int count) {
    return 'Завантажено сповіщення $count';
  }

  @override
  String get noticePublishFailed =>
      'Не вдалося опублікувати сповіщення на панелі області. Перевірте Nostr з \'єднання.';

  @override
  String get noticeMeshPublishNoLink =>
      'Збережено локально. Підключіться до сусіднього мережевого радіо (або шлюзу Wi‑Fi), щоб інші могли приймати його.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'Бюлетень надіслано на $count пристрої поблизу через BLE.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'Побачено радіостанції поблизу, але BLE не вдалося записати. Залиште обидві програми відкритими на екрані повідомлень і повторіть спробу (або скористайтеся реле ESP32).';

  @override
  String get noticeMeshPublishNoGatt =>
      'Приймач BLE цього пристрою не готовий. Увімкніть Bluetooth і знову відкрийте сповіщення.';

  @override
  String get noticeDelete => 'Видалити повідомлення';

  @override
  String get noticeDeleteConfirmTitle => 'Видалити це повідомлення?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'Це видаляє його лише на цьому пристрої. Інші, хто вже отримав його, все одно побачать його.';

  @override
  String get noticeDeleted => 'Повідомлення видалено';

  @override
  String get chatNoticeHidden =>
      'Повідомлення про зону — відкрити повідомлення';

  @override
  String get identityDisplayNameTitle => 'Відображуване ім\'я';

  @override
  String get identitySaveName => 'Зберегти назву';

  @override
  String get identityUserIdLabel =>
      'Ідентифікатор користувача (хеш відкритого ключа)';

  @override
  String get identityCopyHashTooltip => 'Копіювати хеш відкритого ключа';

  @override
  String get identityMyQrTitle => 'Мій QR (id + pubKey + ім\'я)';

  @override
  String identityQrFailed(String error) {
    return 'Не вдалося створити QR\n$error';
  }

  @override
  String get identitySaving => 'Збереження…';

  @override
  String get identitySaveQr => 'Збережіть QR у бібліотеці фотографій';

  @override
  String get identityOpenScanner => 'Відкрийте камеру, щоб сканувати QR';

  @override
  String get identityQrHelp =>
      'Попросіть друга відсканувати це, щоб зберегти ваш відкритий ключ і (за потреби) встановити вас як перевіреного емітента';

  @override
  String get identityChatTip =>
      'Порада: ви також можете відсканувати QR у чаті, щоб додати відкритий ключ для E2EE';

  @override
  String get infoOpen => 'Про / Інформація';

  @override
  String get docsGuideTitle => 'Посібник користувача';

  @override
  String get docsGuideSubtitle => 'Відкривається в браузері';

  @override
  String get docsOpenAction => 'Відкрити посібник';

  @override
  String get docsOpenFailed => 'Не вдалося відкрити посібник користувача';

  @override
  String get firmwareOtaGuideTitle => 'Flash guide & OTA протокол';

  @override
  String get firmwareOtaGuideSubtitle =>
      'Відкриває веб-довідник — завантаження .bin і повні кроки';

  @override
  String get firmwareWebDownloadsTitle => 'Завантаження прошивки в Інтернеті';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'Посилання на версії та контрольні суми на сайті документів';

  @override
  String get inviteCopyShortLink => 'Копіювати коротке посилання';

  @override
  String get inviteShareLink => 'Поділитися посиланням';

  @override
  String get inviteShowFullLink => 'Повне посилання';

  @override
  String get inviteCopyFullLink => 'Скопіюйте повне посилання';

  @override
  String get inviteLinkCopied => 'Посилання скопійовано';

  @override
  String get inviteLongPressHint => 'Тривале натискання для дій за посиланням';

  @override
  String get inviteSendInChat => 'Надіслати в ResilNet чат…';

  @override
  String get inviteSendInChatHint =>
      'Лише люди, для яких у вас уже є відкритий ключ';

  @override
  String get inviteSendInChatEmpty =>
      'Поки що немає чатів для повідомлень.\nСпершу відскануйте QR-код, відкрийте Area/Mesh або поділіться посиланням за межами програми.';

  @override
  String get inviteSentToChat => 'Запрошення надіслано в чаті';

  @override
  String get infoTabInfo => 'Інформація';

  @override
  String get infoTabSettingsHint =>
      'Відкрийте «Параметри» в меню інструментів мови, E2EE та даних';

  @override
  String get infoHowToTitle => 'Як використовувати';

  @override
  String get infoHowToBody =>
      '• Торкніться значка каналу, щоб переключити чат / #mesh / область\n• Торкніться місця, щоб вибрати розмір геохеш\n• Торкніться людей для учасників або хто в мережі\n• Відкрийте Identity/QR у ⋮, щоб обміняти ключі особисто\n• Зона «загальнодоступна» надсилає запечатаний E2EE кожному одноранговому вузлу в мережі — не кімнаті відкритого тексту';

  @override
  String get infoFeaturesTitle => 'особливості';

  @override
  String get infoFeatureOffline =>
      'Офлайн-повідомлення через Bluetooth Low Energy';

  @override
  String get infoFeatureE2ee =>
      'Наскрізне шифрування з RSA-OAEP + AES-GCM (без шуму)';

  @override
  String get infoFeatureMultihop =>
      'Повідомлення можуть переходити через сусідні вузли, щоб відправлятися далі';

  @override
  String get infoFeatureBridge =>
      'Гібридна сітка ↔ Інтернет (Nostr) для запечатаних конвертів';

  @override
  String get infoFeatureGeo =>
      'Локальні геохеш-канали для людей поблизу (discovery UX)';

  @override
  String get infoFeatureNotices =>
      'Повідомлення з терміном дії для #mesh і Area';

  @override
  String get infoPrivacyTitle => 'Конфіденційність';

  @override
  String get infoPrivacyNoRoom =>
      'Немає відкритого тексту села/публічного чату на дроті';

  @override
  String get infoPrivacyFanout =>
      'Надсилання зони = запечатане розгалуження 1:1 до однорангових пристроїв із відомими відкритими ключами';

  @override
  String get infoPrivacyPresence =>
      'Присутність в Інтернет-зоні використовує тимчасові ключі Nostr';

  @override
  String get infoSymbolsTitle => 'Символи';

  @override
  String get infoSymBle => 'Пряме з\'єднання Bluetooth';

  @override
  String get infoSymMesh => 'Доступно через сітку (інші вперед)';

  @override
  String get infoSymInternet => 'Через Інтернет (Nostr) — запечатані конверти';

  @override
  String get infoSymBridge => 'Прибув через↔ мережевий інтернет-міст PATH';

  @override
  String get infoSymOffline => 'Офлайн — зараз недоступний';

  @override
  String get infoSymInArea => 'У зоні цього каналу розташування';

  @override
  String get infoSymE2eeOk => 'Сеанс із наскрізним шифруванням';

  @override
  String get infoSymE2eeFail =>
      'Шифрування недоступне — не надсилайте конфіденційний текст';

  @override
  String get infoSymVerified => 'Ідентичність підтверджена / відомий ключ';

  @override
  String get infoSymBlocked => 'заблоковано';

  @override
  String get infoSymUnread => 'Непрочитане приватне повідомлення';

  @override
  String get infoEmergencyTitle => 'Аварійний режим';

  @override
  String get infoEmergencyBody =>
      'Тричі торкніться заголовка ResilNet на головному екрані, щоб стерти повідомлення, ключі та дані на цьому пристрої.';

  @override
  String get infoLegendNote =>
      'Деякі піктограми шляху задокументовані тут для ясності; галочки доставки в чаті залишаються основним статусом надсилання.';

  @override
  String get dangerZoneTitle => 'НЕБЕЗПЕЧНА ЗОНА';

  @override
  String get dangerZoneSubtitle =>
      'Видаляє повідомлення, ключі шифрування, ідентифікаційні дані Nostr, однорангові пристрої та псевдоніми на цьому пристрої. Ви налаштуєте знову.';

  @override
  String get panicWipeTitle => 'Екстрене протирання';

  @override
  String get panicWipeSubtitle =>
      'Видалити все локальне — так само, як тричі торкнутися заголовка будинку (подвійне торкання оновить радіо)';

  @override
  String get panicWipeConfirmTitle => 'Видалити всі локальні дані?';

  @override
  String get panicWipeConfirmBody =>
      'Це назавжди видаляє чати, ключі та ідентифікаційні дані на цьому телефоні.\nРівні мають повторно обмінятися QR-ключами з вашим новим ідентифікатором.\nЦе неможливо скасувати.';

  @override
  String get panicWipeAction => 'Витріть все';

  @override
  String get panicWipeSnack =>
      'Локальну ідентифікацію видалено — налаштуйте знову';

  @override
  String panicWipeFailed(String error) {
    return 'Не вдалося стерти: $error';
  }

  @override
  String get meshBridgeTitle => 'Сітчастий міст';

  @override
  String get meshBridgeSubtitle =>
      'Якщо ввімкнено (за замовчуванням), запечатані конверти можуть використовувати сітчасту мережу BLE та Інтернет (Nostr) разом, щоб сусідні острови сітчастої мережі могли підключатися. Коли вимкнено, надсилання використовує лише один шлях — ніколи не розміщує відкритий текст у дроті.';

  @override
  String get favoritesTitle => 'Вибране';

  @override
  String get favoritesAdd => 'Додати в обране';

  @override
  String get favoritesRemove => 'Видалити з вибраного';

  @override
  String get favoritesEmpty =>
      'Ще немає вибраних — позначте партнера зі списку учасників';

  @override
  String get favoritesNearbyTitle => 'Улюблене поруч';

  @override
  String favoritesNearbyBody(String name) {
    return '$name знаходиться поруч на сітці';
  }

  @override
  String get favoritesInAreaTitle => 'Улюблений в районі';

  @override
  String favoritesInAreaBody(String name) {
    return '$name онлайн у цій зоні';
  }

  @override
  String get topologyTitle => 'Сітчаста топологія';

  @override
  String get topologySubtitle =>
      'Однорангові підказки та підказки щодо з’єднання з оголошення сітки (лише для читання)';

  @override
  String get topologyConnectedNow => 'Зараз підключено (BLE)';

  @override
  String get topologyNearby => 'Поруч (BLE)';

  @override
  String get topologyKnown => 'Відомі однолітки';

  @override
  String get topologyEmpty =>
      'Ще немає аналогів — залишайтеся поруч із увімкненим BLE';

  @override
  String get topologyYou => 'ти';

  @override
  String topologyStats(int peers, int links) {
    return '$peers партнери · $links посилання';
  }

  @override
  String get topologyGraphHint =>
      'Розраховано на основі виявлення сітки поблизу — ваш пристрій виділено. Торкніться партнера, щоб відкрити чат.';

  @override
  String get topologyOpen => 'Сітчаста топологія';

  @override
  String get slashHelpTitle => 'Команди';

  @override
  String get slashHelpBody =>
      '/help — цей список\n/who — люди онлайн на поточному каналі\n/drop <текст> — закріпити тут запечатане повідомлення (розгортання E2EE)\n\nПовний посібник: скористайтеся Відкритим посібником нижче або Параметри → Посібник користувача.';

  @override
  String get slashWhoEmpty => 'На цьому каналі зараз нікого в мережі';

  @override
  String slashWhoTitle(int count) {
    return 'Онлайн ($count)';
  }

  @override
  String get slashDropNeedText => 'Використання: /скиньте текст примітки';

  @override
  String slashDropDone(String channel) {
    return 'Відкинуто сповіщення про $channel';
  }

  @override
  String get slashUnknown => 'Невідома команда — try /help';

  @override
  String get announceOpen => 'Оголошення';

  @override
  String get announceTitle => 'Оголошення';

  @override
  String get announceEmpty =>
      'Ще немає дошок — створіть одну, щоб публікувати закриті або відкриті повідомлення';

  @override
  String get announceCreate => 'Створити дошку';

  @override
  String get announceCreateHint => 'Назва дошки';

  @override
  String get announceDefaultTitle => 'Громадська рада';

  @override
  String get announceSettings => 'Налаштування дошки';

  @override
  String get announceAllowLocked =>
      'Дозволити заблоковані (зашифровані) публікації';

  @override
  String get announceAllowLockedSub =>
      'Зашифровано до ключа плати — читачам потрібен доступ';

  @override
  String get announceAllowOpen => 'Дозволити відкриті (відкриті) повідомлення';

  @override
  String get announceAllowOpenSub =>
      'Не E2EE — читається на сітці/реле. Вимкнено за замовчуванням.';

  @override
  String get announceComposeHint => 'Написати оголошення…';

  @override
  String get announceMediaInternetOnly =>
      'Фото/голосові оголошення надсилаються через Інтернет (не BLE)';

  @override
  String get announceNeedInternet =>
      'Підключіться до Інтернету, щоб надсилати фото чи голосові оголошення';

  @override
  String announceVoiceFailed(String error) {
    return 'Не вдалося записати голос: $error';
  }

  @override
  String get announceImageTooLarge => 'Зображення завелике (макс. ~180 КБ)';

  @override
  String get announcePlayVoice => 'Відтворити голосову нотатку';

  @override
  String get announceImageLabel => '📷 Зображення';

  @override
  String get announceAudioLabel => '🎤 Голосова нотатка';

  @override
  String get announceModeLocked => 'Заблоковано';

  @override
  String get announceModeOpen => 'ВІДЧИНЕНО';

  @override
  String get announceOpenBadge => 'ВІДКРИТО · не зашифровано';

  @override
  String get announceLockedBadge => 'Заблоковано';

  @override
  String get announceLockedPlaceholder =>
      'Зашифровано — запит на доступ для читання';

  @override
  String get announceRequestAccess => 'Запит на доступ';

  @override
  String get announceRequestSent => 'Запит на доступ надіслано власнику дошки';

  @override
  String get announceRequestFailed =>
      'Не вдалося надіслати запит на доступ (потрібен відкритий ключ власника)';

  @override
  String get announceOpenConfirmTitle => 'Опублікувати без шифрування?';

  @override
  String get announceOpenConfirmBody =>
      'Відкриті дописи не є E2EE. Будь-хто на шляху (сітка / реле) може прочитати їх. Продовжити?';

  @override
  String get announcePostAction => 'Опублікувати';

  @override
  String get announcePendingRequests => 'Запити на доступ';

  @override
  String get announceApprove => 'Затвердити';

  @override
  String get announceDeny => 'Заперечувати';

  @override
  String get announceGranted =>
      'Ви можете читати закриті повідомлення на цій дошці';

  @override
  String get announceOwner => 'Ви володієте цією дошкою';

  @override
  String get announceCopyInvite => 'Скопіюйте текст запрошення';

  @override
  String get announceShowInviteQr => 'Показати QR запрошення';

  @override
  String get announceScanInviteQr => 'Сканування дошки запрошення QR';

  @override
  String get announceFollow => 'Слідкуйте за дошкою з запрошення';

  @override
  String get announceFollowHint =>
      'Вставте текст запрошення або посилання ResilNet від власника';

  @override
  String get announceFollowOk => 'Наступна дошка';

  @override
  String announceFollowOkNamed(String title) {
    return 'Тепер стежить за “$title”';
  }

  @override
  String get announceFollowFail => 'Запрошення недійсне або пошкоджене';

  @override
  String get announceInviteCopied => 'Текст запрошення скопійовано';

  @override
  String get announceInviteSaveQr => 'Зберегти QR';

  @override
  String get announceInviteShare => 'Поділіться запрошенням';

  @override
  String get announceFollowFromCompose =>
      'У вікні повідомлення виявлено запрошення на форум';

  @override
  String get peerConfirmAddTitle => 'Додати учасника мережі?';

  @override
  String peerConfirmAddBody(String name) {
    return 'Додати «$name» з їхнім відкритим ключем, щоб ви могли надсилати їм приватні повідомлення?';
  }

  @override
  String get peerConfirmAdd => 'Додати учасника';

  @override
  String peerAddedOk(String name) {
    return 'Додано $name до учасників мережі';
  }

  @override
  String get peerAddFromCompose =>
      'Ідентифікація/відкритий ключ виявлено у вікні повідомлення';

  @override
  String get peerHashCopied => 'Хеш відкритого ключа скопійовано';

  @override
  String get peerHashOpenChat => 'Відкрити чат';

  @override
  String get peerHashAddHint =>
      'Хеш скопійовано. Попросіть їх поділитися своїм ідентифікаційним посиланням або QR, щоб ви могли додати повний відкритий ключ для E2EE.';

  @override
  String get peerQrNoCode => 'На цьому зображенні не знайдено ResilNet QR';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet ідентифікатор: “$name”\nВідкрийте посилання або вставте його в чат → Додати учасника\nАбо відскануйте ідентифікатор QR.';
  }

  @override
  String get identityShareInvite => 'Поділіться посиланням на ідентифікатор';

  @override
  String get identityInviteCopied => 'Посилання на ідентифікатор скопійовано';

  @override
  String announceInviteSharePreamble(String title) {
    return 'Запрошення до ради: “$title”\nВідкрийте ResilNet → Дошки спільноти → Підпишіться за запрошенням\nАбо відскануйте QR / торкніться посилання нижче.';
  }

  @override
  String get announceConfirmFollowTitle => 'Слідкувати за цією дошкою?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'Стежити за «$title» із цього запрошення?';
  }

  @override
  String get announceConfirmFollow => 'Слідуйте';
}

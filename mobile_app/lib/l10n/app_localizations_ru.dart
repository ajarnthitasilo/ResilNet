// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'Обновление ResilNet…';

  @override
  String get appRefreshed => 'Обновлено — радио и обнаружение перезапущены.';

  @override
  String appRefreshFailed(String error) {
    return 'Не удалось обновить: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'Двойное касание = мягкое обновление. Длительное нажатие = жесткое восстановление. Тройное нажатие = экстренное удаление.';

  @override
  String get softRefreshTipTitle => 'Если ResilNet чувствует себя застрявшим';

  @override
  String get softRefreshTipBody =>
      'Дважды коснитесь ResilNet (вверху слева) для мягкого обновления радио. Если все еще зависло: нажмите и удерживайте заголовок, используйте ⋮ → Hard Recovery или Настройки. Тройное касание предназначено только для экстренной очистки.';

  @override
  String get softRefreshTipGotIt => 'Понятно';

  @override
  String get infoSoftRefreshTitle => 'Если приложение кажется зависшим';

  @override
  String get infoSoftRefreshStepRefresh =>
      'Дважды коснитесь ResilNet (вверху слева) → мягкое обновление радиостанций и людей поблизости.';

  @override
  String get infoSoftRefreshStepHard =>
      'Все еще застрял? Длительное нажатие на заголовок или ⋮ / Настройки → Жесткое восстановление.';

  @override
  String get infoSoftRefreshStepWait =>
      'Подождите, пока появится результат, затем повторите попытку. При сбросе сеанса ваши ключи сохраняются.';

  @override
  String get infoSoftRefreshStepWipe =>
      'Тройное касание = экстренная очистка (удаляет локальные данные) — только если намеренно';

  @override
  String get appRecoverySection => 'Восстановление приложения';

  @override
  String get appRecoverySectionSubtitle =>
      'Используйте, когда приложение зависло. Soft = двойное нажатие на заголовок. Жесткое восстановление сильнее. Сброс сеанса перезапускает службы без очистки ключей.';

  @override
  String get appHardRecoverAction => 'Трудное восстановление';

  @override
  String get appHardRecovering => 'Тяжело восстанавливаться…';

  @override
  String get appSessionResetAction => 'Сбросить сеанс';

  @override
  String get appSessionResetRunning => 'Сброс сеанса…';

  @override
  String get appSessionResetConfirmTitle => 'Сбросить сеанс?';

  @override
  String get appSessionResetConfirmBody =>
      'Перезапускает службы ResilNet на этом устройстве. Ваши идентификационные ключи сохранены.';

  @override
  String get appRecoveryBusy => 'Восстановление уже запущено…';

  @override
  String get appRecoveryOk => 'Восстановление завершено';

  @override
  String get appRecoveryPartial =>
      'Восстановление завершено, некоторые шаги пропущены. Если проблема не решена, попробуйте еще раз.';

  @override
  String get appRecoveryFailed =>
      'Восстановление не удалось — попробуйте сбросить сеанс или принудительно закрыть приложение из ОС.';

  @override
  String get localWifiTitle => 'Локальный Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'Подключите близлежащие устройства без Интернета — то же самое, что и в одной локальной сети.';

  @override
  String get localWifiNotGatewayHint =>
      'Не шлюз ESP32 LoRa SoftAP. Это только телефон↔телефон/LAN.';

  @override
  String get localWifiUnavailable =>
      'Локальный Wi‑Fi еще не готов — дождитесь запуска приложения.';

  @override
  String get lxmfBridgeTitle => 'Домашний узел';

  @override
  String get lxmfBridgeSubtitle =>
      'Дополнительный Mac или Pi на вашем Wi‑Fi, который передает запечатанные чаты. По умолчанию выключено. Не заменяет сквозное шифрование.';

  @override
  String get lxmfBridgeEnable => 'Использовать домашний узел';

  @override
  String get lxmfBridgeDisabledHint =>
      'Включайте только тогда, когда приложение Bridge работает на Mac или Pi в этой сети.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'Онлайн — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'Невозможно связаться с домашним узлом — $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'Адрес домашнего узла';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP или http://IP:порт — например 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap =>
      'Одноранговый узел → LXMF назначение (JSON)';

  @override
  String get lxmfBridgeRefresh => 'Сохранить и обновить статус';

  @override
  String get lxmfBridgeLabHint => 'Дополнительно: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'Настройки домашнего узла';

  @override
  String get lxmfBridgeCheckConnection => 'Проверьте соединение';

  @override
  String get lxmfBridgeStatusOnline => 'Подключено к домашнему узлу';

  @override
  String get lxmfBridgeStatusOffline => 'Домашний узел недоступен';

  @override
  String get lxmfBridgeYourDest => 'Адрес этого узла (поделиться с друзьями)';

  @override
  String get lxmfBridgeCopyDest => 'Копировать адрес';

  @override
  String get lxmfBridgeDestCopied => 'Адрес скопирован';

  @override
  String get lxmfBridgeLinkedPeers => 'Связанные друзья';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'Каждому другу один раз нужен адрес домашнего узла. Тогда запечатанные чаты смогут использовать этот путь.';

  @override
  String get lxmfBridgeNoLinks => 'Друзья еще не связаны.';

  @override
  String get lxmfBridgeAddLink => 'Свяжите друга';

  @override
  String get lxmfBridgePickPeer => 'Друг';

  @override
  String get lxmfBridgePeerDest => 'Адрес их домашнего узла';

  @override
  String get lxmfBridgePeerDestHint => '32-значный код с экрана главного узла.';

  @override
  String get lxmfBridgeInvalidDest =>
      'Этот адрес недействителен. Вставьте полный код с их домашнего узла.';

  @override
  String get lxmfBridgeRemoveLink => 'Отсоединить';

  @override
  String get lxmfBridgeSaveLink => 'Сохранять';

  @override
  String get lxmfBridgeLinkSaved => 'Связан с другом';

  @override
  String get lxmfBridgeNoPeers =>
      'Контактов, для которых можно отправлять сообщения, пока нет. Сначала добавьте друга.';

  @override
  String get lxmfBridgeHelp =>
      'Поддерживайте работу моста на Mac/Pi. Этот путь остается в вашей локальной сети — он не LoRa и не заменяет Интернет или ячеистую сеть Bluetooth.';

  @override
  String get localWifiModeHotspot => 'Рядом';

  @override
  String get localWifiModeRouter => 'Маршрутизатор';

  @override
  String get localWifiHotspotIntro =>
      'Одно устройство использует личную точку доступа. Другие присоединяются к этой точке доступа, а затем ResilNet находит их в локальной сети.';

  @override
  String get localWifiHostAction => 'Создать сеть (Хост)';

  @override
  String get localWifiJoinAction => 'Присоединяйтесь к сети';

  @override
  String get localWifiHostSteps =>
      '1. Откройте настройки iOS/Android и включите «Персональную точку доступа» (или «Общий доступ в Интернет»).\n2. Сообщите друзьям название точки доступа (и пароль).\n3. Вернитесь сюда и нажмите «Точка доступа включена — начните ждать».';

  @override
  String get localWifiHostReady => 'Точка доступа включена — начните ждать';

  @override
  String get localWifiHostWaiting => 'Жду, когда присоединятся друзья…';

  @override
  String get localWifiJoinSteps =>
      '1. Откройте настройки системы и присоединитесь к личной точке доступа вашего друга.\n2. Вернитесь сюда и нажмите «Я на связи — поиск».';

  @override
  String get localWifiJoinReady => 'Я на связи — поиск';

  @override
  String get localWifiRouterIntro =>
      'Подключите все устройства к одному и тому же маршрутизатору/точке доступа Wi‑Fi. Роутеру не нужен интернет — только общая локальная сеть.';

  @override
  String get localWifiRouterSearch => 'Искать по этому Wi‑Fi';

  @override
  String get localWifiRefreshNetwork => 'Обновить информацию Wi‑Fi';

  @override
  String get localWifiRouterNoWifiTitle => 'Не на Wi‑Fi';

  @override
  String get localWifiRouterNoWifiBody =>
      'Присоединитесь к Wi‑Fi маршрутизатора в настройках системы, затем повторите поиск.';

  @override
  String get localWifiDiscovering => 'Поиск по локальному Wi‑Fi…';

  @override
  String get localWifiPeersFound => 'Устройства в этой сети';

  @override
  String get localWifiStop => 'Останавливаться';

  @override
  String get localWifiSsidUnknown => 'Имя Wi‑Fi недоступно';

  @override
  String get localWifiStubBanner => 'Ожидание разъема LAN…';

  @override
  String get localWifiLiveBanner =>
      'Обнаружение локальной сети в реальном времени (UDP) — анонс + закрытый чат на этом Wi‑Fi';

  @override
  String get localWifiEmptyHotspot =>
      'Устройств пока нет.\nУбедитесь, что друзья присоединились к вашей точке доступа и разрешили доступ к локальной сети.';

  @override
  String get localWifiEmptyRouter =>
      'Устройств пока нет.\nТот же SSID? Локальная сеть разрешена? Некоторые маршрутизаторы блокируют трафик между устройствами (изоляция точек доступа).';

  @override
  String get localWifiIsolationHelp => 'Почему мы не можем найти друг друга?';

  @override
  String get localWifiIsolationTitle =>
      'Маршрутизатор может изолировать клиентов';

  @override
  String get localWifiIsolationBody =>
      'Если изоляция точки доступа/клиента (или гостевой сети) включена, телефоны в том же Wi‑Fi не смогут разговаривать. Выключите изоляцию, используйте основной SSID или переключитесь в режим «Рядом» (точка доступа).';

  @override
  String get localWifiPeerReady => 'Готов к общению (есть ключ)';

  @override
  String get localWifiPeerNeedKey =>
      'Найден — отсканируйте QR для обмена ключами';

  @override
  String get localWifiErrorTitle => 'Локальная ошибка Wi‑Fi';

  @override
  String get localWifiErrorBody =>
      'Что-то пошло не так. Остановитесь и попробуйте еще раз.';

  @override
  String get preparingSystem => 'Готовим систему…';

  @override
  String get bootFailedTitle => 'Не удалось начать';

  @override
  String get retry => 'Попробуйте еще раз';

  @override
  String get bootRecoveryAction =>
      'Начать новую идентификацию (удалить локальные данные)';

  @override
  String get bootRecoveryConfirmTitle => 'Начать новую личность?';

  @override
  String get bootRecoveryConfirmBody =>
      'Это приведет к безвозвратному удалению локальных чатов, ключей и личных данных на этом устройстве.\nКоллеги должны еще раз отсканировать ваш QR-код, указав вашу новую личность.\nЭто невозможно отменить.';

  @override
  String get bootRecoveryRunning => 'Сброс локальной идентификации…';

  @override
  String get bootRecoverySuccess => 'Сброс локальной идентификации завершен.';

  @override
  String bootRecoveryFailed(String error) {
    return 'Не удалось сбросить личность: $error';
  }

  @override
  String get cancel => 'Отмена';

  @override
  String get save => 'Сохранять';

  @override
  String get close => 'Закрывать';

  @override
  String get start => 'Начинать';

  @override
  String get send => 'Отправлять';

  @override
  String get settings => 'Настройки';

  @override
  String get language => 'Язык';

  @override
  String get languageSubtitle =>
      'По умолчанию приложение использует язык вашего телефона (если поддерживается). Другие языки возвращаются к английскому. Здесь вы также можете заблокировать язык.';

  @override
  String get languageSystem => 'Система по умолчанию';

  @override
  String get languageThai => 'тайский';

  @override
  String get languageEnglish => 'Английский';

  @override
  String get notificationsTooltip => 'Настройки уведомлений';

  @override
  String get enableMessageNotifications => 'Включить уведомления о сообщениях';

  @override
  String get settingsNotificationsSubtitle =>
      'Сообщения 1:1 и люди в сети (локальные оповещения)';

  @override
  String get networkMembersTooltip => 'Члены сети';

  @override
  String get identityQrTooltip => 'Идентичность / QR';

  @override
  String get feedDirects => 'Чат';

  @override
  String get feedMesh => '#сетка';

  @override
  String get feedGeo => 'Область';

  @override
  String get feedDirectsSubtitle => 'Частные сообщения E2EE';

  @override
  String get feedMeshSubtitle => 'Ближайшие одноранговые узлы (BLE)';

  @override
  String get feedGeoSubtitle => 'Канал обнаружения Geohash';

  @override
  String get peerIdHint =>
      'Вставьте идентификатор получателя (хэш открытого ключа), чтобы начать чат.';

  @override
  String get directsEmpty =>
      'Чатов пока нет — отсканируйте QR или вставьте идентификатор получателя, чтобы начать\nСообщения перед отправкой запечатываются с помощью E2EE (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • нажмите, чтобы открыть чат';

  @override
  String get meshIntro =>
      'Пиры в диапазоне BLE — коснитесь, чтобы открыть частный чат E2EE (публичное создание сообщения в #mesh запрещено).\nОтправляет через гибридный маршрутизатор (BLE + LoRa + Nostr в режиме онлайн)';

  @override
  String get meshEmptyRunning =>
      'поблизости пока нет пиров — откройте приложение на другом устройстве в диапазоне BLE.';

  @override
  String get meshEmptyStopped =>
      'BLE не запущен — предоставьте разрешение Bluetooth/Местоположение.';

  @override
  String get meshNearbyPrefix => 'Рядом';

  @override
  String get meshRetentionTitle => 'Автоматическое удаление сообщений';

  @override
  String get meshRetentionSubtitle =>
      'Старая история локального чата автоматически удаляется.';

  @override
  String get meshRetentionKeep => 'Держать';

  @override
  String get meshRetention1Day => '1 день';

  @override
  String get meshRetention3Days => '3 дня';

  @override
  String get meshRetention7Days => '7 дней';

  @override
  String get refreshLocationTooltip => 'Обновить местоположение';

  @override
  String get geoIntro =>
      'Людям, находящимся в сети в этом геохеше, можно отправлять сообщения 1:1 или с общедоступным разветвлением (по-прежнему запечатанный E2EE для каждого узла, а не открытый текст).';

  @override
  String geoEmpty(String channel) {
    return 'В $channel пока никого нет онлайн\nИспользуйте Транспорт → Интернет/Авто, дождитесь Nostr, обновите местоположение.';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'Онлайн в $channel • нажмите, чтобы увидеть E2EE 1:1.';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'Рядом (ожидает присутствия зоны) • нажмите для 1:1 E2EE';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'Встречается на Nostr в $channel • только обнаружение (устаревшая версия)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'Устаревшее анонимное присутствие — дождитесь привязанного узла или обменяйтесь QR-кодом';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE рядом — отсканируйте QR, чтобы начать E2EE 1:1';

  @override
  String get geoInternetDiscoverHint =>
      'Обнаружение Интернета требует подключения Nostr (Настройки → Транспорт → Интернет/Авто)';

  @override
  String get geoEmptyNoLocation =>
      'Местоположение еще не определено — разрешите GPS и обновите, чтобы опубликовать геохэш на Nostr';

  @override
  String get geoEmptyNeedsPermission =>
      'Разрешение на определение местоположения отклонено — разрешите ResilNet в «Настройки» → «Конфиденциальность» → «Местоположение».';

  @override
  String get geoEmptyServicesDisabled =>
      'Службы геолокации отключены — включите их в настройках.';

  @override
  String get geoEmptyNoGpsFix =>
      'Не удалось получить координаты GPS (часто встречается на iPad Wi‑Fi) — установите геохеш вручную ниже';

  @override
  String get geoEmptyTeleportHint =>
      'Коснитесь значка места → введите геохеш (например, w5) → Телепортироваться.';

  @override
  String get geoSetGeohashManually => 'Установить геохеш';

  @override
  String get geoTeleportHint =>
      'Нет GPS? Введите префикс геохеша (2–7 символов, например w5) и нажмите «Телепорт».';

  @override
  String get geoTeleportInvalid =>
      'Неверный геохэш — используйте только буквы/цифры в формате Base32 (например, w5 или w5jt8).';

  @override
  String geoTeleportOk(String channel) {
    return 'Область установлена ​​на $channel';
  }

  @override
  String geoManualActive(String channel) {
    return 'Область вручную: $channel (обновление GPS будет иметь приоритет)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr не готов — нажмите «Переподключиться» (0/0, пока инициализация не завершится успешно)';

  @override
  String get geoEmptyMeshOnly =>
      'Транспорт только в сети — переключитесь на Интернет или Авто, чтобы найти одноранговые узлы Nostr';

  @override
  String geoEmptyWaiting(String channel) {
    return 'В $channel пока никого — оставьте Area + Internet открытыми на обоих устройствах и подождите ~60 секунд.';
  }

  @override
  String get geoChannelFallback => '#область';

  @override
  String get geoRefreshLocation => 'Обновить местоположение';

  @override
  String get settingsClearLocationTitle => 'Очистить местоположение';

  @override
  String get settingsClearLocationSubtitle =>
      'Удалить геохэш GPS/телепорта (область становится #—)';

  @override
  String get settingsClearLocationConfirmTitle => 'Ясное местоположение?';

  @override
  String get settingsClearLocationConfirmBody =>
      'Удаляет сохраненный геохэш на этом устройстве. После этого вы можете обновить GPS или снова телепортироваться.';

  @override
  String get settingsClearLocationAction => 'Очистить местоположение';

  @override
  String get settingsClearLocationSnack => 'Местоположение очищено';

  @override
  String get chatVoiceTooLarge =>
      'Голосовая заметка слишком велика — максимум ~30 секунд.';

  @override
  String get chatVoiceNeedInternet =>
      'Голосовой заметке требуется Интернет (Nostr) — слишком большой для одного BLE';

  @override
  String get chatVoiceSentInternet =>
      'Голосовая заметка, отправленная через Интернет';

  @override
  String get noticeAnonMention => 'упомянуть';

  @override
  String get noticeAnonDm => 'прямое сообщение';

  @override
  String get noticeAnonHug => 'обнимать';

  @override
  String get noticeAnonSlap => 'шлепок';

  @override
  String get noticeAnonBlock => 'блокировать';

  @override
  String get noticeAnonNeedKey =>
      'Открытого ключа пока нет — сначала обменяйте QR на 1:1';

  @override
  String get noticeAnonActionSent => 'Отправил';

  @override
  String noticeAnonBlocked(String anon) {
    return 'Заблокировано $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '*обнимает $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* дает пощечину $anon *';
  }

  @override
  String get geoReconnectNostr => 'Повторно подключиться Nostr';

  @override
  String get nostrSectionTitle => 'Nostr реле';

  @override
  String get nostrSectionSubtitle =>
      'Эти ретрансляторы используются для обмена сообщениями через Интернет и обнаружения зон. Нажмите «Повторить подключение», если статус остается в автономном режиме.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'Подключено $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'Не в сети — реле указаны, но ни одно из них не подключено';

  @override
  String get nostrStatusNotInit =>
      'Не запущено (0/0) — нажмите «Переподключиться» для инициализации.';

  @override
  String get nostrReconnectAction => 'Повторно подключиться Nostr';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr подключен ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'Все еще не в сети — проверьте Wi‑Fi/cell или повторите попытку.';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'Не удалось: $error';
  }

  @override
  String get nostrReconnecting => 'Подключение к реле…';

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
    return 'Интернет (Nostr) в $channel • запечатанный чат готов';
  }

  @override
  String get transportModeTitle => 'Районный транспорт';

  @override
  String get transportModeSubtitle =>
      'Сетка = BLE поблизости (радио), когда нет Nostr · Интернет и авто = список людей Nostr';

  @override
  String get transportModeMesh => 'сетка';

  @override
  String get transportModeInternet => 'Интернет';

  @override
  String get transportModeAuto => 'Авто';

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
      'Публичное сообщение всем, кто находится онлайн в этой области.';

  @override
  String get geoPublicSend => 'Общественный';

  @override
  String geoPublicHelp(int count) {
    return 'Запечатанное разветвление для $count онлайн-узлов — каждый получает личный конверт.';
  }

  @override
  String geoPublicSent(int count) {
    return 'Отправлено $count одноранговым узлам в этой области.';
  }

  @override
  String get geoPublicSentNone =>
      'В сети нет пиров, готовых к обмену сообщениями — откройте Area/Mesh с узлами, у которых есть ключи, или подождите BLE/Nostr';

  @override
  String get areaPublicBadge => 'Общественная зона';

  @override
  String get geoErrorPermission =>
      'Не удалось прочитать местоположение. Проверьте разрешение на определение местоположения.';

  @override
  String get geoPrecisionRegion => 'Область';

  @override
  String get geoPrecisionProvince => 'Провинция';

  @override
  String get geoPrecisionCity => 'Город';

  @override
  String get geoPrecisionNeighborhood => 'Район';

  @override
  String get geoPrecisionBlock => 'Блокировать';

  @override
  String get aliasTitle => 'Установить псевдоним (псевдоним контакта)';

  @override
  String get aliasHintBody =>
      'Этот псевдоним хранится только на этом устройстве (только локально).\nОн никогда не отправляется с трафиком E2EE.';

  @override
  String get aliasLabel => 'Псевдоним';

  @override
  String get aliasHint => 'например «глава села», «П’Сомчай»…';

  @override
  String get settingsDevices => 'Устройства';

  @override
  String get settingsFirmwareTitle => 'Загрузите/обновите прошивку ESP32';

  @override
  String get settingsFirmwareSubtitle =>
      'Загрузите файлы .bin и обновите плату ESP32 через OTA.';

  @override
  String get mtBridgeTitle => 'Meshtastic мост';

  @override
  String get mtBridgeSettingsSubtitle =>
      'Только текстовый мост A/B — не ResilNet E2EE';

  @override
  String get mtBridgeIntro =>
      'Переместите короткий открытый текст между Meshtastic и ResilNet. Режимы A и B не могут работать одновременно. Это не сквозное шифрование.';

  @override
  String get mtBridgeModeLabel => 'Режим';

  @override
  String get mtBridgeModeOff => 'Выключенный';

  @override
  String get mtBridgeModeA => 'Поглотить А';

  @override
  String get mtBridgeModeB => 'Выход Б';

  @override
  String get mtBridgeModeOffShort => 'Выключенный';

  @override
  String get mtBridgeModeAShort => 'В А';

  @override
  String get mtBridgeModeBShort => 'Выход Б';

  @override
  String get mtBridgeMutexHint =>
      'Выбор режима автоматически отключает другой. Одновременный A+B не поддерживается.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'Демо (ведение журнала)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'Входящий текст отображается в разделе «Уведомления» как #meshtastic. Реле сетки не является обязательным (по умолчанию выключено).';

  @override
  String get mtBridgeRelayTitle => 'Также ретранслируется на сетку ResilNet.';

  @override
  String get mtBridgeRelayHint =>
      'Если эта функция включена, будут транслироваться подписанные публичные бюллетени. Выкл. = только уведомления этого телефона.';

  @override
  String get mtBridgeSimulateHint => 'Демо-сообщение';

  @override
  String get mtBridgeSimulate => 'Имитировать сообщение Meshtastic';

  @override
  String get mtBridgeIngestOk => 'Вставлено в уведомления (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'Внимание: отправленные сюда сообщения НЕ являются ResilNet E2EE. Их может прочитать любой, кто находится по пути Meshtastic.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'Текст для публикации';

  @override
  String get mtBridgeSend => 'Отправить на Meshtastic';

  @override
  String get mtBridgeEgressOk => 'В очереди на Meshtastic (см. журнал/историю)';

  @override
  String get mtBridgeLastEgress => 'Последний выход';

  @override
  String get mtBridgeEgressHistory => 'Недавний выход';

  @override
  String get mtBridgeOffHint =>
      'Включите Ingest (A) или Egress (B), чтобы использовать мост.';

  @override
  String get mtBridgeNoticeBadge => 'МЕШТАСТИЧЕСКИЙ · не E2EE';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'Использовать транспорт MQTT';

  @override
  String get mtBridgeUseMqttHint =>
      'Выкл. = только демонстрационная регистрация (входящие сообщения MQTT игнорируются). On = MQTT для приема/выхода при подключении.';

  @override
  String get mtBridgeMqttHost => 'Хост-брокер';

  @override
  String get mtBridgeMqttPort => 'Порт';

  @override
  String get mtBridgeMqttTls => 'Используйте TLS (mqtts)';

  @override
  String get mtBridgeMqttTlsHint =>
      'Типичный порт 8883. Использует системные сертификаты; происходит сбой при ошибках установления связи.';

  @override
  String get mtBridgeMqttAutoReconnect =>
      'Автоматическое повторное подключение';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'Если этот параметр включен, клиент пытается повторно подключиться после сброса. Статус показывает Подключение до восстановления.';

  @override
  String get mtBridgeMqttTopicHelpers => 'Помощники по темам';

  @override
  String get mtBridgeMqttRegion => 'Префикс региона (необязательно)';

  @override
  String get mtBridgeMqttRegionHint =>
      'Если этот параметр установлен, Apply перестраивает корень как msh/<region>/2/json (переопределяет корень темы).';

  @override
  String get mtBridgeMqttTopicRoot => 'Корень темы JSON';

  @override
  String get mtBridgeMqttDownlinkChannel =>
      'Название канала нисходящей линии связи';

  @override
  String get mtBridgeMqttApplyTopics =>
      'Применить root → подписаться/опубликовать темы';

  @override
  String get mtBridgeMqttAdvanced => 'Расширенный MQTT';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'TLS, повторное подключение, темы, учетные данные';

  @override
  String get mtBridgeMqttTopicIn => 'Подписаться на тему';

  @override
  String get mtBridgeMqttTopicOut => 'Опубликовать тему';

  @override
  String get mtBridgeMqttGatewayFrom => 'Идентификатор узла шлюза (от)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'Десятичный идентификатор или !hex — требуется для нисходящей линии отправки текста.';

  @override
  String get mtBridgeMqttChannelIndex =>
      'Индекс канала сетки (необязательно 0–7)';

  @override
  String get mtBridgeMqttUser => 'Имя пользователя (необязательно)';

  @override
  String get mtBridgeMqttPass => 'Пароль (необязательно)';

  @override
  String get mtBridgeMqttPassStored =>
      'На этом устройстве хранится пароль (не показан).';

  @override
  String get mtBridgeMqttPassReplace =>
      'Новый пароль (оставьте пустым, чтобы сохранить)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'Оставьте пустым, чтобы сохранить сохраненный пароль.';

  @override
  String get mtBridgeMqttPassClear => 'Очистить пароль';

  @override
  String get mtBridgeMqttSave => 'Сохранить настройки MQTT';

  @override
  String get mtBridgeMqttSaved => 'Настройки MQTT сохранены.';

  @override
  String get mtBridgeMqttConnect => 'Соединять';

  @override
  String get mtBridgeMqttDisconnect => 'Отключить';

  @override
  String get mtBridgeMqttConnected => 'MQTT подключено';

  @override
  String get mtBridgeMqttConnecting => 'MQTT подключение…';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT отключен';

  @override
  String get mtBridgeMqttError => 'ошибка MQTT';

  @override
  String get mtBridgeErrModeIngest => 'Сначала переключитесь на Ingest (A)';

  @override
  String get mtBridgeErrModeEgress => 'Сначала переключитесь на выход (B)';

  @override
  String get mtBridgeErrRate => 'Замедлитесь — скорость ограничена';

  @override
  String get mtBridgeErrDedupe => 'Повторяющееся сообщение игнорируется';

  @override
  String get mtBridgeErrLoop =>
      'Отброшено, чтобы предотвратить образование петли моста.';

  @override
  String get mtBridgeErrEmpty => 'Сообщение пусто';

  @override
  String get mtBridgeErrPublish => 'Опубликовать не удалось';

  @override
  String get mtBridgeErrNotConnected => 'MQTT не подключен';

  @override
  String get mtBridgeErrMissingHost => 'Введите хост брокера MQTT.';

  @override
  String get mtBridgeErrMissingTopic => 'Введите темы подписки и публикации';

  @override
  String get mtBridgeErrMissingFromNode =>
      'Введите идентификатор узла шлюза (от) для sendtext';

  @override
  String get mtBridgeErrConnect => 'MQTT подключиться не удалось';

  @override
  String get mtBridgeErrConnectTls => 'MQTT Не удалось подключиться по TLS';

  @override
  String get settingsData => 'Данные';

  @override
  String get settingsDataHint =>
      'Удалите локальные сообщения, чтобы уменьшить размер базы данных — идентификационные данные, ключи и одноранговые узлы сохраняются.';

  @override
  String get settingsSaveHistoryTitle => 'Сохранить историю сообщений';

  @override
  String get settingsSaveHistorySubtitle =>
      'Если этот параметр отключен, сообщения остаются в сети E2EE и сохраняются только для этого сеанса (не в локальной истории чата). Ваш собственный текст по-прежнему отображается на этом устройстве в виде открытого текста.';

  @override
  String get settingsPrivacy => 'Конфиденциальность';

  @override
  String get settingsE2eeTitle => 'Сквозное шифрование';

  @override
  String get settingsE2eeSubtitle =>
      'Всегда включено — сообщения перед отправкой запечатываются с помощью RSA-OAEP + AES-GCM. Реле и близлежащие переходы не могут читать содержимое.';

  @override
  String get settingsScreenshotTitle => 'Оповещения о скриншотах';

  @override
  String get settingsScreenshotSubtitle =>
      'Показывать системную строку в чате, когда это устройство делает снимок экрана';

  @override
  String get settingsNostrExpiryTitle => 'Nostr время хранения сообщения';

  @override
  String get settingsNostrExpirySubtitle =>
      'Как долго запечатанные конверты должны оставаться локально при подключении к сети через Nostr';

  @override
  String get noticeExpiresIn => 'истекает через';

  @override
  String get noticesTitle => 'Уведомления';

  @override
  String get noticesMeshIntro =>
      'Публичный бюллетень — видимый всем в радиодиапазоне, не зашифрованный. Он переключается между телефонами в автономном режиме, а близлежащие релейные блоки ResilNet сохраняют копию, чтобы люди, пришедшие позже, все равно ее видели.';

  @override
  String get noticesMeshPublicBadge => 'ПУБЛИЧНЫЙ · не зашифрован';

  @override
  String get noticesGeoIntro =>
      'Добавьте короткие заметки об этом месте, чтобы другие посетители могли их найти.';

  @override
  String get noticesEmpty => 'пока нет уведомлений';

  @override
  String get noticesEmptyHint =>
      'прикрепите первое уведомление для людей здесь.';

  @override
  String get noticesComposeHint => 'разместить объявление...';

  @override
  String get noticesUrgent => 'срочный';

  @override
  String get noticesOpen => 'Уведомления';

  @override
  String get screenshotTaken => '*вы сделали скриншот*';

  @override
  String get chatAttachImage => 'Прикрепить изображение';

  @override
  String get chatImageLabel => 'Изображение';

  @override
  String get chatImageTooLarge =>
      'Изображение слишком большое. Попробуйте другое фото.';

  @override
  String get chatNostrExpiry => 'Nostr держи';

  @override
  String geoPublicComposeHint(String channel) {
    return 'Отправить на $channel — общедоступно';
  }

  @override
  String get settingsClearTitle => 'Очистить все сообщения';

  @override
  String get settingsClearSubtitle => 'Удалить все чаты на этом устройстве';

  @override
  String get settingsClearConfirmTitle => 'Удалить все сообщения?';

  @override
  String get settingsClearConfirmBody =>
      'Это приведет к удалению всех сообщений чата на этом устройстве.\nПэры и ники не удаляются.';

  @override
  String get settingsClearAction => 'Очистить данные';

  @override
  String get settingsClearedSnack => 'Данные удалены';

  @override
  String settingsVersion(String version) {
    return 'версия $version';
  }

  @override
  String get meshBleScanning => 'BLE: сканирование узлов';

  @override
  String get meshBleEsp32Scanning => 'ESP32: поиск ближайшего узла';

  @override
  String get meshBleSyncing => 'BLE: синхронизация с ESP32';

  @override
  String get meshNostrPublishing => 'Nostr: публикация';

  @override
  String get meshBleIdle =>
      'BLE сетка включена — телефонов поблизости пока нет';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE сетка — $count телефонов поблизости';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: требуется разрешение';

  @override
  String get meshBlePausedCamera =>
      'BLE приостановлено для камеры — нажмите «Старт» BLE';

  @override
  String get meshBleStopped =>
      'BLE выключен — проверьте, включен ли Bluetooth, затем нажмите «Пуск» BLE';

  @override
  String get meshBleRestart => 'Запустить BLE';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'БТ $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'Проверьте разрешения и запустите BLE';

  @override
  String get meshNostrOffline => 'Nostr оффлайн';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count ближайшие узлы • LoRa $lora • синхронизация ~$metersм';
  }

  @override
  String get meshLoraReady => 'готовый';

  @override
  String get meshLoraNotReady => 'не готов';

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
    return 'UDP-шлюз: $label';
  }

  @override
  String get meshGatewayReady => 'UDP шлюза: готов';

  @override
  String get permissionTitle =>
      'Разрешить доступ для запуска ячеистой сети BLE';

  @override
  String get permissionBody =>
      'Приложению требуется Bluetooth (сканирование/подключение/реклама), местоположение (для старых устройств Android) и микрофон (для голосовых заметок в чате и объявлений) для обмена сообщениями с сообществом.';

  @override
  String get permissionE2ee =>
      'Сквозное шифрование (E2EE)\nРелейные узлы не могут читать содержимое сообщения';

  @override
  String get permissionReady => 'Разрешения готовы';

  @override
  String get permissionRequest => 'Разрешить и продолжить';

  @override
  String get permissionNotReadySnack =>
      'Система еще не готова — подождите и повторите попытку.';

  @override
  String get permissionDeniedSnack =>
      'Разрешения неполные — откройте «Настройки» > ResilNet и разрешите Bluetooth/Местоположение/Микрофон.';

  @override
  String get permissionMicDenied =>
      'Доступ к микрофону запрещен — разрешите в настройках записывать голосовые заметки';

  @override
  String get permissionMicOpenSettings => 'Настройки';

  @override
  String get permissionCameraDenied =>
      'Доступ к камере запрещен — разрешите ей в настройках сканировать QR-коды';

  @override
  String get permissionCameraFailed =>
      'Для сканирования QR-кодов требуется разрешение камеры.';

  @override
  String get permissionCameraOpenSettings => 'Настройки';

  @override
  String get permissionPhotosDenied =>
      'Доступ к библиотеке фотографий запрещен — разрешите его в настройках, чтобы сохранить QR-код.';

  @override
  String get permissionPhotosFailed =>
      'Для сохранения вашего QR-кода требуется разрешение библиотеки фотографий.';

  @override
  String get permissionPhotosOpenSettings => 'Настройки';

  @override
  String permissionFailedSnack(String error) {
    return 'Запрос разрешения не выполнен: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet Архитектура • Многоскачковая передача с промежуточным хранением';

  @override
  String get onboardingSkip => 'Пропускать';

  @override
  String get onboardingNext => 'Следующий';

  @override
  String get onboardingStart => 'Начать';

  @override
  String get onboardingWelcomeTitle => 'Добро пожаловать в ResilNet';

  @override
  String get onboardingWelcomeBody =>
      'Общайтесь на ResilNet через ячеистую сеть — даже без Интернета';

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
  String get onboardingChannelsTitle => 'Зашифрованный чат + ближайшие каналы';

  @override
  String get onboardingChannelsBody =>
      'Переключите #mesh / Area (geohash), чтобы найти близлежащих сверстников — сообщения остаются E2EE через BLE mesh и Nostr';

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
  String get chatTitle => 'Чат (E2EE)';

  @override
  String get chatScanTooltip => 'Отсканируйте QR, чтобы добавить партнера';

  @override
  String get chatBlockTooltip => 'Заблокировать этого отправителя';

  @override
  String get chatBlockedSnack =>
      'Заблокировано: нет уведомлений/нет ретрансляции';

  @override
  String get chatAliasTooltip => 'Установить никнейм';

  @override
  String get chatReceiverPemLabel => 'Открытый ключ получателя (PEM)';

  @override
  String get chatReceiverPemHint =>
      'Вставьте открытый ключ вашего друга (из QR/общего файла)';

  @override
  String get chatNeedPeerKey =>
      'Сначала отсканируйте QR-код этого узла (требуется проверенный открытый ключ)';

  @override
  String get chatPeerKeyMismatch =>
      'Сохраненный открытый ключ не соответствует этому идентификатору узла.';

  @override
  String chatVoiceFailed(String error) {
    return 'Не удалось записать звук: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'Не удалось воспроизвести голосовую заметку: $error';
  }

  @override
  String get chatPlayVoice => 'Воспроизвести голосовую заметку';

  @override
  String get chatPauseVoice => 'Пауза';

  @override
  String get chatVoiceLabelSent => '🎤 Голосовая заметка (запечатана)';

  @override
  String get chatVoiceLabel => '🎤 Голосовая заметка';

  @override
  String get chatDecryptFailed => '[расшифровка не удалась]';

  @override
  String chatSentSealed(String preview) {
    return '[запечатано • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[запечатанный]';

  @override
  String get chatComposeHint =>
      'Введите сообщение… (запечатывается при отправке)';

  @override
  String get chatEmptyThread =>
      'Сообщений пока нет\nВведите ниже, чтобы отправить сетку';

  @override
  String chatLoadFailed(String error) {
    return 'Не удалось загрузить разговор: $error';
  }

  @override
  String get chatEmojiTooltip => 'Эмодзи';

  @override
  String get statusPending => 'В ожидании';

  @override
  String get statusSent => 'Отправил';

  @override
  String get statusRelayed => 'Ретранслируемый';

  @override
  String get statusDelivered => 'Доставленный';

  @override
  String get statusRead => 'Читать';

  @override
  String get statusFailed => 'Неуспешный';

  @override
  String get chatCopy => 'Копировать';

  @override
  String get chatDeleteLocal => 'Удалить на этом устройстве';

  @override
  String get chatDeletedLocalSnack => 'Удалено на этом устройстве';

  @override
  String get chatRetry => 'Повторить попытку';

  @override
  String get chatSendFailed => 'Не доставлено — нажмите «Повторить».';

  @override
  String get chatImageNeedInternet =>
      'Подключитесь к Интернету, чтобы отправлять изображения';

  @override
  String get chatImageTooLargeOnline =>
      'Не удалось сжать изображение настолько, чтобы его можно было отправить.';

  @override
  String get chatOpenLinkFailed => 'Не удалось открыть ссылку';

  @override
  String get identityTitle => 'Личность';

  @override
  String get identityScanTooltip => 'Сканируйте QR с помощью камеры';

  @override
  String get identityCopiedHash => 'Хэш открытого ключа скопирован.';

  @override
  String get identityPeerSaved => 'Пир сохранен из QR';

  @override
  String get identityGalleryDenied =>
      'Разрешение на использование библиотеки фотографий отклонено';

  @override
  String get identityQrSaved => 'QR сохранен в библиотеке фотографий';

  @override
  String identityQrSaveFailed(String error) {
    return 'Не удалось сохранить QR: $error';
  }

  @override
  String get peersTitle => 'Члены сети';

  @override
  String get qrScanTitle => 'Отсканируйте QR, чтобы добавить друга';

  @override
  String get qrInvalid => 'Сканирование не удалось: неверный QR-код.';

  @override
  String get qrIdKeyMismatch =>
      'QR отклонен: идентификатор не соответствует открытому ключу';

  @override
  String get qrCameraNotReady => 'Камера не готова';

  @override
  String get qrRetrySettings => 'Попробуйте еще раз/откройте настройки';

  @override
  String qrCameraOpenFailed(String error) {
    return 'Не удалось открыть камеру: $error';
  }

  @override
  String get qrScanAlignHint => 'Выровняйте QR-код внутри рамки';

  @override
  String get firmwareDownloadTitle => 'Загрузите прошивку ESP32';

  @override
  String get firmwareSourceOnline => 'Последние (онлайн)';

  @override
  String get firmwareSourceCached => 'Сохраненная копия (офлайн)';

  @override
  String get firmwareSourceBaseline => 'Базовый уровень в комплекте (офлайн)';

  @override
  String get firmwareSourceUnavailable => 'Нет доступной прошивки';

  @override
  String get firmwareBaselineIncompatible =>
      'Встроенная прошивка слишком старая — подключитесь к Интернету, чтобы загрузить более новую версию.';

  @override
  String get firmwareChecksumFailed =>
      'Не удалось проверить целостность прошивки — прошивка заблокирована';

  @override
  String firmwareReadyFromSource(String source) {
    return 'Прошивка готова: $source';
  }

  @override
  String get peersRefreshTooltip => 'Обновить';

  @override
  String get peersBlocked => 'Заблокировано';

  @override
  String get peersNearbyBle => 'Рядом (BLE)';

  @override
  String get peersRecentlyOnline => 'Недавно был онлайн';

  @override
  String get peersOnlineInArea => 'Онлайн в этом районе';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return 'Виден $minutes мин. назад';
  }

  @override
  String get peersOffline => 'Оффлайн';

  @override
  String peersBlockedSnack(String id) {
    return 'Заблокировано $id';
  }

  @override
  String get peersUnblockedSnack => 'Разблокировано';

  @override
  String get peersEmpty =>
      'В базе данных пока нет участников\nОтсканируйте QR-код или дождитесь обнаружения сетки BLE.';

  @override
  String get peersOpenChat => 'Открыть чат';

  @override
  String get peersBlockAction => 'Блокировать';

  @override
  String get peersUnblockAction => 'Разблокировать';

  @override
  String get channelPickerTooltip => 'Чат / #mesh / Область';

  @override
  String get locationPickerTooltip => 'Канал местоположения';

  @override
  String get transportPickerTooltip => 'Сетка/Интернет/Авто';

  @override
  String get onlinePeopleTooltip => 'Люди онлайн';

  @override
  String get unreadDirectsTooltipEmpty => 'Личные сообщения';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count непрочитанные личные сообщения';
  }

  @override
  String get onlinePeopleTitle => 'люди';

  @override
  String get onlinePeopleEmpty => 'Здесь пока никого нет онлайн';

  @override
  String onlinePeopleCount(int count) {
    return '$count онлайн';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · рядом + территория';

  @override
  String get peerOnlineMeshTitle => 'Кто-то рядом в сетке';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name находится рядом на сетке';
  }

  @override
  String get peerOnlineAreaTitle => 'Кто-то онлайн поблизости';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name находится в сети через Nostr';
  }

  @override
  String get locationSheetTitle => '#каналы местоположения';

  @override
  String get channelPinsTitle => 'Закреплено';

  @override
  String get channelPinsHint =>
      'Закрепите каналы, которые вы часто используете — они остаются вверху';

  @override
  String get channelPinTooltip => 'Закрепить этот канал';

  @override
  String get channelUnpinTooltip => 'Открепить';

  @override
  String get locationSheetIntro =>
      'Общайтесь с людьми поблизости, используя грубый геохэш, а не точный GPS. Присутствие в Интернете использует анонимные ключи Nostr.';

  @override
  String get locationMeshSubtitle => '#bluetooth • ~10–50 м';

  @override
  String get locationTeleportHint => '#геохэш';

  @override
  String get locationTeleport => 'Телепортироваться';

  @override
  String homeComposeHint(String channel) {
    return 'Сообщение $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return 'Отправить на $channel — общедоступно';
  }

  @override
  String get messageExpiryTitle => 'истекает через';

  @override
  String get voiceRecordTapToStart =>
      'Нажмите, чтобы записать голосовое сообщение';

  @override
  String get voiceRecordTooShort =>
      'Запись слишком короткая — попробуйте еще раз';

  @override
  String get voiceRecordFailed =>
      'Не удалось сохранить запись. Повторите попытку.';

  @override
  String get voicePttHold => 'Удерживайте, чтобы записать';

  @override
  String get voicePttRelease => 'Выпустить для предварительного просмотра';

  @override
  String get voicePttRecording => 'Запись…';

  @override
  String get voicePttDraftReady => 'Голосовая заметка готова';

  @override
  String get voicePttDiscard => 'Отказаться';

  @override
  String get voicePttReRecord => 'Записать еще раз';

  @override
  String get voicePttSend => 'Отправить голосовую заметку';

  @override
  String get voicePttPlayPreview => 'Предварительный просмотр воспроизведения';

  @override
  String get voicePttStopPreview => 'Остановить предварительный просмотр';

  @override
  String get noticesBackfilling => 'Загрузка уведомлений…';

  @override
  String get noticesNostrOnline => 'Nostr онлайн';

  @override
  String get noticesNostrOffline =>
      'Nostr не в сети — для бюллетеня требуется Интернет.';

  @override
  String noticesBackfillLoaded(int count) {
    return 'Загружены уведомления $count';
  }

  @override
  String get noticePublishFailed =>
      'Не удалось опубликовать уведомление районному совету. Проверьте соединение Nostr.';

  @override
  String get noticeMeshPublishNoLink =>
      'Сохранено локально. Подключитесь к ближайшему ячеистому радио (или шлюзу Wi‑Fi), чтобы другие могли его принимать.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'Бюллетень отправлен на $count ближайшие устройства через BLE.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'Ближайшие радиостанции видны, но запись BLE не удалась. Оставьте оба приложения открытыми на экране уведомлений и повторите попытку (или используйте реле ESP32).';

  @override
  String get noticeMeshPublishNoGatt =>
      'Приемник BLE этого устройства не готов. Включите Bluetooth и снова откройте «Уведомления».';

  @override
  String get noticeDelete => 'Удалить уведомление';

  @override
  String get noticeDeleteConfirmTitle => 'Удалить это уведомление?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'Это удаляет его только на этом устройстве. Другие, кто уже получил его, все равно его увидят.';

  @override
  String get noticeDeleted => 'Уведомление удалено';

  @override
  String get chatNoticeHidden => 'Уведомление о районе — открыть Уведомления';

  @override
  String get identityDisplayNameTitle => 'Отображаемое имя';

  @override
  String get identitySaveName => 'Сохранить имя';

  @override
  String get identityUserIdLabel =>
      'Идентификатор пользователя (хэш открытого ключа)';

  @override
  String get identityCopyHashTooltip => 'Скопировать хеш открытого ключа';

  @override
  String get identityMyQrTitle => 'Мой QR (id + pubKey + имя)';

  @override
  String identityQrFailed(String error) {
    return 'Не удалось создать QR-код\n$error';
  }

  @override
  String get identitySaving => 'Сохранение…';

  @override
  String get identitySaveQr => 'Сохранить QR в библиотеку фотографий';

  @override
  String get identityOpenScanner => 'Откройте камеру для сканирования QR';

  @override
  String get identityQrHelp =>
      'Попросите друга отсканировать это, чтобы сохранить ваш открытый ключ и (при необходимости) назначить вас проверенным эмитентом.';

  @override
  String get identityChatTip =>
      'Совет: вы также можете отсканировать QR-код в чате, чтобы добавить открытый ключ для E2EE.';

  @override
  String get infoOpen => 'О компании / Информация';

  @override
  String get docsGuideTitle => 'Руководство пользователя';

  @override
  String get docsGuideSubtitle => 'Открывается в браузере';

  @override
  String get docsOpenAction => 'Открыть руководство';

  @override
  String get docsOpenFailed => 'Не удалось открыть руководство пользователя';

  @override
  String get firmwareOtaGuideTitle => 'Flash-руководство и протокол OTA';

  @override
  String get firmwareOtaGuideSubtitle =>
      'Открывает веб-руководство — загрузки .bin и полные инструкции.';

  @override
  String get firmwareWebDownloadsTitle => 'Загрузка прошивки через Интернет';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'Ссылки и контрольные суммы для каждой версии на сайте документации';

  @override
  String get inviteCopyShortLink => 'Скопировать короткую ссылку';

  @override
  String get inviteShareLink => 'Поделиться ссылкой';

  @override
  String get inviteShowFullLink => 'Полная ссылка';

  @override
  String get inviteCopyFullLink => 'Скопировать полную ссылку';

  @override
  String get inviteLinkCopied => 'Ссылка скопирована';

  @override
  String get inviteLongPressHint =>
      'Длительное нажатие для действий со ссылкой';

  @override
  String get inviteSendInChat => 'Отправить в чат ResilNet…';

  @override
  String get inviteSendInChatHint =>
      'Только люди, для которых у вас уже есть открытый ключ';

  @override
  String get inviteSendInChatEmpty =>
      'Чатов для обмена сообщениями пока нет.\nОтсканируйте QR-код, откройте Area/Mesh или сначала поделитесь ссылкой за пределами приложения.';

  @override
  String get inviteSentToChat => 'Приглашение отправлено в чат';

  @override
  String get infoTabInfo => 'Информация';

  @override
  String get infoTabSettingsHint =>
      'Откройте Настройки в меню для языка, E2EE и инструментов данных';

  @override
  String get infoHowToTitle => 'Как использовать';

  @override
  String get infoHowToBody =>
      '• Нажмите на значок канала, чтобы переключить чат / #mesh / Area\n• Нажмите на место, чтобы выбрать размер геохеша\n• Нажмите на людей для подписчиков или тех, кто в сети.\n• Откройте удостоверение личности/QR-код из «», чтобы обменяться ключами лично\n• Область «общественность» отправляет запечатанный E2EE каждому онлайн-ученику, а не в комнату с открытым текстом';

  @override
  String get infoFeaturesTitle => 'Функции';

  @override
  String get infoFeatureOffline =>
      'Автономный обмен сообщениями через Bluetooth Low Energy';

  @override
  String get infoFeatureE2ee =>
      'Сквозное шифрование с помощью RSA-OAEP + AES-GCM (без шума)';

  @override
  String get infoFeatureMultihop =>
      'Сообщения могут проходить через близлежащие узлы, чтобы идти дальше.';

  @override
  String get infoFeatureBridge =>
      'Гибридная сетка ↔ Интернет (Nostr) для запечатанных конвертов';

  @override
  String get infoFeatureGeo =>
      'Местные геохеш-каналы для людей поблизости (Discovery UX)';

  @override
  String get infoFeatureNotices =>
      'Уведомления об истечении срока действия для #mesh и Area';

  @override
  String get infoPrivacyTitle => 'Конфиденциальность';

  @override
  String get infoPrivacyNoRoom =>
      'Нет открытого текста в деревне / общедоступном чате по проводу';

  @override
  String get infoPrivacyFanout =>
      'Отправка области = герметичное разветвление 1:1 к узлам с известными открытыми ключами';

  @override
  String get infoPrivacyPresence =>
      'Присутствие в зоне Интернета использует эфемерные ключи Nostr.';

  @override
  String get infoSymbolsTitle => 'Символы';

  @override
  String get infoSymBle => 'Прямая связь Bluetooth';

  @override
  String get infoSymMesh => 'Доступен через сетку (остальные вперед)';

  @override
  String get infoSymInternet =>
      'Через Интернет (Nostr) — запечатанные конверты';

  @override
  String get infoSymBridge => 'Прибыло по маршруту моста mesh↔internet.';

  @override
  String get infoSymOffline => 'Офлайн — сейчас недоступен';

  @override
  String get infoSymInArea => 'В этом месте в районе канала';

  @override
  String get infoSymE2eeOk => 'Сеанс со сквозным шифрованием';

  @override
  String get infoSymE2eeFail =>
      'Шифрование недоступно — не отправляйте конфиденциальный текст';

  @override
  String get infoSymVerified => 'Личность подтверждена/известный ключ';

  @override
  String get infoSymBlocked => 'Заблокировано';

  @override
  String get infoSymUnread => 'Непрочитанное личное сообщение';

  @override
  String get infoEmergencyTitle => 'Аварийный режим';

  @override
  String get infoEmergencyBody =>
      'Трижды коснитесь заголовка ResilNet на главном экране, чтобы стереть сообщения, ключи и личные данные на этом устройстве.';

  @override
  String get infoLegendNote =>
      'Некоторые значки путей описаны здесь для ясности; галочки доставки в чате остаются основным статусом отправки.';

  @override
  String get dangerZoneTitle => 'Опасная зона';

  @override
  String get dangerZoneSubtitle =>
      'Удаляет сообщения, ключи шифрования, идентификатор Nostr, одноранговые узлы и псевдонимы на этом устройстве. Вы настроите заново.';

  @override
  String get panicWipeTitle => 'Экстренная очистка';

  @override
  String get panicWipeSubtitle =>
      'Удалить все локально — аналогично тройному касанию названия дома (двойное нажатие обновляет радиоприемники)';

  @override
  String get panicWipeConfirmTitle => 'Удалить все локальные данные?';

  @override
  String get panicWipeConfirmBody =>
      'Это приведет к безвозвратному удалению чатов, ключей и личных данных на этом телефоне.\nПиры должны повторно обменять QR-ключи на ваши новые идентификационные данные.\nЭто невозможно отменить.';

  @override
  String get panicWipeAction => 'Протрите все';

  @override
  String get panicWipeSnack =>
      'Локальная идентификационная информация удалена – настройте заново.';

  @override
  String panicWipeFailed(String error) {
    return 'Очистка не удалась: $error';
  }

  @override
  String get meshBridgeTitle => 'Сетчатый мост';

  @override
  String get meshBridgeSubtitle =>
      'Если включено (по умолчанию), запечатанные конверты могут использовать как сетку BLE, так и Интернет (Nostr), чтобы близлежащие островки сетки могли подключаться. Если этот параметр отключен, для отправки используется только один путь — открытый текст никогда не передается по сети.';

  @override
  String get favoritesTitle => 'Избранное';

  @override
  String get favoritesAdd => 'Добавить в избранное';

  @override
  String get favoritesRemove => 'Удалить из избранного';

  @override
  String get favoritesEmpty =>
      'Избранных пока нет — пометьте коллегу из списка участников';

  @override
  String get favoritesNearbyTitle => 'Любимое рядом';

  @override
  String favoritesNearbyBody(String name) {
    return '$name находится рядом на сетке';
  }

  @override
  String get favoritesInAreaTitle => 'Любимый в этом районе';

  @override
  String favoritesInAreaBody(String name) {
    return '$name онлайн в этой области';
  }

  @override
  String get topologyTitle => 'Сетчатая топология';

  @override
  String get topologySubtitle =>
      'Пиры и подсказки по подключению из объявления сетки (только для чтения)';

  @override
  String get topologyConnectedNow => 'Подключено сейчас (BLE)';

  @override
  String get topologyNearby => 'Рядом (BLE)';

  @override
  String get topologyKnown => 'Известные коллеги';

  @override
  String get topologyEmpty =>
      'Никто из коллег еще не узнал — оставайтесь рядом с включенным BLE';

  @override
  String get topologyYou => 'ты';

  @override
  String topologyStats(int peers, int links) {
    return '$peers одноранговых узлов · $links ссылок';
  }

  @override
  String get topologyGraphHint =>
      'По оценкам обнаружения близлежащей сетки — ваше устройство выделено. Нажмите на собеседника, чтобы открыть чат.';

  @override
  String get topologyOpen => 'Сетчатая топология';

  @override
  String get slashHelpTitle => 'Команды';

  @override
  String get slashHelpBody =>
      '/help — этот список\n/who — люди онлайн в текущем канале\n/drop <текст> — закрепить здесь запечатанное уведомление (разветвление E2EE)\n\nПолное руководство: используйте «Открыть руководство» ниже или «Настройки» → «Руководство пользователя».';

  @override
  String get slashWhoEmpty => 'На этом канале сейчас никого нет онлайн';

  @override
  String slashWhoTitle(int count) {
    return 'Онлайн ($count)';
  }

  @override
  String get slashDropNeedText => 'Использование: /drop текст заметки';

  @override
  String slashDropDone(String channel) {
    return 'Уведомление о $channel удалено';
  }

  @override
  String get slashUnknown => 'Неизвестная команда — попробуйте /help';

  @override
  String get announceOpen => 'Объявления';

  @override
  String get announceTitle => 'Объявления';

  @override
  String get announceEmpty =>
      'Досок пока нет — создайте их, чтобы публиковать заблокированные или открытые объявления.';

  @override
  String get announceCreate => 'Создать доску';

  @override
  String get announceCreateHint => 'Название доски';

  @override
  String get announceDefaultTitle => 'Общественный совет';

  @override
  String get announceSettings => 'Настройки доски';

  @override
  String get announceAllowLocked =>
      'Разрешить заблокированные (зашифрованные) публикации';

  @override
  String get announceAllowLockedSub =>
      'Зашифровано на ключе платы — читателям нужен доступ';

  @override
  String get announceAllowOpen =>
      'Разрешить открытые сообщения (открытый текст)';

  @override
  String get announceAllowOpenSub =>
      'Не E2EE — читается на сетке/реле. По умолчанию выключено.';

  @override
  String get announceComposeHint => 'Написать объявление…';

  @override
  String get announceMediaInternetOnly =>
      'Фото/голосовые объявления отправляются через Интернет (кроме BLE)';

  @override
  String get announceNeedInternet =>
      'Подключитесь к Интернету, чтобы отправлять фото или голосовые объявления.';

  @override
  String announceVoiceFailed(String error) {
    return 'Не удалось записать голос: $error';
  }

  @override
  String get announceImageTooLarge =>
      'Изображение слишком велико (максимум ~ 180 КБ).';

  @override
  String get announcePlayVoice => 'Воспроизвести голосовую заметку';

  @override
  String get announceImageLabel => '📷 Изображение';

  @override
  String get announceAudioLabel => '🎤 Голосовая заметка';

  @override
  String get announceModeLocked => 'Заблокировано';

  @override
  String get announceModeOpen => 'Открыть';

  @override
  String get announceOpenBadge => 'ОТКРЫТО · не зашифровано';

  @override
  String get announceLockedBadge => 'Заблокировано';

  @override
  String get announceLockedPlaceholder =>
      'Зашифровано — запросить доступ для чтения';

  @override
  String get announceRequestAccess => 'Запросить доступ';

  @override
  String get announceRequestSent =>
      'Запрос на доступ отправлен владельцу доски';

  @override
  String get announceRequestFailed =>
      'Не удалось запросить доступ (нужен открытый ключ владельца)';

  @override
  String get announceOpenConfirmTitle => 'Пост без шифрования?';

  @override
  String get announceOpenConfirmBody =>
      'Открытые сообщения не относятся к E2EE. Любой на пути (сетка/реле) может их прочитать. Продолжать?';

  @override
  String get announcePostAction => 'Почта';

  @override
  String get announcePendingRequests => 'Запросы доступа';

  @override
  String get announceApprove => 'Утвердить';

  @override
  String get announceDeny => 'Отрицать';

  @override
  String get announceGranted =>
      'Вы можете прочитать заблокированные сообщения на этой доске.';

  @override
  String get announceOwner => 'Вы являетесь владельцем этой доски';

  @override
  String get announceCopyInvite => 'Скопировать текст приглашения';

  @override
  String get announceShowInviteQr => 'Показать приглашение QR';

  @override
  String get announceScanInviteQr => 'Сканировать доску приглашения QR';

  @override
  String get announceFollow => 'Следовать за доской по приглашению';

  @override
  String get announceFollowHint =>
      'Вставьте текст приглашения или ссылку ResilNet от владельца.';

  @override
  String get announceFollowOk => 'Следующая доска';

  @override
  String announceFollowOkNamed(String title) {
    return 'Теперь следую “$title”';
  }

  @override
  String get announceFollowFail =>
      'Приглашение недействительно или повреждено.';

  @override
  String get announceInviteCopied => 'Текст приглашения скопирован.';

  @override
  String get announceInviteSaveQr => 'Сохранить QR-код';

  @override
  String get announceInviteShare => 'Поделиться приглашением';

  @override
  String get announceFollowFromCompose =>
      'Приглашение на форум обнаружено в окне сообщения';

  @override
  String get peerConfirmAddTitle => 'Добавить участника сети?';

  @override
  String peerConfirmAddBody(String name) {
    return 'Добавьте «$name» к их открытому ключу, чтобы вы могли отправлять им личные сообщения?';
  }

  @override
  String get peerConfirmAdd => 'Добавить участника';

  @override
  String peerAddedOk(String name) {
    return 'Добавлен $name к членам сети.';
  }

  @override
  String get peerAddFromCompose =>
      'Идентификатор/открытый ключ обнаружен в окне сообщения';

  @override
  String get peerHashCopied => 'Хэш открытого ключа скопирован.';

  @override
  String get peerHashOpenChat => 'Открыть чат';

  @override
  String get peerHashAddHint =>
      'Хэш скопирован. Попросите их поделиться своей идентификационной ссылкой или QR-кодом, чтобы вы могли добавить полный открытый ключ для E2EE.';

  @override
  String get peerQrNoCode => 'На этом изображении не найден QR-код ResilNet';

  @override
  String identityInviteSharePreamble(String name) {
    return 'Идентификатор ResilNet: «$name»\nОткройте ссылку или вставьте ее в чат → Добавить участника\nИли отсканируйте QR-код удостоверения личности.';
  }

  @override
  String get identityShareInvite => 'Поделиться ссылкой на личность';

  @override
  String get identityInviteCopied =>
      'Ссылка на идентификационную информацию скопирована.';

  @override
  String announceInviteSharePreamble(String title) {
    return 'Приглашение на доску: «$title»\nОткройте ResilNet → Доски сообществ → Подписаться на приглашение.\nИли отсканируйте QR/коснитесь ссылки ниже.';
  }

  @override
  String get announceConfirmFollowTitle => 'Следовать за этой доской?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'Подписаться на «$title» из этого приглашения?';
  }

  @override
  String get announceConfirmFollow => 'Следовать';
}

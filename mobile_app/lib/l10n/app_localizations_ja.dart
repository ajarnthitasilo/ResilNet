// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'ResilNet を更新中…';

  @override
  String get appRefreshed => '更新 — 無線と検出が再開されました';

  @override
  String appRefreshFailed(String error) {
    return '更新に失敗しました: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'ダブルタップ = ソフトリフレッシュ。長押し = ハードリカバリ。トリプルタップ = 緊急ワイプ。';

  @override
  String get softRefreshTipTitle => 'ResilNet が行き詰まりを感じている場合';

  @override
  String get softRefreshTipBody =>
      'ResilNet (左上) をダブルタップすると、無線がソフトに更新されます。それでも解決しない場合は、タイトルを長押しし、「⋮」→「ハードリカバリ」または「設定」を使用します。トリプルタップは緊急ワイプのみです。';

  @override
  String get softRefreshTipGotIt => 'わかった';

  @override
  String get infoSoftRefreshTitle => 'アプリが行き詰まっていると感じた場合';

  @override
  String get infoSoftRefreshStepRefresh =>
      'ResilNet (左上) をダブルタップ → ラジオと近くの人々をソフトリフレッシュします';

  @override
  String get infoSoftRefreshStepHard =>
      'まだ行き詰まっていますか?タイトル長押し、または ⋮ / 設定 → ハードリカバリ';

  @override
  String get infoSoftRefreshStepWait =>
      '結果のスナックバーを待ってから、再試行してください。セッションをリセットしてもキーは保持されます。';

  @override
  String get infoSoftRefreshStepWipe =>
      'トリプルタップ = 緊急ワイプ (ローカル データを削除) — 意図的である場合のみ';

  @override
  String get appRecoverySection => 'アプリの回復';

  @override
  String get appRecoverySectionSubtitle =>
      'アプリがフリーズしていると感じた場合に使用します。ソフト = タイトルをダブルタップします。ハードリカバリーの方が強い。セッションをリセットすると、キーをワイプせずにサービスが再起動されます。';

  @override
  String get appHardRecoverAction => 'ハードリカバリ';

  @override
  String get appHardRecovering => '回復が難しい…';

  @override
  String get appSessionResetAction => 'セッションをリセットする';

  @override
  String get appSessionResetRunning => 'セッションをリセット中…';

  @override
  String get appSessionResetConfirmTitle => 'セッションをリセットしますか?';

  @override
  String get appSessionResetConfirmBody =>
      'このデバイス上の ResilNet サービスを再起動します。 ID キーは保管されます。';

  @override
  String get appRecoveryBusy => 'リカバリはすでに実行中です…';

  @override
  String get appRecoveryOk => '回復が完了しました';

  @override
  String get appRecoveryPartial =>
      'いくつかの手順をスキップしてリカバリが終了しました - まだスタックしている場合はもう一度試してください';

  @override
  String get appRecoveryFailed =>
      '回復に失敗しました - セッションのリセットを試みるか、OS からアプリを強制終了してください';

  @override
  String get localWifiTitle => 'ローカル Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'インターネットなしで近くのデバイスをリンクします。1 つの LAN 上にあるのと同じです。';

  @override
  String get localWifiNotGatewayHint =>
      'ESP32 LoRa ゲートウェイ SoftAP ではありません。電話↔電話・LANのみです。';

  @override
  String get localWifiUnavailable => 'ローカル Wi‑Fi はまだ準備ができていません。アプリが起動するまで待ちます。';

  @override
  String get lxmfBridgeTitle => 'ホームノード';

  @override
  String get lxmfBridgeSubtitle =>
      '封印されたチャットを中継する Wi‑Fi 上のオプションの Mac または Pi。デフォルトではオフです。エンドツーエンド暗号化に代わるものではありません。';

  @override
  String get lxmfBridgeEnable => 'ホームノードを使用する';

  @override
  String get lxmfBridgeDisabledHint =>
      'ブリッジ アプリがこのネットワーク上の Mac または Pi で実行されている場合にのみオンになります。';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'オンライン — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'ホームノードに到達できません — $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'ホームノードアドレス';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP または http://IP:port — 例 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'ピア → LXMF 宛先 (JSON)';

  @override
  String get lxmfBridgeRefresh => 'ステータスの保存と更新';

  @override
  String get lxmfBridgeLabHint => '上級: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'ホームノードの設定';

  @override
  String get lxmfBridgeCheckConnection => '接続を確認してください';

  @override
  String get lxmfBridgeStatusOnline => 'ホームノードに接続されています';

  @override
  String get lxmfBridgeStatusOffline => 'ホームノードに到達できません';

  @override
  String get lxmfBridgeYourDest => 'このノードのアドレス (友人と共有)';

  @override
  String get lxmfBridgeCopyDest => 'アドレスをコピーする';

  @override
  String get lxmfBridgeDestCopied => 'アドレスをコピーしました';

  @override
  String get lxmfBridgeLinkedPeers => 'リンクされた友達';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      '各友人は自分のホームノード アドレスを 1 回必要とします。これにより、シールドされたチャットがこのパスを使用できるようになります。';

  @override
  String get lxmfBridgeNoLinks => 'まだ友達がリンクされていません。';

  @override
  String get lxmfBridgeAddLink => '友達をリンクする';

  @override
  String get lxmfBridgePickPeer => '友達';

  @override
  String get lxmfBridgePeerDest => 'ホームノードアドレス';

  @override
  String get lxmfBridgePeerDestHint => 'ホームノード画面からの 32 文字のコード';

  @override
  String get lxmfBridgeInvalidDest =>
      'そのアドレスは有効ではないようです。ホーム ノードから完全なコードを貼り付けます。';

  @override
  String get lxmfBridgeRemoveLink => 'リンクを解除する';

  @override
  String get lxmfBridgeSaveLink => '保存';

  @override
  String get lxmfBridgeLinkSaved => '友達がリンクされました';

  @override
  String get lxmfBridgeNoPeers => 'メッセージ可能な連絡先はまだありません。まず友達を追加してください。';

  @override
  String get lxmfBridgeHelp =>
      'Mac/Pi 上でブリッジを実行し続けます。このパスは LAN 上に残ります。これは LoRa ではなく、インターネットや Bluetooth メッシュに代わるものではありません。';

  @override
  String get localWifiModeHotspot => '近く';

  @override
  String get localWifiModeRouter => 'ルーター';

  @override
  String get localWifiHotspotIntro =>
      '1 台のデバイスがパーソナル ホットスポットを共有します。他の人がそのホットスポットに参加し、ResilNet がローカル ネットワーク上でそれらを見つけます。';

  @override
  String get localWifiHostAction => 'ネットワークの作成（ホスト）';

  @override
  String get localWifiJoinAction => 'ネットワークに接続する';

  @override
  String get localWifiHostSteps =>
      '1. iOS/Androidの設定を開き、パーソナルホットスポット（またはインターネット共有）をオンにします。\n2.ホットスポット名（とパスワード）を友達に伝えます。\n3.ここに戻って「ホットスポットがオンになっています。お待ちください」をタップします。';

  @override
  String get localWifiHostReady => 'ホットスポットがオンになっています - 待機を開始します';

  @override
  String get localWifiHostWaiting => '友達の参加を待っています…';

  @override
  String get localWifiJoinSteps =>
      '1. システムの設定を開き、友人の個人ホットスポットに参加します。\n2. ここに戻り、「接続中 – 検索」をタップします。';

  @override
  String get localWifiJoinReady => '接続しています — 検索';

  @override
  String get localWifiRouterIntro =>
      'すべてのデバイスを同じ Wi‑Fi ルーター/AP に接続します。ルーターにはインターネットは必要ありません。共有ローカル ネットワークのみが必要です。';

  @override
  String get localWifiRouterSearch => 'この Wi‑Fi で検索します';

  @override
  String get localWifiRefreshNetwork => 'Wi‑Fi 情報を更新';

  @override
  String get localWifiRouterNoWifiTitle => 'Wi‑Fi にはありません';

  @override
  String get localWifiRouterNoWifiBody => 'システム設定でルーターの Wi‑Fi に参加し、再度検索します。';

  @override
  String get localWifiDiscovering => 'ローカル Wi‑Fi で検索しています…';

  @override
  String get localWifiPeersFound => 'このネットワーク上のデバイス';

  @override
  String get localWifiStop => '停止';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi 名が利用できません';

  @override
  String get localWifiStubBanner => 'LANソケットを待っています…';

  @override
  String get localWifiLiveBanner =>
      'LAN ディスカバリ ライブ (UDP) — この Wi‑Fi でアナウンス + 非公開チャット';

  @override
  String get localWifiEmptyHotspot =>
      'まだデバイスがありません。\n友達がホットスポットに参加し、ローカル ネットワーク アクセスを許可していることを確認してください。';

  @override
  String get localWifiEmptyRouter =>
      'まだデバイスがありません。\n同じSSIDですか？ローカルネットワークは許可されますか?一部のルーターはデバイス間のトラフィックをブロックします (AP 分離)。';

  @override
  String get localWifiIsolationHelp => 'なぜお互いを見つけることができないのですか？';

  @override
  String get localWifiIsolationTitle => 'ルーターがクライアントを隔離する可能性がある';

  @override
  String get localWifiIsolationBody =>
      'AP/クライアント分離 (またはゲスト ネットワーク) がオンになっている場合、同じ Wi‑Fi 上の電話は通話できません。分離をオフにするか、メイン SSID を使用するか、近く (ホットスポット) モードに切り替えます。';

  @override
  String get localWifiPeerReady => 'チャットの準備ができました (鍵あり)';

  @override
  String get localWifiPeerNeedKey => '見つかりました— QRをスキャンして鍵を交換';

  @override
  String get localWifiErrorTitle => 'ローカル Wi‑Fi エラー';

  @override
  String get localWifiErrorBody => '何か問題が発生しました。停止してもう一度試してください。';

  @override
  String get preparingSystem => 'システムを準備中…';

  @override
  String get bootFailedTitle => '開始できませんでした';

  @override
  String get retry => 'もう一度やり直してください';

  @override
  String get bootRecoveryAction => '新しいアイデンティティを開始する (ローカル データを消去する)';

  @override
  String get bootRecoveryConfirmTitle => '新しいアイデンティティを始めますか?';

  @override
  String get bootRecoveryConfirmBody =>
      'これにより、このデバイス上のローカル チャット、キー、ID が完全に消去されます。\nピアは、新しい ID を使用して QR を再度スキャンする必要があります。\nこれを元に戻すことはできません。';

  @override
  String get bootRecoveryRunning => 'ローカル ID をリセットしています…';

  @override
  String get bootRecoverySuccess => 'ローカル ID のリセットが完了しました';

  @override
  String bootRecoveryFailed(String error) {
    return 'IDをリセットできませんでした： $error';
  }

  @override
  String get cancel => 'キャンセル';

  @override
  String get save => '保存';

  @override
  String get close => '近い';

  @override
  String get start => '始める';

  @override
  String get send => '送信';

  @override
  String get settings => '設定';

  @override
  String get language => '言語';

  @override
  String get languageSubtitle =>
      'デフォルトでは、アプリは電話の言語に従います (サポートされている場合)。他の言語は英語に戻ります。ここで言語をロックすることもできます。';

  @override
  String get languageSystem => 'システムのデフォルト';

  @override
  String get languageThai => 'タイ語';

  @override
  String get languageEnglish => '英語';

  @override
  String get notificationsTooltip => '通知設定';

  @override
  String get enableMessageNotifications => 'メッセージ通知を有効にする';

  @override
  String get settingsNotificationsSubtitle =>
      '1 対 1 のメッセージとオンラインの人々 (ローカル アラート)';

  @override
  String get networkMembersTooltip => 'ネットワークメンバー';

  @override
  String get identityQrTooltip => 'アイデンティティ/QR';

  @override
  String get feedDirects => 'チャット';

  @override
  String get feedMesh => '＃メッシュ';

  @override
  String get feedGeo => 'エリア';

  @override
  String get feedDirectsSubtitle => 'プライベート E2EE メッセージ';

  @override
  String get feedMeshSubtitle => '近くのピア (BLE)';

  @override
  String get feedGeoSubtitle => 'Geohash ディスカバリー チャネル';

  @override
  String get peerIdHint => '受信者 ID (公開キー ハッシュ) を貼り付けてチャットを開始します';

  @override
  String get directsEmpty =>
      'まだチャットはありません - QR をスキャンするか、受信者 ID を貼り付けて開始してください\nメッセージは送信前に E2EE でシールされます (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • タップしてチャットを開きます';

  @override
  String get meshIntro =>
      'BLE 範囲内のピア — プライベート E2EE チャットをタップします (#mesh でのパブリック作成はありません)\nハイブリッド ルーター経由で送信 (オンライン時は BLE + LoRa + Nostr)';

  @override
  String get meshEmptyRunning => '近くにピアがまだありません - BLE 範囲内の別のデバイスでアプリを開きます';

  @override
  String get meshEmptyStopped =>
      'BLE は実行されていません — Bluetooth / 位置情報のアクセス許可を付与します';

  @override
  String get meshNearbyPrefix => '近く';

  @override
  String get meshRetentionTitle => 'メッセージの自動削除';

  @override
  String get meshRetentionSubtitle => '古いローカル チャット履歴は自動的に削除されます';

  @override
  String get meshRetentionKeep => '保つ';

  @override
  String get meshRetention1Day => '1日';

  @override
  String get meshRetention3Days => '3日間';

  @override
  String get meshRetention7Days => '7日間';

  @override
  String get refreshLocationTooltip => '場所を更新する';

  @override
  String get geoIntro =>
      'このジオハッシュ内のオンラインの人々は、1 対 1 でメッセージを送信することも、エリアのパブリック ファンアウトでメッセージを送信することもできます (ピアごとに E2EE はまだ封印されています。平文ではありません)。';

  @override
  String geoEmpty(String channel) {
    return '$channel にはまだオンラインの人がいません\nトランスポート → インターネット/自動を使用し、Nostr を待ち、場所を更新します';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return '$channel でオンライン • 1 対 1 E2EE をタップ';
  }

  @override
  String get geoPeerNearbySubtitle => '近く (待機エリアに存在) • 1:1 E2EE の場合はタップします';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return '$channel の Nostr で見られる • 検出のみ (レガシー)';
  }

  @override
  String get geoPeerDiscoverOnlySnack => '従来の匿名プレゼンス - バインドされたピアを待つか、QR を交換します';

  @override
  String get bleRadioNearbySubtitle => 'BLE 近く— 1: 1 E 2 EEを開始するためにQRをスキャン';

  @override
  String get geoInternetDiscoverHint =>
      'エリア インターネット検出には Nostr が接続されている必要があります (設定 → トランスポート → インターネット/自動)';

  @override
  String get geoEmptyNoLocation =>
      '場所はまだ解決されていません— GPSとリフレッシュを許可して、ジオハッシュを公開します Nostr';

  @override
  String get geoEmptyNeedsPermission =>
      '位置情報の許可が拒否されました - [設定] → [プライバシー] → [位置情報] で ResilNet を許可します';

  @override
  String get geoEmptyServicesDisabled => '位置情報サービスがオフになっています - 設定でオンにしてください';

  @override
  String get geoEmptyNoGpsFix =>
      'GPS 修正を取得できませんでした (Wi‑Fi iPad で一般的) — 以下で geohash を手動で設定します';

  @override
  String get geoEmptyTeleportHint => '場所アイコンをタップ → ジオハッシュ (例: w5) を入力 → テレポート';

  @override
  String get geoSetGeohashManually => 'ジオハッシュを設定する';

  @override
  String get geoTeleportHint =>
      'GPS がありませんか? geohash プレフィックス (2 ～ 7 文字、例: w5) を入力し、「テレポート」をタップします';

  @override
  String get geoTeleportInvalid =>
      '無効な geohash — Base32 文字/数字のみを使用してください (例: w5 または w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return '$channel に設定された領域';
  }

  @override
  String geoManualActive(String channel) {
    return '手動エリア: $channel (GPS 更新は上書きされます)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr の準備ができていません — [再接続] をタップします (初期化が成功するまで 0/0)';

  @override
  String get geoEmptyMeshOnly =>
      'トランスポートはメッシュのみです - Nostr 経由でピアを検出するには、インターネットまたは自動に切り替えてください';

  @override
  String geoEmptyWaiting(String channel) {
    return '$channel にはまだ誰もいません — 両方のデバイスでエリアとインターネットを開いたままにして、最大 60 秒待ちます';
  }

  @override
  String get geoChannelFallback => '＃エリア';

  @override
  String get geoRefreshLocation => '場所を更新する';

  @override
  String get settingsClearLocationTitle => '明確な場所';

  @override
  String get settingsClearLocationSubtitle =>
      'GPS / テレポート ジオハッシュを削除 (エリアは #— になります)';

  @override
  String get settingsClearLocationConfirmTitle => '明確な場所？';

  @override
  String get settingsClearLocationConfirmBody =>
      'このデバイスに保存されている geohash を削除します。その後、GPS を更新したり、再度テレポートしたりできます。';

  @override
  String get settingsClearLocationAction => '明確な場所';

  @override
  String get settingsClearLocationSnack => '場所がクリアされました';

  @override
  String get chatVoiceTooLarge => '音声メモが大きすぎます - 最大約 30 秒';

  @override
  String get chatVoiceNeedInternet =>
      'ボイスメモにはインターネット (Nostr) が必要です - BLE だけでは大きすぎます';

  @override
  String get chatVoiceSentInternet => 'インターネット経由で送信されるボイスメモ';

  @override
  String get noticeAnonMention => '言及';

  @override
  String get noticeAnonDm => 'ダイレクトメッセージ';

  @override
  String get noticeAnonHug => 'Pa hug';

  @override
  String get noticeAnonSlap => '平手打ち';

  @override
  String get noticeAnonBlock => 'ブロック';

  @override
  String get noticeAnonNeedKey => '公開キーはまだありません - 最初に QR を 1:1 で交換します';

  @override
  String get noticeAnonActionSent => '送信済み';

  @override
  String noticeAnonBlocked(String anon) {
    return 'ブロックされました $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* ハグ $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* 平手打ち $anon *';
  }

  @override
  String get geoReconnectNostr => '再接続 Nostr';

  @override
  String get nostrSectionTitle => 'Nostr リレー';

  @override
  String get nostrSectionSubtitle =>
      'インターネット メッセージングとエリア検出では、これらのリレーが使用されます。ステータスがオフラインのままの場合は、「再接続」をタップします。';

  @override
  String nostrStatusOnline(int connected, int total) {
    return '$connected/$total に接続しました';
  }

  @override
  String get nostrStatusOffline => 'オフライン — リレーはリストされていますが、接続されていません';

  @override
  String get nostrStatusNotInit => '未開始 (0/0) — [再接続] をタップして初期化します';

  @override
  String get nostrReconnectAction => '再接続 Nostr';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr が接続されました ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed => 'まだオフラインです - Wi‑Fi/セルラーを確認するか、もう一度試してください';

  @override
  String nostrReconnectFailedDetail(String error) {
    return '失敗しました: $error';
  }

  @override
  String get nostrReconnecting => 'リレーに接続中…';

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return '$channel のインターネット (Nostr) • シールドチャット対応';
  }

  @override
  String get transportModeTitle => 'エリア輸送';

  @override
  String get transportModeSubtitle =>
      'メッシュ = BLE 近く (無線) Nostr がない場合 · インターネットと自動 = Nostr 人のリスト';

  @override
  String get transportModeMesh => 'メッシュ';

  @override
  String get transportModeInternet => 'インターネット';

  @override
  String get transportModeAuto => '自動';

  @override
  String get geoPublicHint => 'この地域のオンライン上のすべての人への公開メッセージ';

  @override
  String get geoPublicSend => '公共';

  @override
  String geoPublicHelp(int count) {
    return '$count のオンライン ピアへの密閉されたファンアウト - それぞれがプライベート エンベロープを受け取ります';
  }

  @override
  String geoPublicSent(int count) {
    return 'このエリアの $count ピアに送信されます';
  }

  @override
  String get geoPublicSentNone =>
      'オンラインにメッセージ送信可能なピアがありません — キーを持つピアでエリア/メッシュを開くか、BLE/Nostr を待ちます';

  @override
  String get areaPublicBadge => 'エリア公共';

  @override
  String get geoErrorPermission => '位置情報を読み取れませんでした - 位置情報の許可を確認してください';

  @override
  String get geoPrecisionRegion => '地域';

  @override
  String get geoPrecisionProvince => '州';

  @override
  String get geoPrecisionCity => '市';

  @override
  String get geoPrecisionNeighborhood => '近所';

  @override
  String get geoPrecisionBlock => 'ブロック';

  @override
  String get aliasTitle => 'ニックネームの設定（連絡先エイリアス）';

  @override
  String get aliasHintBody =>
      'このエイリアスはこのデバイスのみに保存されます (ローカルのみ)\nE2EE トラフィックで送信されることはありません';

  @override
  String get aliasLabel => 'ニックネーム';

  @override
  String get aliasHint => '例えば「村長」「プソムチャイ」…';

  @override
  String get settingsDevices => 'デバイス';

  @override
  String get settingsFirmwareTitle => 'ESP32 ファームウェアのダウンロード / アップデート';

  @override
  String get settingsFirmwareSubtitle =>
      '.bin ファイルをダウンロードし、OTA 経由で ESP32 ボードを更新します';

  @override
  String get mtBridgeTitle => 'Meshtastic ブリッジ';

  @override
  String get mtBridgeSettingsSubtitle =>
      'テキストのみの A/B ブリッジ - ResilNet E2EE ではない';

  @override
  String get mtBridgeIntro =>
      '短い平文を Meshtastic と ResilNet の間に移動します。モード A と B を同時に実行することはできません。これはエンドツーエンドの暗号化ではありません。';

  @override
  String get mtBridgeModeLabel => 'モード';

  @override
  String get mtBridgeModeOff => 'オフ';

  @override
  String get mtBridgeModeA => 'Aを摂取する';

  @override
  String get mtBridgeModeB => '出口B';

  @override
  String get mtBridgeModeOffShort => 'オフ';

  @override
  String get mtBridgeModeAShort => 'Aで';

  @override
  String get mtBridgeModeBShort => 'アウトB';

  @override
  String get mtBridgeMutexHint =>
      'どちらかのモードを選択すると、もう一方のモードが自動的にオフになります。 A+B の同時はサポートされていません。';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'デモ（ロギング）';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      '受信テキストは「通知」の下に #meshtastic として表示されます。メッシュ リレーはオプションです (デフォルトではオフ)。';

  @override
  String get mtBridgeRelayTitle => 'ResilNet メッシュでも中継します';

  @override
  String get mtBridgeRelayHint =>
      'オンにすると、署名された公開情報がブロードキャストされます。オフ = この電話の通知のみ。';

  @override
  String get mtBridgeSimulateHint => 'デモメッセージ';

  @override
  String get mtBridgeSimulate => 'Meshtastic メッセージをシミュレートします';

  @override
  String get mtBridgeIngestOk => '通知に取り込まれます (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      '警告: ここに送信されるメッセージは ResilNet E2EE ではありません。 Meshtastic パス上の誰でもそれらを読み取ることができます。';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => '公開するテキスト';

  @override
  String get mtBridgeSend => 'Meshtastic に送信';

  @override
  String get mtBridgeEgressOk => 'Meshtastic のキューに登録されました (ログ/履歴を参照)';

  @override
  String get mtBridgeLastEgress => '最終出力';

  @override
  String get mtBridgeEgressHistory => '最近の出力';

  @override
  String get mtBridgeOffHint => 'ブリッジを使用するには、インジェスト (A) またはエグレス (B) をオンにします。';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTIC · E2EE ではありません';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'MQTT トランスポートを使用する';

  @override
  String get mtBridgeUseMqttHint =>
      'オフ = デモ ログのみ (MQTT インバウンドは無視されます)。接続時の取り込み/出力に対してオン = MQTT。';

  @override
  String get mtBridgeMqttHost => 'ブローカーホスト';

  @override
  String get mtBridgeMqttPort => 'ポート';

  @override
  String get mtBridgeMqttTls => 'TLS (mqtts) を使用する';

  @override
  String get mtBridgeMqttTlsHint =>
      '一般的なポート 8883。システム証明書を使用します。ハンドシェイク エラーでソフトが失敗します。';

  @override
  String get mtBridgeMqttAutoReconnect => '自動再接続';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'オンにすると、クライアントは切断後に再接続を試行します。ステータスには、復元されるまで接続中と表示されます。';

  @override
  String get mtBridgeMqttTopicHelpers => 'トピックヘルパー';

  @override
  String get mtBridgeMqttRegion => '地域プレフィックス (オプション)';

  @override
  String get mtBridgeMqttRegionHint =>
      '設定すると、Apply はルートを msh/<region>/2/json として再構築します (トピック ルートをオーバーライドします)。';

  @override
  String get mtBridgeMqttTopicRoot => 'JSONトピックルート';

  @override
  String get mtBridgeMqttDownlinkChannel => 'ダウンリンクチャンネル名';

  @override
  String get mtBridgeMqttApplyTopics => 'ルートを適用 → トピックを購読/公開';

  @override
  String get mtBridgeMqttAdvanced => '上級 MQTT';

  @override
  String get mtBridgeMqttAdvancedHint => 'TLS、再接続、トピック、資格情報';

  @override
  String get mtBridgeMqttTopicIn => 'トピックを購読する';

  @override
  String get mtBridgeMqttTopicOut => 'トピックを公開する';

  @override
  String get mtBridgeMqttGatewayFrom => 'ゲートウェイ ノード ID (送信元)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      '10 進数の ID または !hex — sendtext ダウンリンクに必要';

  @override
  String get mtBridgeMqttChannelIndex => 'メッシュ チャネル インデックス (オプション 0 ～ 7)';

  @override
  String get mtBridgeMqttUser => 'ユーザー名 (オプション)';

  @override
  String get mtBridgeMqttPass => 'パスワード (オプション)';

  @override
  String get mtBridgeMqttPassStored => 'パスワードはこのデバイスに保存されます (図示せず)。';

  @override
  String get mtBridgeMqttPassReplace => '新しいパスワード (空白のままにしておきます)';

  @override
  String get mtBridgeMqttPassReplaceHint => '保存されたパスワードを保持するには、空のままにします。';

  @override
  String get mtBridgeMqttPassClear => 'パスワードをクリア';

  @override
  String get mtBridgeMqttSave => 'MQTT 設定を保存する';

  @override
  String get mtBridgeMqttSaved => 'MQTT 設定が保存されました';

  @override
  String get mtBridgeMqttConnect => '接続する';

  @override
  String get mtBridgeMqttDisconnect => '切断する';

  @override
  String get mtBridgeMqttConnected => 'MQTT が接続されました';

  @override
  String get mtBridgeMqttConnecting => 'MQTT 接続中…';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT が切断されました';

  @override
  String get mtBridgeMqttError => 'MQTT エラー';

  @override
  String get mtBridgeErrModeIngest => '最初にインジェスト (A) に切り替えます';

  @override
  String get mtBridgeErrModeEgress => '最初に下り (B) に切り替えます';

  @override
  String get mtBridgeErrRate => '速度を落とす - 速度制限あり';

  @override
  String get mtBridgeErrDedupe => '重複メッセージは無視されました';

  @override
  String get mtBridgeErrLoop => 'ブリッジループを防ぐために削除されました';

  @override
  String get mtBridgeErrEmpty => 'メッセージが空です';

  @override
  String get mtBridgeErrPublish => '公開に失敗しました';

  @override
  String get mtBridgeErrNotConnected => 'MQTT が接続されていません';

  @override
  String get mtBridgeErrMissingHost => 'MQTT ブローカー ホストを入力してください';

  @override
  String get mtBridgeErrMissingTopic => 'トピックを購読して公開するを入力してください';

  @override
  String get mtBridgeErrMissingFromNode =>
      'sendtext のゲートウェイ ノード ID (from) を入力してください';

  @override
  String get mtBridgeErrConnect => 'MQTT 接続に失敗しました';

  @override
  String get mtBridgeErrConnectTls => 'MQTT TLS 接続に失敗しました';

  @override
  String get settingsData => 'データ';

  @override
  String get settingsDataHint => 'ローカル メッセージを削除してデータベースを縮小します。ID、キー、ピアは保持されます。';

  @override
  String get settingsSaveHistoryTitle => 'メッセージ履歴を保存する';

  @override
  String get settingsSaveHistorySubtitle =>
      'オフの場合、メッセージはネットワーク上の E2EE に留まり、このセッションに対してのみ保持されます (ローカル チャット履歴には残りません)。このデバイスでは、自分のテキストが平文として表示されます。';

  @override
  String get settingsPrivacy => 'プライバシー';

  @override
  String get settingsE2eeTitle => 'エンドツーエンドの暗号化';

  @override
  String get settingsE2eeSubtitle =>
      '常時オン — メッセージは送信前に RSA-OAEP + AES-GCM でシールされます。リレーと近くのホップはコンテンツを読み取ることができません。';

  @override
  String get settingsScreenshotTitle => 'スクリーンショットのアラート';

  @override
  String get settingsScreenshotSubtitle =>
      'このデバイスが画面をキャプチャしたときにチャットにシステム行を表示します';

  @override
  String get settingsNostrExpiryTitle => 'Nostr メッセージの保持時間';

  @override
  String get settingsNostrExpirySubtitle =>
      'Nostr 経由でオンラインの場合、封印した封筒をローカルに保持する期間';

  @override
  String get noticeExpiresIn => 'に有効期限が切れます';

  @override
  String get noticesTitle => 'お知らせ';

  @override
  String get noticesMeshIntro =>
      '公開掲示 — 無線範囲内にいる全員が閲覧できますが、暗号化されていません。電話から電話をオフラインでホップし、近くの ResilNet 中継ボックスにコピーが保存されるので、後から到着した人にもコピーが表示されます。';

  @override
  String get noticesMeshPublicBadge => 'PUBLIC · 暗号化されていません';

  @override
  String get noticesGeoIntro => '他の訪問者が見つけられるように、この場所に関する短いメモを追加します。';

  @override
  String get noticesEmpty => 'まだ通知はありません';

  @override
  String get noticesEmptyHint => 'この辺りの人たちに最初の通知をピンで留めてください。';

  @override
  String get noticesComposeHint => '通知を投稿します...';

  @override
  String get noticesUrgent => '緊急';

  @override
  String get noticesOpen => 'お知らせ';

  @override
  String get screenshotTaken => '* スクリーンショットを撮りました *';

  @override
  String get chatAttachImage => '画像を添付';

  @override
  String get chatImageLabel => '画像';

  @override
  String get chatImageTooLarge => '画像が大きすぎます - 別の写真を試してください';

  @override
  String get chatNostrExpiry => 'Nostr キープ';

  @override
  String geoPublicComposeHint(String channel) {
    return '$channel に送信 — パブリック';
  }

  @override
  String get settingsClearTitle => 'すべてのメッセージをクリア';

  @override
  String get settingsClearSubtitle => 'このデバイス上のすべてのチャットを削除します';

  @override
  String get settingsClearConfirmTitle => 'すべてのメッセージをクリアしますか?';

  @override
  String get settingsClearConfirmBody =>
      'これにより、このデバイス上のすべてのチャット メッセージが削除されます。\nピアとニックネームは削除されません。';

  @override
  String get settingsClearAction => 'データのクリア';

  @override
  String get settingsClearedSnack => 'データクリア';

  @override
  String settingsVersion(String version) {
    return 'バージョン $version';
  }

  @override
  String get meshBleScanning => 'BLE: ノードをスキャンしています';

  @override
  String get meshBleEsp32Scanning => 'ESP32: 近くのノードを探しています';

  @override
  String get meshBleSyncing => 'BLE: ESP32 と同期中';

  @override
  String get meshNostrPublishing => 'Nostr: 公開中';

  @override
  String get meshBleIdle => 'BLE メッシュがオン — 近くに電話がまだありません';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE メッシュ — $count 台の電話が近くにあります';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: 許可が必要です';

  @override
  String get meshBlePausedCamera => 'BLE はカメラのために一時停止しています — [開始 BLE] をタップします';

  @override
  String get meshBleStopped =>
      'BLE がオフになっています — Bluetooth がオンになっていることを確認し、[開始 BLE] をタップします';

  @override
  String get meshBleRestart => 'BLE を開始';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · ロック $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => '権限を確認して BLE を開始してください';

  @override
  String get meshNostrOffline => 'Nostr オフライン';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count 近くのピア • LoRa $lora • 同期 ~${meters}m';
  }

  @override
  String get meshLoraReady => '準備ができて';

  @override
  String get meshLoraNotReady => '準備ができていない';

  @override
  String meshGatewayProgress(String label) {
    return 'ゲートウェイ UDP: $label';
  }

  @override
  String get meshGatewayReady => 'ゲートウェイUDP ：準備完了';

  @override
  String get permissionTitle => 'BLE メッシュ ネットワークを開始するためのアクセスを許可します';

  @override
  String get permissionBody =>
      'アプリには、Bluetooth （スキャン/接続/広告）、Location （古いAndroidデバイスの場合）、およびMicrophone （チャットやお知らせのボイスノート用）が必要です。';

  @override
  String get permissionE2ee =>
      'エンドツーエンド暗号化 (E2EE)\n中継ノードはメッセージの内容を読み取ることができません';

  @override
  String get permissionReady => '権限の準備ができました';

  @override
  String get permissionRequest => '許可して続行する';

  @override
  String get permissionNotReadySnack =>
      'システムの準備がまだ整っていません - しばらく待ってからもう一度お試しください';

  @override
  String get permissionDeniedSnack =>
      '権限が不完全です — [設定] > ResilNet を開き、Bluetooth / 位置情報 / マイクを許可します';

  @override
  String get permissionMicDenied => 'マイクへのアクセスが拒否されました - 音声メモの録音を設定で許可します';

  @override
  String get permissionMicOpenSettings => '設定';

  @override
  String get permissionCameraDenied =>
      'カメラへのアクセスが拒否されました - 設定で QR コードのスキャンを許可します';

  @override
  String get permissionCameraFailed => 'QRコードをスキャンするにはカメラの許可が必要です';

  @override
  String get permissionCameraOpenSettings => '設定';

  @override
  String get permissionPhotosDenied =>
      '写真ライブラリへのアクセスが拒否されました - QR コードを保存するには設定で許可してください';

  @override
  String get permissionPhotosFailed => 'QRコードを保存するにはフォトライブラリの許可が必要です';

  @override
  String get permissionPhotosOpenSettings => '設定';

  @override
  String permissionFailedSnack(String error) {
    return '許可リクエストが失敗しました: $error';
  }

  @override
  String get permissionFooter => 'ResilNet アーキテクチャ • ストア アンド フォワード マルチホップ';

  @override
  String get onboardingSkip => 'スキップ';

  @override
  String get onboardingNext => '次';

  @override
  String get onboardingStart => '始めましょう';

  @override
  String get onboardingWelcomeTitle => 'ResilNet へようこそ';

  @override
  String get onboardingWelcomeBody =>
      'インターネットがなくても、メッシュ ネットワーク経由で ResilNet でチャットできます';

  @override
  String get onboardingFriendsTitle => '友達を簡単に追加';

  @override
  String get onboardingFriendsBody =>
      'Identity から QR を共有するか、友人の QR をスキャンして公開キーを交換します';

  @override
  String get onboardingChannelsTitle => '暗号化されたチャット + 近くのチャンネル';

  @override
  String get onboardingChannelsBody =>
      '#mesh / Area (geohash) を切り替えて近くのピアを検索します。メッセージは BLE メッシュおよび Nostr を介して E2EE に留まります。';

  @override
  String get chatTitle => 'チャット (E2EE)';

  @override
  String get chatScanTooltip => 'QR をスキャンしてピアを追加します';

  @override
  String get chatBlockTooltip => 'この送信者をブロックする';

  @override
  String get chatBlockedSnack => 'ブロック中: 通知なし / 中継なし';

  @override
  String get chatAliasTooltip => 'ニックネームを設定する';

  @override
  String get chatReceiverPemLabel => '受信者公開キー (PEM)';

  @override
  String get chatReceiverPemHint => '友達の公開キーを貼り付けます（QR / 共有ファイルから）';

  @override
  String get chatNeedPeerKey => '最初にこのピアの QR をスキャンします (検証された公開キーが必要です)';

  @override
  String get chatPeerKeyMismatch => '保存された公開キーがこのピア ID と一致しません';

  @override
  String chatVoiceFailed(String error) {
    return '音声を録音できませんでした: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return '音声メモを再生できませんでした: $error';
  }

  @override
  String get chatPlayVoice => 'ボイスメモを再生する';

  @override
  String get chatPauseVoice => '一時停止';

  @override
  String get chatVoiceLabelSent => '🎤 ボイスメモ（封印済み）';

  @override
  String get chatVoiceLabel => '🎤 ボイスメモ';

  @override
  String get chatDecryptFailed => '[復号化に失敗しました]';

  @override
  String chatSentSealed(String preview) {
    return '[封印・ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[封印済み]';

  @override
  String get chatComposeHint => 'メッセージを入力してください… (送信時に封印されます)';

  @override
  String get chatEmptyThread => 'まだメッセージはありません\n以下を入力してメッシュ上に送信します';

  @override
  String chatLoadFailed(String error) {
    return '会話を読み込めませんでした: $error';
  }

  @override
  String get chatEmojiTooltip => '絵文字';

  @override
  String get statusPending => '保留中';

  @override
  String get statusSent => '送信済み';

  @override
  String get statusRelayed => '中継された';

  @override
  String get statusDelivered => '納品済み';

  @override
  String get statusRead => '読む';

  @override
  String get statusFailed => '失敗した';

  @override
  String get chatCopy => 'コピー';

  @override
  String get chatDeleteLocal => 'このデバイスで削除';

  @override
  String get chatDeletedLocalSnack => 'このデバイスでは削除されました';

  @override
  String get chatRetry => 'リトライ';

  @override
  String get chatSendFailed => '配信されません — [再試行] をタップします';

  @override
  String get chatImageNeedInternet => 'インターネットに接続して画像を送信する';

  @override
  String get chatImageTooLargeOnline => '送信できるほど画像を圧縮できませんでした';

  @override
  String get chatOpenLinkFailed => 'リンクを開けませんでした';

  @override
  String get identityTitle => '身元';

  @override
  String get identityScanTooltip => 'カメラでQRをスキャン';

  @override
  String get identityCopiedHash => '公開鍵ハッシュがコピーされました';

  @override
  String get identityPeerSaved => 'QR から保存されたピア';

  @override
  String get identityGalleryDenied => '写真ライブラリの許可が拒否されました';

  @override
  String get identityQrSaved => 'QRをフォトライブラリに保存しました';

  @override
  String identityQrSaveFailed(String error) {
    return 'QR を保存できませんでした: $error';
  }

  @override
  String get peersTitle => 'ネットワークメンバー';

  @override
  String get qrScanTitle => 'QRをスキャンして友達を追加してください';

  @override
  String get qrInvalid => 'スキャン失敗: 無効な QR';

  @override
  String get qrIdKeyMismatch => 'QR が拒否されました: ID が公開キーと一致しません';

  @override
  String get qrCameraNotReady => 'カメラの準備ができていません';

  @override
  String get qrRetrySettings => 'もう一度試してください / 設定を開きます';

  @override
  String qrCameraOpenFailed(String error) {
    return 'カメラを開けませんでした: $error';
  }

  @override
  String get qrScanAlignHint => 'QRコードを枠内に合わせる';

  @override
  String get firmwareDownloadTitle => 'ESP32 ファームウェアをダウンロード';

  @override
  String get firmwareSourceOnline => '最新（オンライン）';

  @override
  String get firmwareSourceCached => '保存されたコピー (オフライン)';

  @override
  String get firmwareSourceBaseline => 'バンドルされたベースライン (オフライン)';

  @override
  String get firmwareSourceUnavailable => '利用可能なファームウェアがありません';

  @override
  String get firmwareBaselineIncompatible =>
      'バンドルされているファームウェアが古すぎます - インターネットに接続して新しいバージョンをダウンロードしてください';

  @override
  String get firmwareChecksumFailed => 'ファームウェアの整合性チェックに失敗しました - 点滅がブロックされました';

  @override
  String firmwareReadyFromSource(String source) {
    return 'ファームウェアの準備が完了しました: $source';
  }

  @override
  String get peersRefreshTooltip => '再読み込み';

  @override
  String get peersBlocked => 'ブロックされました';

  @override
  String get peersNearbyBle => '付近';

  @override
  String get peersRecentlyOnline => '最近オンライン';

  @override
  String get peersOnlineInArea => 'エリア内でオンライン';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return '$minutes 分前に見た';
  }

  @override
  String get peersOffline => 'オフライン';

  @override
  String peersBlockedSnack(String id) {
    return 'ブロックされました $id';
  }

  @override
  String get peersUnblockedSnack => 'ブロック解除されました';

  @override
  String get peersEmpty => 'データベースにはまだメンバーがいません\nQR をスキャンするか、BLE メッシュの検出を待ちます';

  @override
  String get peersOpenChat => 'オープンチャット';

  @override
  String get peersBlockAction => 'ブロック';

  @override
  String get peersUnblockAction => 'ブロックを解除する';

  @override
  String get channelPickerTooltip => 'チャット / #mesh / エリア';

  @override
  String get locationPickerTooltip => 'ロケーションチャンネル';

  @override
  String get transportPickerTooltip => 'メッシュ / インターネット / 自動';

  @override
  String get onlinePeopleTooltip => 'オンラインの人々';

  @override
  String get unreadDirectsTooltipEmpty => 'プライベートメッセージ';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count 件の未読プライベート メッセージ';
  }

  @override
  String get onlinePeopleTitle => '人々';

  @override
  String get onlinePeopleEmpty => 'ここにはまだオンラインの人がいません';

  @override
  String onlinePeopleCount(int count) {
    return '$count オンライン';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1・近隣+エリア';

  @override
  String get peerOnlineMeshTitle => '近くにメッシュ上の誰かがいる';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name はメッシュ上で近くにあります';
  }

  @override
  String get peerOnlineAreaTitle => 'エリア内でオンライン中の人';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name は Nostr 経由でオンラインです';
  }

  @override
  String get locationSheetTitle => '#ロケーションチャンネル';

  @override
  String get channelPinsTitle => '固定された';

  @override
  String get channelPinsHint => 'よく使うチャンネルを固定します - 常に上部に表示されます';

  @override
  String get channelPinTooltip => 'このチャンネルを固定する';

  @override
  String get channelUnpinTooltip => '固定を解除する';

  @override
  String get locationSheetIntro =>
      '正確な GPS ではなく、粗いジオハッシュを使用して近くの人々とチャットします。インターネット上のプレゼンスには匿名の Nostr キーが使用されます。';

  @override
  String get locationMeshSubtitle => '#bluetooth • ~10–50 m';

  @override
  String get locationTeleportHint => '#ジオハッシュ';

  @override
  String get locationTeleport => 'テレポート';

  @override
  String homeComposeHint(String channel) {
    return 'メッセージ $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return '$channel に送信 — パブリック';
  }

  @override
  String get messageExpiryTitle => 'に有効期限が切れます';

  @override
  String get voiceRecordTapToStart => 'タップして音声メッセージを録音します';

  @override
  String get voiceRecordTooShort => '録音が短すぎます - もう一度試してください';

  @override
  String get voiceRecordFailed => '録音を保存できませんでした - もう一度試してください';

  @override
  String get voicePttHold => '長押しして録音する';

  @override
  String get voicePttRelease => 'リリースしてプレビューする';

  @override
  String get voicePttRecording => '録音中…';

  @override
  String get voicePttDraftReady => 'ボイスメモの準備完了';

  @override
  String get voicePttDiscard => '破棄';

  @override
  String get voicePttReRecord => '再度録音します';

  @override
  String get voicePttSend => 'ボイスメモを送信する';

  @override
  String get voicePttPlayPreview => 'プレビューを再生する';

  @override
  String get voicePttStopPreview => 'プレビューを停止する';

  @override
  String get noticesBackfilling => '通知を読み込んでいます…';

  @override
  String get noticesNostrOnline => 'Nostr オンライン';

  @override
  String get noticesNostrOffline => 'Nostr オフライン — 速報にはインターネットが必要です';

  @override
  String noticesBackfillLoaded(int count) {
    return '$count 通知をロードしました';
  }

  @override
  String get noticePublishFailed => 'エリアボードに通知を発行できませんでした。 Nostr 接続を確認してください。';

  @override
  String get noticeMeshPublishNoLink =>
      'ローカルに保存されました。他の人が受信できるように、近くのメッシュ無線 (または Wi‑Fi ゲートウェイ) に接続します。';

  @override
  String noticeMeshPublishSent(int count) {
    return 'BLE 経由で近くの $count デバイスに通知が送信されます。';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      '近くの無線が認識されましたが、BLE の書き込みに失敗しました。通知画面で両方のアプリを開いたままにし、再試行します (または ESP32 リレーを使用します)。';

  @override
  String get noticeMeshPublishNoGatt =>
      'このデバイスの BLE 受信機の準備ができていません。 Bluetooth を切り替えて、通知を再度開きます。';

  @override
  String get noticeDelete => '通知の削除';

  @override
  String get noticeDeleteConfirmTitle => 'この通知を削除しますか?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'これにより、このデバイス上でのみ削除されます。すでに受け取っている他の人には引き続き表示されます。';

  @override
  String get noticeDeleted => '通知が削除されました';

  @override
  String get chatNoticeHidden => 'エリア通知 — 通知を開く';

  @override
  String get identityDisplayNameTitle => '表示名';

  @override
  String get identitySaveName => '名前を保存する';

  @override
  String get identityUserIdLabel => 'ユーザーID（公開鍵ハッシュ）';

  @override
  String get identityCopyHashTooltip => '公開鍵ハッシュをコピーする';

  @override
  String get identityMyQrTitle => '私のQR (ID + pubKey + 名前)';

  @override
  String identityQrFailed(String error) {
    return 'QRを作成できませんでした\n$error';
  }

  @override
  String get identitySaving => '保存中…';

  @override
  String get identitySaveQr => 'QRをフォトライブラリに保存';

  @override
  String get identityOpenScanner => 'カメラを開いて QR をスキャンします';

  @override
  String get identityQrHelp =>
      '友人にこれをスキャンしてもらい、公開キーを保存し、（必要に応じて）あなたを認証済み発行者として設定してもらいます';

  @override
  String get identityChatTip => 'ヒント: チャットで QR をスキャンして E2EE の公開キーを追加することもできます';

  @override
  String get infoOpen => '概要/情報';

  @override
  String get docsGuideTitle => 'ユーザーガイド';

  @override
  String get docsGuideSubtitle => 'ブラウザで開きます';

  @override
  String get docsOpenAction => 'オープンガイド';

  @override
  String get docsOpenFailed => 'ユーザーガイドを開けませんでした';

  @override
  String get firmwareOtaGuideTitle => 'フラッシュガイドとOTAプロトコル';

  @override
  String get firmwareOtaGuideSubtitle => 'Web ガイドを開きます — .bin のダウンロードと完全な手順';

  @override
  String get firmwareWebDownloadsTitle => 'Web からのファームウェアのダウンロード';

  @override
  String get firmwareWebDownloadsSubtitle => 'ドキュメント サイトのバージョンごとのリンクとチェックサム';

  @override
  String get inviteCopyShortLink => '短いリンクをコピーする';

  @override
  String get inviteShareLink => 'リンクを共有する';

  @override
  String get inviteShowFullLink => 'フルリンク';

  @override
  String get inviteCopyFullLink => 'リンク全体をコピーする';

  @override
  String get inviteLinkCopied => 'リンクがコピーされました';

  @override
  String get inviteLongPressHint => '長押しするとリンクアクションが実行されます';

  @override
  String get inviteSendInChat => 'ResilNet チャットに送信…';

  @override
  String get inviteSendInChatHint => 'すでに公開鍵を持っている人のみ';

  @override
  String get inviteSendInChatEmpty =>
      'メッセージ可能なチャットはまだありません。\nまず QR をスキャンし、エリア/メッシュを開くか、アプリの外部でリンクを共有します。';

  @override
  String get inviteSentToChat => 'チャットで招待を送信';

  @override
  String get infoTabInfo => '情報';

  @override
  String get infoTabSettingsHint => '言語、E2EE、およびデータ ツールのメニューから [設定] を開きます';

  @override
  String get infoHowToTitle => '使用方法';

  @override
  String get infoHowToBody =>
      '• チャンネルアイコンをタップしてチャット/#mesh/エリアを切り替えます\n• 場所をタップしてジオハッシュのサイズを選択します\n• メンバーまたはオンライン中の人をタップします\n• ⋮ から ID/QR を開いて直接キーを交換します\n• エリア「パブリック」は、平文ルームではなく、封印された E2EE を各オンライン ピアに送信します。';

  @override
  String get infoFeaturesTitle => '特徴';

  @override
  String get infoFeatureOffline => 'Bluetooth Low Energy によるオフライン メッセージング';

  @override
  String get infoFeatureE2ee => 'RSA-OAEP + AES-GCM (ノイズではない) によるエンドツーエンド暗号化';

  @override
  String get infoFeatureMultihop => 'メッセージは近くのピアを経由してさらに遠くに送信できます';

  @override
  String get infoFeatureBridge => '密封された封筒用のハイブリッド メッシュ ↔ インターネット (Nostr)';

  @override
  String get infoFeatureGeo => '近くにいる人のためのローカル geohash チャネル (ディスカバリー UX)';

  @override
  String get infoFeatureNotices => '#mesh と Area の有効期限に関するお知らせ';

  @override
  String get infoPrivacyTitle => 'プライバシー';

  @override
  String get infoPrivacyNoRoom => '電線上に平文の村やパブリック チャット ルームはありません';

  @override
  String get infoPrivacyFanout => 'エリア送信 = 既知の公開鍵を持つピアへの密閉された 1:1 ファンアウト';

  @override
  String get infoPrivacyPresence => 'インターネット エリアのプレゼンスは一時的な Nostr キーを使用します';

  @override
  String get infoSymbolsTitle => '記号';

  @override
  String get infoSymBle => 'Bluetooth の直接リンク';

  @override
  String get infoSymMesh => 'メッシュ経由で到達可能 (その他は転送)';

  @override
  String get infoSymInternet => 'インターネット経由 (Nostr) — 密封された封筒';

  @override
  String get infoSymBridge => 'メッシュ↔インターネットブリッジパス経由で到着';

  @override
  String get infoSymOffline => 'オフライン — 現在アクセスできません';

  @override
  String get infoSymInArea => 'このロケーションチャンネルのエリア内';

  @override
  String get infoSymE2eeOk => 'エンドツーエンドの暗号化されたセッション';

  @override
  String get infoSymE2eeFail => '暗号化は利用できません - 機密テキストは送信しないでください';

  @override
  String get infoSymVerified => 'ID が検証済み / 既知のキー';

  @override
  String get infoSymBlocked => 'ブロック';

  @override
  String get infoSymUnread => '未読のプライベートメッセージ';

  @override
  String get infoEmergencyTitle => '緊急モード';

  @override
  String get infoEmergencyBody =>
      'ホーム画面の ResilNet タイトルをトリプルタップして、このデバイス上のメッセージ、キー、ID をワイプします。';

  @override
  String get infoLegendNote =>
      'わかりやすくするために、いくつかのパス アイコンをここに記載します。チャットの配信ティックは引き続き主要な送信ステータスです。';

  @override
  String get dangerZoneTitle => '危険地帯';

  @override
  String get dangerZoneSubtitle =>
      'このデバイス上のメッセージ、暗号化キー、Nostr ID、ピア、ニックネームを削除します。再度セットアップします。';

  @override
  String get panicWipeTitle => '緊急時の拭き取り';

  @override
  String get panicWipeSubtitle =>
      'ローカルのすべてを消去します - ホーム タイトルを 3 回タップするのと同じです (ダブルタップするとラジオが更新されます)。';

  @override
  String get panicWipeConfirmTitle => 'ローカルデータをすべて消去しますか?';

  @override
  String get panicWipeConfirmBody =>
      'これにより、この電話上のチャット、キー、ID が完全に削除されます。\nピアは、新しい ID と QR キーを再交換する必要があります。\nこれを元に戻すことはできません。';

  @override
  String get panicWipeAction => 'すべてを拭きます';

  @override
  String get panicWipeSnack => 'ローカル ID が消去されました - 再度セットアップしてください';

  @override
  String panicWipeFailed(String error) {
    return 'ワイプに失敗しました: $error';
  }

  @override
  String get meshBridgeTitle => 'メッシュブリッジ';

  @override
  String get meshBridgeSubtitle =>
      'オン (デフォルト) の場合、密封されたエンベロープは BLE メッシュとインターネット (Nostr) の両方を一緒に使用できるため、近くのメッシュ アイランドが接続できます。オフの場合、送信は 1 つのパスのみを使用し、プレーンテキストをワイヤ上に送信しません。';

  @override
  String get favoritesTitle => 'お気に入り';

  @override
  String get favoritesAdd => 'お気に入りに追加';

  @override
  String get favoritesRemove => 'お気に入りから削除';

  @override
  String get favoritesEmpty => 'まだお気に入りはありません — メンバーリストからピアにスターを付けます';

  @override
  String get favoritesNearbyTitle => '近くのお気に入り';

  @override
  String favoritesNearbyBody(String name) {
    return '$name はメッシュ上で近くにあります';
  }

  @override
  String get favoritesInAreaTitle => '地域のお気に入り';

  @override
  String favoritesInAreaBody(String name) {
    return '$name はこのエリアでオンラインです';
  }

  @override
  String get topologyTitle => 'メッシュトポロジー';

  @override
  String get topologySubtitle => 'メッシュアナウンスからのピアと接続のヒント (読み取り専用)';

  @override
  String get topologyConnectedNow => '現在接続中 (BLE)';

  @override
  String get topologyNearby => '近く (BLE)';

  @override
  String get topologyKnown => '既知のピア';

  @override
  String get topologyEmpty => 'まだ学習したピアはありません - BLE をオンにして近くにいてください';

  @override
  String get topologyYou => 'あなた';

  @override
  String topologyStats(int peers, int links) {
    return '$peers ピア · $links リンク';
  }

  @override
  String get topologyGraphHint =>
      '近くのメッシュ検出から推定 — デバイスが強調表示されます。ピアをタップしてチャットを開きます。';

  @override
  String get topologyOpen => 'メッシュトポロジー';

  @override
  String get slashHelpTitle => 'コマンド';

  @override
  String get slashHelpBody =>
      '/help — このリスト\n/who — 現在のチャネルでオンラインの人々\n/drop <text> — 封印された通知をここに固定します (E2EE ファンアウト)\n\n完全なガイド: 以下のガイドを開く、または [設定] → [ユーザー ガイド] を使用します。';

  @override
  String get slashWhoEmpty => '現在このチャンネルにオンラインしている人はいません';

  @override
  String slashWhoTitle(int count) {
    return 'オンライン ($count)';
  }

  @override
  String get slashDropNeedText => '使用法: /drop メモのテキスト';

  @override
  String slashDropDone(String channel) {
    return '$channel に通知が投下されました';
  }

  @override
  String get slashUnknown => '不明なコマンド — /help を試してください';

  @override
  String get announceOpen => 'お知らせ';

  @override
  String get announceTitle => 'お知らせ';

  @override
  String get announceEmpty =>
      'まだボードがありません — ロックされた通知またはオープン通知を投稿するためにボードを作成してください';

  @override
  String get announceCreate => 'ボードの作成';

  @override
  String get announceCreateHint => '理事会名';

  @override
  String get announceDefaultTitle => 'コミュニティ掲示板';

  @override
  String get announceSettings => 'ボードの設定';

  @override
  String get announceAllowLocked => 'ロックされた（暗号化された）投稿を許可する';

  @override
  String get announceAllowLockedSub => 'ボードキーに暗号化 - リーダーはアクセスする必要があります';

  @override
  String get announceAllowOpen => 'オープン（プレーンテキスト）投稿を許可する';

  @override
  String get announceAllowOpenSub =>
      'E2EE ではありません - メッシュ/リレーで読み取り可能です。デフォルトではオフです。';

  @override
  String get announceComposeHint => 'お知らせを書いて…';

  @override
  String get announceMediaInternetOnly =>
      '写真/音声アナウンスはインターネット経由で送信されます (BLE ではありません)';

  @override
  String get announceNeedInternet => 'インターネットに接続して写真や音声アナウンスを送信します';

  @override
  String announceVoiceFailed(String error) {
    return '音声を録音できませんでした: $error';
  }

  @override
  String get announceImageTooLarge => '画像が大きすぎます (最大約 180 KB)';

  @override
  String get announcePlayVoice => 'ボイスメモを再生する';

  @override
  String get announceImageLabel => '📷 画像';

  @override
  String get announceAudioLabel => '🎤 ボイスメモ';

  @override
  String get announceModeLocked => 'ロックされています';

  @override
  String get announceModeOpen => '開ける';

  @override
  String get announceOpenBadge => 'OPEN · 暗号化されていない';

  @override
  String get announceLockedBadge => 'ロックされています';

  @override
  String get announceLockedPlaceholder => '暗号化 — 読み取りアクセスを要求します';

  @override
  String get announceRequestAccess => 'アクセスをリクエストする';

  @override
  String get announceRequestSent => 'ボード所有者に送信されたアクセス要求';

  @override
  String get announceRequestFailed => 'アクセスを要求できませんでした (所有者の公開キーが必要です)';

  @override
  String get announceOpenConfirmTitle => '暗号化せずに投稿しますか?';

  @override
  String get announceOpenConfirmBody =>
      '開いている投稿は E2EE ではありません。パス (メッシュ/リレー) 上の誰でもそれらを読むことができます。続く？';

  @override
  String get announcePostAction => '役職';

  @override
  String get announcePendingRequests => 'アクセスリクエスト';

  @override
  String get announceApprove => '承認する';

  @override
  String get announceDeny => '拒否';

  @override
  String get announceGranted => 'この掲示板ではロックされた投稿を読むことができます';

  @override
  String get announceOwner => 'あなたはこのボードの所有者です';

  @override
  String get announceCopyInvite => '招待文をコピーする';

  @override
  String get announceShowInviteQr => '招待QRを表示';

  @override
  String get announceScanInviteQr => 'ボード招待 QR をスキャンします';

  @override
  String get announceFollow => '招待からボードをフォローする';

  @override
  String get announceFollowHint => '所有者からの招待テキストまたは ResilNet リンクを貼り付けます';

  @override
  String get announceFollowOk => '次のボード';

  @override
  String announceFollowOkNamed(String title) {
    return '「$title」に続きます';
  }

  @override
  String get announceFollowFail => '招待が無効か破損しています';

  @override
  String get announceInviteCopied => '招待テキストをコピーしました';

  @override
  String get announceInviteSaveQr => 'QRを保存';

  @override
  String get announceInviteShare => '招待を共有する';

  @override
  String get announceFollowFromCompose => 'メッセージ ボックスでボードへの招待が検出されました';

  @override
  String get peerConfirmAddTitle => 'ネットワークメンバーを追加しますか?';

  @override
  String peerConfirmAddBody(String name) {
    return '「$name」と公開キーを追加して、非公開でメッセージを送信できるようにしますか?';
  }

  @override
  String get peerConfirmAdd => 'メンバーを追加';

  @override
  String peerAddedOk(String name) {
    return '$name をネットワークメンバーに追加しました';
  }

  @override
  String get peerAddFromCompose => 'メッセージ ボックスで ID/公開キーが検出されました';

  @override
  String get peerHashCopied => '公開鍵ハッシュがコピーされました';

  @override
  String get peerHashOpenChat => 'オープンチャット';

  @override
  String get peerHashAddHint =>
      'ハッシュがコピーされました。 E2EE の完全な公開キーを追加できるように、ID リンクまたは QR を共有するよう依頼します。';

  @override
  String get peerQrNoCode => 'この画像には ResilNet QR が見つかりません';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet ID: 「$name」\nリンクを開くかチャットに貼り付け→メンバーを追加\nまたは、ID QR をスキャンします。';
  }

  @override
  String get identityShareInvite => 'ID リンクを共有する';

  @override
  String get identityInviteCopied => 'ID リンクがコピーされました';

  @override
  String announceInviteSharePreamble(String title) {
    return '理事会への招待: 「$title」\nResilNet を開く → コミュニティボード → 招待からフォローする\nまたは、QR をスキャンするか、下のリンクをタップしてください。';
  }

  @override
  String get announceConfirmFollowTitle => 'この掲示板をフォローしますか？';

  @override
  String announceConfirmFollowBody(String title) {
    return 'この招待から「$title」をフォローしますか?';
  }

  @override
  String get announceConfirmFollow => 'フォローする';
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => '刷新ResilNet...';

  @override
  String get appRefreshed => '刷新 - 无线电和发现重新启动';

  @override
  String appRefreshFailed(String error) {
    return '刷新失败：$error';
  }

  @override
  String get appRefreshTitleHint => '双击=软刷新。长按=硬恢复。三击 = 紧急擦拭。';

  @override
  String get softRefreshTipTitle => '如果ResilNet感觉卡住了';

  @override
  String get softRefreshTipBody =>
      '双击 ResilNet（左上角）可进行软无线电刷新。如果仍然卡住：长按标题，使用 ⋮ → 硬恢复，或设置。三击仅用于紧急擦除。';

  @override
  String get softRefreshTipGotIt => '知道了';

  @override
  String get infoSoftRefreshTitle => '如果应用程序感觉卡住了';

  @override
  String get infoSoftRefreshStepRefresh => '双击ResilNet（左上角）→软刷新收音机和附近的人';

  @override
  String get infoSoftRefreshStepHard => '仍然停滞不前？长按标题，或“设置” “→硬恢复”';

  @override
  String get infoSoftRefreshStepWait => '等待结果小吃栏，然后重试。会话重置会保留您的密钥。';

  @override
  String get infoSoftRefreshStepWipe => '三击 = 紧急擦除（删除本地数据）——仅在有意情况下';

  @override
  String get appRecoverySection => '应用程序恢复';

  @override
  String get appRecoverySectionSubtitle =>
      '当应用程序感觉冻结时使用。软=标题双击。硬恢复更强。会话重置会重新启动服务而不擦除密钥。';

  @override
  String get appHardRecoverAction => '硬恢复';

  @override
  String get appHardRecovering => '硬恢复中…';

  @override
  String get appSessionResetAction => '重置用户会话';

  @override
  String get appSessionResetRunning => '正在重置会话...';

  @override
  String get appSessionResetConfirmTitle => '重置会话？';

  @override
  String get appSessionResetConfirmBody => '重新启动该设备上的 ResilNet 服务。您的身份密钥将被保留。';

  @override
  String get appRecoveryBusy => '恢复已在运行...';

  @override
  String get appRecoveryOk => '恢复完成';

  @override
  String get appRecoveryPartial => '恢复已完成，但跳过了一些步骤 - 如果仍然卡住，请重试';

  @override
  String get appRecoveryFailed => '恢复失败 - 尝试会话重置，或从操作系统强制退出应用程序';

  @override
  String get localWifiTitle => '本地Wi‑Fi';

  @override
  String get localWifiSubtitle => '无需互联网即可链接附近的设备 — 与在一个 LAN 上一样。';

  @override
  String get localWifiNotGatewayHint => '不是 ESP32 LoRa 网关 SoftAP。这仅是电话↔电话/LAN。';

  @override
  String get localWifiUnavailable => '本地 Wi‑Fi 尚未准备好 - 等待应用程序启动。';

  @override
  String get lxmfBridgeTitle => '主节点';

  @override
  String get lxmfBridgeSubtitle =>
      'Wi‑Fi 上的可选 Mac 或 Pi 可以中继密封聊天。默认关闭。不取代端到端加密。';

  @override
  String get lxmfBridgeEnable => '使用主节点';

  @override
  String get lxmfBridgeDisabledHint => '仅当桥接应用在此网络上的Mac或Pi上运行时才开启。';

  @override
  String lxmfBridgeOnline(String dest) {
    return '在线 — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return '无法到达主节点 - $error';
  }

  @override
  String get lxmfBridgeBaseUrl => '主节点地址';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP 或 http://IP:端口 — 例如 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => '对等 → LXMF 目标 (JSON)';

  @override
  String get lxmfBridgeRefresh => '保存并刷新状态';

  @override
  String get lxmfBridgeLabHint => '高级：labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => '主节点设置';

  @override
  String get lxmfBridgeCheckConnection => '检查连接';

  @override
  String get lxmfBridgeStatusOnline => '连接到主节点';

  @override
  String get lxmfBridgeStatusOffline => '主节点不可达';

  @override
  String get lxmfBridgeYourDest => '该节点地址（分享给朋友）';

  @override
  String get lxmfBridgeCopyDest => '复制地址';

  @override
  String get lxmfBridgeDestCopied => '地址已复制';

  @override
  String get lxmfBridgeLinkedPeers => '已链接的朋友';

  @override
  String get lxmfBridgeLinkedPeersHint => '每个朋友都需要一次他们的主节点地址。那么密封聊天就可以使用这个路径。';

  @override
  String get lxmfBridgeNoLinks => '还没有好友建立联系。';

  @override
  String get lxmfBridgeAddLink => '链接好友';

  @override
  String get lxmfBridgePickPeer => '朋友';

  @override
  String get lxmfBridgePeerDest => '他们的主节点地址';

  @override
  String get lxmfBridgePeerDestHint => '主节点屏幕上的 32 字符代码';

  @override
  String get lxmfBridgeInvalidDest => '该地址看起来无效。粘贴其主节点的完整代码。';

  @override
  String get lxmfBridgeRemoveLink => '取消链接';

  @override
  String get lxmfBridgeSaveLink => '节省';

  @override
  String get lxmfBridgeLinkSaved => '好友已链接';

  @override
  String get lxmfBridgeNoPeers => '尚无可发送消息的联系人 - 请先添加好友。';

  @override
  String get lxmfBridgeHelp =>
      '保持网桥在 Mac/Pi 上运行。该路径保留在您的 LAN 上 — 它不是 LoRa，也不会取代互联网或蓝牙网状网络。';

  @override
  String get localWifiModeHotspot => '附近';

  @override
  String get localWifiModeRouter => '路由器';

  @override
  String get localWifiHotspotIntro =>
      '一台设备共享一个个人热点。其他人加入该热点，然后 ResilNet 在本地网络上找到他们。';

  @override
  String get localWifiHostAction => '创建网络（主机）';

  @override
  String get localWifiJoinAction => '加入网络';

  @override
  String get localWifiHostSteps =>
      '1. 打开 iOS/Android 设置并打开个人热点（或互联网共享）。\n2. 告诉朋友热点名称（和密码）。\n3. 返回此处并点击“热点已打开 - 开始等待”。';

  @override
  String get localWifiHostReady => '热点已开启 — 开始等待';

  @override
  String get localWifiHostWaiting => '等待好友加入……';

  @override
  String get localWifiJoinSteps =>
      '1. 打开系统设置并加入好友的个人热点。\n2. 返回此处并点击“我已连接 — 搜索”。';

  @override
  String get localWifiJoinReady => '我已连接 — 搜索';

  @override
  String get localWifiRouterIntro =>
      '将每个设备连接到同一个 Wi‑Fi 路由器/AP。路由器不需要互联网——只需要共享本地网络。';

  @override
  String get localWifiRouterSearch => '搜索此 Wi‑Fi';

  @override
  String get localWifiRefreshNetwork => '刷新Wi‑Fi信息';

  @override
  String get localWifiRouterNoWifiTitle => '不在 Wi‑Fi 上';

  @override
  String get localWifiRouterNoWifiBody => '在系统设置中加入路由器的Wi‑Fi，然后再次搜索。';

  @override
  String get localWifiDiscovering => '正在本地搜索Wi‑Fi……';

  @override
  String get localWifiPeersFound => '该网络上的设备';

  @override
  String get localWifiStop => '停止';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi 名称不可用';

  @override
  String get localWifiStubBanner => '等待 LAN 插座...';

  @override
  String get localWifiLiveBanner => 'LAN 发现实时 (UDP) — 在此 Wi‑Fi 上宣布 + 密封聊天';

  @override
  String get localWifiEmptyHotspot => '还没有设备。\n检查朋友是否加入了您的热点并允许本地网络访问。';

  @override
  String get localWifiEmptyRouter =>
      '还没有设备。\n相同的SSID？允许本地网络吗？某些路由器会阻止设备到设备的流量（AP 隔离）。';

  @override
  String get localWifiIsolationHelp => '为什么我们找不到彼此？';

  @override
  String get localWifiIsolationTitle => '路由器可能会隔离客户端';

  @override
  String get localWifiIsolationBody =>
      '如果 AP/客户端隔离（或访客网络）打开，同一 Wi‑Fi 上的电话无法通话。关闭隔离、使用主 SSID 或切换到附近（热点）模式。';

  @override
  String get localWifiPeerReady => '准备聊天（有钥匙）';

  @override
  String get localWifiPeerNeedKey => '发现 — 扫描二维码交换密钥';

  @override
  String get localWifiErrorTitle => '本地 Wi‑Fi 错误';

  @override
  String get localWifiErrorBody => '出了点问题。停下来再试一次。';

  @override
  String get preparingSystem => '正在准备系统...';

  @override
  String get bootFailedTitle => '无法启动';

  @override
  String get retry => '再试一次';

  @override
  String get bootRecoveryAction => '启动新身份（擦除本地数据）';

  @override
  String get bootRecoveryConfirmTitle => '开始新的身份？';

  @override
  String get bootRecoveryConfirmBody =>
      '这将永久删除该设备上的本地聊天、密钥和身份。\n同行必须使用您的新身份再次扫描您的二维码。\n此操作无法撤消。';

  @override
  String get bootRecoveryRunning => '重置本地身份...';

  @override
  String get bootRecoverySuccess => '本地身份重置完成';

  @override
  String bootRecoveryFailed(String error) {
    return '无法重置身份：$error';
  }

  @override
  String get cancel => '取消';

  @override
  String get save => '节省';

  @override
  String get close => '关闭';

  @override
  String get start => '开始';

  @override
  String get send => '发送';

  @override
  String get settings => '设置';

  @override
  String get language => '语言';

  @override
  String get languageSubtitle =>
      '默认情况下，应用程序遵循您的手机语言（如果支持）。其他语言则回归英语。您还可以在此处锁定语言。';

  @override
  String get languageSystem => '系统默认';

  @override
  String get languageThai => '泰国';

  @override
  String get languageEnglish => '英语';

  @override
  String get notificationsTooltip => '通知设置';

  @override
  String get enableMessageNotifications => '启用消息通知';

  @override
  String get settingsNotificationsSubtitle => '1:1 消息和在线人员（本地警报）';

  @override
  String get networkMembersTooltip => '网络成员';

  @override
  String get identityQrTooltip => '身份/二维码';

  @override
  String get feedDirects => '聊天';

  @override
  String get feedMesh => '＃网';

  @override
  String get feedGeo => '区域';

  @override
  String get feedDirectsSubtitle => '私有E2EE消息';

  @override
  String feedMeshSubtitle(Object ble) {
    return '附近的同行 (BLE)';
  }

  @override
  String get feedGeoSubtitle => 'Geohash 发现通道';

  @override
  String get peerIdHint => '粘贴接收者 ID（公钥哈希）以开始聊天';

  @override
  String get directsEmpty =>
      '尚无聊天 — 扫描二维码或粘贴接收者 ID 即可开始\n消息在发送前使用 E2EE 进行密封 (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • 点击即可打开聊天';

  @override
  String get meshIntro =>
      'BLE范围内的对等点 - 点击进行私人 E2EE 聊天（#mesh 上没有公开撰写）\n通过混合路由器发送（在线时BLE + LoRa + Nostr）';

  @override
  String get meshEmptyRunning => '附近还没有对等点 - 在 BLE 范围内的另一台设备上打开应用程序';

  @override
  String get meshEmptyStopped => 'BLE 未运行 — 授予蓝牙/位置权限';

  @override
  String get meshNearbyPrefix => '附近';

  @override
  String get meshRetentionTitle => '自动删除消息';

  @override
  String get meshRetentionSubtitle => '较旧的本地聊天记录会自动删除';

  @override
  String get meshRetentionKeep => '保持';

  @override
  String get meshRetention1Day => '1天';

  @override
  String get meshRetention3Days => '3天';

  @override
  String get meshRetention7Days => '7天';

  @override
  String get refreshLocationTooltip => '刷新位置';

  @override
  String get geoIntro =>
      '在此 geohash 中在线的人可以以 1:1 的方式发送消息，或者通过区域公共扇出（每个对等点仍然密封的 E2EE - 非明文）';

  @override
  String geoEmpty(String channel) {
    return '$channel 中尚未有人在线\n使用交通工具 → 互联网/汽车，等待 Nostr，刷新位置';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return '$channel 在线 • 点击 1:1 E2EE';
  }

  @override
  String get geoPeerNearbySubtitle => '附近（等待区域存在） • 点击 1:1 E2EE';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return '在 $channel 中的 Nostr 上看到 • 仅发现（旧版）';
  }

  @override
  String get geoPeerDiscoverOnlySnack => '传统的匿名存在——等待绑定的对等点或交换 QR';

  @override
  String get bleRadioNearbySubtitle => 'BLE 附近 — 扫描二维码开始 1:1 E2EE';

  @override
  String get geoInternetDiscoverHint => '区域互联网发现需要 Nostr 连接（设置 → 传输 → 互联网/自动）';

  @override
  String get geoEmptyNoLocation => '位置尚未解析 - 允许 GPS 并刷新以在 Nostr 上发布您的 geohash';

  @override
  String get geoEmptyNeedsPermission => '位置权限被拒绝 — 在“设置”→“隐私”→“位置”中允许 ResilNet';

  @override
  String get geoEmptyServicesDisabled => '定位服务已关闭 - 在“设置”中将其打开';

  @override
  String get geoEmptyNoGpsFix =>
      '无法获取 GPS 修复（在 Wi‑Fi iPad 上常见）- 在下面手动设置 geohash';

  @override
  String get geoEmptyTeleportHint => '点击地点图标→输入geohash（例如w5）→传送';

  @override
  String get geoSetGeohashManually => '设置地理哈希值';

  @override
  String get geoTeleportHint =>
      '没有GPS？输入 geohash 前缀（2–7 个字符，例如 w5）并点击 Teleport';

  @override
  String get geoTeleportInvalid =>
      '无效的 geohash — 仅使用 base32 字母/数字（例如 w5 或 w5jt8）';

  @override
  String geoTeleportOk(String channel) {
    return '区域设置为$channel';
  }

  @override
  String geoManualActive(String channel) {
    return '手动区域：$channel（GPS刷新将覆盖）';
  }

  @override
  String get geoEmptyNoNostr => 'Nostr 未准备好 — 点击“重新连接”（0/0 直到初始化成功）';

  @override
  String get geoEmptyMeshOnly => '传输仅限网状 - 切换到互联网或自动以发现 Nostr 上的对等点';

  @override
  String geoEmptyWaiting(String channel) {
    return '$channel 中尚未有人 - 在两台设备上保持区域 + 互联网打开并等待约 60 秒';
  }

  @override
  String get geoChannelFallback => '＃区域';

  @override
  String get geoRefreshLocation => '刷新位置';

  @override
  String get settingsClearLocationTitle => '清晰的位置';

  @override
  String get settingsClearLocationSubtitle => '删除 GPS/传送 geohash（区域变为#—）';

  @override
  String get settingsClearLocationConfirmTitle => '位置明确吗？';

  @override
  String get settingsClearLocationConfirmBody =>
      '删除此设备上存储的 geohash。之后您可以再次刷新 GPS 或传送。';

  @override
  String get settingsClearLocationAction => '清晰的位置';

  @override
  String get settingsClearLocationSnack => '位置已清除';

  @override
  String get chatVoiceTooLarge => '语音注释太大 - 最多约 30 秒';

  @override
  String get chatVoiceNeedInternet => '语音笔记需要互联网 (Nostr) — 对于单独的 BLE 来说太大';

  @override
  String get chatVoiceSentInternet => '通过互联网发送语音留言';

  @override
  String get noticeAnonMention => '提到';

  @override
  String get noticeAnonDm => '直接留言';

  @override
  String get noticeAnonHug => '拥抱';

  @override
  String get noticeAnonSlap => '拍击';

  @override
  String get noticeAnonBlock => '堵塞';

  @override
  String get noticeAnonNeedKey => '还没有公钥——先用二维码进行1:1交换';

  @override
  String get noticeAnonActionSent => '发送';

  @override
  String noticeAnonBlocked(String anon) {
    return '已阻止 $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '*拥抱$anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* 打 $anon *';
  }

  @override
  String get geoReconnectNostr => '重新连接Nostr';

  @override
  String get nostrSectionTitle => 'Nostr继电器';

  @override
  String get nostrSectionSubtitle => '互联网消息传递和区域发现使用这些中继。如果状态保持离线，请点击重新连接。';

  @override
  String nostrStatusOnline(int connected, int total) {
    return '已连接 $connected/$total';
  }

  @override
  String get nostrStatusOffline => '离线 — 已列出继电器但未连接';

  @override
  String get nostrStatusNotInit => '未开始 (0/0) — 点击重新连接进行初始化';

  @override
  String get nostrReconnectAction => '重新连接Nostr';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr 已连接 ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed => '仍处于离线状态 — 检查 Wi‑Fi/cellular 或重试';

  @override
  String nostrReconnectFailedDetail(String error) {
    return '失败：$error';
  }

  @override
  String get nostrReconnecting => '连接到继电器...';

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return '$channel 中的互联网 (Nostr) • 密封聊天就绪';
  }

  @override
  String get transportModeTitle => '区域交通';

  @override
  String get transportModeSubtitle =>
      '网格 = BLE 附近（无线电），当没有 Nostr 时 · 互联网和汽车 = Nostr 人员列表';

  @override
  String get transportModeMesh => '网';

  @override
  String get transportModeInternet => '互联网';

  @override
  String get transportModeAuto => '汽车';

  @override
  String get geoPublicHint => '向该领域的所有人在线公开消息';

  @override
  String get geoPublicSend => '民众';

  @override
  String geoPublicHelp(int count) {
    return '密封扇出到 $count 在线对等点 - 每个人都会收到一个私人信封';
  }

  @override
  String geoPublicSent(int count) {
    return '发送至该区域中的 $count 对等点';
  }

  @override
  String get geoPublicSentNone =>
      '没有在线可发送消息的对等点 — 与拥有密钥的对等点打开区域/网格，或者等待 BLE/Nostr';

  @override
  String get areaPublicBadge => '区域公共';

  @override
  String get geoErrorPermission => '无法读取位置 - 检查位置权限';

  @override
  String get geoPrecisionRegion => '地区';

  @override
  String get geoPrecisionProvince => '省';

  @override
  String get geoPrecisionCity => '城市';

  @override
  String get geoPrecisionNeighborhood => '邻里';

  @override
  String get geoPrecisionBlock => '堵塞';

  @override
  String get aliasTitle => '设置昵称（联系人别名）';

  @override
  String get aliasHintBody => '此别名仅存储在此设备上（仅限本地）\n它永远不会与 E2EE 流量一起发送';

  @override
  String get aliasLabel => '昵称';

  @override
  String get aliasHint => '例如“村长”、“P\'Somchai”……';

  @override
  String get settingsDevices => '设备';

  @override
  String get settingsFirmwareTitle => '下载/更新ESP32固件';

  @override
  String get settingsFirmwareSubtitle => '下载.bin文件并通过OTA更新ESP32板';

  @override
  String get mtBridgeTitle => 'Meshtastic桥';

  @override
  String get mtBridgeSettingsSubtitle => '纯文本 A/B 桥 — 不是 ResilNet E2EE';

  @override
  String get mtBridgeIntro =>
      '在 Meshtastic 和 ResilNet 之间移动短明文。模式A和B不能同时运行。这不是端到端加密。';

  @override
  String get mtBridgeModeLabel => '模式';

  @override
  String get mtBridgeModeOff => '离开';

  @override
  String get mtBridgeModeA => '摄取A';

  @override
  String get mtBridgeModeB => '出口B';

  @override
  String get mtBridgeModeOffShort => '离开';

  @override
  String get mtBridgeModeAShort => '在A';

  @override
  String get mtBridgeModeBShort => '输出B';

  @override
  String get mtBridgeMutexHint => '选择一种模式会自动关闭另一种模式。不支持同时 A+B。';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => '演示（记录）';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      '入站文本在“通知”下显示为#meshtastic。网状中继是可选的（默认情况下关闭）。';

  @override
  String get mtBridgeRelayTitle => '还中继 ResilNet 网格';

  @override
  String get mtBridgeRelayHint => '启用后，将广播签名的公共公告。关 = 仅此手机的通知。';

  @override
  String get mtBridgeSimulateHint => '演示消息';

  @override
  String get mtBridgeSimulate => '模拟Meshtastic消息';

  @override
  String get mtBridgeIngestOk => '纳入通知（#meshtastic）';

  @override
  String get mtBridgeEgressWarning =>
      '警告：此处发送的消息不是 ResilNet E2EE。 Meshtastic 路径上的任何人都可以阅读它们。';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => '待发布文本';

  @override
  String get mtBridgeSend => '发送至Meshtastic';

  @override
  String get mtBridgeEgressOk => '排队等候Meshtastic（查看日志/历史记录）';

  @override
  String get mtBridgeLastEgress => '最后出口';

  @override
  String get mtBridgeEgressHistory => '最近外出';

  @override
  String get mtBridgeOffHint => '打开 Ingest (A) 或 Egress (B) 以使用网桥。';

  @override
  String get mtBridgeNoticeBadge => 'MESHASTIC · 不是 E2EE';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => '使用MQTT传输';

  @override
  String get mtBridgeUseMqttHint =>
      '关闭 = 仅演示日志记录（MQTT 入站被忽略）。 On = MQTT 用于连接时的入口/出口。';

  @override
  String get mtBridgeMqttHost => '代理主机';

  @override
  String get mtBridgeMqttPort => '港口';

  @override
  String get mtBridgeMqttTls => '使用 TLS (mqtts)';

  @override
  String get mtBridgeMqttTlsHint => '典型端口8883。使用系统证书；握手错误时软失败。';

  @override
  String get mtBridgeMqttAutoReconnect => '自动重新连接';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      '启用后，客户端会在断开后尝试重新连接。状态显示正在连接直至恢复。';

  @override
  String get mtBridgeMqttTopicHelpers => '主题助手';

  @override
  String get mtBridgeMqttRegion => '区域前缀（可选）';

  @override
  String get mtBridgeMqttRegionHint =>
      '设置后，Apply 将根重建为 msh/<region>/2/json （覆盖主题根）。';

  @override
  String get mtBridgeMqttTopicRoot => 'JSON 主题根';

  @override
  String get mtBridgeMqttDownlinkChannel => '下行通道名称';

  @override
  String get mtBridgeMqttApplyTopics => '申请root→订阅/发布主题';

  @override
  String get mtBridgeMqttAdvanced => '高级 MQTT';

  @override
  String get mtBridgeMqttAdvancedHint => 'TLS、重新连接、主题、凭据';

  @override
  String get mtBridgeMqttTopicIn => '订阅主题';

  @override
  String get mtBridgeMqttTopicOut => '发布主题';

  @override
  String get mtBridgeMqttGatewayFrom => '网关节点id（来自）';

  @override
  String get mtBridgeMqttGatewayFromHint => '十进制 ID 或 !hex — sendtext 下行链路所需';

  @override
  String get mtBridgeMqttChannelIndex => '网状通道索引（可选 0–7）';

  @override
  String get mtBridgeMqttUser => '用户名（可选）';

  @override
  String get mtBridgeMqttPass => '密码（可选）';

  @override
  String get mtBridgeMqttPassStored => '密码存储在该设备上（未显示）。';

  @override
  String get mtBridgeMqttPassReplace => '新密码（留空保留）';

  @override
  String get mtBridgeMqttPassReplaceHint => '留空以保留存储的密码。';

  @override
  String get mtBridgeMqttPassClear => '清除密码';

  @override
  String get mtBridgeMqttSave => '保存 MQTT 设置';

  @override
  String get mtBridgeMqttSaved => 'MQTT 设置已保存';

  @override
  String get mtBridgeMqttConnect => '连接';

  @override
  String get mtBridgeMqttDisconnect => '断开';

  @override
  String get mtBridgeMqttConnected => 'MQTT已连接';

  @override
  String get mtBridgeMqttConnecting => 'MQTT正在连接...';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT已断开连接';

  @override
  String get mtBridgeMqttError => 'MQTT错误';

  @override
  String get mtBridgeErrModeIngest => '首先切换到摄取 (A)';

  @override
  String get mtBridgeErrModeEgress => '首先切换到出口 (B)';

  @override
  String get mtBridgeErrRate => '放慢速度——速率有限';

  @override
  String get mtBridgeErrDedupe => '重复消息被忽略';

  @override
  String get mtBridgeErrLoop => '丢弃以防止桥接环路';

  @override
  String get mtBridgeErrEmpty => '留言内容为空';

  @override
  String get mtBridgeErrPublish => '发布失败';

  @override
  String get mtBridgeErrNotConnected => 'MQTT未连接';

  @override
  String get mtBridgeErrMissingHost => '输入MQTT代理主机';

  @override
  String get mtBridgeErrMissingTopic => '输入订阅和发布主题';

  @override
  String get mtBridgeErrMissingFromNode => '输入 sendtext 的网关节点 ID（来自）';

  @override
  String get mtBridgeErrConnect => 'MQTT 连接失败';

  @override
  String get mtBridgeErrConnectTls => 'MQTT TLS 连接失败';

  @override
  String get settingsData => '数据';

  @override
  String get settingsDataHint => '删除本地消息以缩小数据库——保留身份、密钥和对等点';

  @override
  String get settingsSaveHistoryTitle => '保存消息历史记录';

  @override
  String get settingsSaveHistorySubtitle =>
      '关闭时，消息将保留在 E2EE 线路上，并且仅保留此会话（不在本地聊天历史记录中）。您自己的文本在此设备上仍显示为纯文本。';

  @override
  String get settingsPrivacy => '隐私';

  @override
  String get settingsE2eeTitle => '端到端加密';

  @override
  String get settingsE2eeSubtitle =>
      '始终开启 — 消息在发送前使用 RSA-OAEP + AES-GCM 进行密封。中继和附近的跃点无法读取内容。';

  @override
  String get settingsScreenshotTitle => '截图提醒';

  @override
  String get settingsScreenshotSubtitle => '当该设备捕获屏幕时，在聊天中显示系统线路';

  @override
  String get settingsNostrExpiryTitle => 'Nostr消息保持时间';

  @override
  String get settingsNostrExpirySubtitle => '通过 Nostr 在线时，密封信封应在本地保留多长时间';

  @override
  String get noticeExpiresIn => '到期于';

  @override
  String get noticesTitle => '通知';

  @override
  String get noticesMeshIntro =>
      '公共公告——无线电范围内的每个人都可以看到，未加密。它会在电话到电话之间进行离线连接，并且附近的 ResilNet 中继盒会保留一份副本，以便后来到达的人仍然可以看到它。';

  @override
  String get noticesMeshPublicBadge => '公开 · 未加密';

  @override
  String get noticesGeoIntro => '添加此地点的简短注释，以便其他访客可以找到它们。';

  @override
  String get noticesEmpty => '还没有通知';

  @override
  String get noticesEmptyHint => '为附近的人钉上第一个通知。';

  @override
  String get noticesComposeHint => '发布通知...';

  @override
  String get noticesUrgent => '紧迫的';

  @override
  String get noticesOpen => '通知';

  @override
  String get screenshotTaken => '*你截图了*';

  @override
  String get chatAttachImage => '附上图片';

  @override
  String get chatImageLabel => '图像';

  @override
  String get chatImageTooLarge => '图片太大 - 尝试另一张照片';

  @override
  String get chatNostrExpiry => 'Nostr 保留';

  @override
  String geoPublicComposeHint(String channel) {
    return '发送至 $channel — 公开';
  }

  @override
  String get settingsClearTitle => '清除所有消息';

  @override
  String get settingsClearSubtitle => '删除该设备上的所有聊天记录';

  @override
  String get settingsClearConfirmTitle => '清除所有消息？';

  @override
  String get settingsClearConfirmBody => '这将删除该设备上的所有聊天消息。\n同伴和昵称不会被删除。';

  @override
  String get settingsClearAction => '清除数据';

  @override
  String get settingsClearedSnack => '数据已清除';

  @override
  String settingsVersion(String version) {
    return '版本$version';
  }

  @override
  String get meshBleScanning => 'BLE：扫描节点';

  @override
  String get meshBleEsp32Scanning => 'ESP32：寻找附近的节点';

  @override
  String get meshBleSyncing => 'BLE：与ESP32同步';

  @override
  String get meshNostrPublishing => 'Nostr：发布';

  @override
  String get meshBleIdle => 'BLE 网络已开启 — 附近还没有手机';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE 网格 — $count 附近的手机';
  }

  @override
  String get meshBleNeedsPermission => 'BLE：需要许可';

  @override
  String get meshBlePausedCamera => 'BLE 暂停拍照 — 点击开始 BLE';

  @override
  String get meshBleStopped => 'BLE 已关闭 — 检查蓝牙是否已打开，然后点击开始 BLE';

  @override
  String get meshBleRestart => '开始 BLE';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · 本地 $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => '检查权限并启动 BLE';

  @override
  String get meshNostrOffline => 'Nostr离线';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count 附近的对等点 • LoRa $lora • 同步 ~${meters}m';
  }

  @override
  String get meshLoraReady => '准备好';

  @override
  String get meshLoraNotReady => '还没准备好';

  @override
  String meshGatewayProgress(String label) {
    return '网关 UDP：$label';
  }

  @override
  String get meshGatewayReady => '网关 UDP：准备就绪';

  @override
  String get permissionTitle => '允许访问启动 BLE 网状网络';

  @override
  String get permissionBody =>
      '该应用程序需要蓝牙（扫描/连接/广告）、位置（适用于较旧的 Android 设备）和麦克风（用于聊天和公告中的语音注释）来进行社区消息传递。';

  @override
  String get permissionE2ee => '端到端加密 (E2EE)\n中继节点无法读取消息内容';

  @override
  String get permissionReady => '权限准备就绪';

  @override
  String get permissionRequest => '允许并继续';

  @override
  String get permissionNotReadySnack => '系统尚未准备好 — 稍等片刻，然后重试';

  @override
  String get permissionDeniedSnack => '权限不完整 — 打开“设置”> ResilNet 并允许蓝牙/位置/麦克风';

  @override
  String get permissionMicDenied => '麦克风访问被拒绝 - 在“设置”中允许其录制语音笔记';

  @override
  String get permissionMicOpenSettings => '设置';

  @override
  String get permissionCameraDenied => '相机访问被拒绝 - 在“设置”中允许其扫描二维码';

  @override
  String get permissionCameraFailed => '扫描二维码需要相机权限';

  @override
  String get permissionCameraOpenSettings => '设置';

  @override
  String get permissionPhotosDenied => '照片库访问被拒绝 — 在“设置”中允许它保存您的二维码';

  @override
  String get permissionPhotosFailed => '需要照片库权限才能保存您的二维码';

  @override
  String get permissionPhotosOpenSettings => '设置';

  @override
  String permissionFailedSnack(String error) {
    return '权限请求失败：$error';
  }

  @override
  String get permissionFooter => 'ResilNet 架构 • 存储转发多跳';

  @override
  String get onboardingSkip => '跳过';

  @override
  String get onboardingNext => '下一个';

  @override
  String get onboardingStart => '开始使用';

  @override
  String get onboardingWelcomeTitle => '欢迎来到ResilNet';

  @override
  String get onboardingWelcomeBody => '通过网状网络在 ResilNet 上聊天 — 即使没有互联网';

  @override
  String get onboardingFriendsTitle => '轻松添加好友';

  @override
  String get onboardingFriendsBody => '分享来自 Identity 的 QR，或扫描朋友的 QR 来交换公钥';

  @override
  String get onboardingChannelsTitle => '加密聊天+附近频道';

  @override
  String get onboardingChannelsBody =>
      '切换 #mesh / Area (geohash) 以查找附近的对等点 - 消息通过 BLE 网格和 Nostr 保持 E2EE';

  @override
  String get chatTitle => '聊天（E2EE）';

  @override
  String get chatScanTooltip => '扫描二维码添加好友';

  @override
  String get chatBlockTooltip => '阻止该发件人';

  @override
  String get chatBlockedSnack => '被阻止：没有通知/没有中继';

  @override
  String get chatAliasTooltip => '设置昵称';

  @override
  String get chatReceiverPemLabel => '收件人公钥 (PEM)';

  @override
  String get chatReceiverPemHint => '粘贴您朋友的公钥（来自二维码/共享文件）';

  @override
  String get chatNeedPeerKey => '首先扫描该节点的二维码（需要经过验证的公钥）';

  @override
  String get chatPeerKeyMismatch => '存储的公钥与此对等点 ID 不匹配';

  @override
  String chatVoiceFailed(String error) {
    return '无法录制音频：$error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return '无法播放语音注释：$error';
  }

  @override
  String get chatPlayVoice => '播放语音笔记';

  @override
  String get chatPauseVoice => '暂停';

  @override
  String get chatVoiceLabelSent => '🎤 语音留言（密封）';

  @override
  String get chatVoiceLabel => '语音便笺';

  @override
  String get chatDecryptFailed => '[解密失败]';

  @override
  String chatSentSealed(String preview) {
    return '[密封•ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[密封]';

  @override
  String get chatComposeHint => '输入消息...（发送时密封）';

  @override
  String get chatEmptyThread => '还没有消息\n输入以下内容以通过网格发送';

  @override
  String chatLoadFailed(String error) {
    return '无法加载对话：$error';
  }

  @override
  String get chatEmojiTooltip => '表情符号';

  @override
  String get statusPending => '待办的';

  @override
  String get statusSent => '发送';

  @override
  String get statusRelayed => '中继';

  @override
  String get statusDelivered => '发表';

  @override
  String get statusRead => '读';

  @override
  String get statusFailed => '失败的';

  @override
  String get chatCopy => '复制';

  @override
  String get chatDeleteLocal => '在此设备上删除';

  @override
  String get chatDeletedLocalSnack => '已在此设备上删除';

  @override
  String get chatRetry => '重试';

  @override
  String get chatSendFailed => '未送达 — 点击“重试”';

  @override
  String get chatImageNeedInternet => '连接到互联网以发送图像';

  @override
  String get chatImageTooLargeOnline => '无法将图像压缩到足以发送的程度';

  @override
  String get chatOpenLinkFailed => '无法打开链接';

  @override
  String get identityTitle => '身份';

  @override
  String get identityScanTooltip => '用相机扫描二维码';

  @override
  String get identityCopiedHash => '已复制公钥哈希';

  @override
  String get identityPeerSaved => '通过 QR 保存的对等点';

  @override
  String get identityGalleryDenied => '照片库权限被拒绝';

  @override
  String get identityQrSaved => '二维码已保存至照片库';

  @override
  String identityQrSaveFailed(String error) {
    return '无法保存二维码：$error';
  }

  @override
  String get peersTitle => '网络成员';

  @override
  String get qrScanTitle => '扫描二维码添加好友';

  @override
  String get qrInvalid => '扫描失败：二维码无效';

  @override
  String get qrIdKeyMismatch => 'QR 被拒绝：id 与公钥不匹配';

  @override
  String get qrCameraNotReady => '相机未准备好';

  @override
  String get qrRetrySettings => '重试/打开设置';

  @override
  String qrCameraOpenFailed(String error) {
    return '无法打开相机：$error';
  }

  @override
  String get qrScanAlignHint => '将二维码对齐框内';

  @override
  String get firmwareDownloadTitle => '下载ESP32固件';

  @override
  String get firmwareSourceOnline => '最新（在线）';

  @override
  String get firmwareSourceCached => '保存的副本（离线）';

  @override
  String get firmwareSourceBaseline => '捆绑基线（离线）';

  @override
  String get firmwareSourceUnavailable => '无可用固件';

  @override
  String get firmwareBaselineIncompatible => '捆绑固件太旧 - 连接到互联网下载更新版本';

  @override
  String get firmwareChecksumFailed => '固件完整性检查失败 — 闪烁被阻止';

  @override
  String firmwareReadyFromSource(String source) {
    return '固件就绪：$source';
  }

  @override
  String get peersRefreshTooltip => '刷新';

  @override
  String get peersBlocked => '被阻止';

  @override
  String peersNearbyBle(Object ble) {
    return '附近 (BLE)';
  }

  @override
  String get peersRecentlyOnline => '最近上线';

  @override
  String get peersOnlineInArea => '区域内在线';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return '浏览时间 $minutes 分钟前';
  }

  @override
  String get peersOffline => '离线';

  @override
  String peersBlockedSnack(String id) {
    return '已阻止 $id';
  }

  @override
  String get peersUnblockedSnack => '畅通';

  @override
  String get peersEmpty => '数据库中还没有成员\n扫描二维码或等待 BLE 网格发现';

  @override
  String get peersOpenChat => '打开聊天';

  @override
  String get peersBlockAction => '堵塞';

  @override
  String get peersUnblockAction => '解锁';

  @override
  String get channelPickerTooltip => '聊天/#mesh/区域';

  @override
  String get locationPickerTooltip => '定位通道';

  @override
  String get transportPickerTooltip => '网状/互联网/汽车';

  @override
  String get onlinePeopleTooltip => '在线人数';

  @override
  String get unreadDirectsTooltipEmpty => '私信';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count未读私信';
  }

  @override
  String get onlinePeopleTitle => '人们';

  @override
  String get onlinePeopleEmpty => '这里还没有人在线';

  @override
  String onlinePeopleCount(int count) {
    return '$count在线';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1·附近+区域';

  @override
  String get peerOnlineMeshTitle => '附近有人在网格上';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name 位于网格附近';
  }

  @override
  String get peerOnlineAreaTitle => '该地区有人在线';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name 通过 Nostr 在线';
  }

  @override
  String get locationSheetTitle => '#位置频道';

  @override
  String get channelPinsTitle => '已固定';

  @override
  String get channelPinsHint => '固定您经常使用的频道 - 它们位于顶部';

  @override
  String get channelPinTooltip => '固定此频道';

  @override
  String get channelUnpinTooltip => '取消固定';

  @override
  String get locationSheetIntro =>
      '使用粗略的 geohash（而不是精确的 GPS）与附近的人聊天。 Internet 上的存在使用匿名 Nostr 密钥。';

  @override
  String get locationMeshSubtitle => '#蓝牙 • ~10–50 m';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => '传送';

  @override
  String homeComposeHint(String channel) {
    return '消息$channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return '发送至 $channel — 公开';
  }

  @override
  String get messageExpiryTitle => '到期于';

  @override
  String get voiceRecordTapToStart => '点击即可录制语音消息';

  @override
  String get voiceRecordTooShort => '录音太短 - 请重试';

  @override
  String get voiceRecordFailed => '无法保存录音 - 请重试';

  @override
  String get voicePttHold => '按住录音';

  @override
  String get voicePttRelease => '释放以预览';

  @override
  String get voicePttRecording => '记录…';

  @override
  String get voicePttDraftReady => '语音留言准备就绪';

  @override
  String get voicePttDiscard => '丢弃';

  @override
  String get voicePttReRecord => '再次录制';

  @override
  String get voicePttSend => '发送语音留言';

  @override
  String get voicePttPlayPreview => '播放预览';

  @override
  String get voicePttStopPreview => '停止预览';

  @override
  String get noticesBackfilling => '正在加载通知...';

  @override
  String get noticesNostrOnline => 'Nostr在线';

  @override
  String get noticesNostrOffline => 'Nostr 离线 — 公告需要互联网';

  @override
  String noticesBackfillLoaded(int count) {
    return '已加载 $count 通知';
  }

  @override
  String get noticePublishFailed => '无法向地区委员会发布通知。检查Nostr连接。';

  @override
  String get noticeMeshPublishNoLink =>
      '保存在本地。连接到附近的网状无线电（或 Wi‑Fi 网关），以便其他人可以接收它。';

  @override
  String noticeMeshPublishSent(int count) {
    return '公告已通过 BLE 发送到附近的 $count 设备。';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      '已看到附近的无线电，但 BLE 写入失败。让两个应用程序在“通知”屏幕上保持打开状态，然后重试（或使用 ESP32 中继）。';

  @override
  String get noticeMeshPublishNoGatt => '该设备的BLE接收器未准备好。切换蓝牙并重新打开通知。';

  @override
  String get noticeDelete => '删除通知';

  @override
  String get noticeDeleteConfirmTitle => '删除这个通知吗？';

  @override
  String get noticeDeleteLocalOnlyBody => '这仅在此设备上删除它。其他已经收到它的人仍然会看到它。';

  @override
  String get noticeDeleted => '通知已删除';

  @override
  String get chatNoticeHidden => '区域通知 — 开放通知';

  @override
  String get identityDisplayNameTitle => '显示名称';

  @override
  String get identitySaveName => '保存名称';

  @override
  String get identityUserIdLabel => '用户 ID（公钥哈希）';

  @override
  String get identityCopyHashTooltip => '复制公钥哈希';

  @override
  String get identityMyQrTitle => '我的二维码（id + pubKey + 姓名）';

  @override
  String identityQrFailed(String error) {
    return '无法创建二维码\n$error';
  }

  @override
  String get identitySaving => '保存…';

  @override
  String get identitySaveQr => '将二维码保存到照片库';

  @override
  String get identityOpenScanner => '打开相机扫描二维码';

  @override
  String get identityQrHelp => '让朋友扫描此信息以保存您的公钥并（如果需要）将您设置为已验证的发行人';

  @override
  String get identityChatTip => '提示：您也可以在聊天中扫描二维码添加E2EE公钥';

  @override
  String get infoOpen => '关于/信息';

  @override
  String get docsGuideTitle => '用户指南';

  @override
  String get docsGuideSubtitle => '在浏览器中打开';

  @override
  String get docsOpenAction => '打开指南';

  @override
  String get docsOpenFailed => '无法打开用户指南';

  @override
  String get firmwareOtaGuideTitle => 'Flash指南&OTA协议';

  @override
  String get firmwareOtaGuideSubtitle => '打开网络指南 — .bin 下载和完整步骤';

  @override
  String get firmwareWebDownloadsTitle => '在网络上下载固件';

  @override
  String get firmwareWebDownloadsSubtitle => '文档站点上的每个版本链接和校验和';

  @override
  String get inviteCopyShortLink => '复制短链接';

  @override
  String get inviteShareLink => '分享链接';

  @override
  String get inviteShowFullLink => '完整链接';

  @override
  String get inviteCopyFullLink => '复制完整链接';

  @override
  String get inviteLinkCopied => '链接已复制';

  @override
  String get inviteLongPressHint => '长按可进行链接操作';

  @override
  String get inviteSendInChat => '发送 ResilNet 聊天...';

  @override
  String get inviteSendInChatHint => '仅适用于您已拥有公钥的人';

  @override
  String get inviteSendInChatEmpty =>
      '还没有可发送消息的聊天。\n首先扫描二维码、打开区域/网格或在应用程序外部共享链接。';

  @override
  String get inviteSentToChat => '邀请已在聊天中发送';

  @override
  String get infoTabInfo => '信息';

  @override
  String get infoTabSettingsHint => '从语言、E2EE 和数据工具的菜单中打开“设置”';

  @override
  String get infoHowToTitle => '如何使用';

  @override
  String get infoHowToBody =>
      '• 点击频道图标可切换聊天/#mesh/区域\n• 点击地点选择 geohash 大小\n• 点击人员以查找成员或在线人员\n• 从 ⋮ 开放身份/二维码以亲自交换密钥\n•“公共”区域向每个在线对等方发送密封的 E2EE——而不是明文房间';

  @override
  String get infoFeaturesTitle => '特征';

  @override
  String get infoFeatureOffline => '通过低功耗蓝牙进行离线消息传递';

  @override
  String get infoFeatureE2ee => '使用 RSA-OAEP + AES-GCM 进行端到端加密（非噪声）';

  @override
  String get infoFeatureMultihop => '消息可以通过附近的对等点传输到更远的地方';

  @override
  String get infoFeatureBridge => '用于密封信封的混合网格 ↔ 互联网 (Nostr)';

  @override
  String get infoFeatureGeo => '附近人的本地 geohash 频道（发现 UX）';

  @override
  String get infoFeatureNotices => '#mesh 和 Area 过期的通知';

  @override
  String get infoPrivacyTitle => '隐私';

  @override
  String get infoPrivacyNoRoom => '网络上没有明文村庄/公共聊天室';

  @override
  String get infoPrivacyFanout => '区域发送 = 密封 1:1 扇出到具有已知公钥的对等方';

  @override
  String get infoPrivacyPresence => '互联网区域存在使用临时 Nostr 密钥';

  @override
  String get infoSymbolsTitle => '符号';

  @override
  String get infoSymBle => '直接蓝牙链接';

  @override
  String get infoSymMesh => '可通过网状网络到达（其他转发）';

  @override
  String get infoSymInternet => '通过互联网 (Nostr) — 密封信封';

  @override
  String get infoSymBridge => '通过网状网↔互联网桥路径到达';

  @override
  String get infoSymOffline => '离线 — 目前无法访问';

  @override
  String get infoSymInArea => '在此位置通道区域';

  @override
  String get infoSymE2eeOk => '端到端加密会话';

  @override
  String get infoSymE2eeFail => '加密不可用——不要发送敏感文本';

  @override
  String get infoSymVerified => '身份验证/已知密钥';

  @override
  String get infoSymBlocked => '被阻止';

  @override
  String get infoSymUnread => '未读私信';

  @override
  String get infoEmergencyTitle => '紧急模式';

  @override
  String get infoEmergencyBody => '连按三次主屏幕上的 ResilNet 标题可擦除该设备上的消息、密钥和身份信息。';

  @override
  String get infoLegendNote => '为了清楚起见，此处记录了一些路径图标；聊天中的传递标记仍然是主要发送状态。';

  @override
  String get dangerZoneTitle => '危险区域';

  @override
  String get dangerZoneSubtitle => '删除该设备上的消息、加密密钥、Nostr 身份、对等点和昵称。您将再次设置。';

  @override
  String get panicWipeTitle => '紧急擦拭';

  @override
  String get panicWipeSubtitle => '擦除本地所有内容 - 与三次点击主页标题相同（双击刷新收音机）';

  @override
  String get panicWipeConfirmTitle => '清除所有本地数据？';

  @override
  String get panicWipeConfirmBody =>
      '这将永久删除此手机上的聊天记录、密钥和身份信息。\n同行必须用您的新身份重新交换二维码密钥。\n此操作无法撤消。';

  @override
  String get panicWipeAction => '擦拭一切';

  @override
  String get panicWipeSnack => '本地身份已擦除 — 重新设置';

  @override
  String panicWipeFailed(String error) {
    return '擦除失败：$error';
  }

  @override
  String get meshBridgeTitle => '网桥';

  @override
  String get meshBridgeSubtitle =>
      '启用（默认）后，密封信封可以同时使用 BLE 网格和互联网 (Nostr)，以便附近的网格岛可以连接。关闭时，仅使用一条路径发送 — 绝不将明文传输到线路上。';

  @override
  String get favoritesTitle => '收藏夹';

  @override
  String get favoritesAdd => '添加到收藏夹';

  @override
  String get favoritesRemove => '从收藏夹中删除';

  @override
  String get favoritesEmpty => '尚未收藏 — 从成员列表中为同行加注星标';

  @override
  String get favoritesNearbyTitle => '附近最喜欢的';

  @override
  String favoritesNearbyBody(String name) {
    return '$name 位于网格附近';
  }

  @override
  String get favoritesInAreaTitle => '最喜欢的地区';

  @override
  String favoritesInAreaBody(String name) {
    return '$name在此区域在线';
  }

  @override
  String get topologyTitle => '网状拓扑';

  @override
  String get topologySubtitle => '来自网格公告的对等点和连接提示（只读）';

  @override
  String get topologyConnectedNow => '现已连接 (BLE)';

  @override
  String get topologyNearby => '附近 (BLE)';

  @override
  String get topologyKnown => '已知同行';

  @override
  String get topologyEmpty => '尚未有同伴获悉 - 留在附近并开启 BLE';

  @override
  String get topologyYou => '你';

  @override
  String topologyStats(int peers, int links) {
    return '$peers 同行 · $links 链接';
  }

  @override
  String get topologyGraphHint => '根据附近的网格发现估算 - 您的设备突出显示。点击同伴即可打开聊天。';

  @override
  String get topologyOpen => '网状拓扑';

  @override
  String get slashHelpTitle => '命令';

  @override
  String get slashHelpBody =>
      '/help — 此列表\n/who — 当前频道中在线的人\n/drop <text> — 在此处固定密封通知（E2EE 扇出）\n\n完整指南：使用下面的打开指南，或设置 → 用户指南。';

  @override
  String get slashWhoEmpty => '目前该频道无人在线';

  @override
  String slashWhoTitle(int count) {
    return '在线 ($count)';
  }

  @override
  String get slashDropNeedText => '用法：/删除您的注释文本';

  @override
  String slashDropDone(String channel) {
    return '已在 $channel 上删除通知';
  }

  @override
  String get slashUnknown => '未知命令 — 尝试 /help';

  @override
  String get announceOpen => '公告';

  @override
  String get announceTitle => '公告';

  @override
  String get announceEmpty => '还没有留言板 — 创建一个留言板来发布锁定或开放的通知';

  @override
  String get announceCreate => '创建板';

  @override
  String get announceCreateHint => '董事会名称';

  @override
  String get announceDefaultTitle => '社区委员会';

  @override
  String get announceSettings => '董事会设置';

  @override
  String get announceAllowLocked => '允许锁定（加密）的帖子';

  @override
  String get announceAllowLockedSub => '加密到板密钥 - 读者需要访问';

  @override
  String get announceAllowOpen => '允许公开（明文）帖子';

  @override
  String get announceAllowOpenSub => '不是 E2EE — 在网状网络/继电器上可读。默认关闭。';

  @override
  String get announceComposeHint => '写一个公告...';

  @override
  String get announceMediaInternetOnly => '通过互联网发送照片/语音通知（不是 BLE）';

  @override
  String get announceNeedInternet => '连接到互联网发送照片或语音通知';

  @override
  String announceVoiceFailed(String error) {
    return '无法录制语音：$error';
  }

  @override
  String get announceImageTooLarge => '图像太大（最大 ~180 KB）';

  @override
  String get announcePlayVoice => '播放语音笔记';

  @override
  String get announceImageLabel => '📷 图片';

  @override
  String get announceAudioLabel => '🎤 语音留言';

  @override
  String get announceModeLocked => '锁定';

  @override
  String get announceModeOpen => '打开';

  @override
  String get announceOpenBadge => '开放·未加密';

  @override
  String get announceLockedBadge => '锁定';

  @override
  String get announceLockedPlaceholder => '加密 — 请求访问读取';

  @override
  String get announceRequestAccess => '请求访问权限';

  @override
  String get announceRequestSent => '发送给版块所有者的访问请求';

  @override
  String get announceRequestFailed => '无法请求访问（需要所有者的公钥）';

  @override
  String get announceOpenConfirmTitle => '发帖不加密？';

  @override
  String get announceOpenConfirmBody => '开放帖子不是 E2EE。路径上的任何人（网格/中继）都可以读取它们。继续？';

  @override
  String get announcePostAction => '邮政';

  @override
  String get announcePendingRequests => '访问请求';

  @override
  String get announceApprove => '批准';

  @override
  String get announceDeny => '否定';

  @override
  String get announceGranted => '您可以阅读此板上的锁定帖子';

  @override
  String get announceOwner => '您拥有该板';

  @override
  String get announceCopyInvite => '复制邀请文本';

  @override
  String get announceShowInviteQr => '显示邀请二维码';

  @override
  String get announceScanInviteQr => '扫一扫邀请码';

  @override
  String get announceFollow => '通过邀请关注董事会';

  @override
  String get announceFollowHint => '粘贴来自所有者的邀请文本或 ResilNet 链接';

  @override
  String get announceFollowOk => '跟随板';

  @override
  String announceFollowOkNamed(String title) {
    return '现在正在关注“$title”';
  }

  @override
  String get announceFollowFail => '邀请无效或已损坏';

  @override
  String get announceInviteCopied => '邀请文本已复制';

  @override
  String get announceInviteSaveQr => '保存二维码';

  @override
  String get announceInviteShare => '分享邀请';

  @override
  String get announceFollowFromCompose => '在消息框中检测到论坛邀请';

  @override
  String get peerConfirmAddTitle => '添加网络成员？';

  @override
  String peerConfirmAddBody(String name) {
    return '添加“$name”及其公钥，以便您可以私下向他们发送消息？';
  }

  @override
  String get peerConfirmAdd => '添加会员';

  @override
  String peerAddedOk(String name) {
    return '将 $name 添加到网络成员';
  }

  @override
  String get peerAddFromCompose => '在消息框中检测到身份/公钥';

  @override
  String get peerHashCopied => '已复制公钥哈希';

  @override
  String get peerHashOpenChat => '打开聊天';

  @override
  String get peerHashAddHint => '已复制哈希值。请他们分享他们的身份链接或 QR，以便您可以添加 E2EE 的完整公钥。';

  @override
  String get peerQrNoCode => '此图片中未找到 ResilNet 二维码';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet身份：“$name”\n打开链接或将其粘贴到聊天中 → 添加成员\n或扫描身份二维码。';
  }

  @override
  String get identityShareInvite => '分享身份链接';

  @override
  String get identityInviteCopied => '已复制身份链接';

  @override
  String announceInviteSharePreamble(String title) {
    return '董事会邀请：“$title”\n打开 ResilNet → 社区委员会 → 通过邀请关注\n或扫描二维码/点击下面的链接。';
  }

  @override
  String get announceConfirmFollowTitle => '关注这个板块？';

  @override
  String announceConfirmFollowBody(String title) {
    return '关注此邀请中的“$title”吗？';
  }

  @override
  String get announceConfirmFollow => '跟随';
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class AppLocalizationsZhTw extends AppLocalizationsZh {
  AppLocalizationsZhTw() : super('zh_TW');

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => '刷新ResilNet...';

  @override
  String get appRefreshed => '刷新 - 無線電和發現重新啟動';

  @override
  String appRefreshFailed(String error) {
    return '刷新失敗：$error';
  }

  @override
  String get appRefreshTitleHint => '雙擊=軟刷新。長按=硬恢復。三擊 = 緊急擦拭。';

  @override
  String get softRefreshTipTitle => '如果ResilNet感覺卡住了';

  @override
  String get softRefreshTipBody =>
      '雙擊 ResilNet（左上角）可進行軟無線電刷新。如果仍然卡住：長按標題，使用 ⋮ → 硬恢復，或設定。三擊僅用於緊急擦除。';

  @override
  String get softRefreshTipGotIt => '知道了';

  @override
  String get infoSoftRefreshTitle => '如果應用程式感覺卡住了';

  @override
  String get infoSoftRefreshStepRefresh => '雙擊ResilNet（左上）→ 軟刷新收音機和附近的人';

  @override
  String get infoSoftRefreshStepHard => '還卡住了嗎？長按標題，或⋮/設定→硬恢復';

  @override
  String get infoSoftRefreshStepWait => '等待結果小點心欄，然後再試一次。會話重置會保留您的金鑰。';

  @override
  String get infoSoftRefreshStepWipe => '三擊 = 緊急擦除（刪除本機資料）－僅在有意情況下';

  @override
  String get appRecoverySection => '應用程式恢復';

  @override
  String get appRecoverySectionSubtitle =>
      '當應用程式感覺凍結時使用。軟=標題雙擊。硬恢復更強。會話重置會重新啟動服務而不擦除金鑰。';

  @override
  String get appHardRecoverAction => '硬恢復';

  @override
  String get appHardRecovering => '恢復困難…';

  @override
  String get appSessionResetAction => '重置會話';

  @override
  String get appSessionResetRunning => '正在重置會話...';

  @override
  String get appSessionResetConfirmTitle => '重置會話？';

  @override
  String get appSessionResetConfirmBody => '重新啟動該裝置上的 ResilNet 服務。您的身分密鑰將被保留。';

  @override
  String get appRecoveryBusy => '恢復已在運作...';

  @override
  String get appRecoveryOk => '恢復完成';

  @override
  String get appRecoveryPartial => '恢復已完成，但跳過了一些步驟 - 如果仍然卡住，請重試';

  @override
  String get appRecoveryFailed => '恢復失敗 - 嘗試會話重置，或從作業系統強制退出應用程式';

  @override
  String get localWifiTitle => '本地Wi‑Fi';

  @override
  String get localWifiSubtitle => '無需網路即可連結附近的設備 — 與在一個 LAN 上相同。';

  @override
  String get localWifiNotGatewayHint => '不是 ESP32 LoRa 閘道 SoftAP。這僅是電話↔電話/LAN。';

  @override
  String get localWifiUnavailable => '本地 Wi‑Fi 尚未準備好 - 等待應用程式啟動。';

  @override
  String get lxmfBridgeTitle => '主節點';

  @override
  String get lxmfBridgeSubtitle =>
      'Wi‑Fi 上的可選 Mac 或 Pi 可以中繼密封聊天。預設關閉。不取代端對端加密。';

  @override
  String get lxmfBridgeEnable => '使用主節點';

  @override
  String get lxmfBridgeDisabledHint => '僅當橋接應用程式在此網路上的 Mac 或 Pi 上運行時才開啟。';

  @override
  String lxmfBridgeOnline(String dest) {
    return '線上 — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return '無法到達主節點 - $error';
  }

  @override
  String get lxmfBridgeBaseUrl => '主節點位址';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP 或 http://IP:連接埠 — 例如 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => '對等 → LXMF 目標 (JSON)';

  @override
  String get lxmfBridgeRefresh => '儲存並重新整理狀態';

  @override
  String get lxmfBridgeLabHint => '進階：labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => '主節點設定';

  @override
  String get lxmfBridgeCheckConnection => '檢查連接';

  @override
  String get lxmfBridgeStatusOnline => '連接到主節點';

  @override
  String get lxmfBridgeStatusOffline => '主節點不可達';

  @override
  String get lxmfBridgeYourDest => '該節點位址（分享給朋友）';

  @override
  String get lxmfBridgeCopyDest => '複製地址';

  @override
  String get lxmfBridgeDestCopied => '地址已複製';

  @override
  String get lxmfBridgeLinkedPeers => '已連結的朋友';

  @override
  String get lxmfBridgeLinkedPeersHint => '每個朋友都需要一次他們的主節點位址。那麼密封聊天就可以使用這個路徑。';

  @override
  String get lxmfBridgeNoLinks => '還沒有好友建立聯繫。';

  @override
  String get lxmfBridgeAddLink => '連結好友';

  @override
  String get lxmfBridgePickPeer => '朋友';

  @override
  String get lxmfBridgePeerDest => '他們的主節點位址';

  @override
  String get lxmfBridgePeerDestHint => '主節點畫面上的 32 字元代碼';

  @override
  String get lxmfBridgeInvalidDest => '該地址看起來無效。貼上其主節點的完整程式碼。';

  @override
  String get lxmfBridgeRemoveLink => '取消連結';

  @override
  String get lxmfBridgeSaveLink => '節省';

  @override
  String get lxmfBridgeLinkSaved => '好友已連結';

  @override
  String get lxmfBridgeNoPeers => '尚無可發送訊息的聯絡人 - 請先新增好友。';

  @override
  String get lxmfBridgeHelp =>
      '保持網橋在 Mac/Pi 上運作。該路徑保留在您的 LAN 上 — 它不是 LoRa，也不會取代網際網路或藍牙網狀網路。';

  @override
  String get localWifiModeHotspot => '附近';

  @override
  String get localWifiModeRouter => '路由器';

  @override
  String get localWifiHotspotIntro =>
      '一台設備共享一個個人熱點。其他人加入該熱點，然後 ResilNet 在本地網路上找到他們。';

  @override
  String get localWifiHostAction => '建立網路（主機）';

  @override
  String get localWifiJoinAction => '加入網路';

  @override
  String get localWifiHostSteps =>
      '1. 開啟 iOS/Android 設定並開啟個人熱點（或網路分享）。\n2. 告訴朋友熱點名稱（和密碼）。\n3. 返回此處並點擊「熱點已開啟 - 開始等待」。';

  @override
  String get localWifiHostReady => '熱點已開啟 — 開始等待';

  @override
  String get localWifiHostWaiting => '等待好友加入…';

  @override
  String get localWifiJoinSteps =>
      '1. 開啟系統設定並加入好友的個人熱點。\n2. 返回此處並點選「我已連線 — 搜尋」。';

  @override
  String get localWifiJoinReady => '我已連線 — 搜尋';

  @override
  String get localWifiRouterIntro =>
      '將每個裝置連接到同一個 Wi‑Fi 路由器/AP。路由器不需要網路－只需要共用本地網路。';

  @override
  String get localWifiRouterSearch => '搜尋此 Wi‑Fi';

  @override
  String get localWifiRefreshNetwork => '刷新Wi‑Fi訊息';

  @override
  String get localWifiRouterNoWifiTitle => '不在 Wi‑Fi 上';

  @override
  String get localWifiRouterNoWifiBody => '在系統設定中加入路由器的Wi‑Fi，然後再次搜尋。';

  @override
  String get localWifiDiscovering => '正在本地 Wi‑Fi 搜尋...';

  @override
  String get localWifiPeersFound => '該網路上的設備';

  @override
  String get localWifiStop => '停止';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi 名稱不可用';

  @override
  String get localWifiStubBanner => '等待 LAN 插座...';

  @override
  String get localWifiLiveBanner => 'LAN 發現即時 (UDP) — 在此 Wi‑Fi 上宣布 + 密封聊天';

  @override
  String get localWifiEmptyHotspot => '還沒有設備。\n檢查朋友是否加入了您的熱點並允許本地網路存取。';

  @override
  String get localWifiEmptyRouter =>
      '還沒有設備。\n相同的SSID？允許本地網路嗎？某些路由器會阻止設備到設備的流量（AP 隔離）。';

  @override
  String get localWifiIsolationHelp => '為什麼我們找不到彼此？';

  @override
  String get localWifiIsolationTitle => '路由器可能會隔離客戶端';

  @override
  String get localWifiIsolationBody =>
      '如果 AP/用戶端隔離（或訪客網路）開啟，則同一 Wi‑Fi 上的電話無法通話。關閉隔離、使用主 SSID 或切換到附近（熱點）模式。';

  @override
  String get localWifiPeerReady => '準備聊天（有鑰匙）';

  @override
  String get localWifiPeerNeedKey => '發現 — 掃描二維碼交換金鑰';

  @override
  String get localWifiErrorTitle => '本機 Wi‑Fi 錯誤';

  @override
  String get localWifiErrorBody => '出了點問題。停下來再試一次。';

  @override
  String get preparingSystem => '正在準備系統...';

  @override
  String get bootFailedTitle => '無法啟動';

  @override
  String get retry => '再試一次';

  @override
  String get bootRecoveryAction => '啟動新身分（擦除本機資料）';

  @override
  String get bootRecoveryConfirmTitle => '開始新的身份？';

  @override
  String get bootRecoveryConfirmBody =>
      '這將永久刪除該裝置上的本機聊天、金鑰和身分。\n同行必須使用您的新身分再次掃描您的二維碼。\n此操作無法撤銷。';

  @override
  String get bootRecoveryRunning => '重置本地身份...';

  @override
  String get bootRecoverySuccess => '本地身份重置完成';

  @override
  String bootRecoveryFailed(String error) {
    return '無法重設身分：$error';
  }

  @override
  String get cancel => '取消';

  @override
  String get save => '節省';

  @override
  String get close => '關閉';

  @override
  String get start => '開始';

  @override
  String get send => '傳送';

  @override
  String get settings => '設定';

  @override
  String get language => '語言';

  @override
  String get languageSubtitle =>
      '預設情況下，應用程式遵循您的手機語言（如果支援）。其他語言則回歸英語。您也可以在此處鎖定語言。';

  @override
  String get languageSystem => '系統預設';

  @override
  String get languageThai => '泰國';

  @override
  String get languageEnglish => '英語';

  @override
  String get notificationsTooltip => '通知設定';

  @override
  String get enableMessageNotifications => '啟用訊息通知';

  @override
  String get settingsNotificationsSubtitle => '1:1 訊息和線上人員（本地警報）';

  @override
  String get networkMembersTooltip => '網路成員';

  @override
  String get identityQrTooltip => '身份/二維碼';

  @override
  String get feedDirects => '聊天';

  @override
  String get feedMesh => '＃網';

  @override
  String get feedGeo => '區域';

  @override
  String get feedDirectsSubtitle => '私有E2EE訊息';

  @override
  String feedMeshSubtitle(Object ble) {
    return '附近的同行 (BLE)';
  }

  @override
  String get feedGeoSubtitle => 'Geohash 發現通道';

  @override
  String get peerIdHint => '貼上接收者 ID（公鑰哈希）以開始聊天';

  @override
  String get directsEmpty =>
      '尚無聊天 — 掃描二維碼或貼上接收者 ID 即可開始\n訊息在發送前使用 E2EE 進行密封 (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • 點擊即可開啟聊天';

  @override
  String get meshIntro =>
      'BLE範圍內的對等點 - 點擊進行私人 E2EE 聊天（#mesh 上沒有公開撰寫）\n透過混合路由器傳送（線上時BLE + LoRa + Nostr）';

  @override
  String get meshEmptyRunning => '附近還沒有對等點 - 在 BLE 範圍內的另一台設備上打開應用程式';

  @override
  String get meshEmptyStopped => 'BLE 未運作 — 授予藍牙/位置權限';

  @override
  String get meshNearbyPrefix => '附近';

  @override
  String get meshRetentionTitle => '自動刪除訊息';

  @override
  String get meshRetentionSubtitle => '較舊的本機聊天記錄會自動刪除';

  @override
  String get meshRetentionKeep => '保持';

  @override
  String get meshRetention1Day => '1天';

  @override
  String get meshRetention3Days => '3天';

  @override
  String get meshRetention7Days => '7天';

  @override
  String get refreshLocationTooltip => '重新整理位置';

  @override
  String get geoIntro =>
      '在此 geohash 中在線的人可以以 1:1 的方式發送訊息，或者透過區域公共扇出（每個對等點仍然密封的 E2EE - 非明文）';

  @override
  String geoEmpty(String channel) {
    return '$channel 中尚未有人在線\n使用交通工具 → 網路/汽車，等待 Nostr，刷新位置';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return '$channel 線上 • 點選 1:1 E2EE';
  }

  @override
  String get geoPeerNearbySubtitle => '附近（等待區域存在） • 點選 1:1 E2EE';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return '在 $channel 中的 Nostr 上看到 • 僅發現（舊版）';
  }

  @override
  String get geoPeerDiscoverOnlySnack => '傳統的匿名存在－等待綁定的對等點或交換二維碼';

  @override
  String get bleRadioNearbySubtitle => 'BLE 附近 — 掃描二維碼開始 1:1 E2EE';

  @override
  String get geoInternetDiscoverHint => '區域網路發現需要 Nostr 連線（設定 → 傳輸 → 網路/自動）';

  @override
  String get geoEmptyNoLocation => '位置尚未解析 - 允許 GPS 並刷新以在 Nostr 上發布您的 geohash';

  @override
  String get geoEmptyNeedsPermission =>
      '位置權限被拒絕 — 在「設定」→「隱私權」→「位置」中允許 ResilNet';

  @override
  String get geoEmptyServicesDisabled => '定位服務已關閉 - 在「設定」中將其開啟';

  @override
  String get geoEmptyNoGpsFix =>
      '無法取得 GPS 修復（在 Wi‑Fi iPad 上常見）- 在下方手動設定 geohash';

  @override
  String get geoEmptyTeleportHint => '點選地點圖示→輸入geohash（例如w5）→傳送';

  @override
  String get geoSetGeohashManually => '設定地理哈希值';

  @override
  String get geoTeleportHint =>
      '沒有GPS？輸入 geohash 前綴（2–7 個字符，例如 w5）並點擊 Teleport';

  @override
  String get geoTeleportInvalid =>
      '無效的 geohash — 僅使用 base32 字母/數字（例如 w5 或 w5jt8）';

  @override
  String geoTeleportOk(String channel) {
    return '區域設定為$channel';
  }

  @override
  String geoManualActive(String channel) {
    return '手動區域：$channel（GPS刷新將覆蓋）';
  }

  @override
  String get geoEmptyNoNostr => 'Nostr 未準備好 — 點選「重新連線」（0/0 直到初始化成功）';

  @override
  String get geoEmptyMeshOnly => '傳輸僅限網狀 - 切換到互聯網或自動以發現 Nostr 上的對等點';

  @override
  String geoEmptyWaiting(String channel) {
    return '$channel 中尚未有人 - 在兩台裝置上保持區域 + 網路開啟並等待約 60 秒';
  }

  @override
  String get geoChannelFallback => '＃區域';

  @override
  String get geoRefreshLocation => '重新整理位置';

  @override
  String get settingsClearLocationTitle => '清晰的位置';

  @override
  String get settingsClearLocationSubtitle => '刪除 GPS/傳送 geohash（區域變成#—）';

  @override
  String get settingsClearLocationConfirmTitle => '位置明確嗎？';

  @override
  String get settingsClearLocationConfirmBody =>
      '刪除此裝置上儲存的 geohash。之後您可以再次刷新 GPS 或傳送。';

  @override
  String get settingsClearLocationAction => '清晰的位置';

  @override
  String get settingsClearLocationSnack => '位置已清除';

  @override
  String get chatVoiceTooLarge => '語音註釋太大 - 最多約 30 秒';

  @override
  String get chatVoiceNeedInternet => '語音筆記需要網路 (Nostr) — 對於單獨的 BLE 來說太大';

  @override
  String get chatVoiceSentInternet => '透過網路傳送語音留言';

  @override
  String get noticeAnonMention => '提到';

  @override
  String get noticeAnonDm => '直接留言';

  @override
  String get noticeAnonHug => '擁抱';

  @override
  String get noticeAnonSlap => '拍擊';

  @override
  String get noticeAnonBlock => '堵塞';

  @override
  String get noticeAnonNeedKey => '還沒有公鑰－先用二維碼進行1:1交換';

  @override
  String get noticeAnonActionSent => '傳送';

  @override
  String noticeAnonBlocked(String anon) {
    return '已阻止 $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '*擁抱$anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* 打 $anon *';
  }

  @override
  String get geoReconnectNostr => '重新連線Nostr';

  @override
  String get nostrSectionTitle => 'Nostr繼電器';

  @override
  String get nostrSectionSubtitle => '網路訊息傳遞和區域發現使用這些中繼。如果狀態保持離線，請點選重新連線。';

  @override
  String nostrStatusOnline(int connected, int total) {
    return '已連線 $connected/$total';
  }

  @override
  String get nostrStatusOffline => '離線 — 已列出繼電器但未連接';

  @override
  String get nostrStatusNotInit => '尚未開始(0/0) —輕點「重新連線」以初始化';

  @override
  String get nostrReconnectAction => '重新連線Nostr';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr 已連線 ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed => '仍處於離線狀態 — 檢查 Wi‑Fi/cellular 或重試';

  @override
  String nostrReconnectFailedDetail(String error) {
    return '失敗：$error';
  }

  @override
  String get nostrReconnecting => '連接到繼電器...';

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return '$channel 中的網際網路 (Nostr) • 密封聊天就緒';
  }

  @override
  String get transportModeTitle => '區域交通';

  @override
  String get transportModeSubtitle =>
      '網格 = BLE 附近（無線電），當沒有 Nostr 時 · 網路和汽車 = Nostr 人員列表';

  @override
  String get transportModeMesh => '網';

  @override
  String get transportModeInternet => '網際網路';

  @override
  String get transportModeAuto => '汽車';

  @override
  String get geoPublicHint => '向該領域的所有人在線公開消息';

  @override
  String get geoPublicSend => '民眾';

  @override
  String geoPublicHelp(int count) {
    return '密封扇出到 $count 線上對等點 - 每個人都會收到一個私人信封';
  }

  @override
  String geoPublicSent(int count) {
    return '發送至該區域中的 $count 對等點';
  }

  @override
  String get geoPublicSentNone =>
      '沒有線上可傳送訊息的對等點 — 與擁有金鑰的對等點開啟區域/網格，或等待 BLE/Nostr';

  @override
  String get areaPublicBadge => '區域公共';

  @override
  String get geoErrorPermission => '無法讀取位置 - 檢查位置權限';

  @override
  String get geoPrecisionRegion => '地區';

  @override
  String get geoPrecisionProvince => '省';

  @override
  String get geoPrecisionCity => '城市';

  @override
  String get geoPrecisionNeighborhood => '鄰裡';

  @override
  String get geoPrecisionBlock => '堵塞';

  @override
  String get aliasTitle => '設定暱稱（聯絡人別名）';

  @override
  String get aliasHintBody => '此別名僅儲存在此裝置上（僅限本機）\n它永遠不會與 E2EE 流量一起發送';

  @override
  String get aliasLabel => '暱稱';

  @override
  String get aliasHint => '例如「村長」、「P\'Somchai」…';

  @override
  String get settingsDevices => '裝置';

  @override
  String get settingsFirmwareTitle => '下載/更新ESP32韌體';

  @override
  String get settingsFirmwareSubtitle => '下載.bin檔案並透過OTA更新ESP32板';

  @override
  String get mtBridgeTitle => 'Meshtastic橋';

  @override
  String get mtBridgeSettingsSubtitle => '純文字 A/B 橋接器 — 不是 ResilNet E2EE';

  @override
  String get mtBridgeIntro =>
      '在 Meshtastic 和 ResilNet 之間移動短明文。模式A和B不能同時運作。這不是端對端加密。';

  @override
  String get mtBridgeModeLabel => '模式';

  @override
  String get mtBridgeModeOff => '離開';

  @override
  String get mtBridgeModeA => '攝取A';

  @override
  String get mtBridgeModeB => '出口B';

  @override
  String get mtBridgeModeOffShort => '離開';

  @override
  String get mtBridgeModeAShort => '在A';

  @override
  String get mtBridgeModeBShort => '輸出B';

  @override
  String get mtBridgeMutexHint => '選擇一種模式會自動關閉另一種模式。不支援同時 A+B。';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => '示範（記錄）';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint => '入站文字在「通知」下顯示為#meshtastic。網狀中繼是可選的（預設關閉）。';

  @override
  String get mtBridgeRelayTitle => '還中繼 ResilNet 網格';

  @override
  String get mtBridgeRelayHint => '啟用後，將廣播簽署的公共公告。關 = 僅此手機的通知。';

  @override
  String get mtBridgeSimulateHint => '示範訊息';

  @override
  String get mtBridgeSimulate => '模擬Meshtastic訊息';

  @override
  String get mtBridgeIngestOk => '納入通知（#meshtastic）';

  @override
  String get mtBridgeEgressWarning =>
      '警告：此處發送的訊息不是 ResilNet E2EE。 Meshtastic 路徑上的任何人都可以閱讀它們。';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => '待發布文本';

  @override
  String get mtBridgeSend => '發送至Meshtastic';

  @override
  String get mtBridgeEgressOk => '排隊等候Meshtastic（查看日誌/歷史記錄）';

  @override
  String get mtBridgeLastEgress => '最後出口';

  @override
  String get mtBridgeEgressHistory => '最近外出';

  @override
  String get mtBridgeOffHint => '開啟 Ingest (A) 或 Egress (B) 以使用網橋。';

  @override
  String get mtBridgeNoticeBadge => 'MESHASTIC · 不是 E2EE';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => '使用MQTT傳輸';

  @override
  String get mtBridgeUseMqttHint =>
      '關閉 = 僅演示日誌記錄（MQTT 入站被忽略）。 On = MQTT 用於連接時的入口/出口。';

  @override
  String get mtBridgeMqttHost => '經紀商主機';

  @override
  String get mtBridgeMqttPort => '港口';

  @override
  String get mtBridgeMqttTls => '使用 TLS (mqtts)';

  @override
  String get mtBridgeMqttTlsHint => '典型端口8883。使用系統證書；握手錯誤時軟失敗。';

  @override
  String get mtBridgeMqttAutoReconnect => '自動重新連接';

  @override
  String get mtBridgeMqttAutoReconnectHint => '啟用後，客戶端會在斷開後嘗試重新連線。狀態顯示正在連線至恢復。';

  @override
  String get mtBridgeMqttTopicHelpers => '主題助手';

  @override
  String get mtBridgeMqttRegion => '區域前綴（可選）';

  @override
  String get mtBridgeMqttRegionHint =>
      '設定後，Apply 將根重建為 msh/<region>/2/json （覆蓋主題根）。';

  @override
  String get mtBridgeMqttTopicRoot => 'JSON 主題根';

  @override
  String get mtBridgeMqttDownlinkChannel => '下行通道名稱';

  @override
  String get mtBridgeMqttApplyTopics => '申請root→訂閱/發布主題';

  @override
  String get mtBridgeMqttAdvanced => '進階 MQTT';

  @override
  String get mtBridgeMqttAdvancedHint => 'TLS、重新連結、主題、憑證';

  @override
  String get mtBridgeMqttTopicIn => '訂閱主題';

  @override
  String get mtBridgeMqttTopicOut => '發布主題';

  @override
  String get mtBridgeMqttGatewayFrom => '網關點id（來自）';

  @override
  String get mtBridgeMqttGatewayFromHint => '十進位 ID 或 !hex — sendtext 下行鏈路所需';

  @override
  String get mtBridgeMqttChannelIndex => '網狀通道索引（可選 0–7）';

  @override
  String get mtBridgeMqttUser => '使用者名稱（可選）';

  @override
  String get mtBridgeMqttPass => '密碼（可選）';

  @override
  String get mtBridgeMqttPassStored => '密碼儲存在該裝置上（未顯示）。';

  @override
  String get mtBridgeMqttPassReplace => '新密碼（留空保留）';

  @override
  String get mtBridgeMqttPassReplaceHint => '留空以保留儲存的密碼。';

  @override
  String get mtBridgeMqttPassClear => '清除密碼';

  @override
  String get mtBridgeMqttSave => '儲存 MQTT 設定';

  @override
  String get mtBridgeMqttSaved => 'MQTT 設定已儲存';

  @override
  String get mtBridgeMqttConnect => '連接';

  @override
  String get mtBridgeMqttDisconnect => '斷開';

  @override
  String get mtBridgeMqttConnected => 'MQTT已連接';

  @override
  String get mtBridgeMqttConnecting => 'MQTT正在連線...';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT已斷開連接';

  @override
  String get mtBridgeMqttError => 'MQTT錯誤';

  @override
  String get mtBridgeErrModeIngest => '先切換到攝取 (A)';

  @override
  String get mtBridgeErrModeEgress => '首先切換到出口 (B)';

  @override
  String get mtBridgeErrRate => '放慢速度——速率有限';

  @override
  String get mtBridgeErrDedupe => '重複訊息被忽略';

  @override
  String get mtBridgeErrLoop => '丟棄以防止橋接環路';

  @override
  String get mtBridgeErrEmpty => '留言內容為空';

  @override
  String get mtBridgeErrPublish => '發布失敗';

  @override
  String get mtBridgeErrNotConnected => 'MQTT未連接';

  @override
  String get mtBridgeErrMissingHost => '輸入MQTT代理主機';

  @override
  String get mtBridgeErrMissingTopic => '輸入訂閱和發布主題';

  @override
  String get mtBridgeErrMissingFromNode => '輸入 sendtext 的網關節點 ID（來自）';

  @override
  String get mtBridgeErrConnect => 'MQTT 連線失敗';

  @override
  String get mtBridgeErrConnectTls => 'MQTT TLS 連線失敗';

  @override
  String get settingsData => '數據';

  @override
  String get settingsDataHint => '刪除本機訊息以縮小資料庫－保留身分、金鑰和對等點';

  @override
  String get settingsSaveHistoryTitle => '保存訊息歷史記錄';

  @override
  String get settingsSaveHistorySubtitle =>
      '關閉時，訊息將保留在 E2EE 線路上，並且僅保留此會話（不在本機聊天歷史記錄中）。您自己的文字在此裝置上仍顯示為純文字。';

  @override
  String get settingsPrivacy => '隱私';

  @override
  String get settingsE2eeTitle => '端對端加密';

  @override
  String get settingsE2eeSubtitle =>
      '始終開啟 — 訊息在發送前使用 RSA-OAEP + AES-GCM 進行密封。中繼和附近的躍點無法讀取內容。';

  @override
  String get settingsScreenshotTitle => '截圖提醒';

  @override
  String get settingsScreenshotSubtitle => '當該設備捕獲螢幕時，在聊天中顯示系統線路';

  @override
  String get settingsNostrExpiryTitle => 'Nostr訊息保持時間';

  @override
  String get settingsNostrExpirySubtitle => '透過以下方式上線時，密封信封應在當地保留多長時間： Nostr';

  @override
  String get noticeExpiresIn => '到期於';

  @override
  String get noticesTitle => '通知';

  @override
  String get noticesMeshIntro =>
      '公共公告－無線電範圍內的每個人都可以看到，未加密。它會在電話到電話之間進行離線連接，並且附近的 ResilNet 中繼盒會保留一份副本，以便後來到達的人仍然可以看到它。';

  @override
  String get noticesMeshPublicBadge => '公開 · 未加密';

  @override
  String get noticesGeoIntro => '添加此地點的簡短註釋，以便其他訪客可以找到它們。';

  @override
  String get noticesEmpty => '還沒有通知';

  @override
  String get noticesEmptyHint => '為附近的人釘上第一個通知。';

  @override
  String get noticesComposeHint => '發布通知...';

  @override
  String get noticesUrgent => '緊迫的';

  @override
  String get noticesOpen => '通知';

  @override
  String get screenshotTaken => '*你截圖了*';

  @override
  String get chatAttachImage => '附上圖片';

  @override
  String get chatImageLabel => '影像';

  @override
  String get chatImageTooLarge => '圖片太大 - 嘗試另一張照片';

  @override
  String get chatNostrExpiry => 'Nostr 保留';

  @override
  String geoPublicComposeHint(String channel) {
    return '寄至 $channel — 公開';
  }

  @override
  String get settingsClearTitle => '清除所有訊息';

  @override
  String get settingsClearSubtitle => '刪除該裝置上的所有聊天記錄';

  @override
  String get settingsClearConfirmTitle => '清除所有訊息？';

  @override
  String get settingsClearConfirmBody => '這將刪除該裝置上的所有聊天訊息。\n同伴和暱稱不會被刪除。';

  @override
  String get settingsClearAction => '清除數據';

  @override
  String get settingsClearedSnack => '資料已清除';

  @override
  String settingsVersion(String version) {
    return '版本$version';
  }

  @override
  String get meshBleScanning => 'BLE：掃描節點';

  @override
  String get meshBleEsp32Scanning => 'ESP32：尋找附近的節點';

  @override
  String get meshBleSyncing => 'BLE：與ESP32同步';

  @override
  String get meshNostrPublishing => 'Nostr：發布';

  @override
  String get meshBleIdle => 'BLE 網路已開啟 — 附近還沒有手機';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE 格 — $count 附近的手機';
  }

  @override
  String get meshBleNeedsPermission => 'BLE：需要許可';

  @override
  String get meshBlePausedCamera => 'BLE 暫停拍照 — 點選開始 BLE';

  @override
  String get meshBleStopped => 'BLE 已關閉 — 檢查藍牙是否已打開，然後點選開始 BLE';

  @override
  String get meshBleRestart => '開始 BLE';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · 本地 $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => '檢查權限並啟動 BLE';

  @override
  String get meshNostrOffline => 'Nostr離線';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count 附近的對等點 • LoRa $lora • 同步 ~${meters}m';
  }

  @override
  String get meshLoraReady => '準備好';

  @override
  String get meshLoraNotReady => '還沒準備好';

  @override
  String meshGatewayProgress(String label) {
    return '網關 UDP：$label';
  }

  @override
  String get meshGatewayReady => '網關 UDP：準備就緒';

  @override
  String get permissionTitle => '允許存取啟動 BLE 網狀網絡';

  @override
  String get permissionBody =>
      '該應用程式需要藍牙（掃描/連接/廣告）、位置（適用於較舊的 Android 裝置）和麥克風（用於聊天和公告中的語音註釋）來進行社群訊息傳遞。';

  @override
  String get permissionE2ee => '端對端加密 (E2EE)\n中繼節點無法讀取訊息內容';

  @override
  String get permissionReady => '權限準備就緒';

  @override
  String get permissionRequest => '允許並繼續';

  @override
  String get permissionNotReadySnack => '系統尚未準備好 — 稍等片刻，然後重試';

  @override
  String get permissionDeniedSnack => '權限不完整 — 開啟「設定」> ResilNet 並允許藍牙/位置/麥克風';

  @override
  String get permissionMicDenied => '麥克風存取被拒絕 - 在“設定”中允許其錄製語音筆記';

  @override
  String get permissionMicOpenSettings => '設定';

  @override
  String get permissionCameraDenied => '相機存取被拒絕 - 在“設定”中允許其掃描二維碼';

  @override
  String get permissionCameraFailed => '掃描二維碼需要相機權限';

  @override
  String get permissionCameraOpenSettings => '設定';

  @override
  String get permissionPhotosDenied => '照片庫存取被拒絕 — 在「設定」中允許它保存您的二維碼';

  @override
  String get permissionPhotosFailed => '需要照片庫權限才能儲存您的二維碼';

  @override
  String get permissionPhotosOpenSettings => '設定';

  @override
  String permissionFailedSnack(String error) {
    return '權限請求失敗：$error';
  }

  @override
  String get permissionFooter => 'ResilNet 架構 • 儲存轉發多跳';

  @override
  String get onboardingSkip => '跳過';

  @override
  String get onboardingNext => '下一個';

  @override
  String get onboardingStart => '開始使用';

  @override
  String get onboardingWelcomeTitle => '歡迎來到ResilNet';

  @override
  String get onboardingWelcomeBody => '透過網狀網路在 ResilNet 上聊天 — 即使沒有互聯網';

  @override
  String get onboardingFriendsTitle => '輕鬆新增好友';

  @override
  String get onboardingFriendsBody => '分享來自 Identity 的 QR，或掃描朋友的 QR 來交換公鑰';

  @override
  String get onboardingChannelsTitle => '加密聊天+附近頻道';

  @override
  String get onboardingChannelsBody =>
      '切換 #mesh / Area (geohash) 以查找附近的對等點 - 訊息透過 BLE 網格和 Nostr 保持 E2EE';

  @override
  String get chatTitle => '聊天（E2EE）';

  @override
  String get chatScanTooltip => '掃描二維碼新增好友';

  @override
  String get chatBlockTooltip => '阻止該寄件人';

  @override
  String get chatBlockedSnack => '被封鎖：沒有通知/沒有中繼';

  @override
  String get chatAliasTooltip => '設定暱稱';

  @override
  String get chatReceiverPemLabel => '收件者公鑰 (PEM)';

  @override
  String get chatReceiverPemHint => '貼上您朋友的公鑰（來自二維碼/共享檔案）';

  @override
  String get chatNeedPeerKey => '首先掃描該節點的二維碼（需要經過驗證的公鑰）';

  @override
  String get chatPeerKeyMismatch => '儲存的公鑰與此對等點 ID 不匹配';

  @override
  String chatVoiceFailed(String error) {
    return '無法錄製音訊：$error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return '無法播放語音註釋：$error';
  }

  @override
  String get chatPlayVoice => '播放語音筆記';

  @override
  String get chatPauseVoice => '暫停';

  @override
  String get chatVoiceLabelSent => '🎤 語音留言（密封）';

  @override
  String get chatVoiceLabel => '🎤 語音留言';

  @override
  String get chatDecryptFailed => '[解密失敗]';

  @override
  String chatSentSealed(String preview) {
    return '[密封•ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[密封]';

  @override
  String get chatComposeHint => '輸入訊息...（發送時密封）';

  @override
  String get chatEmptyThread => '還沒有消息\n輸入以下內容以透過網格發送';

  @override
  String chatLoadFailed(String error) {
    return '無法載入對話：$error';
  }

  @override
  String get chatEmojiTooltip => '表情符號';

  @override
  String get statusPending => '待辦的';

  @override
  String get statusSent => '傳送';

  @override
  String get statusRelayed => '中繼';

  @override
  String get statusDelivered => '發表';

  @override
  String get statusRead => '讀';

  @override
  String get statusFailed => '失敗的';

  @override
  String get chatCopy => '複製';

  @override
  String get chatDeleteLocal => '在此設備上刪除';

  @override
  String get chatDeletedLocalSnack => '已在此裝置上刪除';

  @override
  String get chatRetry => '重試';

  @override
  String get chatSendFailed => '未送達 — 點選“重試”';

  @override
  String get chatImageNeedInternet => '連接到網際網路以傳送影像';

  @override
  String get chatImageTooLargeOnline => '無法將影像壓縮到足以發送的程度';

  @override
  String get chatOpenLinkFailed => '無法開啟連結';

  @override
  String get identityTitle => '身分';

  @override
  String get identityScanTooltip => '用相機掃描二維碼';

  @override
  String get identityCopiedHash => '已複製公鑰哈希';

  @override
  String get identityPeerSaved => '透過 QR 保存的對等點';

  @override
  String get identityGalleryDenied => '照片庫權限被拒絕';

  @override
  String get identityQrSaved => '二維碼已儲存至照片庫';

  @override
  String identityQrSaveFailed(String error) {
    return '無法儲存二維碼：$error';
  }

  @override
  String get peersTitle => '網路成員';

  @override
  String get qrScanTitle => '掃描二維碼新增好友';

  @override
  String get qrInvalid => '掃描失敗：二維碼無效';

  @override
  String get qrIdKeyMismatch => 'QR 被拒絕：id 與公鑰不匹配';

  @override
  String get qrCameraNotReady => '相機未準備好';

  @override
  String get qrRetrySettings => '重試/開啟設定';

  @override
  String qrCameraOpenFailed(String error) {
    return '無法開啟相機：$error';
  }

  @override
  String get qrScanAlignHint => '將二維碼對齊框內';

  @override
  String get firmwareDownloadTitle => '下載ESP32韌體';

  @override
  String get firmwareSourceOnline => '最新（線上）';

  @override
  String get firmwareSourceCached => '保存的副本（離線）';

  @override
  String get firmwareSourceBaseline => '捆綁基線（離線）';

  @override
  String get firmwareSourceUnavailable => '無可用韌體';

  @override
  String get firmwareBaselineIncompatible => '捆綁韌體太舊 - 連接到互聯網下載更新版本';

  @override
  String get firmwareChecksumFailed => '韌體完整性檢查失敗 — 閃爍被阻止';

  @override
  String firmwareReadyFromSource(String source) {
    return '韌體就緒：$source';
  }

  @override
  String get peersRefreshTooltip => '重新整理';

  @override
  String get peersBlocked => '被阻止';

  @override
  String peersNearbyBle(Object ble) {
    return '附近 (BLE)';
  }

  @override
  String get peersRecentlyOnline => '最近上線';

  @override
  String get peersOnlineInArea => '區域內在線';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return '瀏覽時間 $minutes 分鐘前';
  }

  @override
  String get peersOffline => '離線';

  @override
  String peersBlockedSnack(String id) {
    return '已阻止 $id';
  }

  @override
  String get peersUnblockedSnack => '暢通';

  @override
  String get peersEmpty => '資料庫中還沒有成員\n掃描二維碼或等待 BLE 網格發現';

  @override
  String get peersOpenChat => '打開聊天';

  @override
  String get peersBlockAction => '堵塞';

  @override
  String get peersUnblockAction => '解鎖';

  @override
  String get channelPickerTooltip => '聊天/#mesh/區域';

  @override
  String get locationPickerTooltip => '定位通道';

  @override
  String get transportPickerTooltip => '網狀/互聯網/汽車';

  @override
  String get onlinePeopleTooltip => '線上人數';

  @override
  String get unreadDirectsTooltipEmpty => '私訊';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count未讀私訊';
  }

  @override
  String get onlinePeopleTitle => '人們';

  @override
  String get onlinePeopleEmpty => '這裡還沒有人在線';

  @override
  String onlinePeopleCount(int count) {
    return '$count在線';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1·附近+區域';

  @override
  String get peerOnlineMeshTitle => '附近有人在網格上';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name 位於網格附近';
  }

  @override
  String get peerOnlineAreaTitle => '該地區有人在線';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name 透過 Nostr 在線';
  }

  @override
  String get locationSheetTitle => '#位置頻道';

  @override
  String get channelPinsTitle => '已固定';

  @override
  String get channelPinsHint => '固定您經常使用的頻道 - 它們位於頂部';

  @override
  String get channelPinTooltip => '固定此頻道';

  @override
  String get channelUnpinTooltip => '取消固定';

  @override
  String get locationSheetIntro =>
      '使用粗略的 geohash（而不是精確的 GPS）與附近的人聊天。 Internet 上的存在使用匿名 Nostr 金鑰。';

  @override
  String get locationMeshSubtitle => '#藍牙 • ~10–50 m';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => '傳送';

  @override
  String homeComposeHint(String channel) {
    return '訊息$channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return '寄至 $channel — 公開';
  }

  @override
  String get messageExpiryTitle => '到期於';

  @override
  String get voiceRecordTapToStart => '點擊即可錄製語音訊息';

  @override
  String get voiceRecordTooShort => '錄音太短 - 請重試';

  @override
  String get voiceRecordFailed => '無法儲存錄音 - 請重試';

  @override
  String get voicePttHold => '按住錄音';

  @override
  String get voicePttRelease => '發布預覽';

  @override
  String get voicePttRecording => '記錄…';

  @override
  String get voicePttDraftReady => '語音留言準備就緒';

  @override
  String get voicePttDiscard => '丟棄';

  @override
  String get voicePttReRecord => '再次錄製';

  @override
  String get voicePttSend => '傳送語音留言';

  @override
  String get voicePttPlayPreview => '播放預覽';

  @override
  String get voicePttStopPreview => '停止預覽';

  @override
  String get noticesBackfilling => '正在載入通知...';

  @override
  String get noticesNostrOnline => 'Nostr在線';

  @override
  String get noticesNostrOffline => 'Nostr 離線 — 公告需要互聯網';

  @override
  String noticesBackfillLoaded(int count) {
    return '已載入 $count 通知';
  }

  @override
  String get noticePublishFailed => '無法向地區委員會發布通知。檢查Nostr連線。';

  @override
  String get noticeMeshPublishNoLink =>
      '保存在本地。連接到附近的網狀無線電（或 Wi‑Fi 網關），以便其他人可以接收它。';

  @override
  String noticeMeshPublishSent(int count) {
    return '公告已透過 BLE 發送到附近的 $count 裝置。';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      '已看到附近的無線電，但 BLE 寫入失敗。讓兩個應用程式在「通知」畫面上保持開啟狀態，然後重試（或使用 ESP32 中繼）。';

  @override
  String get noticeMeshPublishNoGatt => '該設備的BLE接收器未準備好。切換藍牙並重新開啟通知。';

  @override
  String get noticeDelete => '刪除通知';

  @override
  String get noticeDeleteConfirmTitle => '刪除這個通知嗎？';

  @override
  String get noticeDeleteLocalOnlyBody => '這僅在此設備上刪除它。其他已經收到它的人仍然會看到它。';

  @override
  String get noticeDeleted => '通知已刪除';

  @override
  String get chatNoticeHidden => '區域通知 — 開放通知';

  @override
  String get identityDisplayNameTitle => '顯示名稱';

  @override
  String get identitySaveName => '保存名稱';

  @override
  String get identityUserIdLabel => '用戶 ID（公鑰哈希）';

  @override
  String get identityCopyHashTooltip => '複製公鑰哈希';

  @override
  String get identityMyQrTitle => '我的二維碼（id + pubKey + 姓名）';

  @override
  String identityQrFailed(String error) {
    return '無法建立二維碼\n$error';
  }

  @override
  String get identitySaving => '保存…';

  @override
  String get identitySaveQr => '將二維碼儲存到照片庫';

  @override
  String get identityOpenScanner => '開啟相機掃描二維碼';

  @override
  String get identityQrHelp => '讓朋友掃描此資訊以保存您的公鑰並（如果需要）將您設定為已驗證的發行人';

  @override
  String get identityChatTip => '提示：您也可以在聊天中掃描二維碼添加E2EE公鑰';

  @override
  String get infoOpen => '關於/訊息';

  @override
  String get docsGuideTitle => '使用者指南';

  @override
  String get docsGuideSubtitle => '在瀏覽器中開啟';

  @override
  String get docsOpenAction => '開啟指南';

  @override
  String get docsOpenFailed => '無法開啟使用者指南';

  @override
  String get firmwareOtaGuideTitle => 'Flash指南&OTA協議';

  @override
  String get firmwareOtaGuideSubtitle => '開啟網路指南 — .bin 下載與完整步驟';

  @override
  String get firmwareWebDownloadsTitle => '在網路上下載韌體';

  @override
  String get firmwareWebDownloadsSubtitle => '文件網站上的每個版本連結和校驗和';

  @override
  String get inviteCopyShortLink => '複製短連結';

  @override
  String get inviteShareLink => '分享連結';

  @override
  String get inviteShowFullLink => '完整連結';

  @override
  String get inviteCopyFullLink => '複製完整連結';

  @override
  String get inviteLinkCopied => '連結已複製';

  @override
  String get inviteLongPressHint => '長按可進行連結操作';

  @override
  String get inviteSendInChat => '發送 ResilNet 聊天...';

  @override
  String get inviteSendInChatHint => '僅適用於您已擁有公鑰的人';

  @override
  String get inviteSendInChatEmpty =>
      '還沒有可發送訊息的聊天。\n首先掃描二維碼、打開區域/網格或在應用程式外部共享連結。';

  @override
  String get inviteSentToChat => '邀請已在聊天中發送';

  @override
  String get infoTabInfo => '資訊';

  @override
  String get infoTabSettingsHint => '從語言、E2EE 和資料工具的選單中開啟“設定”';

  @override
  String get infoHowToTitle => '如何使用';

  @override
  String get infoHowToBody =>
      '• 點選頻道圖示可切換聊天/#mesh/區域\n• 點選地點選擇 geohash 大小\n• 點選人員以尋找會員或線上人員\n• 從 ⋮ 開放身分/二維碼以親自交換金鑰\n•「公共」區域向每個線上對等方發送密封的 E2EE——而不是明文房間';

  @override
  String get infoFeaturesTitle => '特徵';

  @override
  String get infoFeatureOffline => '透過低功耗藍牙進行離線訊息傳遞';

  @override
  String get infoFeatureE2ee => '使用 RSA-OAEP + AES-GCM 進行端對端加密（非雜訊）';

  @override
  String get infoFeatureMultihop => '訊息可以透過附近的對等點傳送到更遠的地方';

  @override
  String get infoFeatureBridge => '用於密封信封的混合網格 ↔ 互聯網 (Nostr)';

  @override
  String get infoFeatureGeo => '附近人的本地 geohash 頻道（發現 UX）';

  @override
  String get infoFeatureNotices => '#mesh 和 Area 過期的通知';

  @override
  String get infoPrivacyTitle => '隱私';

  @override
  String get infoPrivacyNoRoom => '網路上沒有明文村莊/公共聊天室';

  @override
  String get infoPrivacyFanout => '區域發送 = 密封 1:1 扇出到具有已知公鑰的對等方';

  @override
  String get infoPrivacyPresence => '在網際網路區域存在使用臨時 Nostr 金鑰';

  @override
  String get infoSymbolsTitle => '符號';

  @override
  String get infoSymBle => '直接藍牙連結';

  @override
  String get infoSymMesh => '可透過網狀網路到達（其他轉送）';

  @override
  String get infoSymInternet => '透過互聯網 (Nostr) — 密封信封';

  @override
  String get infoSymBridge => '經由網狀網↔互聯網橋路徑到達';

  @override
  String get infoSymOffline => '離線 — 目前無法訪問';

  @override
  String get infoSymInArea => '在此位置通道區域';

  @override
  String get infoSymE2eeOk => '端對端加密會話';

  @override
  String get infoSymE2eeFail => '加密不可用——不要發送敏感文本';

  @override
  String get infoSymVerified => '身份驗證/已知金鑰';

  @override
  String get infoSymBlocked => '被阻止';

  @override
  String get infoSymUnread => '未讀私訊';

  @override
  String get infoEmergencyTitle => '緊急模式';

  @override
  String get infoEmergencyBody => '連按三次主畫面上的 ResilNet 標題可擦除該裝置上的訊息、金鑰和身分資訊。';

  @override
  String get infoLegendNote => '為了清楚起見，此處記錄了一些路徑圖示；聊天中的傳遞標記仍然是主要發送狀態。';

  @override
  String get dangerZoneTitle => '危險區域';

  @override
  String get dangerZoneSubtitle => '刪除該裝置上的訊息、加密金鑰、Nostr 身分、對等點和暱稱。您將再次設定。';

  @override
  String get panicWipeTitle => '緊急擦拭';

  @override
  String get panicWipeSubtitle => '擦除本地所有內容 - 與三次點擊主頁標題相同（雙擊刷新收音機）';

  @override
  String get panicWipeConfirmTitle => '清除所有本地資料？';

  @override
  String get panicWipeConfirmBody =>
      '這將永久刪除此手機上的聊天記錄、金鑰和身分資訊。\n同行必須用您的新身分重新交換二維碼金鑰。\n此操作無法撤銷。';

  @override
  String get panicWipeAction => '擦拭一切';

  @override
  String get panicWipeSnack => '本機身分已擦除 — 重新設定';

  @override
  String panicWipeFailed(String error) {
    return '擦除失敗：$error';
  }

  @override
  String get meshBridgeTitle => '橋';

  @override
  String get meshBridgeSubtitle =>
      '啟用（預設）後，密封信封可以同時使用 BLE 網格和網際網路 (Nostr)，以便附近的網格島可以連接。關閉時，僅使用一條路徑發送 — 絕不將明文傳輸到線路上。';

  @override
  String get favoritesTitle => '收藏夾';

  @override
  String get favoritesAdd => '加入收藏夾';

  @override
  String get favoritesRemove => '從收藏夾中刪除';

  @override
  String get favoritesEmpty => '尚未收藏 — 從成員名單中為同儕加註星標';

  @override
  String get favoritesNearbyTitle => '附近最喜歡的';

  @override
  String favoritesNearbyBody(String name) {
    return '$name 位於網格附近';
  }

  @override
  String get favoritesInAreaTitle => '最喜歡的地區';

  @override
  String favoritesInAreaBody(String name) {
    return '$name在此區域在線';
  }

  @override
  String get topologyTitle => '網狀拓撲';

  @override
  String get topologySubtitle => '來自網格公告的對等點和連接提示（唯讀）';

  @override
  String get topologyConnectedNow => '現已連線 (BLE)';

  @override
  String get topologyNearby => '附近 (BLE)';

  @override
  String get topologyKnown => '已知同行';

  @override
  String get topologyEmpty => '尚未有同伴獲悉 - 留在附近並開啟 BLE';

  @override
  String get topologyYou => '你';

  @override
  String topologyStats(int peers, int links) {
    return '$peers 同行 · $links 鏈接';
  }

  @override
  String get topologyGraphHint => '根據附近的網格發現估算 - 您的設備突出顯示。點擊同伴即可開啟聊天。';

  @override
  String get topologyOpen => '網狀拓撲';

  @override
  String get slashHelpTitle => '命令';

  @override
  String get slashHelpBody =>
      '/help — 此列表\n/who — 目前頻道中在線的人\n/drop <text> — 在此處固定密封通知（E2EE 扇出）\n\n完整指南：使用下面的開啟指南，或設定 → 使用者指南。';

  @override
  String get slashWhoEmpty => '目前該頻道無人在線';

  @override
  String slashWhoTitle(int count) {
    return '線上 ($count)';
  }

  @override
  String get slashDropNeedText => '用法：/刪除您的註釋文本';

  @override
  String slashDropDone(String channel) {
    return '已在 $channel 上刪除通知';
  }

  @override
  String get slashUnknown => '未知指令 — 嘗試 /help';

  @override
  String get announceOpen => '公告';

  @override
  String get announceTitle => '公告';

  @override
  String get announceEmpty => '還沒有留言板 — 建立一個留言板來發布鎖定或開放的通知';

  @override
  String get announceCreate => '創建板';

  @override
  String get announceCreateHint => '董事會名稱';

  @override
  String get announceDefaultTitle => '社區委員會';

  @override
  String get announceSettings => '董事會設置';

  @override
  String get announceAllowLocked => '允許鎖定（加密）的帖子';

  @override
  String get announceAllowLockedSub => '加密到板密鑰 - 讀者需要訪問';

  @override
  String get announceAllowOpen => '允許公開（明文）帖子';

  @override
  String get announceAllowOpenSub => '不是 E2EE — 在網狀網路/繼電器上可讀。預設關閉。';

  @override
  String get announceComposeHint => '寫一個公告...';

  @override
  String get announceMediaInternetOnly => '透過網路傳送照片/語音通知（不是 BLE）';

  @override
  String get announceNeedInternet => '連接網路發送照片或語音通知';

  @override
  String announceVoiceFailed(String error) {
    return '無法錄製語音：$error';
  }

  @override
  String get announceImageTooLarge => '影像太大（最大 ~180 KB）';

  @override
  String get announcePlayVoice => '播放語音筆記';

  @override
  String get announceImageLabel => '📷 圖片';

  @override
  String get announceAudioLabel => '🎤 語音留言';

  @override
  String get announceModeLocked => '鎖定';

  @override
  String get announceModeOpen => '打開';

  @override
  String get announceOpenBadge => '開放·未加密';

  @override
  String get announceLockedBadge => '鎖定';

  @override
  String get announceLockedPlaceholder => '加密 — 請求存取讀取';

  @override
  String get announceRequestAccess => '請求存取權限';

  @override
  String get announceRequestSent => '發送給版塊所有者的存取請求';

  @override
  String get announceRequestFailed => '無法請求存取（需要所有者的公鑰）';

  @override
  String get announceOpenConfirmTitle => '發文不加密？';

  @override
  String get announceOpenConfirmBody => '開放貼文不是 E2EE。路徑上的任何人（網格/中繼）都可以讀取它們。繼續？';

  @override
  String get announcePostAction => '郵政';

  @override
  String get announcePendingRequests => '訪問請求';

  @override
  String get announceApprove => '核准';

  @override
  String get announceDeny => '否定';

  @override
  String get announceGranted => '您可以閱讀此板上的鎖定帖子';

  @override
  String get announceOwner => '您擁有該板';

  @override
  String get announceCopyInvite => '複製邀請文本';

  @override
  String get announceShowInviteQr => '顯示邀請二維碼';

  @override
  String get announceScanInviteQr => '掃一掃邀請碼';

  @override
  String get announceFollow => '透過邀請關注董事會';

  @override
  String get announceFollowHint => '貼上來自所有者的邀請文字或 ResilNet 鏈接';

  @override
  String get announceFollowOk => '跟隨板';

  @override
  String announceFollowOkNamed(String title) {
    return '現在正在關注“$title”';
  }

  @override
  String get announceFollowFail => '邀請無效或已損壞';

  @override
  String get announceInviteCopied => '邀請文字已複製';

  @override
  String get announceInviteSaveQr => '儲存二維碼';

  @override
  String get announceInviteShare => '分享邀請';

  @override
  String get announceFollowFromCompose => '在訊息框中偵測到論壇邀請';

  @override
  String get peerConfirmAddTitle => '新增網路成員？';

  @override
  String peerConfirmAddBody(String name) {
    return '添加“$name”及其公鑰，以便您可以私下向他們發送訊息？';
  }

  @override
  String get peerConfirmAdd => '新增會員';

  @override
  String peerAddedOk(String name) {
    return '將 $name 新增至網路成員';
  }

  @override
  String get peerAddFromCompose => '在訊息框中偵測到身分/公鑰';

  @override
  String get peerHashCopied => '已複製公鑰哈希';

  @override
  String get peerHashOpenChat => '打開聊天';

  @override
  String get peerHashAddHint => '已複製哈希值。請他們分享他們的身份連結或 QR，以便您可以添加 E2EE 的完整公鑰。';

  @override
  String get peerQrNoCode => '此圖片中找不到 ResilNet 二維碼';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet身份：“$name”\n打開連結或將其貼到聊天中 → 新增成員\n或掃描身份二維碼。';
  }

  @override
  String get identityShareInvite => '分享身份連結';

  @override
  String get identityInviteCopied => '已複製身份連結';

  @override
  String announceInviteSharePreamble(String title) {
    return '董事會邀請：“$title”\n開啟 ResilNet → 社區委員會 → 透過邀請關注\n或掃描二維碼/點擊下面的連結。';
  }

  @override
  String get announceConfirmFollowTitle => '關注這個板塊？';

  @override
  String announceConfirmFollowBody(String title) {
    return '關注此邀請中的“$title”嗎？';
  }

  @override
  String get announceConfirmFollow => '跟隨';
}

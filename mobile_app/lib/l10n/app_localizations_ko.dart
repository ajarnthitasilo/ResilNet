// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'ResilNet 새로 고치는 중…';

  @override
  String get appRefreshed => '새로 고침 - 라디오 및 검색이 다시 시작되었습니다.';

  @override
  String appRefreshFailed(String error) {
    return '새로고침 실패: $error';
  }

  @override
  String get appRefreshTitleHint =>
      '두 번 탭하기 = 소프트 새로 고침. 길게 누르기 = 하드 복구. 세 번 탭하기 = 긴급 삭제.';

  @override
  String get softRefreshTipTitle => 'ResilNet이 막힌 것 같은 느낌이 드는 경우';

  @override
  String get softRefreshTipBody =>
      '라디오를 부드럽게 새로 고치려면 ResilNet(왼쪽 상단)을 두 번 탭하세요. 여전히 멈춘 경우: 제목을 길게 누르거나 ⋮ → 하드 복구 또는 설정을 사용하세요. 세 번 탭하면 긴급 삭제만 가능합니다.';

  @override
  String get softRefreshTipGotIt => '알았어요';

  @override
  String get infoSoftRefreshTitle => '앱이 멈춘 것 같은 경우';

  @override
  String get infoSoftRefreshStepRefresh =>
      'ResilNet(왼쪽 상단)을 두 번 탭하고 → 라디오 및 주변 사람 새로 고침';

  @override
  String get infoSoftRefreshStepHard => '아직도 붙어있나요? 제목을 길게 누르거나 ⋮ / 설정 → 하드 복구';

  @override
  String get infoSoftRefreshStepWait =>
      '결과 스낵바를 기다린 후 다시 시도하세요. 세션 재설정은 키를 유지합니다.';

  @override
  String get infoSoftRefreshStepWipe =>
      '세 번 탭하기 = 긴급 삭제(로컬 데이터 삭제) — 의도적인 경우에만';

  @override
  String get appRecoverySection => '앱 복구';

  @override
  String get appRecoverySectionSubtitle =>
      '앱이 정지된 것처럼 느껴질 때 사용하세요. 소프트 = 제목을 두 번 탭합니다. 하드 복구가 더 강력합니다. 세션 재설정은 키를 지우지 않고 서비스를 다시 시작합니다.';

  @override
  String get appHardRecoverAction => '하드 복구';

  @override
  String get appHardRecovering => '열심히 회복 중…';

  @override
  String get appSessionResetAction => '세션 재설정';

  @override
  String get appSessionResetRunning => '세션 재설정 중…';

  @override
  String get appSessionResetConfirmTitle => '세션을 재설정하시겠습니까?';

  @override
  String get appSessionResetConfirmBody =>
      '이 장치에서 ResilNet 서비스를 다시 시작합니다. 귀하의 ID 키는 보관됩니다.';

  @override
  String get appRecoveryBusy => '복구가 이미 실행 중입니다…';

  @override
  String get appRecoveryOk => '복구 완료';

  @override
  String get appRecoveryPartial =>
      '일부 단계를 건너뛰고 복구가 완료되었습니다. 여전히 멈춘 경우 다시 시도하세요.';

  @override
  String get appRecoveryFailed => '복구 실패 - 세션 재설정을 시도하거나 OS에서 앱을 강제 종료하세요.';

  @override
  String get localWifiTitle => '로컬 Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      '인터넷 없이 근처 장치를 연결하세요. 마치 하나의 LAN에 있는 것과 같습니다.';

  @override
  String get localWifiNotGatewayHint =>
      'ESP32 LoRa 게이트웨이 SoftAP가 아닙니다. 전화⇔전화/LAN 전용입니다.';

  @override
  String get localWifiUnavailable => '로컬 Wi‑Fi은 아직 준비되지 않았습니다. 앱 시작을 기다립니다.';

  @override
  String get lxmfBridgeTitle => '홈 노드';

  @override
  String get lxmfBridgeSubtitle =>
      '비공개 채팅을 전달하는 Wi‑Fi의 Mac 또는 Pi 옵션. 기본적으로 꺼져 있습니다. 종단 간 암호화를 대체하지 않습니다.';

  @override
  String get lxmfBridgeEnable => '홈 노드 사용';

  @override
  String get lxmfBridgeDisabledHint =>
      '이 네트워크의 Mac 또는 Pi에서 브리지 앱이 실행 중인 경우에만 켜십시오.';

  @override
  String lxmfBridgeOnline(String dest) {
    return '온라인 — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return '홈 노드에 연결할 수 없습니다 — $error';
  }

  @override
  String get lxmfBridgeBaseUrl => '홈 노드 주소';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP 또는 http://IP:port — 예 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => '피어 → LXMF 대상(JSON)';

  @override
  String get lxmfBridgeRefresh => '저장 및 새로고침 상태';

  @override
  String get lxmfBridgeLabHint => '고급: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => '홈 노드 설정';

  @override
  String get lxmfBridgeCheckConnection => '연결 확인';

  @override
  String get lxmfBridgeStatusOnline => '홈 노드에 연결됨';

  @override
  String get lxmfBridgeStatusOffline => '홈 노드에 연결할 수 없음';

  @override
  String get lxmfBridgeYourDest => '이 노드의 주소(친구와 공유)';

  @override
  String get lxmfBridgeCopyDest => '주소 복사';

  @override
  String get lxmfBridgeDestCopied => '주소가 복사되었습니다';

  @override
  String get lxmfBridgeLinkedPeers => '연결된 친구';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      '각 친구는 자신의 홈 노드 주소가 한 번씩 필요합니다. 그러면 봉인된 채팅에서 이 경로를 사용할 수 있습니다.';

  @override
  String get lxmfBridgeNoLinks => '아직 연결된 친구가 없습니다.';

  @override
  String get lxmfBridgeAddLink => '친구 연결';

  @override
  String get lxmfBridgePickPeer => '친구';

  @override
  String get lxmfBridgePeerDest => '홈 노드 주소';

  @override
  String get lxmfBridgePeerDestHint => '홈 노드 화면의 32자 코드';

  @override
  String get lxmfBridgeInvalidDest => '주소가 잘못된 것 같습니다. 홈 노드의 전체 코드를 붙여넣습니다.';

  @override
  String get lxmfBridgeRemoveLink => '풀리다';

  @override
  String get lxmfBridgeSaveLink => '구하다';

  @override
  String get lxmfBridgeLinkSaved => '친구가 연결되었습니다';

  @override
  String get lxmfBridgeNoPeers => '아직 메시지를 보낼 수 있는 연락처가 없습니다. 먼저 친구를 추가하세요.';

  @override
  String get lxmfBridgeHelp =>
      'Mac/Pi에서 브리지를 계속 실행하세요. 이 경로는 LAN에 유지됩니다. LoRa이 아니며 인터넷이나 Bluetooth 메시를 대체하지 않습니다.';

  @override
  String get localWifiModeHotspot => '가까운';

  @override
  String get localWifiModeRouter => '라우터';

  @override
  String get localWifiHotspotIntro =>
      '하나의 장치가 개인용 핫스팟을 공유합니다. 다른 사람들이 해당 핫스팟에 가입하면 ResilNet이(가) 로컬 네트워크에서 해당 핫스팟을 찾습니다.';

  @override
  String get localWifiHostAction => '네트워크(호스트) 생성';

  @override
  String get localWifiJoinAction => '네트워크에 가입';

  @override
  String get localWifiHostSteps =>
      '1. iOS/Android 설정을 열고 개인 핫스팟(또는 인터넷 공유)을 켭니다.\n2. 친구에게 핫스팟 이름(및 비밀번호)을 알려주세요.\n3. 여기로 돌아와서 \'핫스팟이 켜져 있습니다. 대기 시작\'을 탭하세요.';

  @override
  String get localWifiHostReady => '핫스팟이 켜져 있습니다. 대기 시작하세요';

  @override
  String get localWifiHostWaiting => '친구의 참여를 기다리는 중…';

  @override
  String get localWifiJoinSteps =>
      '1. 시스템 설정을 열고 친구의 개인 핫스팟에 가입하세요.\n2. 여기로 돌아와서 \'연결되었습니다 - 검색\'을 탭하세요.';

  @override
  String get localWifiJoinReady => '연결되었습니다 — 검색';

  @override
  String get localWifiRouterIntro =>
      '모든 장치를 동일한 Wi‑Fi 라우터/AP에 연결합니다. 라우터에는 인터넷이 필요하지 않으며 공유 로컬 네트워크만 있으면 됩니다.';

  @override
  String get localWifiRouterSearch => 'Wi‑Fi에서 검색하세요.';

  @override
  String get localWifiRefreshNetwork => 'Wi‑Fi 정보 새로 고침';

  @override
  String get localWifiRouterNoWifiTitle => 'Wi‑Fi에 없음';

  @override
  String get localWifiRouterNoWifiBody =>
      '시스템 설정에서 라우터의 Wi‑Fi에 가입한 다음 다시 검색하세요.';

  @override
  String get localWifiDiscovering => '로컬 Wi‑Fi에서 검색 중…';

  @override
  String get localWifiPeersFound => '이 네트워크의 장치';

  @override
  String get localWifiStop => '멈추다';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi 이름을 사용할 수 없습니다.';

  @override
  String get localWifiStubBanner => 'LAN 소켓을 기다리는 중…';

  @override
  String get localWifiLiveBanner => 'LAN 검색 라이브(UDP) — 이 Wi‑Fi에서 알림 + 비공개 채팅';

  @override
  String get localWifiEmptyHotspot =>
      '아직 기기가 없습니다.\n친구들이 핫스팟에 접속했고 로컬 네트워크 액세스를 허용했는지 확인하세요.';

  @override
  String get localWifiEmptyRouter =>
      '아직 기기가 없습니다.\n같은 SSID인가요? 로컬 네트워크가 허용됩니까? 일부 라우터는 장치 간 트래픽(AP 격리)을 차단합니다.';

  @override
  String get localWifiIsolationHelp => '왜 우리는 서로를 찾을 수 없나요?';

  @override
  String get localWifiIsolationTitle => '라우터가 클라이언트를 격리할 수 있음';

  @override
  String get localWifiIsolationBody =>
      'AP/클라이언트 격리(또는 게스트 네트워크)가 켜져 있으면 동일한 Wi‑Fi에 있는 전화기는 통화할 수 없습니다. 격리를 끄거나 기본 SSID를 사용하거나 Nearby(핫스팟) 모드로 전환하세요.';

  @override
  String get localWifiPeerReady => '채팅 준비 완료(키 있음)';

  @override
  String get localWifiPeerNeedKey => '발견 — QR을 스캔하여 키 교환';

  @override
  String get localWifiErrorTitle => '로컬 Wi‑Fi 오류';

  @override
  String get localWifiErrorBody => '문제가 발생했습니다. 중지하고 다시 시도하십시오.';

  @override
  String get preparingSystem => '시스템 준비 중…';

  @override
  String get bootFailedTitle => '시작할 수 없습니다.';

  @override
  String get retry => '다시 시도하세요';

  @override
  String get bootRecoveryAction => '새 ID 시작(로컬 데이터 삭제)';

  @override
  String get bootRecoveryConfirmTitle => '새로운 정체성을 시작하시겠습니까?';

  @override
  String get bootRecoveryConfirmBody =>
      '이 기기의 로컬 채팅, 키, ID가 영구적으로 삭제됩니다.\n동료는 새 ID로 QR을 다시 스캔해야 합니다.\n이 작업은 취소할 수 없습니다.';

  @override
  String get bootRecoveryRunning => '로컬 ID 재설정 중…';

  @override
  String get bootRecoverySuccess => '로컬 ID 재설정 완료';

  @override
  String bootRecoveryFailed(String error) {
    return 'ID를 재설정할 수 없습니다: $error';
  }

  @override
  String get cancel => '취소';

  @override
  String get save => '구하다';

  @override
  String get close => '닫다';

  @override
  String get start => '시작';

  @override
  String get send => '보내다';

  @override
  String get settings => '설정';

  @override
  String get language => '언어';

  @override
  String get languageSubtitle =>
      '기본적으로 앱은 귀하의 전화 언어를 따릅니다(지원되는 경우). 다른 언어는 영어로 대체됩니다. 여기에서 언어를 잠글 수도 있습니다.';

  @override
  String get languageSystem => '시스템 기본값';

  @override
  String get languageThai => '태국어';

  @override
  String get languageEnglish => '영어';

  @override
  String get notificationsTooltip => '알림 설정';

  @override
  String get enableMessageNotifications => '메시지 알림 활성화';

  @override
  String get settingsNotificationsSubtitle => '1:1 메시지 및 온라인 사용자(지역 알림)';

  @override
  String get networkMembersTooltip => '네트워크 회원';

  @override
  String get identityQrTooltip => '신원 / QR';

  @override
  String get feedDirects => '채팅';

  @override
  String get feedMesh => '#망사';

  @override
  String get feedGeo => '영역';

  @override
  String get feedDirectsSubtitle => '비공개 E2EE 메시지';

  @override
  String feedMeshSubtitle(Object ble) {
    return '주변 피어(BLE)';
  }

  @override
  String get feedGeoSubtitle => 'Geohash 발견 채널';

  @override
  String get peerIdHint => '채팅을 시작하려면 수신자 ID(공개 키 해시)를 붙여넣으세요.';

  @override
  String get directsEmpty =>
      '아직 채팅이 없습니다. 시작하려면 QR을 스캔하거나 수신자 ID를 붙여넣으세요.\n메시지는 보내기 전에 E2EE로 봉인됩니다(BLE / LoRa / Nostr).';

  @override
  String get directsSubtitle => 'E2EE • 채팅을 열려면 탭하세요.';

  @override
  String get meshIntro =>
      'BLE 범위의 피어 — 비공개 E2EE 채팅을 하려면 탭하세요(#mesh에는 공개 작성이 없음).\n하이브리드 라우터를 통해 전송합니다(온라인인 경우 BLE + LoRa + Nostr).';

  @override
  String get meshEmptyRunning => '아직 근처에 동료가 없습니다. BLE 범위 내의 다른 기기에서 앱을 엽니다.';

  @override
  String get meshEmptyStopped => 'BLE이(가) 실행 중이 아닙니다. 블루투스/위치 권한을 부여하세요.';

  @override
  String get meshNearbyPrefix => '가까운';

  @override
  String get meshRetentionTitle => '메시지 자동 삭제';

  @override
  String get meshRetentionSubtitle => '오래된 로컬 채팅 기록은 자동으로 삭제됩니다.';

  @override
  String get meshRetentionKeep => '유지하다';

  @override
  String get meshRetention1Day => '1일';

  @override
  String get meshRetention3Days => '3일';

  @override
  String get meshRetention7Days => '7일';

  @override
  String get refreshLocationTooltip => '위치 새로고침';

  @override
  String get geoIntro =>
      '이 지오해시에 있는 온라인 사람들은 1:1 또는 지역 공개 팬아웃을 통해 메시지를 받을 수 있습니다(여전히 피어당 E2EE로 봉인되어 있으며 일반 텍스트는 아님).';

  @override
  String geoEmpty(String channel) {
    return '아직 $channel에 온라인인 사람이 없습니다\n전송 → 인터넷/자동 이용, Nostr 대기, 위치 새로고침';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return '$channel에서 온라인 • 1:1 E2EE용 탭';
  }

  @override
  String get geoPeerNearbySubtitle => '근처(지역 존재 대기 중) • 1:1 E2EE를 위해 탭하세요.';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return '$channel의 Nostr에서 확인됨 • 검색 전용(레거시)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      '레거시 익명 존재 - 바인딩된 피어를 기다리거나 QR을 교환합니다.';

  @override
  String get bleRadioNearbySubtitle => '인근 BLE — QR을 스캔하여 1:1 E2EE 시작';

  @override
  String get geoInternetDiscoverHint =>
      '지역 인터넷 검색에는 Nostr 연결이 필요합니다(설정 → 전송 → 인터넷/자동).';

  @override
  String get geoEmptyNoLocation =>
      '위치가 아직 확인되지 않았습니다. Nostr에 지오해시를 게시하려면 GPS를 허용하고 새로고침하세요.';

  @override
  String get geoEmptyNeedsPermission =>
      '위치 권한이 거부됨 - 설정 → 개인 정보 보호 → 위치에서 ResilNet 허용';

  @override
  String get geoEmptyServicesDisabled => '위치 서비스가 꺼져 있습니다. 설정에서 켜세요.';

  @override
  String get geoEmptyNoGpsFix =>
      'GPS 수정을 얻을 수 없습니다(Wi‑Fi iPad에서 일반적임) — 아래에서 수동으로 geohash를 설정하세요.';

  @override
  String get geoEmptyTeleportHint => '장소 아이콘을 탭하고 → 지오해시(예: w5) 입력 → 순간이동';

  @override
  String get geoSetGeohashManually => '지오해시 설정';

  @override
  String get geoTeleportHint =>
      'GPS가 없나요? geohash 접두어(2~7자, 예: w5)를 입력하고 순간이동을 탭하세요.';

  @override
  String get geoTeleportInvalid =>
      '잘못된 지오해시 - base32 문자/숫자만 사용하세요(예: w5 또는 w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return '$channel로 설정된 영역';
  }

  @override
  String geoManualActive(String channel) {
    return '수동 영역: $channel(GPS 새로고침이 무시됨)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr 준비되지 않음 — 다시 연결을 탭합니다(초기화가 성공할 때까지 0/0).';

  @override
  String get geoEmptyMeshOnly =>
      '전송은 메시 전용입니다. Nostr을 통해 피어를 검색하려면 인터넷 또는 자동으로 전환하세요.';

  @override
  String geoEmptyWaiting(String channel) {
    return '$channel에는 아직 아무도 없습니다. 두 기기 모두에서 Area + Internet을 열어두고 60초 정도 기다리세요.';
  }

  @override
  String get geoChannelFallback => '#영역';

  @override
  String get geoRefreshLocation => '위치 새로고침';

  @override
  String get settingsClearLocationTitle => '위치 지우기';

  @override
  String get settingsClearLocationSubtitle => 'GPS 제거 / 텔레포트 지오해시(지역은 #—)';

  @override
  String get settingsClearLocationConfirmTitle => '위치를 지우시겠습니까?';

  @override
  String get settingsClearLocationConfirmBody =>
      '이 기기에 저장된 지오해시를 삭제합니다. 나중에 GPS를 새로 고치거나 다시 순간이동할 수 있습니다.';

  @override
  String get settingsClearLocationAction => '위치 지우기';

  @override
  String get settingsClearLocationSnack => '위치가 삭제되었습니다.';

  @override
  String get chatVoiceTooLarge => '음성 메모가 너무 큼 - 최대 30초';

  @override
  String get chatVoiceNeedInternet =>
      '음성 메모에는 인터넷(Nostr)이 필요합니다. BLE만으로는 너무 큽니다.';

  @override
  String get chatVoiceSentInternet => '인터넷을 통해 전송된 음성 메모';

  @override
  String get noticeAnonMention => '언급하다';

  @override
  String get noticeAnonDm => '다이렉트 메시지';

  @override
  String get noticeAnonHug => '껴안다';

  @override
  String get noticeAnonSlap => '찰싹';

  @override
  String get noticeAnonBlock => '차단하다';

  @override
  String get noticeAnonNeedKey => '아직 공개 키가 없습니다. 먼저 QR을 1:1로 교환하세요.';

  @override
  String get noticeAnonActionSent => '전송된';

  @override
  String noticeAnonBlocked(String anon) {
    return '차단됨 $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* 포옹 $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* 뺨때리기 $anon *';
  }

  @override
  String get geoReconnectNostr => 'Nostr 다시 연결';

  @override
  String get nostrSectionTitle => 'Nostr 릴레이';

  @override
  String get nostrSectionSubtitle =>
      '인터넷 메시징 및 영역 검색에서는 이러한 릴레이를 사용합니다. 상태가 오프라인으로 유지되면 다시 연결을 탭하세요.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return '연결됨 $connected/$total';
  }

  @override
  String get nostrStatusOffline => '오프라인 - 릴레이가 나열되지만 연결되지 않음';

  @override
  String get nostrStatusNotInit => '시작되지 않음(0/0) — 초기화하려면 다시 연결을 탭하세요.';

  @override
  String get nostrReconnectAction => 'Nostr 다시 연결';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr 연결됨 ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      '아직 오프라인입니다. Wi‑Fi/cellular를 확인하거나 다시 시도하세요.';

  @override
  String nostrReconnectFailedDetail(String error) {
    return '실패: $error';
  }

  @override
  String get nostrReconnecting => '릴레이에 연결 중…';

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return '$channel의 인터넷(Nostr) • 비공개 채팅 준비됨';
  }

  @override
  String get transportModeTitle => '지역 교통';

  @override
  String get transportModeSubtitle =>
      '메시 = Nostr가 없을 때 근처(라디오) BLE · 인터넷 및 자동 = Nostr 사람 목록';

  @override
  String get transportModeMesh => '망사';

  @override
  String get transportModeInternet => '인터넷';

  @override
  String get transportModeAuto => '자동';

  @override
  String get geoPublicHint => '이 지역의 온라인 모든 사람에게 공개 메시지';

  @override
  String get geoPublicSend => '공공의';

  @override
  String geoPublicHelp(int count) {
    return '$count 온라인 피어에 대한 봉인된 팬아웃 — 각 피어는 개인 봉투를 받습니다.';
  }

  @override
  String geoPublicSent(int count) {
    return '이 지역의 $count 피어에게 전송됨';
  }

  @override
  String get geoPublicSentNone =>
      '온라인으로 메시지를 보낼 수 있는 피어가 없습니다. 키가 있는 피어로 Area/Mesh를 열거나 BLE/Nostr를 기다립니다.';

  @override
  String get areaPublicBadge => '지역 공개';

  @override
  String get geoErrorPermission => '위치를 읽을 수 없습니다. 위치 권한을 확인하세요.';

  @override
  String get geoPrecisionRegion => '지역';

  @override
  String get geoPrecisionProvince => '주';

  @override
  String get geoPrecisionCity => '도시';

  @override
  String get geoPrecisionNeighborhood => '이웃';

  @override
  String get geoPrecisionBlock => '차단하다';

  @override
  String get aliasTitle => '닉네임 설정(연락처 별칭)';

  @override
  String get aliasHintBody =>
      '이 별칭은 이 장치에만 저장됩니다(로컬 전용).\nE2EE 트래픽과 함께 전송되지 않습니다.';

  @override
  String get aliasLabel => '별명';

  @override
  String get aliasHint => '예를 들어 “마을 이장”, “프솜차이”…';

  @override
  String get settingsDevices => '장치';

  @override
  String get settingsFirmwareTitle => 'ESP32 펌웨어 다운로드/업데이트';

  @override
  String get settingsFirmwareSubtitle =>
      '.bin 파일을 다운로드하고 OTA를 통해 ESP32 보드를 업데이트하세요.';

  @override
  String get mtBridgeTitle => 'Meshtastic 브리지';

  @override
  String get mtBridgeSettingsSubtitle => '텍스트 전용 A/B 브리지 — ResilNet E2EE 아님';

  @override
  String get mtBridgeIntro =>
      'Meshtastic과 ResilNet 사이에 짧은 일반 텍스트를 이동합니다. 모드 A와 B는 동시에 실행할 수 없습니다. 이는 종단 간 암호화가 아닙니다.';

  @override
  String get mtBridgeModeLabel => '방법';

  @override
  String get mtBridgeModeOff => '끄다';

  @override
  String get mtBridgeModeA => 'A를 섭취하다';

  @override
  String get mtBridgeModeB => '출구 B';

  @override
  String get mtBridgeModeOffShort => '끄다';

  @override
  String get mtBridgeModeAShort => 'A에서';

  @override
  String get mtBridgeModeBShort => '아웃 B';

  @override
  String get mtBridgeMutexHint =>
      '모드를 선택하면 다른 모드는 자동으로 꺼집니다. 동시 A+B는 지원되지 않습니다.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => '데모(로깅)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      '인바운드 텍스트는 통지 아래에 #meshastic으로 표시됩니다. 메시 릴레이는 선택 사항입니다(기본적으로 꺼져 있음).';

  @override
  String get mtBridgeRelayTitle => 'ResilNet 메시에도 릴레이';

  @override
  String get mtBridgeRelayHint =>
      '켜져 있으면 서명된 공개 게시판이 브로드캐스트됩니다. 끄기 = 이 전화기의 알림만.';

  @override
  String get mtBridgeSimulateHint => '데모 메시지';

  @override
  String get mtBridgeSimulate => 'Meshtastic 메시지 시뮬레이션';

  @override
  String get mtBridgeIngestOk => '알림에 수집됨(#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      '경고: 여기에서 보낸 메시지는 ResilNet E2EE가 아닙니다. Meshtastic 경로에 있는 사람은 누구나 읽을 수 있습니다.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => '게시할 텍스트';

  @override
  String get mtBridgeSend => 'Meshtastic로 보내기';

  @override
  String get mtBridgeEgressOk => 'Meshtastic 동안 대기열에 있음(로그/기록 참조)';

  @override
  String get mtBridgeLastEgress => '마지막 이그레스';

  @override
  String get mtBridgeEgressHistory => '최근 이그레스';

  @override
  String get mtBridgeOffHint => '브리지를 사용하려면 수집(A) 또는 송신(B)을 켜십시오.';

  @override
  String get mtBridgeNoticeBadge => '메시타스틱 · E2EE 아님';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'MQTT 운송 수단 사용';

  @override
  String get mtBridgeUseMqttHint =>
      '끄기 = 데모 로깅만(MQTT 인바운드 무시) 연결 시 수집/송신에 대해 On = MQTT입니다.';

  @override
  String get mtBridgeMqttHost => '브로커 호스트';

  @override
  String get mtBridgeMqttPort => '포트';

  @override
  String get mtBridgeMqttTls => 'TLS(mqtts) 사용';

  @override
  String get mtBridgeMqttTlsHint =>
      '일반적인 포트 8883. 시스템 인증서를 사용합니다. 핸드셰이크 오류로 인해 소프트 실패합니다.';

  @override
  String get mtBridgeMqttAutoReconnect => '자동 재연결';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      '켜져 있으면 클라이언트가 삭제 후 다시 연결을 시도합니다. 상태는 복원될 때까지 연결 중으로 표시됩니다.';

  @override
  String get mtBridgeMqttTopicHelpers => '주제 도우미';

  @override
  String get mtBridgeMqttRegion => '지역 접두어(선택사항)';

  @override
  String get mtBridgeMqttRegionHint =>
      '설정되면 Apply는 루트를 msh/<region>/2/json으로 다시 빌드합니다(토픽 루트 재정의).';

  @override
  String get mtBridgeMqttTopicRoot => 'JSON 주제 루트';

  @override
  String get mtBridgeMqttDownlinkChannel => '다운링크 채널 이름';

  @override
  String get mtBridgeMqttApplyTopics => '루트 적용 → 주제 구독/게시';

  @override
  String get mtBridgeMqttAdvanced => '고급 MQTT';

  @override
  String get mtBridgeMqttAdvancedHint => 'TLS, 다시 연결, 주제, 자격 증명';

  @override
  String get mtBridgeMqttTopicIn => '주제 구독';

  @override
  String get mtBridgeMqttTopicOut => '주제 게시';

  @override
  String get mtBridgeMqttGatewayFrom => '게이트웨이 노드 ID(시작)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      '10진수 ID 또는 !hex — sendtext 다운링크에 필요';

  @override
  String get mtBridgeMqttChannelIndex => '메시 채널 인덱스(선택 사항 0-7)';

  @override
  String get mtBridgeMqttUser => '사용자 이름(선택사항)';

  @override
  String get mtBridgeMqttPass => '비밀번호(선택사항)';

  @override
  String get mtBridgeMqttPassStored => '비밀번호는 이 기기에 저장되어 있습니다(표시되지 않음).';

  @override
  String get mtBridgeMqttPassReplace => '새 비밀번호(유지하려면 비워두세요)';

  @override
  String get mtBridgeMqttPassReplaceHint => '저장된 비밀번호를 유지하려면 비워두세요.';

  @override
  String get mtBridgeMqttPassClear => '비밀번호 지우기';

  @override
  String get mtBridgeMqttSave => 'MQTT 설정 저장';

  @override
  String get mtBridgeMqttSaved => 'MQTT 설정이 저장되었습니다.';

  @override
  String get mtBridgeMqttConnect => '연결하다';

  @override
  String get mtBridgeMqttDisconnect => '연결 끊기';

  @override
  String get mtBridgeMqttConnected => 'MQTT 연결됨';

  @override
  String get mtBridgeMqttConnecting => 'MQTT 연결 중…';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT 연결이 끊어졌습니다.';

  @override
  String get mtBridgeMqttError => 'MQTT 오류';

  @override
  String get mtBridgeErrModeIngest => '먼저 수집(A)으로 전환하세요.';

  @override
  String get mtBridgeErrModeEgress => '먼저 송신(B)으로 전환하세요.';

  @override
  String get mtBridgeErrRate => '속도를 늦추세요 - 속도가 제한됨';

  @override
  String get mtBridgeErrDedupe => '중복된 메시지가 무시되었습니다.';

  @override
  String get mtBridgeErrLoop => '브리지 루프를 방지하기 위해 삭제됨';

  @override
  String get mtBridgeErrEmpty => '메시지가 비어 있습니다.';

  @override
  String get mtBridgeErrPublish => '게시 실패';

  @override
  String get mtBridgeErrNotConnected => 'MQTT 연결되지 않음';

  @override
  String get mtBridgeErrMissingHost => 'MQTT 브로커 호스트를 입력하세요.';

  @override
  String get mtBridgeErrMissingTopic => '구독 및 게시 주제 입력';

  @override
  String get mtBridgeErrMissingFromNode =>
      'sendtext에 대한 게이트웨이 노드 ID(발신)를 입력하세요.';

  @override
  String get mtBridgeErrConnect => 'MQTT 연결 실패';

  @override
  String get mtBridgeErrConnectTls => 'MQTT TLS 연결 실패';

  @override
  String get settingsData => '데이터';

  @override
  String get settingsDataHint =>
      '데이터베이스를 축소하려면 로컬 메시지를 삭제하세요. ID, 키, 피어는 그대로 유지됩니다.';

  @override
  String get settingsSaveHistoryTitle => '메시지 기록 저장';

  @override
  String get settingsSaveHistorySubtitle =>
      '꺼져 있으면 메시지는 E2EE로 전송되며 이 세션 동안만 보관됩니다(로컬 채팅 기록에는 보관되지 않음). 귀하의 텍스트는 이 장치에서 여전히 일반 텍스트로 표시됩니다.';

  @override
  String get settingsPrivacy => '은둔';

  @override
  String get settingsE2eeTitle => '엔드투엔드 암호화';

  @override
  String get settingsE2eeSubtitle =>
      '항상 켜짐 — 메시지는 보내기 전에 RSA-OAEP + AES-GCM으로 봉인됩니다. 릴레이 및 근처 홉은 내용을 읽을 수 없습니다.';

  @override
  String get settingsScreenshotTitle => '스크린샷 알림';

  @override
  String get settingsScreenshotSubtitle => '이 장치가 화면을 캡처하면 채팅에 시스템 라인을 표시합니다.';

  @override
  String get settingsNostrExpiryTitle => 'Nostr 메시지 보관 시간';

  @override
  String get settingsNostrExpirySubtitle =>
      'Nostr을 통해 온라인일 때 봉인된 봉투가 로컬로 유지되어야 하는 기간';

  @override
  String get noticeExpiresIn => '에 만료됩니다';

  @override
  String get noticesTitle => '공지사항';

  @override
  String get noticesMeshIntro =>
      '공개 게시판 — 암호화되지 않고 무선 범위에 있는 모든 사람이 볼 수 있습니다. 전화 대 전화를 오프라인으로 연결하고 근처의 ResilNet 중계 상자에 복사본을 보관하여 나중에 도착하는 사람들도 계속 볼 수 있도록 합니다.';

  @override
  String get noticesMeshPublicBadge => '공개 · 암호화되지 않음';

  @override
  String get noticesGeoIntro => '다른 방문자가 찾을 수 있도록 이 장소에 대한 간단한 메모를 추가하세요.';

  @override
  String get noticesEmpty => '아직 공지가 없습니다';

  @override
  String get noticesEmptyHint => '여기 주변 사람들을 위해 첫 번째 알림을 고정해 보세요.';

  @override
  String get noticesComposeHint => '공지를 게시하다...';

  @override
  String get noticesUrgent => '긴급한';

  @override
  String get noticesOpen => '공지사항';

  @override
  String get screenshotTaken => '* 스크린샷을 찍으셨습니다 *';

  @override
  String get chatAttachImage => '이미지 첨부';

  @override
  String get chatImageLabel => '영상';

  @override
  String get chatImageTooLarge => '이미지가 너무 큽니다. 다른 사진을 찍어 보세요.';

  @override
  String get chatNostrExpiry => 'Nostr 유지';

  @override
  String geoPublicComposeHint(String channel) {
    return '$channel에게 보내기 — 공개';
  }

  @override
  String get settingsClearTitle => '모든 메시지 지우기';

  @override
  String get settingsClearSubtitle => '이 기기의 모든 채팅 삭제';

  @override
  String get settingsClearConfirmTitle => '모든 메시지를 지우시겠습니까?';

  @override
  String get settingsClearConfirmBody =>
      '이렇게 하면 이 기기의 모든 채팅 메시지가 삭제됩니다.\n동료와 별명은 제거되지 않습니다.';

  @override
  String get settingsClearAction => '데이터 지우기';

  @override
  String get settingsClearedSnack => '데이터가 삭제되었습니다.';

  @override
  String settingsVersion(String version) {
    return '버전 $version';
  }

  @override
  String get meshBleScanning => 'BLE: 노드 검색';

  @override
  String get meshBleEsp32Scanning => 'ESP32: 가까운 노드를 찾습니다.';

  @override
  String get meshBleSyncing => 'BLE: ESP32과 동기화 중';

  @override
  String get meshNostrPublishing => 'Nostr: 게시';

  @override
  String get meshBleIdle => 'BLE 메시 켜짐 - 아직 근처에 휴대전화가 없음';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE 메시 — 근처에 있는 $count개의 휴대전화';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: 권한이 필요합니다';

  @override
  String get meshBlePausedCamera => 'BLE 카메라 일시중지 — 시작 BLE 탭';

  @override
  String get meshBleStopped =>
      'BLE이 꺼져 있습니다. Bluetooth가 켜져 있는지 확인한 다음 BLE 시작을 탭하세요.';

  @override
  String get meshBleRestart => 'BLE 시작';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · 위치 $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => '권한 확인 및 BLE 시작';

  @override
  String get meshNostrOffline => 'Nostr 오프라인';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count 근처 피어 • LoRa $lora • 동기화 ~${meters}m';
  }

  @override
  String get meshLoraReady => '준비가 된';

  @override
  String get meshLoraNotReady => '준비가 안 됐어';

  @override
  String meshGatewayProgress(String label) {
    return '게이트웨이 UDP: $label';
  }

  @override
  String get meshGatewayReady => '게이트웨이 UDP: 준비됨';

  @override
  String get permissionTitle => 'BLE 메시 네트워크를 시작하려면 액세스를 허용하세요.';

  @override
  String get permissionBody =>
      '앱에는 커뮤니티 메시징을 위한 Bluetooth(스캔/연결/광고), 위치(이전 Android 장치의 경우) 및 마이크(채팅 및 공지 사항의 음성 메모용)가 필요합니다.';

  @override
  String get permissionE2ee => '종단 간 암호화(E2EE)\n릴레이 노드는 메시지 내용을 읽을 수 없습니다.';

  @override
  String get permissionReady => '권한 준비됨';

  @override
  String get permissionRequest => '허용하고 계속';

  @override
  String get permissionNotReadySnack =>
      '시스템이 아직 준비되지 않았습니다. 잠시 기다렸다가 다시 시도하세요.';

  @override
  String get permissionDeniedSnack =>
      '권한이 완료되지 않았습니다. 설정 > ResilNet을 열고 Bluetooth/위치/마이크를 허용하세요.';

  @override
  String get permissionMicDenied =>
      '마이크 액세스가 거부되었습니다. 음성 메모를 녹음하려면 설정에서 허용하세요.';

  @override
  String get permissionMicOpenSettings => '설정';

  @override
  String get permissionCameraDenied =>
      '카메라 액세스가 거부되었습니다. QR 코드를 스캔하려면 설정에서 허용하세요.';

  @override
  String get permissionCameraFailed => 'QR 코드를 스캔하려면 카메라 권한이 필요합니다';

  @override
  String get permissionCameraOpenSettings => '설정';

  @override
  String get permissionPhotosDenied =>
      '사진 라이브러리 액세스가 거부되었습니다. QR 코드를 저장하려면 설정에서 허용하세요.';

  @override
  String get permissionPhotosFailed => 'QR 코드를 저장하려면 사진 라이브러리 권한이 필요합니다';

  @override
  String get permissionPhotosOpenSettings => '설정';

  @override
  String permissionFailedSnack(String error) {
    return '권한 요청 실패: $error';
  }

  @override
  String get permissionFooter => 'ResilNet 아키텍처 • 저장 및 전달 멀티홉';

  @override
  String get onboardingSkip => '건너뛰다';

  @override
  String get onboardingNext => '다음';

  @override
  String get onboardingStart => '시작하기';

  @override
  String get onboardingWelcomeTitle => 'ResilNet에 오신 것을 환영합니다';

  @override
  String get onboardingWelcomeBody => '인터넷 없이도 메시 네트워크를 통해 ResilNet에서 채팅';

  @override
  String get onboardingFriendsTitle => '쉽게 친구 추가';

  @override
  String get onboardingFriendsBody =>
      'ID에서 QR을 공유하거나 친구의 QR을 스캔하여 공개 키를 교환하세요.';

  @override
  String get onboardingChannelsTitle => '암호화된 채팅 + 주변 채널';

  @override
  String get onboardingChannelsBody =>
      '#mesh / Area(geohash)를 전환하여 근처 피어를 찾습니다. 메시지는 BLE 메시 및 Nostr를 통해 E2EE로 유지됩니다.';

  @override
  String get chatTitle => '채팅(E2EE)';

  @override
  String get chatScanTooltip => 'QR을 스캔하여 피어를 추가하세요.';

  @override
  String get chatBlockTooltip => '이 발신자 차단';

  @override
  String get chatBlockedSnack => '차단됨: 알림 없음/릴레이 없음';

  @override
  String get chatAliasTooltip => '닉네임 설정';

  @override
  String get chatReceiverPemLabel => '수신자 공개 키(PEM)';

  @override
  String get chatReceiverPemHint => '친구의 공개 키를 붙여넣으세요(QR/공유 파일에서)';

  @override
  String get chatNeedPeerKey => '이 피어의 QR을 먼저 스캔하세요(확인된 공개 키 필요)';

  @override
  String get chatPeerKeyMismatch => '저장된 공개 키가 이 피어 ID와 일치하지 않습니다.';

  @override
  String chatVoiceFailed(String error) {
    return '오디오를 녹음할 수 없습니다: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return '음성 메모를 재생할 수 없습니다: $error';
  }

  @override
  String get chatPlayVoice => '음성 메모 재생';

  @override
  String get chatPauseVoice => '정지시키다';

  @override
  String get chatVoiceLabelSent => '🎤 음성 메모(밀봉)';

  @override
  String get chatVoiceLabel => '🎤 음성 메모';

  @override
  String get chatDecryptFailed => '[복호화 실패]';

  @override
  String chatSentSealed(String preview) {
    return '[봉인됨 • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[봉인]';

  @override
  String get chatComposeHint => '메시지를 입력하세요… (전송 시 봉인됨)';

  @override
  String get chatEmptyThread => '아직 메시지가 없습니다\n메쉬를 통해 보내려면 아래를 입력하세요.';

  @override
  String chatLoadFailed(String error) {
    return '대화를 로드할 수 없습니다: $error';
  }

  @override
  String get chatEmojiTooltip => '이모티콘';

  @override
  String get statusPending => '보류 중';

  @override
  String get statusSent => '전송된';

  @override
  String get statusRelayed => '중계됨';

  @override
  String get statusDelivered => '배달됨';

  @override
  String get statusRead => '읽다';

  @override
  String get statusFailed => '실패한';

  @override
  String get chatCopy => '복사';

  @override
  String get chatDeleteLocal => '이 기기에서 삭제';

  @override
  String get chatDeletedLocalSnack => '이 기기에서 삭제되었습니다.';

  @override
  String get chatRetry => '다시 해 보다';

  @override
  String get chatSendFailed => '배송되지 않음 - 재시도를 탭하세요';

  @override
  String get chatImageNeedInternet => '이미지를 보내려면 인터넷에 연결하세요.';

  @override
  String get chatImageTooLargeOnline => '전송할 만큼 이미지를 압축할 수 없습니다.';

  @override
  String get chatOpenLinkFailed => '링크를 열 수 없습니다.';

  @override
  String get identityTitle => '신원';

  @override
  String get identityScanTooltip => '카메라로 QR 스캔';

  @override
  String get identityCopiedHash => '공개 키 해시가 복사되었습니다.';

  @override
  String get identityPeerSaved => 'QR에서 저장된 피어';

  @override
  String get identityGalleryDenied => '사진 라이브러리 권한이 거부되었습니다.';

  @override
  String get identityQrSaved => '사진 라이브러리에 QR이 저장되었습니다.';

  @override
  String identityQrSaveFailed(String error) {
    return 'QR을 저장할 수 없습니다: $error';
  }

  @override
  String get peersTitle => '네트워크 회원';

  @override
  String get qrScanTitle => 'QR을 스캔하여 친구를 추가하세요';

  @override
  String get qrInvalid => '스캔 실패: 잘못된 QR';

  @override
  String get qrIdKeyMismatch => 'QR 거부됨: ID가 공개 키와 일치하지 않습니다.';

  @override
  String get qrCameraNotReady => '카메라가 준비되지 않았습니다.';

  @override
  String get qrRetrySettings => '다시 시도/설정 열기';

  @override
  String qrCameraOpenFailed(String error) {
    return '카메라를 열 수 없습니다: $error';
  }

  @override
  String get qrScanAlignHint => '프레임 안쪽에 QR 코드를 맞춥니다.';

  @override
  String get firmwareDownloadTitle => 'ESP32 펌웨어 다운로드';

  @override
  String get firmwareSourceOnline => '최신(온라인)';

  @override
  String get firmwareSourceCached => '저장된 사본(오프라인)';

  @override
  String get firmwareSourceBaseline => '번들 기준(오프라인)';

  @override
  String get firmwareSourceUnavailable => '사용 가능한 펌웨어가 없습니다.';

  @override
  String get firmwareBaselineIncompatible =>
      '번들 펌웨어가 너무 오래되었습니다. 최신 버전을 다운로드하려면 인터넷에 연결하세요.';

  @override
  String get firmwareChecksumFailed => '펌웨어 무결성 검사 실패 - 깜박임 차단됨';

  @override
  String firmwareReadyFromSource(String source) {
    return '펌웨어 준비됨: $source';
  }

  @override
  String get peersRefreshTooltip => '새로 고치다';

  @override
  String get peersBlocked => '막힌';

  @override
  String peersNearbyBle(Object ble) {
    return '주변(BLE)';
  }

  @override
  String get peersRecentlyOnline => '최근 온라인';

  @override
  String get peersOnlineInArea => '해당 지역의 온라인';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return '$minutes분 전에 확인됨';
  }

  @override
  String get peersOffline => '오프라인';

  @override
  String peersBlockedSnack(String id) {
    return '차단됨 $id';
  }

  @override
  String get peersUnblockedSnack => '차단 해제됨';

  @override
  String get peersEmpty => '아직 데이터베이스에 구성원이 없습니다.\nQR을 스캔하거나 BLE 메시 검색을 기다립니다.';

  @override
  String get peersOpenChat => '오픈채팅';

  @override
  String get peersBlockAction => '차단하다';

  @override
  String get peersUnblockAction => '차단 해제';

  @override
  String get channelPickerTooltip => '채팅 / #mesh / 지역';

  @override
  String get locationPickerTooltip => '위치 채널';

  @override
  String get transportPickerTooltip => '메쉬/인터넷/자동';

  @override
  String get onlinePeopleTooltip => '온라인에 있는 사람들';

  @override
  String get unreadDirectsTooltipEmpty => '비공개 메시지';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count 읽지 않은 비공개 메시지';
  }

  @override
  String get onlinePeopleTitle => '사람들';

  @override
  String get onlinePeopleEmpty => '아직 온라인에 접속한 사람이 없습니다.';

  @override
  String onlinePeopleCount(int count) {
    return '$count 온라인';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · 주변 + 지역';

  @override
  String get peerOnlineMeshTitle => '메시에 근처에 있는 사람';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name이(가) 메시 근처에 있습니다.';
  }

  @override
  String get peerOnlineAreaTitle => '해당 지역의 누군가 온라인 상태임';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name은(는) Nostr을(를) 통해 온라인 상태입니다.';
  }

  @override
  String get locationSheetTitle => '#위치 채널';

  @override
  String get channelPinsTitle => '고정됨';

  @override
  String get channelPinsHint => '자주 사용하는 핀 채널 - 상단에 유지됩니다.';

  @override
  String get channelPinTooltip => '이 채널 고정';

  @override
  String get channelUnpinTooltip => '고정 해제';

  @override
  String get locationSheetIntro =>
      '정확한 GPS가 아닌 대략적인 지오해시를 사용하여 근처 사람들과 채팅하세요. 인터넷상의 존재는 익명의 Nostr 키를 사용합니다.';

  @override
  String get locationMeshSubtitle => '#블루투스 • ~10~50m';

  @override
  String get locationTeleportHint => '#지오해시';

  @override
  String get locationTeleport => '텔레포트';

  @override
  String homeComposeHint(String channel) {
    return '메시지 $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return '$channel에게 보내기 — 공개';
  }

  @override
  String get messageExpiryTitle => '에 만료됩니다';

  @override
  String get voiceRecordTapToStart => '음성 메시지를 녹음하려면 탭하세요.';

  @override
  String get voiceRecordTooShort => '녹음 시간이 너무 짧습니다. 다시 시도하세요.';

  @override
  String get voiceRecordFailed => '녹음을 저장할 수 없습니다. 다시 시도하세요.';

  @override
  String get voicePttHold => '녹음하려면 길게 누르세요.';

  @override
  String get voicePttRelease => '미리보기로 출시';

  @override
  String get voicePttRecording => '녹음…';

  @override
  String get voicePttDraftReady => '음성 메모 준비됨';

  @override
  String get voicePttDiscard => '버리다';

  @override
  String get voicePttReRecord => '다시 녹음하세요';

  @override
  String get voicePttSend => '음성 메모 보내기';

  @override
  String get voicePttPlayPreview => '미리보기 재생';

  @override
  String get voicePttStopPreview => '미리보기 중지';

  @override
  String get noticesBackfilling => '공지 로드 중…';

  @override
  String get noticesNostrOnline => 'Nostr 온라인';

  @override
  String get noticesNostrOffline => 'Nostr 오프라인 — 게시판에는 인터넷이 필요합니다.';

  @override
  String noticesBackfillLoaded(int count) {
    return '$count 알림 로드됨';
  }

  @override
  String get noticePublishFailed => '지역 게시판에 공지를 게시할 수 없습니다. Nostr 연결을 확인하세요.';

  @override
  String get noticeMeshPublishNoLink =>
      '로컬에 저장되었습니다. 다른 사람이 수신할 수 있도록 근처의 메시 라디오(또는 Wi‑Fi 게이트웨이)에 연결하세요.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'BLE을(를) 통해 $count 근처 기기로 게시판이 전송되었습니다.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      '근처의 라디오가 감지되었으나 BLE 쓰기에 실패했습니다. 알림 화면에서 두 앱을 모두 열어두고 다시 시도하세요(또는 ESP32 릴레이 사용).';

  @override
  String get noticeMeshPublishNoGatt =>
      '이 기기의 BLE 수신기가 준비되지 않았습니다. Bluetooth를 전환하고 공지사항을 다시 엽니다.';

  @override
  String get noticeDelete => '공지 삭제';

  @override
  String get noticeDeleteConfirmTitle => '이 알림을 삭제하시겠습니까?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      '이 장치에서만 제거됩니다. 이미 받은 다른 사람들은 계속해서 볼 수 있습니다.';

  @override
  String get noticeDeleted => '공지가 삭제되었습니다.';

  @override
  String get chatNoticeHidden => '지역공지 — 공개공지';

  @override
  String get identityDisplayNameTitle => '표시 이름';

  @override
  String get identitySaveName => '이름 저장';

  @override
  String get identityUserIdLabel => '사용자 ID(공개 키 해시)';

  @override
  String get identityCopyHashTooltip => '공개 키 해시 복사';

  @override
  String get identityMyQrTitle => '내 QR (id + pubKey + name)';

  @override
  String identityQrFailed(String error) {
    return 'QR을 생성할 수 없습니다.\n$error';
  }

  @override
  String get identitySaving => '절약…';

  @override
  String get identitySaveQr => 'QR을 사진 라이브러리에 저장';

  @override
  String get identityOpenScanner => 'QR을 스캔하려면 카메라를 엽니다.';

  @override
  String get identityQrHelp =>
      '친구에게 이를 스캔하여 공개 키를 저장하고 (필요한 경우) 귀하를 인증된 발급자로 설정하도록 하세요.';

  @override
  String get identityChatTip => '팁: 채팅에서 QR을 스캔하여 E2EE용 공개 키를 추가할 수도 있습니다.';

  @override
  String get infoOpen => '소개 / 정보';

  @override
  String get docsGuideTitle => '사용자 가이드';

  @override
  String get docsGuideSubtitle => '브라우저에서 열립니다';

  @override
  String get docsOpenAction => '가이드 열기';

  @override
  String get docsOpenFailed => '사용자 가이드를 열 수 없습니다';

  @override
  String get firmwareOtaGuideTitle => '플래시 가이드 및 OTA 프로토콜';

  @override
  String get firmwareOtaGuideSubtitle => '웹 가이드 열기 — .bin 다운로드 및 전체 단계';

  @override
  String get firmwareWebDownloadsTitle => '웹에서 펌웨어 다운로드';

  @override
  String get firmwareWebDownloadsSubtitle => '문서 사이트의 버전별 링크 및 체크섬';

  @override
  String get inviteCopyShortLink => '짧은 링크 복사';

  @override
  String get inviteShareLink => '링크 공유';

  @override
  String get inviteShowFullLink => '전체 링크';

  @override
  String get inviteCopyFullLink => '전체 링크 복사';

  @override
  String get inviteLinkCopied => '링크가 복사되었습니다';

  @override
  String get inviteLongPressHint => '링크 작업을 하려면 길게 누르세요.';

  @override
  String get inviteSendInChat => 'ResilNet 채팅으로 보내기…';

  @override
  String get inviteSendInChatHint => '이미 공개 키를 갖고 있는 사람만';

  @override
  String get inviteSendInChatEmpty =>
      '아직 메시지를 보낼 수 있는 채팅이 없습니다.\n먼저 QR을 스캔하고, 영역/메시를 열거나, 앱 외부에 링크를 공유하세요.';

  @override
  String get inviteSentToChat => '채팅으로 초대가 전송되었습니다.';

  @override
  String get infoTabInfo => '정보';

  @override
  String get infoTabSettingsHint => '언어, E2EE 및 데이터 도구 메뉴에서 설정을 엽니다.';

  @override
  String get infoHowToTitle => '사용방법';

  @override
  String get infoHowToBody =>
      '• 채널 아이콘을 탭하여 채팅/#mesh/지역을 전환하세요.\n• 장소를 탭하여 지오해시 크기를 선택하세요.\n• 회원이나 온라인에 있는 사람을 탭하세요.\n• ⋮에서 ID/QR을 열어 직접 키 교환\n• \"공용\" 영역은 일반 텍스트 공간이 아닌 각 온라인 피어에게 봉인된 E2EE를 보냅니다.';

  @override
  String get infoFeaturesTitle => '특징';

  @override
  String get infoFeatureOffline => 'Bluetooth Low Energy를 통한 오프라인 메시징';

  @override
  String get infoFeatureE2ee => 'RSA-OAEP + AES-GCM(노이즈 아님)을 사용한 엔드투엔드 암호화';

  @override
  String get infoFeatureMultihop => '메시지는 근처의 동료를 거쳐 더 멀리 갈 수 있습니다.';

  @override
  String get infoFeatureBridge => '봉인된 봉투용 하이브리드 메시 ⇔ 인터넷(Nostr)';

  @override
  String get infoFeatureGeo => '근처 사람들을 위한 지역 지오해시 채널(디스커버리 UX)';

  @override
  String get infoFeatureNotices => '#mesh 및 Area에 대한 만료 알림';

  @override
  String get infoPrivacyTitle => '은둔';

  @override
  String get infoPrivacyNoRoom => '전선에 일반 텍스트 마을/공개 채팅방 없음';

  @override
  String get infoPrivacyFanout => '영역 전송 = 알려진 공개 키를 사용하여 피어에 대한 봉인된 1:1 팬아웃';

  @override
  String get infoPrivacyPresence => '인터넷 영역 존재는 임시 Nostr 키를 사용합니다.';

  @override
  String get infoSymbolsTitle => '기호';

  @override
  String get infoSymBle => '직접 블루투스 링크';

  @override
  String get infoSymMesh => '메시를 통해 접근 가능(다른 것들은 전달됨)';

  @override
  String get infoSymInternet => '인터넷을 통해 (Nostr) — 봉인된 봉투';

  @override
  String get infoSymBridge => '메시‐인터넷 브릿지 경로를 통해 도착';

  @override
  String get infoSymOffline => '오프라인 — 지금은 접속할 수 없습니다';

  @override
  String get infoSymInArea => '이 위치 채널의 영역';

  @override
  String get infoSymE2eeOk => '엔드투엔드 암호화 세션';

  @override
  String get infoSymE2eeFail => '암호화 불가 - 민감한 문자를 보내지 마세요';

  @override
  String get infoSymVerified => '신원 확인/알려진 키';

  @override
  String get infoSymBlocked => '막힌';

  @override
  String get infoSymUnread => '읽지 않은 비공개 메시지';

  @override
  String get infoEmergencyTitle => '비상 모드';

  @override
  String get infoEmergencyBody =>
      '이 기기의 메시지, 키, ID를 지우려면 홈 화면에서 ResilNet 제목을 세 번 탭하세요.';

  @override
  String get infoLegendNote =>
      '명확성을 위해 일부 경로 아이콘이 여기에 설명되어 있습니다. 채팅의 배달 확인은 기본 전송 상태로 유지됩니다.';

  @override
  String get dangerZoneTitle => '위험지대';

  @override
  String get dangerZoneSubtitle =>
      '이 장치에서 메시지, 암호화 키, Nostr ID, 피어 및 닉네임을 삭제합니다. 다시 설정하게 됩니다.';

  @override
  String get panicWipeTitle => '긴급 삭제';

  @override
  String get panicWipeSubtitle =>
      '로컬의 모든 항목 삭제 - 홈 제목을 세 번 탭하는 것과 동일(두 번 탭하면 라디오 새로 고침)';

  @override
  String get panicWipeConfirmTitle => '모든 로컬 데이터를 지우시겠습니까?';

  @override
  String get panicWipeConfirmBody =>
      '이 휴대전화의 채팅, 키, ID가 영구적으로 삭제됩니다.\n피어는 QR 키를 새 ID로 다시 교환해야 합니다.\n이 작업은 취소할 수 없습니다.';

  @override
  String get panicWipeAction => '모든 것을 닦아라';

  @override
  String get panicWipeSnack => '로컬 신원이 지워졌습니다. 다시 설정하세요';

  @override
  String panicWipeFailed(String error) {
    return '초기화 실패: $error';
  }

  @override
  String get meshBridgeTitle => '메쉬 브리지';

  @override
  String get meshBridgeSubtitle =>
      '켜져 있으면(기본값) 봉인된 봉투는 BLE 메시와 인터넷(Nostr)을 함께 사용하여 인근 메시 아일랜드를 연결할 수 있습니다. 꺼져 있으면 하나의 경로만 사용하여 보냅니다. 일반 텍스트를 연결에 넣지 않습니다.';

  @override
  String get favoritesTitle => '즐겨찾기';

  @override
  String get favoritesAdd => '즐겨찾기에 추가';

  @override
  String get favoritesRemove => '즐겨찾기에서 제거';

  @override
  String get favoritesEmpty => '아직 즐겨찾기가 없습니다. 회원 목록에서 동료에게 별표를 표시하세요.';

  @override
  String get favoritesNearbyTitle => '근처에서 즐겨찾는';

  @override
  String favoritesNearbyBody(String name) {
    return '$name이(가) 메시 근처에 있습니다.';
  }

  @override
  String get favoritesInAreaTitle => '지역에서 즐겨찾는';

  @override
  String favoritesInAreaBody(String name) {
    return '$name은(는) 이 지역에서 온라인 상태입니다.';
  }

  @override
  String get topologyTitle => '메시 토폴로지';

  @override
  String get topologySubtitle => '메시 공지의 피어 및 연결 힌트(읽기 전용)';

  @override
  String get topologyConnectedNow => '지금 연결됨(BLE)';

  @override
  String get topologyNearby => '주변(BLE)';

  @override
  String get topologyKnown => '알려진 동료';

  @override
  String get topologyEmpty => '아직 학습된 동료가 없습니다. BLE을(를) 켠 상태로 근처에 머무르세요.';

  @override
  String get topologyYou => '너';

  @override
  String topologyStats(int peers, int links) {
    return '$peers 피어 · $links 링크';
  }

  @override
  String get topologyGraphHint =>
      '근처의 메시 검색을 통해 추정 - 귀하의 장치가 강조 표시됩니다. 채팅을 열려면 동료를 탭하세요.';

  @override
  String get topologyOpen => '메시 토폴로지';

  @override
  String get slashHelpTitle => '명령';

  @override
  String get slashHelpBody =>
      '/help — 이 목록\n/who — 현재 채널에 온라인인 사람들\n/drop <text> — 여기에 봉인된 공지를 고정합니다(E2EE 팬아웃).\n\n전체 가이드: 아래 오픈 가이드 또는 설정 → 사용자 가이드를 사용하세요.';

  @override
  String get slashWhoEmpty => '지금 이 채널에 온라인인 사람이 없습니다';

  @override
  String slashWhoTitle(int count) {
    return '온라인($count)';
  }

  @override
  String get slashDropNeedText => '사용법: /메모 텍스트 삭제';

  @override
  String slashDropDone(String channel) {
    return '$channel에 알림이 삭제되었습니다.';
  }

  @override
  String get slashUnknown => '알 수 없는 명령 - /help를 사용해 보세요.';

  @override
  String get announceOpen => '공지사항';

  @override
  String get announceTitle => '공지사항';

  @override
  String get announceEmpty => '아직 보드가 없습니다. 잠겼거나 공개된 알림을 게시하려면 보드를 만드세요.';

  @override
  String get announceCreate => '보드 만들기';

  @override
  String get announceCreateHint => '보드 이름';

  @override
  String get announceDefaultTitle => '커뮤니티보드';

  @override
  String get announceSettings => '보드 설정';

  @override
  String get announceAllowLocked => '잠긴(암호화된) 게시물 허용';

  @override
  String get announceAllowLockedSub => '보드 키에 암호화됨 - 독자가 액세스해야 함';

  @override
  String get announceAllowOpen => '공개(일반 텍스트) 게시물 허용';

  @override
  String get announceAllowOpenSub =>
      'E2EE 아님 — 메시/릴레이에서 읽을 수 있습니다. 기본적으로 꺼져 있습니다.';

  @override
  String get announceComposeHint => '공지사항 작성…';

  @override
  String get announceMediaInternetOnly => '사진/음성 안내는 인터넷을 통해 전송됩니다(BLE 아님).';

  @override
  String get announceNeedInternet => '사진이나 음성 안내를 보내려면 인터넷에 연결하세요.';

  @override
  String announceVoiceFailed(String error) {
    return '음성을 녹음할 수 없습니다: $error';
  }

  @override
  String get announceImageTooLarge => '이미지가 너무 큽니다(최대 180KB).';

  @override
  String get announcePlayVoice => '음성 메모 재생';

  @override
  String get announceImageLabel => '📷 이미지';

  @override
  String get announceAudioLabel => '🎤 음성 메모';

  @override
  String get announceModeLocked => '잠김';

  @override
  String get announceModeOpen => '열려 있는';

  @override
  String get announceOpenBadge => 'OPEN · 암호화되지 않음';

  @override
  String get announceLockedBadge => '잠김';

  @override
  String get announceLockedPlaceholder => '암호화됨 — 읽기 액세스 권한을 요청합니다.';

  @override
  String get announceRequestAccess => '액세스 요청';

  @override
  String get announceRequestSent => '보드 소유자에게 전송된 액세스 요청';

  @override
  String get announceRequestFailed => '액세스를 요청할 수 없습니다(소유자의 공개 키 필요).';

  @override
  String get announceOpenConfirmTitle => '암호화하지 않고 게시하시겠습니까?';

  @override
  String get announceOpenConfirmBody =>
      '열린 게시물은 E2EE가 아닙니다. 경로(메시/릴레이)에 있는 사람은 누구나 읽을 수 있습니다. 계속하다?';

  @override
  String get announcePostAction => '우편';

  @override
  String get announcePendingRequests => '액세스 요청';

  @override
  String get announceApprove => '승인하다';

  @override
  String get announceDeny => '부인하다';

  @override
  String get announceGranted => '이 보드에서 잠긴 게시물을 읽을 수 있습니다.';

  @override
  String get announceOwner => '당신은 이 보드를 소유하고 있습니다';

  @override
  String get announceCopyInvite => '초대 텍스트 복사';

  @override
  String get announceShowInviteQr => '초대 QR 표시';

  @override
  String get announceScanInviteQr => '스캔보드 초대 QR';

  @override
  String get announceFollow => '초대를 받은 보드 팔로우';

  @override
  String get announceFollowHint => '초대 텍스트 또는 소유자의 ResilNet 링크를 붙여넣으세요.';

  @override
  String get announceFollowOk => '팔로잉 보드';

  @override
  String announceFollowOkNamed(String title) {
    return '이제 “$title”을(를) 팔로우합니다.';
  }

  @override
  String get announceFollowFail => '초대가 유효하지 않거나 손상되었습니다.';

  @override
  String get announceInviteCopied => '초대 텍스트가 복사되었습니다.';

  @override
  String get announceInviteSaveQr => 'QR 저장';

  @override
  String get announceInviteShare => '초대 공유';

  @override
  String get announceFollowFromCompose => '메시지 상자에서 보드 초대가 감지되었습니다.';

  @override
  String get peerConfirmAddTitle => '네트워크 구성원을 추가하시겠습니까?';

  @override
  String peerConfirmAddBody(String name) {
    return '비공개로 메시지를 보낼 수 있도록 공개 키와 함께 \'$name\'을 추가하시겠습니까?';
  }

  @override
  String get peerConfirmAdd => '회원 추가';

  @override
  String peerAddedOk(String name) {
    return '네트워크 구성원에 $name을(를) 추가했습니다.';
  }

  @override
  String get peerAddFromCompose => '메시지 상자에서 신원/공개 키가 감지되었습니다.';

  @override
  String get peerHashCopied => '공개 키 해시가 복사되었습니다.';

  @override
  String get peerHashOpenChat => '오픈채팅';

  @override
  String get peerHashAddHint =>
      '해시가 복사되었습니다. E2EE에 대한 전체 공개 키를 추가할 수 있도록 ID 링크 또는 QR을 공유하도록 요청하세요.';

  @override
  String get peerQrNoCode => '이 이미지에는 ResilNet QR이 없습니다.';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet ID: “$name”\n링크 열기 또는 채팅창에 붙여넣기 → 회원 추가\n아니면 신원 QR을 스캔하세요.';
  }

  @override
  String get identityShareInvite => 'ID 링크 공유';

  @override
  String get identityInviteCopied => 'ID 링크가 복사되었습니다.';

  @override
  String announceInviteSharePreamble(String title) {
    return '이사회 초대: “$title”\nResilNet 열기 → 커뮤니티 보드 → 초대에서 팔로우\n또는 QR을 스캔하거나 아래 링크를 탭하세요.';
  }

  @override
  String get announceConfirmFollowTitle => '이 보드를 팔로우하시겠습니까?';

  @override
  String announceConfirmFollowBody(String title) {
    return '이 초대에서 \'$title\'을(를) 팔로우하시겠습니까?';
  }

  @override
  String get announceConfirmFollow => '따르다';
}

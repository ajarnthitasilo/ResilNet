// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'તાજું કરી રહ્યું છે ResilNet…';

  @override
  String get appRefreshed => 'તાજું કર્યું — રેડિયો અને શોધ પુનઃપ્રારંભ';

  @override
  String appRefreshFailed(String error) {
    return 'તાજું કરવું નિષ્ફળ થયું: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'ડબલ-ટેપ = નરમ તાજું. લાંબા સમય સુધી દબાવો = સખત પુનઃપ્રાપ્તિ. ટ્રિપલ-ટેપ = કટોકટી સાફ કરવું.';

  @override
  String get softRefreshTipTitle => 'જો ResilNet અટવાઈ લાગે';

  @override
  String get softRefreshTipBody =>
      'સોફ્ટ રેડિયો રિફ્રેશ માટે ResilNet (ઉપર-ડાબે) બે વાર ટેપ કરો. જો હજુ પણ અટકી જાય તો: શીર્ષકને લાંબો સમય દબાવો, ⋮ → હાર્ડ પુનઃપ્રાપ્તિ અથવા સેટિંગ્સનો ઉપયોગ કરો. ટ્રિપલ-ટેપ માત્ર ઇમરજન્સી વાઇપ છે.';

  @override
  String get softRefreshTipGotIt => 'સમજાયું';

  @override
  String get infoSoftRefreshTitle => 'જો એપ્લિકેશન અટવાઇ લાગે છે';

  @override
  String get infoSoftRefreshStepRefresh =>
      'બે વાર ટૅપ કરો ResilNet (ઉપર-ડાબે) → સોફ્ટ રિફ્રેશ રેડિયો અને નજીકના લોકો';

  @override
  String get infoSoftRefreshStepHard =>
      'હજુ અટવાયું છે? શીર્ષકને લાંબા સમય સુધી દબાવો, અથવા ⋮ / સેટિંગ્સ → સખત પુનઃપ્રાપ્તિ';

  @override
  String get infoSoftRefreshStepWait =>
      'પરિણામ સ્નેકબાર માટે રાહ જુઓ, પછી ફરી પ્રયાસ કરો. સત્ર રીસેટ તમારી કી રાખે છે.';

  @override
  String get infoSoftRefreshStepWipe =>
      'ટ્રિપલ-ટેપ = ઇમરજન્સી વાઇપ (સ્થાનિક ડેટા કાઢી નાખે છે) — માત્ર જો ઇરાદાપૂર્વક';

  @override
  String get appRecoverySection => 'એપ્લિકેશન પુનઃપ્રાપ્તિ';

  @override
  String get appRecoverySectionSubtitle =>
      'જ્યારે એપ્લિકેશન સ્થિર લાગે ત્યારે ઉપયોગ કરો. નરમ = શીર્ષક ડબલ-ટેપ. સખત પુનઃપ્રાપ્તિ વધુ મજબૂત છે. સત્ર રીસેટ કી વાઇપ કર્યા વિના સેવાઓ પુનઃપ્રારંભ કરે છે.';

  @override
  String get appHardRecoverAction => 'હાર્ડ પુનઃપ્રાપ્ત';

  @override
  String get appHardRecovering => 'પુનઃપ્રાપ્તિ મુશ્કેલ છે...';

  @override
  String get appSessionResetAction => 'સત્ર રીસેટ કરો';

  @override
  String get appSessionResetRunning => 'સત્ર રીસેટ કરી રહ્યું છે...';

  @override
  String get appSessionResetConfirmTitle => 'સત્ર રીસેટ કરીએ?';

  @override
  String get appSessionResetConfirmBody =>
      'આ ઉપકરણ પર ResilNet સેવાઓ પુનઃપ્રારંભ કરે છે. તમારી ઓળખની ચાવીઓ રાખવામાં આવે છે.';

  @override
  String get appRecoveryBusy => 'પુનઃપ્રાપ્તિ પહેલેથી ચાલી રહી છે...';

  @override
  String get appRecoveryOk => 'પુનઃપ્રાપ્તિ સમાપ્ત';

  @override
  String get appRecoveryPartial =>
      'કેટલાક પગલાં છોડવા સાથે પુનઃપ્રાપ્તિ સમાપ્ત થઈ — જો હજુ પણ અટકી ગયા હોય તો ફરી પ્રયાસ કરો';

  @override
  String get appRecoveryFailed =>
      'પુનઃપ્રાપ્તિ નિષ્ફળ થઈ — સત્ર રીસેટ કરવાનો પ્રયાસ કરો, અથવા OS માંથી એપ્લિકેશનને બળપૂર્વક છોડો';

  @override
  String get localWifiTitle => 'સ્થાનિક Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'ઇન્ટરનેટ વિના નજીકના ઉપકરણોને લિંક કરો — એક LAN પર હોવા જેવું જ.';

  @override
  String get localWifiNotGatewayHint =>
      'ESP32 LoRa ગેટવે SoftAP નથી. આ માત્ર ફોન↔ફોન / LAN છે.';

  @override
  String get localWifiUnavailable =>
      'સ્થાનિક Wi‑Fi હજી તૈયાર નથી — એપ સ્ટાર્ટઅપની રાહ જુઓ.';

  @override
  String get lxmfBridgeTitle => 'હોમ નોડ';

  @override
  String get lxmfBridgeSubtitle =>
      'તમારા Wi‑Fi પર વૈકલ્પિક Mac અથવા Pi જે સીલ કરેલી ચેટ્સને રિલે કરે છે. મૂળભૂત રીતે બંધ. એન્ડ-ટુ-એન્ડ એન્ક્રિપ્શનને બદલતું નથી.';

  @override
  String get lxmfBridgeEnable => 'હોમ નોડનો ઉપયોગ કરો';

  @override
  String get lxmfBridgeDisabledHint =>
      'જ્યારે આ નેટવર્ક પર Mac અથવા Pi પર બ્રિજ એપ્લિકેશન ચાલી રહી હોય ત્યારે જ ચાલુ કરો.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'ઑનલાઇન — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'હોમ નોડ સુધી પહોંચી શકાતું નથી — $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'હોમ નોડ સરનામું';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP અથવા http://IP:port — ઉદાહરણ 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'પીઅર → LXMF ડેસ્ટ (JSON)';

  @override
  String get lxmfBridgeRefresh => 'સ્થિતિ સાચવો અને તાજું કરો';

  @override
  String get lxmfBridgeLabHint => 'અદ્યતન: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'હોમ નોડ સેટિંગ્સ';

  @override
  String get lxmfBridgeCheckConnection => 'કનેક્શન તપાસો';

  @override
  String get lxmfBridgeStatusOnline => 'હોમ નોડ સાથે જોડાયેલ છે';

  @override
  String get lxmfBridgeStatusOffline => 'હોમ નોડ પહોંચી શકાતું નથી';

  @override
  String get lxmfBridgeYourDest => 'આ નોડનું સરનામું (મિત્રો સાથે શેર કરો)';

  @override
  String get lxmfBridgeCopyDest => 'સરનામું કૉપિ કરો';

  @override
  String get lxmfBridgeDestCopied => 'સરનામું કૉપિ કર્યું';

  @override
  String get lxmfBridgeLinkedPeers => 'જોડાયેલા મિત્રો';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'દરેક મિત્રને એકવાર તેમના ઘર-નોડ સરનામાંની જરૂર હોય છે. પછી સીલબંધ ચેટ્સ આ પાથનો ઉપયોગ કરી શકે છે.';

  @override
  String get lxmfBridgeNoLinks => 'હજુ સુધી કોઈ મિત્રો જોડાયેલા નથી.';

  @override
  String get lxmfBridgeAddLink => 'મિત્રને લિંક કરો';

  @override
  String get lxmfBridgePickPeer => 'મિત્ર';

  @override
  String get lxmfBridgePeerDest => 'તેમનું ઘર-નોડ સરનામું';

  @override
  String get lxmfBridgePeerDestHint =>
      'તેમની હોમ નોડ સ્ક્રીનમાંથી 32-અક્ષરનો કોડ';

  @override
  String get lxmfBridgeInvalidDest =>
      'તે સરનામું માન્ય લાગતું નથી. તેમના હોમ નોડમાંથી સંપૂર્ણ કોડ પેસ્ટ કરો.';

  @override
  String get lxmfBridgeRemoveLink => 'અનલિંક કરો';

  @override
  String get lxmfBridgeSaveLink => 'સાચવો';

  @override
  String get lxmfBridgeLinkSaved => 'મિત્ર જોડાયો';

  @override
  String get lxmfBridgeNoPeers =>
      'હજી સુધી કોઈ સંદેશાયોગ્ય સંપર્કો નથી — પહેલા મિત્રને ઉમેરો.';

  @override
  String get lxmfBridgeHelp =>
      'બ્રિજને Mac/Pi પર ચાલતો રાખો. આ પાથ તમારા LAN પર રહે છે — તે LoRa નથી અને ઇન્ટરનેટ અથવા બ્લૂટૂથ મેશને બદલતો નથી.';

  @override
  String get localWifiModeHotspot => 'નજીકમાં';

  @override
  String get localWifiModeRouter => 'રાઉટર';

  @override
  String get localWifiHotspotIntro =>
      'એક ઉપકરણ વ્યક્તિગત હોટસ્પોટ શેર કરે છે. અન્ય લોકો તે હોટસ્પોટમાં જોડાય છે, પછી ResilNet તેમને સ્થાનિક નેટવર્ક પર શોધે છે.';

  @override
  String get localWifiHostAction => 'નેટવર્ક બનાવો (હોસ્ટ)';

  @override
  String get localWifiJoinAction => 'નેટવર્કમાં જોડાઓ';

  @override
  String get localWifiHostSteps =>
      '1. iOS/Android સેટિંગ્સ ખોલો અને વ્યક્તિગત હોટસ્પોટ (અથવા ઇન્ટરનેટ શેરિંગ) ચાલુ કરો.\n2. મિત્રોને હોટસ્પોટ નામ (અને પાસવર્ડ) જણાવો.\n3. અહીં પાછા આવો અને \"હોટસ્પોટ ચાલુ છે — રાહ જોવાનું શરૂ કરો\" પર ટૅપ કરો.';

  @override
  String get localWifiHostReady => 'હોટસ્પોટ ચાલુ છે — રાહ જોવાનું શરૂ કરો';

  @override
  String get localWifiHostWaiting => 'મિત્રો જોડાવા માટે રાહ જોઈ રહ્યાં છીએ...';

  @override
  String get localWifiJoinSteps =>
      '1. સિસ્ટમ સેટિંગ્સ ખોલો અને તમારા મિત્રના વ્યક્તિગત હોટસ્પોટમાં જોડાઓ.\n2. અહીં પાછા ફરો અને \"હું કનેક્ટેડ છું — શોધો\" પર ટેપ કરો.';

  @override
  String get localWifiJoinReady => 'હું જોડાયેલ છું - શોધો';

  @override
  String get localWifiRouterIntro =>
      'દરેક ઉપકરણને સમાન Wi‑Fi રાઉટર/AP સાથે કનેક્ટ કરો. રાઉટરને ઈન્ટરનેટની જરૂર નથી - માત્ર એક શેર કરેલ સ્થાનિક નેટવર્ક.';

  @override
  String get localWifiRouterSearch => 'આ Wi‑Fi પર શોધો';

  @override
  String get localWifiRefreshNetwork => 'Wi‑Fi માહિતી તાજી કરો';

  @override
  String get localWifiRouterNoWifiTitle => 'Wi‑Fi પર નથી';

  @override
  String get localWifiRouterNoWifiBody =>
      'સિસ્ટમ સેટિંગ્સમાં રાઉટરના Wi‑Fi સાથે જોડાઓ, પછી ફરીથી શોધો.';

  @override
  String get localWifiDiscovering => 'સ્થાનિક Wi‑Fi પર શોધી રહ્યાં છીએ…';

  @override
  String get localWifiPeersFound => 'આ નેટવર્ક પરના ઉપકરણો';

  @override
  String get localWifiStop => 'રોકો';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi નામ અનુપલબ્ધ';

  @override
  String get localWifiStubBanner => 'LAN સોકેટની રાહ જોઈ રહ્યાં છીએ...';

  @override
  String get localWifiLiveBanner =>
      'LAN ડિસ્કવરી લાઇવ (UDP) — આ Wi‑Fi પર + સીલબંધ ચેટની જાહેરાત કરો';

  @override
  String get localWifiEmptyHotspot =>
      'હજુ સુધી કોઈ ઉપકરણો નથી.\nતપાસો કે મિત્રો તમારા હોટસ્પોટમાં જોડાયા છે અને સ્થાનિક નેટવર્કને ઍક્સેસ કરવાની મંજૂરી આપી છે.';

  @override
  String get localWifiEmptyRouter =>
      'હજુ સુધી કોઈ ઉપકરણો નથી.\nસમાન SSID? સ્થાનિક નેટવર્કની મંજૂરી છે? કેટલાક રાઉટર્સ ડિવાઇસ-ટુ-ડિવાઈસ ટ્રાફિક (AP આઇસોલેશન) બ્લોક કરે છે.';

  @override
  String get localWifiIsolationHelp => 'શા માટે આપણે એકબીજાને શોધી શકતા નથી?';

  @override
  String get localWifiIsolationTitle => 'રાઉટર ગ્રાહકોને અલગ કરી શકે છે';

  @override
  String get localWifiIsolationBody =>
      'જો AP/ક્લાયન્ટ આઇસોલેશન (અથવા અતિથિ નેટવર્ક) ચાલુ હોય, તો સમાન Wi‑Fi પરના ફોન વાત કરી શકતા નથી. આઇસોલેશન બંધ કરો, મુખ્ય SSID નો ઉપયોગ કરો અથવા નજીકના (હોટસ્પોટ) મોડ પર સ્વિચ કરો.';

  @override
  String get localWifiPeerReady => 'ચેટ કરવા માટે તૈયાર (ચાવી છે)';

  @override
  String get localWifiPeerNeedKey =>
      'મળ્યું — કીઓ એક્સચેન્જ કરવા માટે QR સ્કેન કરો';

  @override
  String get localWifiErrorTitle => 'સ્થાનિક Wi‑Fi ભૂલ';

  @override
  String get localWifiErrorBody => 'કંઈક ખોટું થયું. રોકો અને ફરી પ્રયાસ કરો.';

  @override
  String get preparingSystem => 'સિસ્ટમ તૈયાર કરી રહ્યું છે...';

  @override
  String get bootFailedTitle => 'શરૂ કરી શકાયું નથી';

  @override
  String get retry => 'ફરી પ્રયાસ કરો';

  @override
  String get bootRecoveryAction => 'નવી ઓળખ શરૂ કરો (સ્થાનિક ડેટા ભૂંસી નાખો)';

  @override
  String get bootRecoveryConfirmTitle => 'નવી ઓળખ શરૂ કરશો?';

  @override
  String get bootRecoveryConfirmBody =>
      'આ આ ઉપકરણ પરની સ્થાનિક ચેટ્સ, કી અને ઓળખને કાયમ માટે ભૂંસી નાખશે.\nસાથીઓએ તમારી નવી ઓળખ સાથે તમારો QR ફરીથી સ્કેન કરવો આવશ્યક છે.\nઆ પૂર્વવત્ કરી શકાતું નથી.';

  @override
  String get bootRecoveryRunning => 'સ્થાનિક ઓળખ રીસેટ કરી રહ્યાં છીએ...';

  @override
  String get bootRecoverySuccess => 'સ્થાનિક ઓળખ રીસેટ પૂર્ણ';

  @override
  String bootRecoveryFailed(String error) {
    return 'ઓળખ રીસેટ કરી શકાઈ નથી: $error';
  }

  @override
  String get cancel => 'રદ કરો';

  @override
  String get save => 'સાચવો';

  @override
  String get close => 'બંધ કરો';

  @override
  String get start => 'શરૂ કરો';

  @override
  String get send => 'મોકલો';

  @override
  String get settings => 'સેટિંગ્સ';

  @override
  String get language => 'ભાષા';

  @override
  String get languageSubtitle =>
      'ડિફૉલ્ટ રૂપે એપ્લિકેશન તમારી ફોનની ભાષાને અનુસરે છે (જ્યારે સમર્થિત હોય). અન્ય ભાષાઓ અંગ્રેજીમાં પાછી પડે છે. તમે અહીં ભાષાને પણ લૉક કરી શકો છો.';

  @override
  String get languageSystem => 'સિસ્ટમ ડિફોલ્ટ';

  @override
  String get languageThai => 'થાઈ';

  @override
  String get languageEnglish => 'અંગ્રેજી';

  @override
  String get notificationsTooltip => 'સૂચના સેટિંગ્સ';

  @override
  String get enableMessageNotifications => 'સંદેશ સૂચનાઓ સક્ષમ કરો';

  @override
  String get settingsNotificationsSubtitle =>
      '1:1 સંદેશાઓ અને લોકો ઓનલાઇન (સ્થાનિક ચેતવણીઓ)';

  @override
  String get networkMembersTooltip => 'નેટવર્ક સભ્યો';

  @override
  String get identityQrTooltip => 'ઓળખ / QR';

  @override
  String get feedDirects => 'ચેટ';

  @override
  String get feedMesh => '#મેશ';

  @override
  String get feedGeo => 'વિસ્તાર';

  @override
  String get feedDirectsSubtitle => 'ખાનગી E2EE સંદેશાઓ';

  @override
  String get feedMeshSubtitle => 'નજીકના સાથીદારો (BLE)';

  @override
  String get feedGeoSubtitle => 'જીઓહશ શોધ ચેનલ';

  @override
  String get peerIdHint =>
      'ચેટ શરૂ કરવા માટે રીસીવર ID (પબ્લિક કી હેશ) પેસ્ટ કરો';

  @override
  String get directsEmpty =>
      'હજી સુધી કોઈ ચેટ નથી — શરૂ કરવા માટે QR સ્કેન કરો અથવા પ્રાપ્તકર્તા ID પેસ્ટ કરો\nસંદેશાઓ મોકલતા પહેલા E2EE વડે સીલ કરવામાં આવે છે (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • ચેટ ખોલવા માટે ટેપ કરો';

  @override
  String get meshIntro =>
      'BLE શ્રેણીમાં સાથીદારો — ખાનગી E2EE ચેટ માટે ટેપ કરો (#mesh પર કોઈ સાર્વજનિક કંપોઝ નથી)\nહાઇબ્રિડ રાઉટર દ્વારા મોકલે છે (BLE + LoRa + Nostr જ્યારે ઓનલાઇન)';

  @override
  String get meshEmptyRunning =>
      'હજી સુધી કોઈ નજીકના સાથીદારો નથી — એપને BLE શ્રેણીમાં બીજા ઉપકરણ પર ખોલો';

  @override
  String get meshEmptyStopped =>
      'BLE ચાલી રહ્યું નથી — બ્લૂટૂથ / સ્થાન પરવાનગી આપો';

  @override
  String get meshNearbyPrefix => 'નજીકમાં';

  @override
  String get meshRetentionTitle => 'સંદેશાઓ સ્વતઃ કાઢી નાખો';

  @override
  String get meshRetentionSubtitle =>
      'જૂનો સ્થાનિક ચેટ ઇતિહાસ આપમેળે કાઢી નાખવામાં આવે છે';

  @override
  String get meshRetentionKeep => 'રાખો';

  @override
  String get meshRetention1Day => '1 દિવસ';

  @override
  String get meshRetention3Days => '3 દિવસ';

  @override
  String get meshRetention7Days => '7 દિવસ';

  @override
  String get refreshLocationTooltip => 'સ્થાન તાજું કરો';

  @override
  String get geoIntro =>
      'આ જીઓહાશમાં ઓનલાઈન લોકોને 1:1 અથવા વિસ્તારના પબ્લિક ફેન-આઉટ સાથે મેસેજ કરી શકાય છે (હજુ પણ પીઅર દીઠ E2EE સીલ કરેલ છે - સાદા ટેક્સ્ટ નહીં)';

  @override
  String geoEmpty(String channel) {
    return 'હજુ સુધી $channel માં કોઈ ઓનલાઈન નથી\nપરિવહન → ઇન્ટરનેટ/ઓટોનો ઉપયોગ કરો, Nostr માટે રાહ જુઓ, સ્થાન તાજું કરો';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return '$channel માં ઑનલાઇન • 1:1 E2EE માટે ટેપ કરો';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'નજીકમાં (વિસ્તારમાં હાજરીની રાહ જોઈ રહ્યા છીએ) • 1:1 E2EE માટે ટેપ કરો';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return '$channel માં Nostr પર જોવા મળે છે • ફક્ત શોધ (લેગસી)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'વારસાની અનામી હાજરી — બાઉન્ડ પીઅરની રાહ જુઓ અથવા QR એક્સચેન્જ કરો';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE નજીકમાં — 1:1 E2EE શરૂ કરવા માટે QR સ્કેન કરો';

  @override
  String get geoInternetDiscoverHint =>
      'વિસ્તાર ઈન્ટરનેટ શોધની જરૂર છે Nostr કનેક્ટેડ (સેટિંગ્સ → ટ્રાન્સપોર્ટ → ઈન્ટરનેટ/ઓટો)';

  @override
  String get geoEmptyNoLocation =>
      'સ્થાન હજી ઉકેલાયું નથી — જીપીએસને મંજૂરી આપો અને તમારા જીઓહશને Nostr પર પ્રકાશિત કરવા રિફ્રેશ કરો';

  @override
  String get geoEmptyNeedsPermission =>
      'સ્થાન પરવાનગી નકારી — સેટિંગ્સ → ગોપનીયતા → સ્થાનમાં ResilNet ને મંજૂરી આપો';

  @override
  String get geoEmptyServicesDisabled =>
      'સ્થાન સેવાઓ બંધ છે — તેમને સેટિંગ્સમાં ચાલુ કરો';

  @override
  String get geoEmptyNoGpsFix =>
      'GPS ફિક્સ મેળવી શકાયું નથી (Wi‑Fi iPads પર સામાન્ય) — નીચે મેન્યુઅલી જીઓહાશ સેટ કરો';

  @override
  String get geoEmptyTeleportHint =>
      'સ્થળ આયકનને ટેપ કરો → જીઓહાશ દાખલ કરો (દા.ત. w5) → ટેલિપોર્ટ';

  @override
  String get geoSetGeohashManually => 'જીઓહાશ સેટ કરો';

  @override
  String get geoTeleportHint =>
      'જીપીએસ નથી? જીઓહાશ ઉપસર્ગ દાખલ કરો (2–7 અક્ષરો, દા.ત. w5) અને ટેલિપોર્ટને ટેપ કરો';

  @override
  String get geoTeleportInvalid =>
      'અમાન્ય જીઓહાશ — ફક્ત આધાર32 અક્ષરો/સંખ્યાઓનો ઉપયોગ કરો (દા.ત. w5 અથવા w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'વિસ્તાર $channel પર સેટ કર્યો';
  }

  @override
  String geoManualActive(String channel) {
    return 'મેન્યુઅલ વિસ્તાર: $channel (GPS રિફ્રેશ ઓવરરાઇડ થશે)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr તૈયાર નથી — ફરીથી કનેક્ટ કરો પર ટૅપ કરો (0/0 જ્યાં સુધી પ્રારંભ સફળ ન થાય)';

  @override
  String get geoEmptyMeshOnly =>
      'ટ્રાન્સપોર્ટ માત્ર મેશ માટે છે — Nostr થી વધુ સાથીદારોને શોધવા માટે ઈન્ટરનેટ અથવા ઓટો પર સ્વિચ કરો';

  @override
  String geoEmptyWaiting(String channel) {
    return 'હજુ સુધી $channel માં કોઈ નથી — બંને ઉપકરણો પર Area + ઈન્ટરનેટ ખુલ્લો રાખો અને ~60s રાહ જુઓ';
  }

  @override
  String get geoChannelFallback => '#વિસ્તાર';

  @override
  String get geoRefreshLocation => 'સ્થાન તાજું કરો';

  @override
  String get settingsClearLocationTitle => 'સ્થાન સાફ કરો';

  @override
  String get settingsClearLocationSubtitle =>
      'જીપીએસ / ટેલિપોર્ટ જીઓહાશ દૂર કરો (વિસ્તાર #— બને છે)';

  @override
  String get settingsClearLocationConfirmTitle => 'સ્થાન સાફ કરીએ?';

  @override
  String get settingsClearLocationConfirmBody =>
      'આ ઉપકરણ પર સંગ્રહિત જીઓહાશ કાઢી નાખે છે. તમે પછીથી ફરીથી GPS અથવા ટેલિપોર્ટ રિફ્રેશ કરી શકો છો.';

  @override
  String get settingsClearLocationAction => 'સ્થાન સાફ કરો';

  @override
  String get settingsClearLocationSnack => 'સ્થાન સાફ કર્યું';

  @override
  String get chatVoiceTooLarge => 'વૉઇસ નોટ ખૂબ મોટી છે — મહત્તમ ~30 સેકન્ડ';

  @override
  String get chatVoiceNeedInternet =>
      'વૉઇસ નોટને ઇન્ટરનેટની જરૂર છે (Nostr) — એકલા BLE માટે ખૂબ મોટી';

  @override
  String get chatVoiceSentInternet => 'ઈન્ટરનેટ દ્વારા વોઈસ નોટ મોકલવામાં આવી';

  @override
  String get noticeAnonMention => 'ઉલ્લેખ';

  @override
  String get noticeAnonDm => 'સીધો સંદેશ';

  @override
  String get noticeAnonHug => 'આલિંગન';

  @override
  String get noticeAnonSlap => 'થપ્પડ';

  @override
  String get noticeAnonBlock => 'બ્લોક';

  @override
  String get noticeAnonNeedKey =>
      'હજી સુધી કોઈ સાર્વજનિક કી નથી — 1:1 માટે પહેલા QR એક્સચેન્જ કરો';

  @override
  String get noticeAnonActionSent => 'મોકલેલ';

  @override
  String noticeAnonBlocked(String anon) {
    return 'અવરોધિત $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* આલિંગન $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* થપ્પડ $anon *';
  }

  @override
  String get geoReconnectNostr => 'Nostr ફરીથી કનેક્ટ કરો';

  @override
  String get nostrSectionTitle => 'Nostr રિલે';

  @override
  String get nostrSectionSubtitle =>
      'ઈન્ટરનેટ મેસેજિંગ અને એરિયા ડિસ્કવરી આ રિલેનો ઉપયોગ કરે છે. જો સ્ટેટસ ઑફલાઇન રહે તો ફરીથી કનેક્ટ કરો પર ટૅપ કરો.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'કનેક્ટેડ $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'ઑફલાઇન — રિલે સૂચિબદ્ધ છે પરંતુ કોઈ કનેક્ટેડ નથી';

  @override
  String get nostrStatusNotInit =>
      'શરૂ થયું નથી (0/0) — પ્રારંભ કરવા માટે ફરીથી કનેક્ટ કરો પર ટૅપ કરો';

  @override
  String get nostrReconnectAction => 'Nostr ફરીથી કનેક્ટ કરો';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr કનેક્ટેડ ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'હજુ પણ ઑફલાઇન — Wi‑Fi/સેલ્યુલર તપાસો અથવા ફરી પ્રયાસ કરો';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'નિષ્ફળ: $error';
  }

  @override
  String get nostrReconnecting => 'રિલે સાથે કનેક્ટ થઈ રહ્યું છે...';

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
    return '$channel માં ઈન્ટરનેટ (Nostr) • સીલબંધ ચેટ તૈયાર છે';
  }

  @override
  String get transportModeTitle => 'વિસ્તાર પરિવહન';

  @override
  String get transportModeSubtitle =>
      'મેશ = BLE નજીકમાં (રેડિયો) જ્યારે ન હોય ત્યારે Nostr · ઇન્ટરનેટ અને ઑટો = Nostr લોકોની સૂચિ';

  @override
  String get transportModeMesh => 'જાળીદાર';

  @override
  String get transportModeInternet => 'ઈન્ટરનેટ';

  @override
  String get transportModeAuto => 'ઓટો';

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
  String get geoPublicHint => 'આ વિસ્તારમાં દરેકને ઓનલાઇન જાહેર સંદેશ';

  @override
  String get geoPublicSend => 'જાહેર';

  @override
  String geoPublicHelp(int count) {
    return '$count ઓનલાઈન પીઅર(ઓ) ને સીલ કરેલ ફેન-આઉટ — દરેકને એક ખાનગી પરબિડીયું પ્રાપ્ત થાય છે';
  }

  @override
  String geoPublicSent(int count) {
    return 'આ વિસ્તારમાં $count સાથીદારોને મોકલવામાં આવ્યા છે';
  }

  @override
  String get geoPublicSentNone =>
      'ઓનલાઈન મેસેજ કરી શકાય તેવા સાથીદારો નથી — ચાવી ધરાવતા સાથીદારો સાથે વિસ્તાર/મેશ ખોલો અથવા BLE/Nostr ની રાહ જુઓ';

  @override
  String get areaPublicBadge => 'વિસ્તાર જાહેર';

  @override
  String get geoErrorPermission =>
      'સ્થાન વાંચી શકાયું નથી — સ્થાન પરવાનગી તપાસો';

  @override
  String get geoPrecisionRegion => 'પ્રદેશ';

  @override
  String get geoPrecisionProvince => 'પ્રાંત';

  @override
  String get geoPrecisionCity => 'શહેર';

  @override
  String get geoPrecisionNeighborhood => 'પડોશ';

  @override
  String get geoPrecisionBlock => 'બ્લોક';

  @override
  String get aliasTitle => 'ઉપનામ સેટ કરો (સંપર્ક ઉપનામ)';

  @override
  String get aliasHintBody =>
      'આ ઉપનામ ફક્ત આ ઉપકરણ પર સંગ્રહિત છે (ફક્ત સ્થાનિક)\nતે ક્યારેય E2EE ટ્રાફિક સાથે મોકલવામાં આવતું નથી';

  @override
  String get aliasLabel => 'ઉપનામ';

  @override
  String get aliasHint => 'દા.ત. “ગામના વડા”, “પ’સોમચાઈ”…';

  @override
  String get settingsDevices => 'ઉપકરણો';

  @override
  String get settingsFirmwareTitle => 'ફર્મવેર ESP32 ડાઉનલોડ / અપડેટ કરો';

  @override
  String get settingsFirmwareSubtitle =>
      '.bin ફાઇલો ડાઉનલોડ કરો અને OTA દ્વારા ESP32 બોર્ડ અપડેટ કરો';

  @override
  String get mtBridgeTitle => 'Meshtastic પુલ';

  @override
  String get mtBridgeSettingsSubtitle =>
      'ફક્ત ટેક્સ્ટ-એ/બી બ્રિજ — ResilNet E2EE નહીં';

  @override
  String get mtBridgeIntro =>
      'ટૂંકા સાદા ટેક્સ્ટને Meshtastic અને ResilNet વચ્ચે ખસેડો. A અને B મોડ્સ એક જ સમયે ચાલી શકતા નથી. આ એન્ડ-ટુ-એન્ડ એન્ક્રિપ્શન નથી.';

  @override
  String get mtBridgeModeLabel => 'મોડ';

  @override
  String get mtBridgeModeOff => 'બંધ';

  @override
  String get mtBridgeModeA => 'ઇન્જેસ્ટ એ';

  @override
  String get mtBridgeModeB => 'એગ્રેસ બી';

  @override
  String get mtBridgeModeOffShort => 'બંધ';

  @override
  String get mtBridgeModeAShort => 'માં એ';

  @override
  String get mtBridgeModeBShort => 'આઉટ બી';

  @override
  String get mtBridgeMutexHint =>
      'એક મોડ પસંદ કરવાથી બીજો આપમેળે બંધ થઈ જાય છે. એક સાથે A+B સમર્થિત નથી.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'ડેમો (લોગીંગ)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'ઇનબાઉન્ડ ટેક્સ્ટ નોટિસ હેઠળ #meshtastic તરીકે દેખાય છે. મેશ રિલે વૈકલ્પિક છે (મૂળભૂત રીતે બંધ).';

  @override
  String get mtBridgeRelayTitle => 'ResilNet મેશ પર પણ રિલે';

  @override
  String get mtBridgeRelayHint =>
      'જ્યારે ચાલુ હોય, ત્યારે હસ્તાક્ષરિત જાહેર બુલેટિન પ્રસારિત થાય છે. બંધ = આ ફોનની સૂચનાઓ જ.';

  @override
  String get mtBridgeSimulateHint => 'ડેમો સંદેશ';

  @override
  String get mtBridgeSimulate => 'Meshtastic સંદેશનું અનુકરણ કરો';

  @override
  String get mtBridgeIngestOk => 'નોટિસમાં ઇન્જેસ્ટ (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'ચેતવણી: અહીં મોકલવામાં આવેલ સંદેશાઓ ResilNet E2EE નથી. Meshtastic પાથ પરની કોઈપણ વ્યક્તિ તેને વાંચી શકે છે.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'પ્રકાશિત કરવા માટેનો ટેક્સ્ટ';

  @override
  String get mtBridgeSend => 'Meshtastic પર મોકલો';

  @override
  String get mtBridgeEgressOk => 'Meshtastic માટે કતારબદ્ધ (લોગ / ઇતિહાસ જુઓ)';

  @override
  String get mtBridgeLastEgress => 'છેલ્લું બહાર નીકળવું';

  @override
  String get mtBridgeEgressHistory => 'તાજેતરનું બહાર નીકળવું';

  @override
  String get mtBridgeOffHint =>
      'બ્રિજનો ઉપયોગ કરવા માટે ઇન્જેસ્ટ (A) અથવા Egress (B) ચાલુ કરો.';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTIC · E2EE નહીં';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'MQTT પરિવહનનો ઉપયોગ કરો';

  @override
  String get mtBridgeUseMqttHint =>
      'બંધ = માત્ર ડેમો લોગીંગ (MQTT ઇનબાઉન્ડ અવગણવામાં આવેલ). જ્યારે કનેક્ટ થયેલ હોય ત્યારે ઇન્જેસ્ટ/એગ્રેસ માટે = MQTT ચાલુ.';

  @override
  String get mtBridgeMqttHost => 'બ્રોકર હોસ્ટ';

  @override
  String get mtBridgeMqttPort => 'બંદર';

  @override
  String get mtBridgeMqttTls => 'TLS (mqtts) નો ઉપયોગ કરો';

  @override
  String get mtBridgeMqttTlsHint =>
      'લાક્ષણિક પોર્ટ 8883. સિસ્ટમ પ્રમાણપત્રોનો ઉપયોગ કરે છે; હેન્ડશેક ભૂલો પર નરમ નિષ્ફળ જાય છે.';

  @override
  String get mtBridgeMqttAutoReconnect => 'સ્વતઃ-પુનઃજોડાણ';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'જ્યારે ચાલુ હોય, ત્યારે ક્લાયંટ ટીપાં પછી ફરીથી કનેક્ટ કરવાનો પ્રયાસ કરે છે. પુનઃસ્થાપિત થાય ત્યાં સુધી સ્થિતિ કનેક્ટિંગ બતાવે છે.';

  @override
  String get mtBridgeMqttTopicHelpers => 'વિષય સહાયકો';

  @override
  String get mtBridgeMqttRegion => 'પ્રદેશ ઉપસર્ગ (વૈકલ્પિક)';

  @override
  String get mtBridgeMqttRegionHint =>
      'જ્યારે સેટ કરો, ત્યારે msh/<region>/2/json તરીકે પુનઃનિર્માણ રૂટ લાગુ કરો (વિષય રુટને ઓવરરાઇડ કરે છે).';

  @override
  String get mtBridgeMqttTopicRoot => 'JSON વિષય રુટ';

  @override
  String get mtBridgeMqttDownlinkChannel => 'ડાઉનલિંક ચેનલનું નામ';

  @override
  String get mtBridgeMqttApplyTopics =>
      'રૂટ લાગુ કરો → સબ્સ્ક્રાઇબ કરો / વિષયો પ્રકાશિત કરો';

  @override
  String get mtBridgeMqttAdvanced => 'ઉન્નત MQTT';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'TLS, ફરીથી કનેક્ટ કરો, વિષયો, ઓળખપત્રો';

  @override
  String get mtBridgeMqttTopicIn => 'વિષય પર સબ્સ્ક્રાઇબ કરો';

  @override
  String get mtBridgeMqttTopicOut => 'વિષય પ્રકાશિત કરો';

  @override
  String get mtBridgeMqttGatewayFrom => 'ગેટવે નોડ આઈડી (માંથી)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'દશાંશ id અથવા !hex — સેન્ડટેક્સ્ટ ડાઉનલિંક માટે જરૂરી છે';

  @override
  String get mtBridgeMqttChannelIndex => 'મેશ ચેનલ ઇન્ડેક્સ (વૈકલ્પિક 0–7)';

  @override
  String get mtBridgeMqttUser => 'વપરાશકર્તા નામ (વૈકલ્પિક)';

  @override
  String get mtBridgeMqttPass => 'પાસવર્ડ (વૈકલ્પિક)';

  @override
  String get mtBridgeMqttPassStored =>
      'આ ઉપકરણ પર પાસવર્ડ સંગ્રહિત છે (બતાવેલ નથી).';

  @override
  String get mtBridgeMqttPassReplace => 'નવો પાસવર્ડ (રાખવા માટે ખાલી છોડો)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'સંગ્રહિત પાસવર્ડ રાખવા માટે ખાલી છોડી દો.';

  @override
  String get mtBridgeMqttPassClear => 'પાસવર્ડ સાફ કરો';

  @override
  String get mtBridgeMqttSave => 'MQTT સેટિંગ્સ સાચવો';

  @override
  String get mtBridgeMqttSaved => 'MQTT સેટિંગ્સ સાચવી';

  @override
  String get mtBridgeMqttConnect => 'કનેક્ટ કરો';

  @override
  String get mtBridgeMqttDisconnect => 'ડિસ્કનેક્ટ કરો';

  @override
  String get mtBridgeMqttConnected => 'MQTT કનેક્ટેડ';

  @override
  String get mtBridgeMqttConnecting => 'MQTT કનેક્ટ કરી રહ્યું છે...';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT ડિસ્કનેક્ટ થયું';

  @override
  String get mtBridgeMqttError => 'MQTT ભૂલ';

  @override
  String get mtBridgeErrModeIngest => 'પહેલા ઇન્જેસ્ટ (A) પર સ્વિચ કરો';

  @override
  String get mtBridgeErrModeEgress => 'પહેલા Egress (B) પર સ્વિચ કરો';

  @override
  String get mtBridgeErrRate => 'ધીમો કરો — દર મર્યાદિત';

  @override
  String get mtBridgeErrDedupe => 'ડુપ્લિકેટ સંદેશ અવગણવામાં આવ્યો';

  @override
  String get mtBridgeErrLoop => 'બ્રિજ લૂપને રોકવા માટે છોડવામાં આવ્યો';

  @override
  String get mtBridgeErrEmpty => 'સંદેશ ખાલી છે';

  @override
  String get mtBridgeErrPublish => 'પ્રકાશિત કરવું નિષ્ફળ થયું';

  @override
  String get mtBridgeErrNotConnected => 'MQTT કનેક્ટેડ નથી';

  @override
  String get mtBridgeErrMissingHost => 'MQTT બ્રોકર હોસ્ટ દાખલ કરો';

  @override
  String get mtBridgeErrMissingTopic =>
      'સબ્સ્ક્રાઇબ કરો અને વિષયો પ્રકાશિત કરો';

  @override
  String get mtBridgeErrMissingFromNode =>
      'સેન્ડટેક્સ્ટ માટે ગેટવે નોડ આઈડી (માંથી) દાખલ કરો';

  @override
  String get mtBridgeErrConnect => 'MQTT કનેક્ટ નિષ્ફળ થયું';

  @override
  String get mtBridgeErrConnectTls => 'MQTT TLS કનેક્ટ નિષ્ફળ થયું';

  @override
  String get settingsData => 'ડેટા';

  @override
  String get settingsDataHint =>
      'ડેટાબેઝને સંકોચવા માટે સ્થાનિક સંદેશાઓ કાઢી નાખો — ઓળખ, કીઓ અને સાથીદારો રાખવામાં આવે છે';

  @override
  String get settingsSaveHistoryTitle => 'સંદેશ ઇતિહાસ સાચવો';

  @override
  String get settingsSaveHistorySubtitle =>
      'જ્યારે બંધ હોય, ત્યારે સંદેશા વાયર પર E2EE રહે છે અને માત્ર આ સત્ર માટે રાખવામાં આવે છે (સ્થાનિક ચેટ ઇતિહાસમાં નહીં). તમારું પોતાનું લખાણ હજી પણ આ ઉપકરણ પર સાદા ટેક્સ્ટ તરીકે દેખાય છે.';

  @override
  String get settingsPrivacy => 'ગોપનીયતા';

  @override
  String get settingsE2eeTitle => 'એન્ડ-ટુ-એન્ડ એન્ક્રિપ્શન';

  @override
  String get settingsE2eeSubtitle =>
      'હંમેશા ચાલુ — સંદેશાઓ મોકલતા પહેલા RSA-OAEP + AES-GCM વડે સીલ કરવામાં આવે છે. રિલે અને નજીકના હોપ્સ સામગ્રીઓ વાંચી શકતા નથી.';

  @override
  String get settingsScreenshotTitle => 'સ્ક્રીનશોટ ચેતવણીઓ';

  @override
  String get settingsScreenshotSubtitle =>
      'જ્યારે આ ઉપકરણ સ્ક્રીનને કેપ્ચર કરે ત્યારે ચેટમાં સિસ્ટમ લાઇન બતાવો';

  @override
  String get settingsNostrExpiryTitle => 'Nostr સંદેશ સમય રાખો';

  @override
  String get settingsNostrExpirySubtitle =>
      'Nostr દ્વારા ઓનલાઈન હોય ત્યારે સીલબંધ એન્વલપ્સ સ્થાનિક રીતે કેટલા સમય સુધી રહેવા જોઈએ';

  @override
  String get noticeExpiresIn => 'માં સમાપ્ત થાય છે';

  @override
  String get noticesTitle => 'નોટિસ';

  @override
  String get noticesMeshIntro =>
      'સાર્વજનિક બુલેટિન — રેડિયો શ્રેણીમાં દરેકને દૃશ્યક્ષમ, એન્ક્રિપ્ટેડ નથી. તે ફોન-ટુ-ફોન ઑફલાઇન હૉપ કરે છે, અને નજીકના ResilNet રિલે બૉક્સ એક કૉપિ રાખે છે જેથી જે લોકો પછીથી આવે તેઓ હજુ પણ તેને જુએ.';

  @override
  String get noticesMeshPublicBadge => 'પબ્લિક · એન્ક્રિપ્ટેડ નથી';

  @override
  String get noticesGeoIntro =>
      'આ સ્થાન માટે ટૂંકી નોંધ ઉમેરો જેથી અન્ય મુલાકાતીઓ તેમને શોધી શકે.';

  @override
  String get noticesEmpty => 'હજુ સુધી કોઈ સૂચના નથી';

  @override
  String get noticesEmptyHint => 'અહીં આસપાસના લોકો માટે પ્રથમ સૂચના પિન કરો.';

  @override
  String get noticesComposeHint => 'નોટિસ પોસ્ટ કરો...';

  @override
  String get noticesUrgent => 'તાત્કાલિક';

  @override
  String get noticesOpen => 'નોટિસ';

  @override
  String get screenshotTaken => '*તમે સ્ક્રીનશોટ લીધો*';

  @override
  String get chatAttachImage => 'છબી જોડો';

  @override
  String get chatImageLabel => 'છબી';

  @override
  String get chatImageTooLarge => 'છબી ખૂબ મોટી છે - બીજો ફોટો અજમાવો';

  @override
  String get chatNostrExpiry => 'Nostr રાખો';

  @override
  String geoPublicComposeHint(String channel) {
    return '$channel ને મોકલો — સાર્વજનિક';
  }

  @override
  String get settingsClearTitle => 'બધા સંદેશાઓ સાફ કરો';

  @override
  String get settingsClearSubtitle => 'આ ઉપકરણ પરની બધી ચેટ્સ કાઢી નાખો';

  @override
  String get settingsClearConfirmTitle => 'બધા સંદેશાઓ સાફ કરીએ?';

  @override
  String get settingsClearConfirmBody =>
      'આ આ ઉપકરણ પરના તમામ ચેટ સંદેશાઓને કાઢી નાખે છે.\nસાથીદારો અને ઉપનામો દૂર કરવામાં આવતાં નથી.';

  @override
  String get settingsClearAction => 'ડેટા સાફ કરો';

  @override
  String get settingsClearedSnack => 'ડેટા સાફ કર્યો';

  @override
  String settingsVersion(String version) {
    return 'સંસ્કરણ $version';
  }

  @override
  String get meshBleScanning => 'BLE: નોડ્સ માટે સ્કેનિંગ';

  @override
  String get meshBleEsp32Scanning => 'ESP32: નજીકના નોડ શોધી રહ્યાં છીએ';

  @override
  String get meshBleSyncing => 'BLE: ESP32 સાથે સમન્વયિત થઈ રહ્યું છે';

  @override
  String get meshNostrPublishing => 'Nostr: પ્રકાશન';

  @override
  String get meshBleIdle => 'BLE જાળીદાર ચાલુ — હજી સુધી કોઈ નજીકના ફોન નથી';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE મેશ — નજીકના $count ફોન';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: પરવાનગી જરૂરી છે';

  @override
  String get meshBlePausedCamera =>
      'BLE કૅમેરા માટે થોભાવ્યું — પ્રારંભ કરો પર ટૅપ કરો BLE';

  @override
  String get meshBleStopped =>
      'BLE બંધ છે — બ્લૂટૂથ ચાલુ છે તે તપાસો, પછી પ્રારંભ કરો પર ટૅપ કરો BLE';

  @override
  String get meshBleRestart => 'BLE શરૂ કરો';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'પરવાનગીઓ તપાસો અને BLE શરૂ કરો';

  @override
  String get meshNostrOffline => 'Nostr ઑફલાઇન';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count નજીકના સાથીદારો • LoRa $lora • સમન્વયન ~${meters}m';
  }

  @override
  String get meshLoraReady => 'તૈયાર';

  @override
  String get meshLoraNotReady => 'તૈયાર નથી';

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
    return 'ગેટવે UDP: $label';
  }

  @override
  String get meshGatewayReady => 'ગેટવે UDP: તૈયાર';

  @override
  String get permissionTitle =>
      'BLE મેશ નેટવર્ક શરૂ કરવા માટે ઍક્સેસની મંજૂરી આપો';

  @override
  String get permissionBody =>
      'એપ્લિકેશનને સમુદાય સંદેશા માટે બ્લૂટૂથ (સ્કેન / કનેક્ટ / જાહેરાત), સ્થાન (જૂના Android ઉપકરણો માટે), અને માઇક્રોફોન (ચેટ અને ઘોષણાઓમાં વૉઇસ નોંધો માટે) ની જરૂર છે.';

  @override
  String get permissionE2ee =>
      'એન્ડ-ટુ-એન્ડ એન્ક્રિપ્શન (E2EE)\nરિલે નોડ્સ સંદેશ સામગ્રીઓ વાંચી શકતા નથી';

  @override
  String get permissionReady => 'પરવાનગીઓ તૈયાર છે';

  @override
  String get permissionRequest => 'મંજૂરી આપો અને ચાલુ રાખો';

  @override
  String get permissionNotReadySnack =>
      'સિસ્ટમ હજી તૈયાર નથી — થોડીવાર રાહ જુઓ અને ફરી પ્રયાસ કરો';

  @override
  String get permissionDeniedSnack =>
      'પરવાનગીઓ અપૂર્ણ છે — સેટિંગ્સ > ResilNet ખોલો અને બ્લૂટૂથ / સ્થાન / માઇક્રોફોનને મંજૂરી આપો';

  @override
  String get permissionMicDenied =>
      'માઇક્રોફોન ઍક્સેસ નકારવામાં આવ્યો — તેને સેટિંગ્સમાં વૉઇસ નોંધ રેકોર્ડ કરવાની મંજૂરી આપો';

  @override
  String get permissionMicOpenSettings => 'સેટિંગ્સ';

  @override
  String get permissionCameraDenied =>
      'કૅમેરાની ઍક્સેસ નકારી - તેને સેટિંગમાં QR કોડ સ્કૅન કરવાની મંજૂરી આપો';

  @override
  String get permissionCameraFailed =>
      'QR કોડ સ્કેન કરવા માટે કેમેરાની પરવાનગી જરૂરી છે';

  @override
  String get permissionCameraOpenSettings => 'સેટિંગ્સ';

  @override
  String get permissionPhotosDenied =>
      'ફોટો લાઇબ્રેરી ઍક્સેસ નકારવામાં આવી છે — તમારો QR કોડ સાચવવા માટે સેટિંગ્સમાં તેને મંજૂરી આપો';

  @override
  String get permissionPhotosFailed =>
      'તમારો QR કોડ સાચવવા માટે ફોટો લાઇબ્રેરીની પરવાનગી જરૂરી છે';

  @override
  String get permissionPhotosOpenSettings => 'સેટિંગ્સ';

  @override
  String permissionFailedSnack(String error) {
    return 'પરવાનગી વિનંતી નિષ્ફળ: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet આર્કિટેક્ચર • સ્ટોર-એન્ડ-ફોરવર્ડ મલ્ટી-હોપ';

  @override
  String get onboardingSkip => 'છોડો';

  @override
  String get onboardingNext => 'આગળ';

  @override
  String get onboardingStart => 'પ્રારંભ કરો';

  @override
  String get onboardingWelcomeTitle => 'ResilNet માં સ્વાગત છે';

  @override
  String get onboardingWelcomeBody =>
      'મેશ નેટવર્ક પર ResilNet પર ચેટ કરો — ઇન્ટરનેટ વિના પણ';

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
  String get onboardingChannelsTitle => 'એન્ક્રિપ્ટેડ ચેટ + નજીકની ચેનલો';

  @override
  String get onboardingChannelsBody =>
      'નજીકના સાથીદારોને શોધવા માટે #mesh / વિસ્તાર (geohash) સ્વિચ કરો — સંદેશાઓ BLE મેશ અને Nostr પર E2EE રહે છે';

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
  String get chatTitle => 'ચેટ (E2EE)';

  @override
  String get chatScanTooltip => 'પીઅર ઉમેરવા માટે QR સ્કેન કરો';

  @override
  String get chatBlockTooltip => 'આ મોકલનારને અવરોધિત કરો';

  @override
  String get chatBlockedSnack => 'અવરોધિત: કોઈ સૂચના નથી / કોઈ રિલે નથી';

  @override
  String get chatAliasTooltip => 'ઉપનામ સેટ કરો';

  @override
  String get chatReceiverPemLabel => 'પ્રાપ્તકર્તા સાર્વજનિક કી (PEM)';

  @override
  String get chatReceiverPemHint =>
      'તમારા મિત્રની સાર્વજનિક કી પેસ્ટ કરો (QR / શેર કરેલી ફાઇલમાંથી)';

  @override
  String get chatNeedPeerKey =>
      'પહેલા આ પીઅરનો QR સ્કેન કરો (ચકાસાયેલ જાહેર કી જરૂરી છે)';

  @override
  String get chatPeerKeyMismatch =>
      'સંગ્રહિત જાહેર કી આ પીઅર આઈડી સાથે મેળ ખાતી નથી';

  @override
  String chatVoiceFailed(String error) {
    return 'ઑડિયો રેકોર્ડ કરી શકાયો નથી: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'વૉઇસ નોંધ ચલાવી શકાઈ નથી: $error';
  }

  @override
  String get chatPlayVoice => 'વૉઇસ નોંધ ચલાવો';

  @override
  String get chatPauseVoice => 'વિરામ';

  @override
  String get chatVoiceLabelSent => '🎤 વૉઇસ નોટ (સીલ કરેલી)';

  @override
  String get chatVoiceLabel => '🎤 વૉઇસ નોટ';

  @override
  String get chatDecryptFailed => '[ડિક્રિપ્શન નિષ્ફળ]';

  @override
  String chatSentSealed(String preview) {
    return '[સીલ કરેલ • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[સીલ કરેલ]';

  @override
  String get chatComposeHint => 'સંદેશ લખો... (મોકલવા પર સીલ કરેલ)';

  @override
  String get chatEmptyThread =>
      'હજુ સુધી કોઈ સંદેશા નથી\nમેશ ઉપર મોકલવા માટે નીચે લખો';

  @override
  String chatLoadFailed(String error) {
    return 'વાતચીત લોડ કરી શકાઈ નથી: $error';
  }

  @override
  String get chatEmojiTooltip => 'ઇમોજી';

  @override
  String get statusPending => 'બાકી છે';

  @override
  String get statusSent => 'મોકલેલ';

  @override
  String get statusRelayed => 'રિલેડ';

  @override
  String get statusDelivered => 'વિતરિત';

  @override
  String get statusRead => 'વાંચો';

  @override
  String get statusFailed => 'નિષ્ફળ';

  @override
  String get chatCopy => 'નકલ કરો';

  @override
  String get chatDeleteLocal => 'આ ઉપકરણ પર કાઢી નાખો';

  @override
  String get chatDeletedLocalSnack => 'આ ઉપકરણ પરથી કાઢી નાખ્યું';

  @override
  String get chatRetry => 'ફરી પ્રયાસ કરો';

  @override
  String get chatSendFailed => 'વિતરિત નથી — ફરીથી પ્રયાસ કરો પર ટેપ કરો';

  @override
  String get chatImageNeedInternet => 'છબીઓ મોકલવા માટે ઇન્ટરનેટથી કનેક્ટ કરો';

  @override
  String get chatImageTooLargeOnline =>
      'મોકલવા માટે પૂરતી છબી સંકુચિત કરી શકાઈ નથી';

  @override
  String get chatOpenLinkFailed => 'લિંક ખોલી શકાઈ નથી';

  @override
  String get identityTitle => 'ઓળખ';

  @override
  String get identityScanTooltip => 'કેમેરા વડે QR સ્કેન કરો';

  @override
  String get identityCopiedHash => 'સાર્વજનિક કી હેશ કૉપિ કરી';

  @override
  String get identityPeerSaved => 'પીઅર QR માંથી સાચવેલ';

  @override
  String get identityGalleryDenied => 'ફોટો લાઇબ્રેરીની પરવાનગી નકારી';

  @override
  String get identityQrSaved => 'QR ફોટો લાઇબ્રેરીમાં સાચવેલ';

  @override
  String identityQrSaveFailed(String error) {
    return 'QR સાચવી શકાયું નથી: $error';
  }

  @override
  String get peersTitle => 'નેટવર્ક સભ્યો';

  @override
  String get qrScanTitle => 'મિત્રને ઉમેરવા માટે QR સ્કેન કરો';

  @override
  String get qrInvalid => 'સ્કેન નિષ્ફળ થયું: અમાન્ય QR';

  @override
  String get qrIdKeyMismatch =>
      'QR નકારવામાં આવ્યું: id સાર્વજનિક કી સાથે મેળ ખાતી નથી';

  @override
  String get qrCameraNotReady => 'કેમેરા તૈયાર નથી';

  @override
  String get qrRetrySettings => 'ફરીથી પ્રયાસ કરો / સેટિંગ્સ ખોલો';

  @override
  String qrCameraOpenFailed(String error) {
    return 'કૅમેરો ખોલી શકાયો નથી: $error';
  }

  @override
  String get qrScanAlignHint => 'ફ્રેમની અંદર QR કોડને સંરેખિત કરો';

  @override
  String get firmwareDownloadTitle => 'ESP32 ફર્મવેર ડાઉનલોડ કરો';

  @override
  String get firmwareSourceOnline => 'નવીનતમ (ઓનલાઈન)';

  @override
  String get firmwareSourceCached => 'સાચવેલી નકલ (ઑફલાઇન)';

  @override
  String get firmwareSourceBaseline => 'બંડલ કરેલ બેઝલાઇન (ઓફલાઇન)';

  @override
  String get firmwareSourceUnavailable => 'કોઈ ફર્મવેર ઉપલબ્ધ નથી';

  @override
  String get firmwareBaselineIncompatible =>
      'બંડલ કરેલ ફર્મવેર ખૂબ જૂનું છે — નવું સંસ્કરણ ડાઉનલોડ કરવા માટે ઇન્ટરનેટથી કનેક્ટ કરો';

  @override
  String get firmwareChecksumFailed =>
      'ફર્મવેર અખંડિતતા તપાસમાં નિષ્ફળ થયું — ફ્લેશિંગ અવરોધિત';

  @override
  String firmwareReadyFromSource(String source) {
    return 'ફર્મવેર તૈયાર: $source';
  }

  @override
  String get peersRefreshTooltip => 'તાજું કરો';

  @override
  String get peersBlocked => 'અવરોધિત';

  @override
  String get peersNearbyBle => 'નજીકમાં (BLE)';

  @override
  String get peersRecentlyOnline => 'તાજેતરમાં ઓનલાઈન';

  @override
  String get peersOnlineInArea => 'વિસ્તારમાં ઓનલાઇન';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return '$minutes મિનિટ પહેલાં જોયું';
  }

  @override
  String get peersOffline => 'ઑફલાઇન';

  @override
  String peersBlockedSnack(String id) {
    return 'અવરોધિત $id';
  }

  @override
  String get peersUnblockedSnack => 'અનાવરોધિત';

  @override
  String get peersEmpty =>
      'ડેટાબેઝમાં હજુ સુધી કોઈ સભ્યો નથી\nQR સ્કેન કરો અથવા BLE મેશ શોધની રાહ જુઓ';

  @override
  String get peersOpenChat => 'ચેટ ખોલો';

  @override
  String get peersBlockAction => 'બ્લોક';

  @override
  String get peersUnblockAction => 'અનાવરોધિત કરો';

  @override
  String get channelPickerTooltip => 'ચેટ / #mesh / વિસ્તાર';

  @override
  String get locationPickerTooltip => 'સ્થાન ચેનલ';

  @override
  String get transportPickerTooltip => 'મેશ / ઇન્ટરનેટ / ઓટો';

  @override
  String get onlinePeopleTooltip => 'લોકો ઓનલાઇન';

  @override
  String get unreadDirectsTooltipEmpty => 'ખાનગી સંદેશાઓ';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count વાંચ્યા વગરના ખાનગી સંદેશાઓ';
  }

  @override
  String get onlinePeopleTitle => 'લોકો';

  @override
  String get onlinePeopleEmpty => 'અહીં હજુ સુધી કોઈ ઓનલાઈન નથી';

  @override
  String onlinePeopleCount(int count) {
    return '$count ઑનલાઇન';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · નજીકના + વિસ્તાર';

  @override
  String get peerOnlineMeshTitle => 'જાળી પર નજીકમાં કોઈ';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name મેશ પર નજીકમાં છે';
  }

  @override
  String get peerOnlineAreaTitle => 'વિસ્તારમાં કોઈ ઑનલાઇન';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name Nostr દ્વારા ઑનલાઇન છે';
  }

  @override
  String get locationSheetTitle => '#સ્થાન ચેનલો';

  @override
  String get channelPinsTitle => 'પિન કરેલ';

  @override
  String get channelPinsHint =>
      'તમે વારંવાર ઉપયોગ કરો છો તે ચેનલોને પિન કરો — તે ટોચ પર રહે છે';

  @override
  String get channelPinTooltip => 'આ ચેનલને પિન કરો';

  @override
  String get channelUnpinTooltip => 'અનપિન કરો';

  @override
  String get locationSheetIntro =>
      'બરછટ જીઓહાશનો ઉપયોગ કરીને નજીકના લોકો સાથે ચેટ કરો — ચોક્કસ GPS નહીં. ઇન્ટરનેટ પર હાજરી અનામી Nostr કીનો ઉપયોગ કરે છે.';

  @override
  String get locationMeshSubtitle => '#bluetooth • ~10–50 મી';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => 'ટેલિપોર્ટ';

  @override
  String homeComposeHint(String channel) {
    return 'સંદેશ $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return '$channel ને મોકલો — સાર્વજનિક';
  }

  @override
  String get messageExpiryTitle => 'માં સમાપ્ત થાય છે';

  @override
  String get voiceRecordTapToStart => 'વૉઇસ સંદેશ રેકોર્ડ કરવા માટે ટૅપ કરો';

  @override
  String get voiceRecordTooShort => 'ખૂબ જ ટૂંકું રેકોર્ડિંગ — ફરી પ્રયાસ કરો';

  @override
  String get voiceRecordFailed =>
      'રેકોર્ડિંગ સાચવી શકાયું નથી — ફરી પ્રયાસ કરો';

  @override
  String get voicePttHold => 'રેકોર્ડ કરવા માટે પકડી રાખો';

  @override
  String get voicePttRelease => 'પૂર્વાવલોકન માટે છોડો';

  @override
  String get voicePttRecording => 'રેકોર્ડિંગ...';

  @override
  String get voicePttDraftReady => 'વૉઇસ નોટ તૈયાર છે';

  @override
  String get voicePttDiscard => 'કાઢી નાખો';

  @override
  String get voicePttReRecord => 'ફરીથી રેકોર્ડ કરો';

  @override
  String get voicePttSend => 'વૉઇસ નોટ મોકલો';

  @override
  String get voicePttPlayPreview => 'પૂર્વાવલોકન ચલાવો';

  @override
  String get voicePttStopPreview => 'પૂર્વાવલોકન બંધ કરો';

  @override
  String get noticesBackfilling => 'સૂચનાઓ લોડ કરી રહ્યું છે...';

  @override
  String get noticesNostrOnline => 'Nostr ઑનલાઇન';

  @override
  String get noticesNostrOffline =>
      'Nostr ઑફલાઇન — બુલેટિનને ઇન્ટરનેટની જરૂર છે';

  @override
  String noticesBackfillLoaded(int count) {
    return '$count નોટિસ લોડ કરી';
  }

  @override
  String get noticePublishFailed =>
      'એરિયા બોર્ડને નોટિસ પ્રકાશિત કરી શકાઈ નથી. Nostr કનેક્શન તપાસો.';

  @override
  String get noticeMeshPublishNoLink =>
      'સ્થાનિક રીતે સાચવેલ. નજીકના મેશ રેડિયો (અથવા Wi‑Fi ગેટવે) સાથે કનેક્ટ કરો જેથી કરીને અન્ય લોકો તેને પ્રાપ્ત કરી શકે.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'BLE પર $count નજીકના ઉપકરણ(ઓ) પર બુલેટિન મોકલવામાં આવ્યું.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'નજીકના રેડિયો જોયા, પરંતુ BLE લખવાનું નિષ્ફળ થયું. નોટિસ સ્ક્રીન પર બંને એપને ખુલ્લી રાખો અને ફરી પ્રયાસ કરો (અથવા ESP32 રિલેનો ઉપયોગ કરો).';

  @override
  String get noticeMeshPublishNoGatt =>
      'આ ઉપકરણનું BLE રીસીવર તૈયાર નથી. બ્લૂટૂથ ટૉગલ કરો અને નોટિસ ફરીથી ખોલો.';

  @override
  String get noticeDelete => 'નોટિસ કાઢી નાખો';

  @override
  String get noticeDeleteConfirmTitle => 'આ સૂચના કાઢી નાખીએ?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'આ ફક્ત આ ઉપકરણ પર જ તેને દૂર કરે છે. અન્ય જેમણે તેને પહેલેથી જ પ્રાપ્ત કર્યું છે તેઓ હજુ પણ તેને જોશે.';

  @override
  String get noticeDeleted => 'નોટિસ કાઢી નાખી';

  @override
  String get chatNoticeHidden => 'વિસ્તાર સૂચના - ખુલ્લી સૂચનાઓ';

  @override
  String get identityDisplayNameTitle => 'ડિસ્પ્લે નામ';

  @override
  String get identitySaveName => 'નામ સાચવો';

  @override
  String get identityUserIdLabel => 'વપરાશકર્તા ID (પબ્લિક કી હેશ)';

  @override
  String get identityCopyHashTooltip => 'સાર્વજનિક કી હેશની નકલ કરો';

  @override
  String get identityMyQrTitle => 'મારો QR (id + pubKey + નામ)';

  @override
  String identityQrFailed(String error) {
    return 'QR બનાવી શકાયું નથી\n$error';
  }

  @override
  String get identitySaving => 'સાચવી રહ્યું છે...';

  @override
  String get identitySaveQr => 'ફોટો લાઇબ્રેરીમાં QR સાચવો';

  @override
  String get identityOpenScanner => 'QR સ્કેન કરવા માટે કૅમેરો ખોલો';

  @override
  String get identityQrHelp =>
      'તમારી સાર્વજનિક કીને સાચવવા માટે કોઈ મિત્રને આ સ્કેન કરવા કહો અને (જો જરૂરી હોય તો) તમને ચકાસાયેલ રજૂકર્તા તરીકે સેટ કરો';

  @override
  String get identityChatTip =>
      'ટીપ: તમે E2EE માટે સાર્વજનિક કી ઉમેરવા માટે ચેટમાં QR પણ સ્કેન કરી શકો છો';

  @override
  String get infoOpen => 'વિશે / માહિતી';

  @override
  String get docsGuideTitle => 'વપરાશકર્તા માર્ગદર્શિકા';

  @override
  String get docsGuideSubtitle => 'બ્રાઉઝરમાં ખુલે છે';

  @override
  String get docsOpenAction => 'માર્ગદર્શિકા ખોલો';

  @override
  String get docsOpenFailed => 'વપરાશકર્તા માર્ગદર્શિકા ખોલી શકાઈ નથી';

  @override
  String get firmwareOtaGuideTitle => 'ફ્લેશ માર્ગદર્શિકા અને OTA પ્રોટોકોલ';

  @override
  String get firmwareOtaGuideSubtitle =>
      'વેબ માર્ગદર્શિકા ખોલે છે — .bin ડાઉનલોડ્સ અને સંપૂર્ણ પગલાં';

  @override
  String get firmwareWebDownloadsTitle => 'વેબ પર ફર્મવેર ડાઉનલોડ';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'દસ્તાવેજ સાઇટ પર પ્રતિ-સંસ્કરણ લિંક્સ અને ચેકસમ';

  @override
  String get inviteCopyShortLink => 'ટૂંકી લિંક કૉપિ કરો';

  @override
  String get inviteShareLink => 'લિંક શેર કરો';

  @override
  String get inviteShowFullLink => 'સંપૂર્ણ લિંક';

  @override
  String get inviteCopyFullLink => 'સંપૂર્ણ લિંક કૉપિ કરો';

  @override
  String get inviteLinkCopied => 'લિંક કૉપિ કરી';

  @override
  String get inviteLongPressHint => 'લિંક ક્રિયાઓ માટે લાંબા સમય સુધી દબાવો';

  @override
  String get inviteSendInChat => 'ResilNet ચેટમાં મોકલો...';

  @override
  String get inviteSendInChatHint =>
      'ફક્ત તે જ લોકો કે જેના માટે તમારી પાસે પહેલાથી જ સાર્વજનિક કી છે';

  @override
  String get inviteSendInChatEmpty =>
      'હજુ સુધી કોઈ સંદેશાયોગ્ય ચેટ્સ નથી.\nક્યૂઆર સ્કેન કરો, એરિયા/મેશ ખોલો અથવા પહેલા એપની બહાર લિંક શેર કરો.';

  @override
  String get inviteSentToChat => 'ચેટમાં આમંત્રણ મોકલ્યું';

  @override
  String get infoTabInfo => 'માહિતી';

  @override
  String get infoTabSettingsHint =>
      'ભાષા, E2EE અને ડેટા ટૂલ્સ માટે મેનૂમાંથી સેટિંગ્સ ખોલો';

  @override
  String get infoHowToTitle => 'કેવી રીતે ઉપયોગ કરવો';

  @override
  String get infoHowToBody =>
      '• Chat / #mesh / Area પર સ્વિચ કરવા માટે ચેનલ આયકનને ટેપ કરો\n• જીઓહાશ કદ પસંદ કરવા માટે સ્થળને ટેપ કરો\n• સભ્યો માટે અથવા જેઓ ઑનલાઇન છે તેમને ટેપ કરો\n• રૂબરૂમાં કીની આપલે કરવા માટે ⋮ થી ઓળખ/QR ખોલો\n• વિસ્તાર \"જાહેર\" દરેક ઓનલાઈન પીઅરને સીલબંધ E2EE મોકલે છે — સાદા ટેક્સ્ટ રૂમને નહીં';

  @override
  String get infoFeaturesTitle => 'લક્ષણો';

  @override
  String get infoFeatureOffline => 'બ્લૂટૂથ લો એનર્જી દ્વારા ઑફલાઇન મેસેજિંગ';

  @override
  String get infoFeatureE2ee =>
      'RSA-OAEP + AES-GCM (નોઈઝ નહીં) સાથે એન્ડ-ટુ-એન્ડ એન્ક્રિપ્શન';

  @override
  String get infoFeatureMultihop =>
      'વધુ દૂર જવા માટે નજીકના સાથીદારો દ્વારા સંદેશાઓ મોકલી શકાય છે';

  @override
  String get infoFeatureBridge =>
      'સીલબંધ પરબિડીયાઓ માટે હાઇબ્રિડ મેશ ↔ ઇન્ટરનેટ (Nostr).';

  @override
  String get infoFeatureGeo =>
      'નજીકના લોકો માટે સ્થાનિક જીઓહશ ચેનલ્સ (ડિસ્કવરી UX)';

  @override
  String get infoFeatureNotices =>
      '#mesh અને વિસ્તાર માટે સમાપ્તિ સાથેની સૂચનાઓ';

  @override
  String get infoPrivacyTitle => 'ગોપનીયતા';

  @override
  String get infoPrivacyNoRoom =>
      'વાયર પર કોઈ સાદા લખાણ ગામ / જાહેર ચેટ રૂમ નથી';

  @override
  String get infoPrivacyFanout =>
      'વિસ્તાર મોકલો = સીલ કરેલ 1:1 જાણીતી સાર્વજનિક કી સાથે સાથીદારોને ફેન-આઉટ';

  @override
  String get infoPrivacyPresence =>
      'ઇન્ટરનેટ વિસ્તારની હાજરી ક્ષણિક Nostr કીનો ઉપયોગ કરે છે';

  @override
  String get infoSymbolsTitle => 'પ્રતીકો';

  @override
  String get infoSymBle => 'ડાયરેક્ટ બ્લૂટૂથ લિંક';

  @override
  String get infoSymMesh => 'મેશ દ્વારા પહોંચી શકાય છે (અન્ય આગળ)';

  @override
  String get infoSymInternet => 'ઇન્ટરનેટ દ્વારા (Nostr) — સીલબંધ એન્વલપ્સ';

  @override
  String get infoSymBridge => 'મેશ↔ઇન્ટરનેટ બ્રિજ પાથ દ્વારા પહોંચ્યા';

  @override
  String get infoSymOffline => 'ઑફલાઇન — અત્યારે પહોંચી શકાય તેમ નથી';

  @override
  String get infoSymInArea => 'આ સ્થાન ચેનલના વિસ્તારમાં';

  @override
  String get infoSymE2eeOk => 'એન્ડ-ટુ-એન્ડ એન્ક્રિપ્ટેડ સત્ર';

  @override
  String get infoSymE2eeFail =>
      'એન્ક્રિપ્શન અનુપલબ્ધ — સંવેદનશીલ ટેક્સ્ટ મોકલશો નહીં';

  @override
  String get infoSymVerified => 'ઓળખ ચકાસાયેલ / જાણીતી કી';

  @override
  String get infoSymBlocked => 'અવરોધિત';

  @override
  String get infoSymUnread => 'વાંચ્યા વગરનો ખાનગી સંદેશ';

  @override
  String get infoEmergencyTitle => 'કટોકટી મોડ';

  @override
  String get infoEmergencyBody =>
      'આ ઉપકરણ પર સંદેશાઓ, કી અને ઓળખને સાફ કરવા માટે હોમ સ્ક્રીન પર ResilNet શીર્ષકને ટ્રિપલ-ટેપ કરો.';

  @override
  String get infoLegendNote =>
      'સ્પષ્ટતા માટે કેટલાક પાથ ચિહ્નો અહીં દસ્તાવેજીકૃત કરવામાં આવ્યા છે; ચેટમાં ડિલિવરી ટિક પ્રાથમિક મોકલવાની સ્થિતિ રહે છે.';

  @override
  String get dangerZoneTitle => 'ડેન્જર ઝોન';

  @override
  String get dangerZoneSubtitle =>
      'આ ઉપકરણ પરથી સંદેશાઓ, એન્ક્રિપ્શન કી, Nostr ઓળખ, સાથીદારો અને ઉપનામો કાઢી નાખે છે. તમે ફરીથી સેટ કરશો.';

  @override
  String get panicWipeTitle => 'કટોકટી સાફ';

  @override
  String get panicWipeSubtitle =>
      'બધું સ્થાનિક ભૂંસી નાખો — હોમ શીર્ષકને ટ્રિપલ-ટેપ કરવા જેવું જ (બે વાર ટેપ રેડિયોને તાજું કરે છે)';

  @override
  String get panicWipeConfirmTitle => 'બધો સ્થાનિક ડેટા સાફ કરીએ?';

  @override
  String get panicWipeConfirmBody =>
      'આ આ ફોન પરની ચેટ, કી અને ઓળખને કાયમ માટે ડિલીટ કરે છે.\nસાથીઓએ તમારી નવી ઓળખ સાથે QR કીની ફરીથી આપલે કરવી આવશ્યક છે.\nઆ પૂર્વવત્ કરી શકાતું નથી.';

  @override
  String get panicWipeAction => 'બધું સાફ કરો';

  @override
  String get panicWipeSnack => 'સ્થાનિક ઓળખ લૂછી — ફરીથી સેટ કરો';

  @override
  String panicWipeFailed(String error) {
    return 'સાફ કરવું નિષ્ફળ થયું: $error';
  }

  @override
  String get meshBridgeTitle => 'જાળીદાર પુલ';

  @override
  String get meshBridgeSubtitle =>
      'જ્યારે ચાલુ હોય (ડિફૉલ્ટ), ત્યારે સીલબંધ પરબિડીયાઓમાં BLE મેશ અને ઈન્ટરનેટ (Nostr) બંનેનો એકસાથે ઉપયોગ થઈ શકે છે જેથી નજીકના જાળીદાર ટાપુઓ કનેક્ટ થઈ શકે. જ્યારે બંધ હોય, ત્યારે મોકલે છે માત્ર એક પાથનો ઉપયોગ કરો — વાયર પર સાદો લખાણ ક્યારેય મૂકતું નથી.';

  @override
  String get favoritesTitle => 'મનપસંદ';

  @override
  String get favoritesAdd => 'મનપસંદમાં ઉમેરો';

  @override
  String get favoritesRemove => 'મનપસંદમાંથી દૂર કરો';

  @override
  String get favoritesEmpty =>
      'હજી સુધી કોઈ મનપસંદ નથી — સભ્ય સૂચિમાંથી પીઅરને સ્ટાર આપો';

  @override
  String get favoritesNearbyTitle => 'નજીકના મનપસંદ';

  @override
  String favoritesNearbyBody(String name) {
    return '$name મેશ પર નજીકમાં છે';
  }

  @override
  String get favoritesInAreaTitle => 'વિસ્તારમાં પ્રિય';

  @override
  String favoritesInAreaBody(String name) {
    return '$name આ વિસ્તારમાં ઑનલાઇન છે';
  }

  @override
  String get topologyTitle => 'મેશ ટોપોલોજી';

  @override
  String get topologySubtitle =>
      'મેશથી પીઅર અને કનેક્શન સંકેતો જાહેર કરે છે (ફક્ત વાંચવા માટે)';

  @override
  String get topologyConnectedNow => 'હવે કનેક્ટેડ છે (BLE)';

  @override
  String get topologyNearby => 'નજીકમાં (BLE)';

  @override
  String get topologyKnown => 'જાણીતા સાથીદારો';

  @override
  String get topologyEmpty =>
      'હજી સુધી કોઈ સાથીદારો શીખ્યા નથી — BLE ચાલુ રાખીને નજીકમાં રહો';

  @override
  String get topologyYou => 'તમે';

  @override
  String topologyStats(int peers, int links) {
    return '$peers સાથીદારો · $links લિંક્સ';
  }

  @override
  String get topologyGraphHint =>
      'નજીકના મેશ શોધ પરથી અંદાજિત — તમારું ઉપકરણ હાઇલાઇટ થયેલ છે. ચેટ ખોલવા માટે પીઅરને ટેપ કરો.';

  @override
  String get topologyOpen => 'મેશ ટોપોલોજી';

  @override
  String get slashHelpTitle => 'આદેશો';

  @override
  String get slashHelpBody =>
      '/help — આ યાદી\n/કોણ — વર્તમાન ચેનલમાં લોકો ઓનલાઇન\n/ડ્રોપ <text> — અહીં સીલબંધ નોટિસ પિન કરો (E2EE ફેન-આઉટ)\n\nસંપૂર્ણ માર્ગદર્શિકા: નીચે ખોલો માર્ગદર્શિકા અથવા સેટિંગ્સ → વપરાશકર્તા માર્ગદર્શિકાનો ઉપયોગ કરો.';

  @override
  String get slashWhoEmpty => 'આ ચેનલમાં અત્યારે કોઈ ઓનલાઈન નથી';

  @override
  String slashWhoTitle(int count) {
    return 'ઑનલાઇન ($count)';
  }

  @override
  String get slashDropNeedText => 'ઉપયોગ: /તમારી નોંધ લખાણ છોડો';

  @override
  String slashDropDone(String channel) {
    return '$channel પર નોટિસ છોડી દીધી';
  }

  @override
  String get slashUnknown => 'અજ્ઞાત આદેશ. /help નો પ્રયત્ન કરો';

  @override
  String get announceOpen => 'ઘોષણાઓ';

  @override
  String get announceTitle => 'ઘોષણાઓ';

  @override
  String get announceEmpty =>
      'હજી સુધી કોઈ બોર્ડ નથી — લૉક અથવા ઓપન નોટિસ પોસ્ટ કરવા માટે એક બનાવો';

  @override
  String get announceCreate => 'બોર્ડ બનાવો';

  @override
  String get announceCreateHint => 'બોર્ડનું નામ';

  @override
  String get announceDefaultTitle => 'સમુદાય બોર્ડ';

  @override
  String get announceSettings => 'બોર્ડ સેટિંગ્સ';

  @override
  String get announceAllowLocked =>
      'લૉક કરેલી (એનક્રિપ્ટેડ) પોસ્ટ્સને મંજૂરી આપો';

  @override
  String get announceAllowLockedSub =>
      'બોર્ડ કી પર એન્ક્રિપ્ટેડ — વાચકોને ઍક્સેસની જરૂર છે';

  @override
  String get announceAllowOpen => 'ઓપન (સાદા લખાણ) પોસ્ટ્સને મંજૂરી આપો';

  @override
  String get announceAllowOpenSub =>
      'E2EE નથી — મેશ/રિલે પર વાંચી શકાય છે. મૂળભૂત રીતે બંધ.';

  @override
  String get announceComposeHint => 'એક જાહેરાત લખો...';

  @override
  String get announceMediaInternetOnly =>
      'ફોટો/વૉઇસ ઘોષણાઓ ઇન્ટરનેટ પર મોકલવામાં આવે છે (BLE નહીં)';

  @override
  String get announceNeedInternet =>
      'ફોટો અથવા વૉઇસ ઘોષણાઓ મોકલવા માટે ઇન્ટરનેટથી કનેક્ટ કરો';

  @override
  String announceVoiceFailed(String error) {
    return 'અવાજ રેકોર્ડ કરી શકાયો નથી: $error';
  }

  @override
  String get announceImageTooLarge => 'છબી ખૂબ મોટી છે (મહત્તમ ~180 KB)';

  @override
  String get announcePlayVoice => 'વૉઇસ નોંધ ચલાવો';

  @override
  String get announceImageLabel => '📷 છબી';

  @override
  String get announceAudioLabel => '🎤 વૉઇસ નોટ';

  @override
  String get announceModeLocked => 'તાળું મારેલું';

  @override
  String get announceModeOpen => 'ખોલો';

  @override
  String get announceOpenBadge => 'OPEN · એન્ક્રિપ્ટેડ નથી';

  @override
  String get announceLockedBadge => 'તાળું મારેલું';

  @override
  String get announceLockedPlaceholder =>
      'એન્ક્રિપ્ટેડ — વાંચવા માટે ઍક્સેસની વિનંતી કરો';

  @override
  String get announceRequestAccess => 'ઍક્સેસની વિનંતી કરો';

  @override
  String get announceRequestSent => 'બોર્ડ માલિકને ઍક્સેસ વિનંતી મોકલવામાં આવી';

  @override
  String get announceRequestFailed =>
      'ઍક્સેસની વિનંતી કરી શકાઈ નથી (માલિકની સાર્વજનિક કીની જરૂર છે)';

  @override
  String get announceOpenConfirmTitle => 'એન્ક્રિપ્શન વિના પોસ્ટ કરીએ?';

  @override
  String get announceOpenConfirmBody =>
      'ઓપન પોસ્ટ્સ E2EE નથી. પાથ પરના કોઈપણ (મેશ/રિલે) તેમને વાંચી શકે છે. ચાલુ રાખીએ?';

  @override
  String get announcePostAction => 'પોસ્ટ';

  @override
  String get announcePendingRequests => 'ઍક્સેસ વિનંતીઓ';

  @override
  String get announceApprove => 'મંજૂર';

  @override
  String get announceDeny => 'નામંજૂર કરો';

  @override
  String get announceGranted => 'તમે આ બોર્ડ પર લૉક કરેલી પોસ્ટ્સ વાંચી શકો છો';

  @override
  String get announceOwner => 'તમે આ બોર્ડના માલિક છો';

  @override
  String get announceCopyInvite => 'આમંત્રણ ટેક્સ્ટ કૉપિ કરો';

  @override
  String get announceShowInviteQr => 'આમંત્રણ QR બતાવો';

  @override
  String get announceScanInviteQr => 'સ્કેન બોર્ડ આમંત્રણ QR';

  @override
  String get announceFollow => 'આમંત્રણમાંથી બોર્ડને અનુસરો';

  @override
  String get announceFollowHint =>
      'માલિક તરફથી આમંત્રણ ટેક્સ્ટ અથવા ResilNet લિંક પેસ્ટ કરો';

  @override
  String get announceFollowOk => 'નીચેના બોર્ડ';

  @override
  String announceFollowOkNamed(String title) {
    return 'હવે “$title” ને અનુસરી રહ્યું છે';
  }

  @override
  String get announceFollowFail => 'આમંત્રણ અમાન્ય અથવા ક્ષતિગ્રસ્ત છે';

  @override
  String get announceInviteCopied => 'આમંત્રિત ટેક્સ્ટની નકલ કરી';

  @override
  String get announceInviteSaveQr => 'QR સાચવો';

  @override
  String get announceInviteShare => 'આમંત્રણ શેર કરો';

  @override
  String get announceFollowFromCompose =>
      'સંદેશ બોક્સમાં બોર્ડનું આમંત્રણ મળ્યું';

  @override
  String get peerConfirmAddTitle => 'નેટવર્ક સભ્યને ઉમેરીએ?';

  @override
  String peerConfirmAddBody(String name) {
    return 'તેમની સાર્વજનિક કી સાથે “$name” ઉમેરો જેથી કરીને તમે તેમને ખાનગી રીતે સંદેશ આપી શકો?';
  }

  @override
  String get peerConfirmAdd => 'સભ્ય ઉમેરો';

  @override
  String peerAddedOk(String name) {
    return 'નેટવર્ક સભ્યોમાં $name ઉમેર્યું';
  }

  @override
  String get peerAddFromCompose => 'સંદેશ બોક્સમાં ઓળખ / સાર્વજનિક કી મળી';

  @override
  String get peerHashCopied => 'સાર્વજનિક કી હેશ કૉપિ કરી';

  @override
  String get peerHashOpenChat => 'ચેટ ખોલો';

  @override
  String get peerHashAddHint =>
      'હેશ કૉપિ કર્યું. તેમને તેમની ઓળખ લિંક અથવા QR શેર કરવા માટે કહો જેથી કરીને તમે E2EE માટે સંપૂર્ણ સાર્વજનિક કી ઉમેરી શકો.';

  @override
  String get peerQrNoCode => 'આ છબીમાં કોઈ ResilNet QR મળ્યો નથી';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet ઓળખ: “$name”\nલિંક ખોલો અથવા તેને ચેટમાં પેસ્ટ કરો → સભ્ય ઉમેરો\nઅથવા ઓળખ QR સ્કેન કરો.';
  }

  @override
  String get identityShareInvite => 'ઓળખ લિંક શેર કરો';

  @override
  String get identityInviteCopied => 'ઓળખ લિંક કૉપિ કરી';

  @override
  String announceInviteSharePreamble(String title) {
    return 'બોર્ડનું આમંત્રણ: “$title”\nResilNet → સમુદાય બોર્ડ ખોલો → આમંત્રણમાંથી અનુસરો\nઅથવા QR સ્કેન કરો / નીચેની લિંકને ટેપ કરો.';
  }

  @override
  String get announceConfirmFollowTitle => 'આ બોર્ડને અનુસરો?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'આ આમંત્રણમાંથી “$title”ને ફૉલો કરીએ?';
  }

  @override
  String get announceConfirmFollow => 'અનુસરો';
}

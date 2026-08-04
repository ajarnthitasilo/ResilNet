// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'Atualizando ResilNet...';

  @override
  String get appRefreshed => 'Atualizado – rádios e descoberta reiniciados';

  @override
  String appRefreshFailed(String error) {
    return 'Falha na atualização: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'Toque duplo = atualização suave. Pressão longa = recuperação difícil. Toque triplo = limpeza de emergência.';

  @override
  String get softRefreshTipTitle => 'Se ResilNet parecer preso';

  @override
  String get softRefreshTipBody =>
      'Toque duas vezes em ResilNet (canto superior esquerdo) para uma atualização suave do rádio. Se ainda estiver travado: mantenha pressionado o título, use ⋮ → Recuperação total ou Configurações. O toque triplo é apenas para limpeza de emergência.';

  @override
  String get softRefreshTipGotIt => 'Entendi';

  @override
  String get infoSoftRefreshTitle => 'Se o aplicativo parecer travado';

  @override
  String get infoSoftRefreshStepRefresh =>
      'Toque duas vezes em ResilNet (canto superior esquerdo) → atualização suave de rádios e pessoas próximas';

  @override
  String get infoSoftRefreshStepHard =>
      'Ainda preso? Pressione longamente o título ou ⋮ / Configurações → Recuperação total';

  @override
  String get infoSoftRefreshStepWait =>
      'Aguarde o resultado da barra de lanches e tente novamente. A redefinição da sessão mantém suas chaves.';

  @override
  String get infoSoftRefreshStepWipe =>
      'Toque triplo = limpeza de emergência (exclui dados locais) – somente se intencional';

  @override
  String get appRecoverySection => 'Recuperação de aplicativos';

  @override
  String get appRecoverySectionSubtitle =>
      'Use quando o aplicativo parecer congelado. Suave = título toque duas vezes. A recuperação difícil é mais forte. A redefinição da sessão reinicia os serviços sem limpar as chaves.';

  @override
  String get appHardRecoverAction => 'Recuperação difícil';

  @override
  String get appHardRecovering => 'Recuperação difícil…';

  @override
  String get appSessionResetAction => 'Redefinir sessão';

  @override
  String get appSessionResetRunning => 'Redefinindo sessão…';

  @override
  String get appSessionResetConfirmTitle => 'Redefinir sessão?';

  @override
  String get appSessionResetConfirmBody =>
      'Reinicia os serviços ResilNet neste dispositivo. Suas chaves de identidade são mantidas.';

  @override
  String get appRecoveryBusy => 'A recuperação já está em execução…';

  @override
  String get appRecoveryOk => 'Recuperação concluída';

  @override
  String get appRecoveryPartial =>
      'A recuperação foi concluída com algumas etapas ignoradas – tente novamente se ainda travar';

  @override
  String get appRecoveryFailed =>
      'Falha na recuperação – tente redefinir a sessão ou forçar o encerramento do aplicativo no sistema operacional';

  @override
  String get localWifiTitle => 'Local Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'Vincule dispositivos próximos sem internet — o mesmo que estar em uma LAN.';

  @override
  String get localWifiNotGatewayHint =>
      'Não o gateway ESP32 LoRa SoftAP. Este é apenas telefone↔telefone / LAN.';

  @override
  String get localWifiUnavailable =>
      'O local Wi‑Fi ainda não está pronto – aguarde a inicialização do aplicativo.';

  @override
  String get lxmfBridgeTitle => 'Nó inicial';

  @override
  String get lxmfBridgeSubtitle =>
      'Mac ou Pi opcional em seu Wi‑Fi que transmite bate-papos selados. Desativado por padrão. Não substitui a criptografia ponta a ponta.';

  @override
  String get lxmfBridgeEnable => 'Usar o nó inicial';

  @override
  String get lxmfBridgeDisabledHint =>
      'Ative somente quando o aplicativo bridge estiver sendo executado em um Mac ou Pi nesta rede.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'On-line — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'Não é possível acessar o nó inicial — $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'Endereço do nó inicial';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP ou http://IP:porta — exemplo 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'Peer → LXMF destino (JSON)';

  @override
  String get lxmfBridgeRefresh => 'Salvar e atualizar status';

  @override
  String get lxmfBridgeLabHint => 'Avançado: laboratórios/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'Configurações do nó inicial';

  @override
  String get lxmfBridgeCheckConnection => 'Verifique a conexão';

  @override
  String get lxmfBridgeStatusOnline => 'Conectado ao nó inicial';

  @override
  String get lxmfBridgeStatusOffline => 'Nó inicial não acessível';

  @override
  String get lxmfBridgeYourDest =>
      'O endereço deste nó (compartilhe com amigos)';

  @override
  String get lxmfBridgeCopyDest => 'Copiar endereço';

  @override
  String get lxmfBridgeDestCopied => 'Endereço copiado';

  @override
  String get lxmfBridgeLinkedPeers => 'Amigos vinculados';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'Cada amigo precisa do endereço do nó inicial uma vez. Então, os bate-papos fechados podem usar esse caminho.';

  @override
  String get lxmfBridgeNoLinks => 'Ainda não há amigos conectados.';

  @override
  String get lxmfBridgeAddLink => 'Vincular um amigo';

  @override
  String get lxmfBridgePickPeer => 'Amigo';

  @override
  String get lxmfBridgePeerDest => 'O endereço do nó inicial';

  @override
  String get lxmfBridgePeerDestHint =>
      'Código de 32 caracteres da tela do nó inicial';

  @override
  String get lxmfBridgeInvalidDest =>
      'Esse endereço não parece válido. Cole o código completo do nó inicial.';

  @override
  String get lxmfBridgeRemoveLink => 'Desvincular';

  @override
  String get lxmfBridgeSaveLink => 'Salvar';

  @override
  String get lxmfBridgeLinkSaved => 'Amigo vinculado';

  @override
  String get lxmfBridgeNoPeers =>
      'Ainda não há contatos para mensagens. Adicione um amigo primeiro.';

  @override
  String get lxmfBridgeHelp =>
      'Mantenha a ponte funcionando no Mac/Pi. Este caminho permanece na sua LAN — não é LoRa e não substitui a internet ou a malha Bluetooth.';

  @override
  String get localWifiModeHotspot => 'Próximo';

  @override
  String get localWifiModeRouter => 'Roteador';

  @override
  String get localWifiHotspotIntro =>
      'Um dispositivo compartilha um ponto de acesso pessoal. Outros ingressam nesse ponto de acesso e ResilNet os encontra na rede local.';

  @override
  String get localWifiHostAction => 'Criar rede (Host)';

  @override
  String get localWifiJoinAction => 'Junte-se à rede';

  @override
  String get localWifiHostSteps =>
      '1. Abra as configurações do iOS/Android e ative o Hotspot pessoal (ou compartilhamento de Internet).\n2. Diga aos amigos o nome (e a senha) do ponto de acesso.\n3. Volte aqui e toque em “Hotspot ativado – comece a esperar”.';

  @override
  String get localWifiHostReady => 'O hotspot está ativado – comece a esperar';

  @override
  String get localWifiHostWaiting => 'Esperando a adesão dos amigos…';

  @override
  String get localWifiJoinSteps =>
      '1. Abra as configurações do sistema e entre no ponto de acesso pessoal do seu amigo.\n2. Volte aqui e toque em “Estou conectado – pesquisar”.';

  @override
  String get localWifiJoinReady => 'Estou conectado - pesquise';

  @override
  String get localWifiRouterIntro =>
      'Conecte todos os dispositivos ao mesmo roteador/AP Wi‑Fi. O roteador não precisa de internet – apenas uma rede local compartilhada.';

  @override
  String get localWifiRouterSearch => 'Pesquise sobre isso Wi‑Fi';

  @override
  String get localWifiRefreshNetwork => 'Atualizar informações Wi‑Fi';

  @override
  String get localWifiRouterNoWifiTitle => 'Não em Wi‑Fi';

  @override
  String get localWifiRouterNoWifiBody =>
      'Junte-se ao Wi‑Fi do roteador nas configurações do sistema e pesquise novamente.';

  @override
  String get localWifiDiscovering => 'Pesquisando no local Wi‑Fi…';

  @override
  String get localWifiPeersFound => 'Dispositivos nesta rede';

  @override
  String get localWifiStop => 'Parar';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi nome indisponível';

  @override
  String get localWifiStubBanner => 'Aguardando soquete LAN…';

  @override
  String get localWifiLiveBanner =>
      'LAN Discovery Live (UDP) — anúncio + bate-papo selado sobre este Wi‑Fi';

  @override
  String get localWifiEmptyHotspot =>
      'Nenhum dispositivo ainda.\nVerifique se os amigos aderiram ao seu ponto de acesso e permitiram o acesso à rede local.';

  @override
  String get localWifiEmptyRouter =>
      'Nenhum dispositivo ainda.\nMesmo SSID? Rede local permitida? Alguns roteadores bloqueiam o tráfego entre dispositivos (isolamento de AP).';

  @override
  String get localWifiIsolationHelp => 'Por que não podemos nos encontrar?';

  @override
  String get localWifiIsolationTitle => 'Roteador pode isolar clientes';

  @override
  String get localWifiIsolationBody =>
      'Se o isolamento de AP/Cliente (ou uma rede de convidado) estiver ativado, os telefones no mesmo Wi‑Fi não poderão falar. Desligue o isolamento, use o SSID principal ou mude para o modo Próximo (Hotspot).';

  @override
  String get localWifiPeerReady => 'Pronto para conversar (tem chave)';

  @override
  String get localWifiPeerNeedKey =>
      'Encontrado – escaneie o QR para trocar chaves';

  @override
  String get localWifiErrorTitle => 'Erro local Wi‑Fi';

  @override
  String get localWifiErrorBody => 'Algo deu errado. Pare e tente novamente.';

  @override
  String get preparingSystem => 'Preparando sistema…';

  @override
  String get bootFailedTitle => 'Não foi possível iniciar';

  @override
  String get retry => 'Tente novamente';

  @override
  String get bootRecoveryAction =>
      'Iniciar nova identidade (apagar dados locais)';

  @override
  String get bootRecoveryConfirmTitle => 'Iniciar uma nova identidade?';

  @override
  String get bootRecoveryConfirmBody =>
      'Isso apagará permanentemente os bate-papos locais, as chaves e a identidade deste dispositivo.\nOs colegas devem escanear seu QR novamente com sua nova identidade.\nIsto não pode ser desfeito.';

  @override
  String get bootRecoveryRunning => 'Redefinindo a identidade local…';

  @override
  String get bootRecoverySuccess => 'Redefinição de identidade local concluída';

  @override
  String bootRecoveryFailed(String error) {
    return 'Não foi possível redefinir a identidade: $error';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Salvar';

  @override
  String get close => 'Fechar';

  @override
  String get start => 'Começar';

  @override
  String get send => 'Enviar';

  @override
  String get settings => 'Configurações';

  @override
  String get language => 'Linguagem';

  @override
  String get languageSubtitle =>
      'Por padrão, o aplicativo segue o idioma do seu telefone (quando compatível). Outras línguas voltam ao inglês. Você também pode bloquear um idioma aqui.';

  @override
  String get languageSystem => 'Padrão do sistema';

  @override
  String get languageThai => 'Tailandês';

  @override
  String get languageEnglish => 'Inglês';

  @override
  String get notificationsTooltip => 'Configurações de notificação';

  @override
  String get enableMessageNotifications => 'Ativar notificações de mensagens';

  @override
  String get settingsNotificationsSubtitle =>
      'Mensagens 1:1 e pessoas online (alertas locais)';

  @override
  String get networkMembersTooltip => 'Membros da rede';

  @override
  String get identityQrTooltip => 'Identidade / QR';

  @override
  String get feedDirects => 'Bater papo';

  @override
  String get feedMesh => 'Malha';

  @override
  String get feedGeo => 'Área';

  @override
  String get feedDirectsSubtitle => 'Mensagens E2EE privadas';

  @override
  String get feedMeshSubtitle => 'Pares próximos (BLE)';

  @override
  String get feedGeoSubtitle => 'Canal de descoberta Geohash';

  @override
  String get peerIdHint =>
      'Cole o ID do receptor (hash de chave pública) para iniciar um bate-papo';

  @override
  String get directsEmpty =>
      'Ainda não há bate-papo – escaneie um QR ou cole um ID do receptor para começar\nAs mensagens são seladas com E2EE antes do envio (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • toque para abrir o bate-papo';

  @override
  String get meshIntro =>
      'Pares no intervalo BLE — toque para um bate-papo E2EE privado (sem composição pública em #mesh)\nEnvia via roteador híbrido (BLE + LoRa + Nostr quando online)';

  @override
  String get meshEmptyRunning =>
      'Ainda não há peers próximos — abra o aplicativo em outro dispositivo dentro do alcance BLE';

  @override
  String get meshEmptyStopped =>
      'BLE não está em execução — conceda permissão de Bluetooth/localização';

  @override
  String get meshNearbyPrefix => 'Próximo';

  @override
  String get meshRetentionTitle => 'Excluir mensagens automaticamente';

  @override
  String get meshRetentionSubtitle =>
      'O histórico de bate-papo local mais antigo é removido automaticamente';

  @override
  String get meshRetentionKeep => 'Manter';

  @override
  String get meshRetention1Day => '1 dia';

  @override
  String get meshRetention3Days => '3 dias';

  @override
  String get meshRetention7Days => '7 dias';

  @override
  String get refreshLocationTooltip => 'Atualizar localização';

  @override
  String get geoIntro =>
      'As pessoas on-line neste geohash podem receber mensagens 1:1 ou com uma distribuição pública de área (ainda selada E2EE por par - não em texto simples)';

  @override
  String geoEmpty(String channel) {
    return 'Ninguém online em $channel ainda\nUse Transporte → Internet/Auto, aguarde Nostr, atualize o local';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'On-line em $channel • toque para E2EE 1:1';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'Perto (aguardando presença na área) • toque para E2EE 1:1';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'Visto em Nostr em $channel • somente descoberta (legado)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'Presença anônima herdada – espere por um par vinculado ou troque QR';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE próximo – escaneie o QR para iniciar 1:1 E2EE';

  @override
  String get geoInternetDiscoverHint =>
      'A área de descoberta da Internet precisa de Nostr conectado (Configurações → Transporte → Internet/Automático)';

  @override
  String get geoEmptyNoLocation =>
      'Localização ainda não resolvida — permita que o GPS e a atualização publiquem seu geohash em Nostr';

  @override
  String get geoEmptyNeedsPermission =>
      'Permissão de localização negada – permitir ResilNet em Configurações → Privacidade → Localização';

  @override
  String get geoEmptyServicesDisabled =>
      'Os serviços de localização estão desativados – ative-os nas configurações';

  @override
  String get geoEmptyNoGpsFix =>
      'Não foi possível obter uma localização de GPS (comum em iPads Wi‑Fi) — configure o geohash manualmente abaixo';

  @override
  String get geoEmptyTeleportHint =>
      'Toque no ícone do local → insira um geohash (por exemplo, w5) → Teleporte';

  @override
  String get geoSetGeohashManually => 'Definir geohash';

  @override
  String get geoTeleportHint =>
      'Sem GPS? Insira o prefixo geohash (2–7 caracteres, por exemplo, w5) e toque em Teletransportar';

  @override
  String get geoTeleportInvalid =>
      'Geohash inválido – use apenas letras/números base32 (por exemplo, w5 ou w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'Área definida como $channel';
  }

  @override
  String geoManualActive(String channel) {
    return 'Área manual: $channel (a atualização do GPS será substituída)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr não está pronto - toque em Reconectar (0/0 até que a inicialização seja bem-sucedida)';

  @override
  String get geoEmptyMeshOnly =>
      'O transporte é somente Mesh – mude para Internet ou Automático para descobrir pares em Nostr';

  @override
  String geoEmptyWaiting(String channel) {
    return 'Ninguém em $channel ainda — mantenha Área + Internet aberta em ambos os dispositivos e espere aproximadamente 60s';
  }

  @override
  String get geoChannelFallback => '#área';

  @override
  String get geoRefreshLocation => 'Atualizar localização';

  @override
  String get settingsClearLocationTitle => 'Limpar localização';

  @override
  String get settingsClearLocationSubtitle =>
      'Remover GPS / geohash de teletransporte (a área se torna #—)';

  @override
  String get settingsClearLocationConfirmTitle => 'Limpar a localização';

  @override
  String get settingsClearLocationConfirmBody =>
      'Exclui o geohash armazenado neste dispositivo. Você pode atualizar o GPS ou se teletransportar novamente depois.';

  @override
  String get settingsClearLocationAction => 'Limpar localização';

  @override
  String get settingsClearLocationSnack => 'Local limpo';

  @override
  String get chatVoiceTooLarge =>
      'Nota de voz muito grande – no máximo cerca de 30 segundos';

  @override
  String get chatVoiceNeedInternet =>
      'A nota de voz precisa de Internet (Nostr) — grande demais para BLE sozinho';

  @override
  String get chatVoiceSentInternet => 'Nota de voz enviada via Internet';

  @override
  String get noticeAnonMention => 'menção';

  @override
  String get noticeAnonDm => 'e objetiva. ';

  @override
  String get noticeAnonHug => 'abraço';

  @override
  String get noticeAnonSlap => 'tapa';

  @override
  String get noticeAnonBlock => 'bloquear';

  @override
  String get noticeAnonNeedKey =>
      'Nenhuma chave pública ainda – troque o QR primeiro por 1:1';

  @override
  String get noticeAnonActionSent => 'Enviado';

  @override
  String noticeAnonBlocked(String anon) {
    return 'Bloqueado $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '*abraços $anon*';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* tapas $anon *';
  }

  @override
  String get geoReconnectNostr => 'Reconectar Nostr';

  @override
  String get nostrSectionTitle => 'Nostr relés';

  @override
  String get nostrSectionSubtitle =>
      'As mensagens da Internet e a descoberta de área usam essas retransmissões. Toque em reconectar se o status permanecer off-line.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'Conectado $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'Off-line – relés listados, mas nenhum conectado';

  @override
  String get nostrStatusNotInit =>
      'Não iniciado (0/0) — toque em Reconectar para inicializar';

  @override
  String get nostrReconnectAction => 'Reconectar Nostr';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr conectado ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'Ainda off-line — verifique Wi‑Fi/celular ou tente novamente';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'Falha: $error';
  }

  @override
  String get nostrReconnecting => 'Conectando aos relés…';

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return 'Internet (Nostr) em $channel • bate-papo selado pronto';
  }

  @override
  String get transportModeTitle => 'Transporte de área';

  @override
  String get transportModeSubtitle =>
      'Mesh = BLE próximo (rádio) quando não há Nostr · Internet e Auto = Nostr lista de pessoas';

  @override
  String get transportModeMesh => 'Malha';

  @override
  String get transportModeInternet => 'Internet';

  @override
  String get transportModeAuto => 'Auto';

  @override
  String get geoPublicHint => 'Mensagem pública para todos online nesta área';

  @override
  String get geoPublicSend => 'Público';

  @override
  String geoPublicHelp(int count) {
    return 'Distribuição selada para $count peer(s) on-line — cada um recebe um envelope privado';
  }

  @override
  String geoPublicSent(int count) {
    return 'Enviado para $count pares nesta área';
  }

  @override
  String get geoPublicSentNone =>
      'Nenhum peer que pode ser enviado para mensagens on-line — abra Área/Malha com peers que possuem chaves ou aguarde BLE/Nostr';

  @override
  String get areaPublicBadge => 'Área pública';

  @override
  String get geoErrorPermission =>
      'Não foi possível ler a localização – verifique a permissão de localização';

  @override
  String get geoPrecisionRegion => 'Região';

  @override
  String get geoPrecisionProvince => 'Província';

  @override
  String get geoPrecisionCity => 'Cidade';

  @override
  String get geoPrecisionNeighborhood => 'Vizinhança';

  @override
  String get geoPrecisionBlock => 'Bloquear';

  @override
  String get aliasTitle => 'Definir apelido (alias de contato)';

  @override
  String get aliasHintBody =>
      'Este alias é armazenado apenas neste dispositivo (somente local)\nNunca é enviado com tráfego E2EE';

  @override
  String get aliasLabel => 'Apelido';

  @override
  String get aliasHint => 'por exemplo “chefe da aldeia”, “P\'Somchai”…';

  @override
  String get settingsDevices => 'Dispositivos';

  @override
  String get settingsFirmwareTitle => 'Baixar/atualizar firmware ESP32';

  @override
  String get settingsFirmwareSubtitle =>
      'Baixe arquivos .bin e atualize a placa ESP32 via OTA';

  @override
  String get mtBridgeTitle => 'Meshtastic ponte';

  @override
  String get mtBridgeSettingsSubtitle =>
      'Ponte A/B somente texto — não ResilNet E2EE';

  @override
  String get mtBridgeIntro =>
      'Mova texto simples curto entre Meshtastic e ResilNet. Os modos A e B não podem funcionar ao mesmo tempo. Esta não é criptografia de ponta a ponta.';

  @override
  String get mtBridgeModeLabel => 'Modo';

  @override
  String get mtBridgeModeOff => 'Desligado';

  @override
  String get mtBridgeModeA => 'Ingerir A';

  @override
  String get mtBridgeModeB => 'Saída B';

  @override
  String get mtBridgeModeOffShort => 'Desligado';

  @override
  String get mtBridgeModeAShort => 'Em A';

  @override
  String get mtBridgeModeBShort => 'Fora B';

  @override
  String get mtBridgeMutexHint =>
      'Selecionar um modo desliga o outro automaticamente. A+B simultâneo não é suportado.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'Demonstração (registro)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'O texto de entrada aparece em Avisos como #meshtastic. O relé de malha é opcional (desativado por padrão).';

  @override
  String get mtBridgeRelayTitle => 'Também retransmitir na malha ResilNet';

  @override
  String get mtBridgeRelayHint =>
      'Quando ativado, os boletins públicos assinados são transmitidos. Desligado = apenas avisos deste telefone.';

  @override
  String get mtBridgeSimulateHint => 'Mensagem de demonstração';

  @override
  String get mtBridgeSimulate => 'Simular mensagem Meshtastic';

  @override
  String get mtBridgeIngestOk => 'Ingerido em avisos (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'Atenção: as mensagens enviadas aqui NÃO são ResilNet E2EE. Qualquer pessoa no caminho Meshtastic pode lê-los.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'Texto para publicar';

  @override
  String get mtBridgeSend => 'Enviar para Meshtastic';

  @override
  String get mtBridgeEgressOk => 'Na fila para Meshtastic (ver log/histórico)';

  @override
  String get mtBridgeLastEgress => 'Última saída';

  @override
  String get mtBridgeEgressHistory => 'Saída recente';

  @override
  String get mtBridgeOffHint =>
      'Ative Ingest (A) ou Egress (B) para usar a ponte.';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTIC · não E2EE';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'Use transporte MQTT';

  @override
  String get mtBridgeUseMqttHint =>
      'Desativado = apenas registro de demonstração (MQTT entrada ignorada). On = MQTT para ingestão/saída quando conectado.';

  @override
  String get mtBridgeMqttHost => 'Host do corretor';

  @override
  String get mtBridgeMqttPort => 'Porta';

  @override
  String get mtBridgeMqttTls => 'Usar TLS (mqtts)';

  @override
  String get mtBridgeMqttTlsHint =>
      'Porta típica 8883. Usa certificados de sistema; falha suavemente em erros de handshake.';

  @override
  String get mtBridgeMqttAutoReconnect => 'Reconectar automaticamente';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'Quando ativado, o cliente tenta se reconectar após quedas. O status mostra Conectando até ser restaurado.';

  @override
  String get mtBridgeMqttTopicHelpers => 'Ajudantes de tópico';

  @override
  String get mtBridgeMqttRegion => 'Prefixo da região (opcional)';

  @override
  String get mtBridgeMqttRegionHint =>
      'Quando definido, Apply reconstrói a raiz como msh/<region>/2/json (substitui a raiz do tópico).';

  @override
  String get mtBridgeMqttTopicRoot => 'Raiz do tópico JSON';

  @override
  String get mtBridgeMqttDownlinkChannel => 'Nome do canal de downlink';

  @override
  String get mtBridgeMqttApplyTopics =>
      'Aplicar root → assinar/publicar tópicos';

  @override
  String get mtBridgeMqttAdvanced => 'Avançado MQTT';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'TLS, reconectar, tópicos, credenciais';

  @override
  String get mtBridgeMqttTopicIn => 'Assinar tópico';

  @override
  String get mtBridgeMqttTopicOut => 'Publicar tópico';

  @override
  String get mtBridgeMqttGatewayFrom => 'ID do nó de gateway (de)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'ID decimal ou !hex — necessário para downlink sendtext';

  @override
  String get mtBridgeMqttChannelIndex =>
      'Índice de canal de malha (opcional 0–7)';

  @override
  String get mtBridgeMqttUser => 'Nome de usuário (opcional)';

  @override
  String get mtBridgeMqttPass => 'Senha (opcional)';

  @override
  String get mtBridgeMqttPassStored =>
      'Uma senha é armazenada neste dispositivo (não mostrada).';

  @override
  String get mtBridgeMqttPassReplace =>
      'Nova senha (deixe em branco para manter)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'Deixe em branco para manter a senha armazenada.';

  @override
  String get mtBridgeMqttPassClear => 'limpe a senha. ';

  @override
  String get mtBridgeMqttSave => 'Salvar configurações MQTT';

  @override
  String get mtBridgeMqttSaved => 'MQTT configurações salvas';

  @override
  String get mtBridgeMqttConnect => 'Conectar';

  @override
  String get mtBridgeMqttDisconnect => 'Desconectar';

  @override
  String get mtBridgeMqttConnected => 'MQTT conectado';

  @override
  String get mtBridgeMqttConnecting => 'MQTT conectando…';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT desconectado';

  @override
  String get mtBridgeMqttError => 'Erro MQTT';

  @override
  String get mtBridgeErrModeIngest => 'Mude para Ingestão (A) primeiro';

  @override
  String get mtBridgeErrModeEgress => 'Mude para Saída (B) primeiro';

  @override
  String get mtBridgeErrRate => 'Desacelere – taxa limitada';

  @override
  String get mtBridgeErrDedupe => 'Mensagem duplicada ignorada';

  @override
  String get mtBridgeErrLoop => 'Caiu para evitar um loop de ponte';

  @override
  String get mtBridgeErrEmpty => 'A mensagem está vazia';

  @override
  String get mtBridgeErrPublish => 'Falha na publicação';

  @override
  String get mtBridgeErrNotConnected => 'MQTT não conectado';

  @override
  String get mtBridgeErrMissingHost => 'Digite MQTT host do corretor';

  @override
  String get mtBridgeErrMissingTopic => 'Digite assinar e publicar tópicos';

  @override
  String get mtBridgeErrMissingFromNode =>
      'Insira o ID do nó do gateway (de) para sendtext';

  @override
  String get mtBridgeErrConnect => 'MQTT falha na conexão';

  @override
  String get mtBridgeErrConnectTls => 'MQTT Falha na conexão TLS';

  @override
  String get settingsData => 'Dados';

  @override
  String get settingsDataHint =>
      'Exclua mensagens locais para reduzir o banco de dados – identidade, chaves e pares são mantidos';

  @override
  String get settingsSaveHistoryTitle => 'Salvar histórico de mensagens';

  @override
  String get settingsSaveHistorySubtitle =>
      'Quando desativadas, as mensagens permanecem E2EE na transmissão e são mantidas apenas para esta sessão (não no histórico de bate-papo local). Seu próprio texto ainda é exibido como texto simples neste dispositivo.';

  @override
  String get settingsPrivacy => 'Privacidade';

  @override
  String get settingsE2eeTitle => 'Criptografia ponta a ponta';

  @override
  String get settingsE2eeSubtitle =>
      'Sempre ativado — as mensagens são lacradas com RSA-OAEP + AES-GCM antes do envio. Relés e saltos próximos não podem ler o conteúdo.';

  @override
  String get settingsScreenshotTitle => 'Alertas de captura de tela';

  @override
  String get settingsScreenshotSubtitle =>
      'Mostrar uma linha do sistema no chat quando este dispositivo capturar a tela';

  @override
  String get settingsNostrExpiryTitle => 'Nostr mensagem manter tempo';

  @override
  String get settingsNostrExpirySubtitle =>
      'Por quanto tempo os envelopes lacrados devem permanecer localmente quando online via Nostr';

  @override
  String get noticeExpiresIn => 'expira em';

  @override
  String get noticesTitle => 'Avisos';

  @override
  String get noticesMeshIntro =>
      'Boletim público — visível para todos no alcance do rádio, não criptografado. Ele fica off-line de telefone para telefone e as caixas de retransmissão ResilNet próximas mantêm uma cópia para que as pessoas que chegam mais tarde ainda a vejam.';

  @override
  String get noticesMeshPublicBadge => 'PÚBLICO · não criptografado';

  @override
  String get noticesGeoIntro =>
      'Adicione notas curtas sobre este lugar para que outros visitantes possam encontrá-las.';

  @override
  String get noticesEmpty => 'ainda não há avisos';

  @override
  String get noticesEmptyHint =>
      'fixe o primeiro aviso para as pessoas por aqui.';

  @override
  String get noticesComposeHint => 'poste um aviso...';

  @override
  String get noticesUrgent => 'urgente';

  @override
  String get noticesOpen => 'Avisos';

  @override
  String get screenshotTaken => '*você tirou uma captura de tela*';

  @override
  String get chatAttachImage => 'Anexar imagem';

  @override
  String get chatImageLabel => 'Imagem';

  @override
  String get chatImageTooLarge => 'Imagem muito grande – tente outra foto';

  @override
  String get chatNostrExpiry => 'Nostr manter';

  @override
  String geoPublicComposeHint(String channel) {
    return 'Enviar para $channel — público';
  }

  @override
  String get settingsClearTitle => 'Limpar todas as mensagens';

  @override
  String get settingsClearSubtitle =>
      'Exclua todos os bate-papos neste dispositivo';

  @override
  String get settingsClearConfirmTitle => 'Limpar todas as mensagens?';

  @override
  String get settingsClearConfirmBody =>
      'Isso exclui todas as mensagens de bate-papo neste dispositivo.\nPares e apelidos não são removidos.';

  @override
  String get settingsClearAction => 'Limpar dados';

  @override
  String get settingsClearedSnack => 'Dados apagados';

  @override
  String settingsVersion(String version) {
    return 'versão $version';
  }

  @override
  String get meshBleScanning => 'BLE: verificando nós';

  @override
  String get meshBleEsp32Scanning => 'ESP32: procurando um nó próximo';

  @override
  String get meshBleSyncing => 'BLE: sincronizando com ESP32';

  @override
  String get meshNostrPublishing => 'Nostr: publicação';

  @override
  String get meshBleIdle =>
      'BLE malha ativada — ainda não há telefones próximos';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE malha — $count telefone(s) próximo(s)';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: permissão necessária';

  @override
  String get meshBlePausedCamera =>
      'BLE pausado para câmera — toque em Iniciar BLE';

  @override
  String get meshBleStopped =>
      'BLE está desligado – verifique se o Bluetooth está ligado e toque em Iniciar BLE';

  @override
  String get meshBleRestart => 'Iniciar BLE';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'Verifique as permissões e inicie BLE';

  @override
  String get meshNostrOffline => 'Nostr off-line';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count pares próximos • LoRa $lora • sincronização ~${meters}m';
  }

  @override
  String get meshLoraReady => 'preparar';

  @override
  String get meshLoraNotReady => 'não está pronto';

  @override
  String meshGatewayProgress(String label) {
    return 'Gateway UDP: $label';
  }

  @override
  String get meshGatewayReady => 'Gateway UDP: pronto';

  @override
  String get permissionTitle => 'Permitir acesso para iniciar a rede mesh BLE';

  @override
  String get permissionBody =>
      'O aplicativo precisa de Bluetooth (digitalizar/conectar/anunciar), localização (para dispositivos Android mais antigos) e microfone (para notas de voz em bate-papo e anúncios) para mensagens da comunidade.';

  @override
  String get permissionE2ee =>
      'Criptografia ponta a ponta (E2EE)\nOs nós de retransmissão não podem ler o conteúdo da mensagem';

  @override
  String get permissionReady => 'Permissões prontas';

  @override
  String get permissionRequest => 'Permitir e continuar';

  @override
  String get permissionNotReadySnack =>
      'O sistema ainda não está pronto – espere um momento e tente novamente';

  @override
  String get permissionDeniedSnack =>
      'Permissões incompletas – abra Configurações > ResilNet e permita Bluetooth/Localização/Microfone';

  @override
  String get permissionMicDenied =>
      'Acesso ao microfone negado – permita nas configurações gravar notas de voz';

  @override
  String get permissionMicOpenSettings => 'Configurações';

  @override
  String get permissionCameraDenied =>
      'Acesso à câmera negado – permita nas Configurações para escanear códigos QR';

  @override
  String get permissionCameraFailed =>
      'É necessária permissão da câmera para escanear códigos QR';

  @override
  String get permissionCameraOpenSettings => 'Configurações';

  @override
  String get permissionPhotosDenied =>
      'Acesso à biblioteca de fotos negado – permita nas configurações para salvar seu código QR';

  @override
  String get permissionPhotosFailed =>
      'É necessária permissão da biblioteca de fotos para salvar seu código QR';

  @override
  String get permissionPhotosOpenSettings => 'Configurações';

  @override
  String permissionFailedSnack(String error) {
    return 'Falha na solicitação de permissão: $error';
  }

  @override
  String get permissionFooter =>
      'Arquitetura ResilNet • Multi-hop de armazenamento e encaminhamento';

  @override
  String get onboardingSkip => 'Pular';

  @override
  String get onboardingNext => 'Próximo';

  @override
  String get onboardingStart => 'Comece';

  @override
  String get onboardingWelcomeTitle => 'Bem vindo a ResilNet';

  @override
  String get onboardingWelcomeBody =>
      'Converse em ResilNet em uma rede mesh — mesmo sem internet';

  @override
  String get onboardingFriendsTitle => 'Adicione amigos facilmente';

  @override
  String get onboardingFriendsBody =>
      'Compartilhe um QR do Identity ou escaneie o QR de um amigo para trocar chaves públicas';

  @override
  String get onboardingChannelsTitle =>
      'Bate-papo criptografado + canais próximos';

  @override
  String get onboardingChannelsBody =>
      'Alterne #mesh / Area (geohash) para encontrar pares próximos - as mensagens permanecem E2EE em malha BLE e Nostr';

  @override
  String get chatTitle => 'Bate-papo (E2EE)';

  @override
  String get chatScanTooltip => 'Digitalize QR para adicionar um par';

  @override
  String get chatBlockTooltip => 'Bloquear este remetente';

  @override
  String get chatBlockedSnack =>
      'Bloqueado: sem notificações/sem retransmissão';

  @override
  String get chatAliasTooltip => 'Definir apelido';

  @override
  String get chatReceiverPemLabel => 'Chave pública do destinatário (PEM)';

  @override
  String get chatReceiverPemHint =>
      'Cole a chave pública do seu amigo (do QR/arquivo compartilhado)';

  @override
  String get chatNeedPeerKey =>
      'Digitalize primeiro o QR deste peer (é necessária uma chave pública verificada)';

  @override
  String get chatPeerKeyMismatch =>
      'A chave pública armazenada não corresponde a este ID de peer';

  @override
  String chatVoiceFailed(String error) {
    return 'Não foi possível gravar o áudio: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'Não foi possível reproduzir a nota de voz: $error';
  }

  @override
  String get chatPlayVoice => 'Reproduzir nota de voz';

  @override
  String get chatPauseVoice => 'Pausa';

  @override
  String get chatVoiceLabelSent => '🎤 Nota de voz (selada)';

  @override
  String get chatVoiceLabel => '🎤 Nota de voz';

  @override
  String get chatDecryptFailed => '[falha na descriptografia]';

  @override
  String chatSentSealed(String preview) {
    return '[selado • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[selado]';

  @override
  String get chatComposeHint => 'Digite uma mensagem… (selada ao enviar)';

  @override
  String get chatEmptyThread =>
      'Nenhuma mensagem ainda\nDigite abaixo para enviar pela malha';

  @override
  String chatLoadFailed(String error) {
    return 'Não foi possível carregar a conversa: $error';
  }

  @override
  String get chatEmojiTooltip => 'Emoji';

  @override
  String get statusPending => 'Pendente';

  @override
  String get statusSent => 'Enviado';

  @override
  String get statusRelayed => 'Retransmitido';

  @override
  String get statusDelivered => 'Entregue';

  @override
  String get statusRead => 'Ler';

  @override
  String get statusFailed => 'Fracassado';

  @override
  String get chatCopy => 'Cópia';

  @override
  String get chatDeleteLocal => 'Excluir neste dispositivo';

  @override
  String get chatDeletedLocalSnack => 'Excluído neste dispositivo';

  @override
  String get chatRetry => 'Tentar novamente';

  @override
  String get chatSendFailed => 'Não entregue – toque em Tentar novamente';

  @override
  String get chatImageNeedInternet =>
      'Conecte-se à internet para enviar imagens';

  @override
  String get chatImageTooLargeOnline =>
      'Não foi possível compactar a imagem o suficiente para enviar';

  @override
  String get chatOpenLinkFailed => 'Não foi possível abrir o link';

  @override
  String get identityTitle => 'Identidade';

  @override
  String get identityScanTooltip => 'Digitalize QR com câmera';

  @override
  String get identityCopiedHash => 'Hash de chave pública copiado';

  @override
  String get identityPeerSaved => 'Par salvo do QR';

  @override
  String get identityGalleryDenied => 'Permissão da biblioteca de fotos negada';

  @override
  String get identityQrSaved => 'QR salvo na biblioteca de fotos';

  @override
  String identityQrSaveFailed(String error) {
    return 'Não foi possível salvar o QR: $error';
  }

  @override
  String get peersTitle => 'Membros da rede';

  @override
  String get qrScanTitle => 'Digitalize QR para adicionar um amigo';

  @override
  String get qrInvalid => 'Falha na verificação: QR inválido';

  @override
  String get qrIdKeyMismatch =>
      'QR rejeitado: id não corresponde à chave pública';

  @override
  String get qrCameraNotReady => 'A câmera não está pronta';

  @override
  String get qrRetrySettings => 'Tente novamente/abra Configurações';

  @override
  String qrCameraOpenFailed(String error) {
    return 'Não foi possível abrir a câmera: $error';
  }

  @override
  String get qrScanAlignHint => 'Alinhe o código QR dentro da moldura';

  @override
  String get firmwareDownloadTitle => 'Baixe o firmware ESP32';

  @override
  String get firmwareSourceOnline => 'Mais recente (on-line)';

  @override
  String get firmwareSourceCached => 'Cópia salva (off-line)';

  @override
  String get firmwareSourceBaseline => 'Linha de base agrupada (off-line)';

  @override
  String get firmwareSourceUnavailable => 'Nenhum firmware disponível';

  @override
  String get firmwareBaselineIncompatible =>
      'O firmware incluído é muito antigo – conecte-se à Internet para baixar uma versão mais recente';

  @override
  String get firmwareChecksumFailed =>
      'Falha na verificação de integridade do firmware — intermitência bloqueada';

  @override
  String firmwareReadyFromSource(String source) {
    return 'Firmware pronto: $source';
  }

  @override
  String get peersRefreshTooltip => 'Atualizar';

  @override
  String get peersBlocked => 'Bloqueado';

  @override
  String get peersNearbyBle => 'Perto (BLE)';

  @override
  String get peersRecentlyOnline => 'On-line recentemente';

  @override
  String get peersOnlineInArea => 'On-line na área';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return 'Visto $minutes minutos atrás';
  }

  @override
  String get peersOffline => 'Off-line';

  @override
  String peersBlockedSnack(String id) {
    return 'Bloqueado $id';
  }

  @override
  String get peersUnblockedSnack => 'Desbloqueado';

  @override
  String get peersEmpty =>
      'Nenhum membro no banco de dados ainda\nDigitalize um QR ou aguarde a descoberta da malha BLE';

  @override
  String get peersOpenChat => 'Abrir bate-papo';

  @override
  String get peersBlockAction => 'Bloquear';

  @override
  String get peersUnblockAction => 'Desbloquear';

  @override
  String get channelPickerTooltip => 'Bate-papo / #mesh / Área';

  @override
  String get locationPickerTooltip => 'Canal de localização';

  @override
  String get transportPickerTooltip => 'Malha / Internet / Automático';

  @override
  String get onlinePeopleTooltip => 'Pessoas on-line';

  @override
  String get unreadDirectsTooltipEmpty => 'Mensagens privadas';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count mensagens privadas não lidas';
  }

  @override
  String get onlinePeopleTitle => 'pessoas';

  @override
  String get onlinePeopleEmpty => 'Ninguém online aqui ainda';

  @override
  String onlinePeopleCount(int count) {
    return '$count on-line';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · próximo + área';

  @override
  String get peerOnlineMeshTitle => 'Alguém próximo na malha';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name está próximo na malha';
  }

  @override
  String get peerOnlineAreaTitle => 'Alguém online na área';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name está on-line via Nostr';
  }

  @override
  String get locationSheetTitle => '#canais de localização';

  @override
  String get channelPinsTitle => 'Fixado';

  @override
  String get channelPinsHint =>
      'Fixe canais que você usa com frequência – eles permanecem no topo';

  @override
  String get channelPinTooltip => 'Fixar este canal';

  @override
  String get channelUnpinTooltip => 'Liberar';

  @override
  String get locationSheetIntro =>
      'Converse com pessoas próximas usando geohash grosseiro – e não GPS preciso. A presença na Internet usa chaves Nostr anônimas.';

  @override
  String get locationMeshSubtitle => '#bluetooth • ~10–50 m';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => 'Teleporte';

  @override
  String homeComposeHint(String channel) {
    return 'Mensagem $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return 'Enviar para $channel — público';
  }

  @override
  String get messageExpiryTitle => 'expira em';

  @override
  String get voiceRecordTapToStart => 'Toque para gravar mensagem de voz';

  @override
  String get voiceRecordTooShort => 'Gravação muito curta – tente novamente';

  @override
  String get voiceRecordFailed =>
      'Não foi possível salvar a gravação. Tente novamente';

  @override
  String get voicePttHold => 'Segure para gravar';

  @override
  String get voicePttRelease => 'Liberar para visualizar';

  @override
  String get voicePttRecording => 'Gravando…';

  @override
  String get voicePttDraftReady => 'Nota de voz pronta';

  @override
  String get voicePttDiscard => 'Descartar';

  @override
  String get voicePttReRecord => 'Grave novamente';

  @override
  String get voicePttSend => 'Enviar nota de voz';

  @override
  String get voicePttPlayPreview => 'Antevisão da reprodução';

  @override
  String get voicePttStopPreview => 'Parar visualização';

  @override
  String get noticesBackfilling => 'Carregando avisos…';

  @override
  String get noticesNostrOnline => 'Nostr on-line';

  @override
  String get noticesNostrOffline =>
      'Nostr off-line — o boletim precisa de Internet';

  @override
  String noticesBackfillLoaded(int count) {
    return 'Avisos $count carregados';
  }

  @override
  String get noticePublishFailed =>
      'Não foi possível publicar aviso ao conselho da área. Verifique a conexão Nostr.';

  @override
  String get noticeMeshPublishNoLink =>
      'Salvo localmente. Conecte-se a um rádio mesh próximo (ou gateway Wi‑Fi) para que outras pessoas possam recebê-lo.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'Boletim enviado para $count dispositivos próximos em BLE.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'Rádios próximos vistos, mas falha na gravação BLE. Mantenha os dois aplicativos abertos na tela Avisos e tente novamente (ou use um relé ESP32).';

  @override
  String get noticeMeshPublishNoGatt =>
      'O receptor BLE deste dispositivo não está pronto. Alterne o Bluetooth e reabra os Avisos.';

  @override
  String get noticeDelete => 'Excluir aviso';

  @override
  String get noticeDeleteConfirmTitle => 'Excluir este aviso?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'Isso o remove apenas neste dispositivo. Outros que já o receberam ainda o verão.';

  @override
  String get noticeDeleted => 'Aviso excluído';

  @override
  String get chatNoticeHidden => 'Aviso de área – avisos abertos';

  @override
  String get identityDisplayNameTitle => 'Nome de exibição';

  @override
  String get identitySaveName => 'Salvar nome';

  @override
  String get identityUserIdLabel => 'ID do usuário (hash de chave pública)';

  @override
  String get identityCopyHashTooltip => 'Copiar hash de chave pública';

  @override
  String get identityMyQrTitle => 'Meu QR (id + pubKey + nome)';

  @override
  String identityQrFailed(String error) {
    return 'Não foi possível criar QR\n$error';
  }

  @override
  String get identitySaving => 'Salvando…';

  @override
  String get identitySaveQr => 'Salvar QR na biblioteca de fotos';

  @override
  String get identityOpenScanner => 'Abra a câmera para digitalizar QR';

  @override
  String get identityQrHelp =>
      'Peça a um amigo que escaneie isso para salvar sua chave pública e (se necessário) defini-lo como um Emissor Verificado';

  @override
  String get identityChatTip =>
      'Dica: você também pode escanear um QR no chat para adicionar uma chave pública para E2EE';

  @override
  String get infoOpen => 'Sobre / Informações';

  @override
  String get docsGuideTitle => 'Guia do usuário';

  @override
  String get docsGuideSubtitle => 'Abre no navegador';

  @override
  String get docsOpenAction => 'Guia aberto';

  @override
  String get docsOpenFailed => 'Não foi possível abrir o guia do usuário';

  @override
  String get firmwareOtaGuideTitle => 'Guia Flash e protocolo OTA';

  @override
  String get firmwareOtaGuideSubtitle =>
      'Abre o guia da web – downloads .bin e etapas completas';

  @override
  String get firmwareWebDownloadsTitle => 'Downloads de firmware na web';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'Links e somas de verificação por versão no site de documentos';

  @override
  String get inviteCopyShortLink => 'Copiar link curto';

  @override
  String get inviteShareLink => 'Compartilhar link';

  @override
  String get inviteShowFullLink => 'Link completo';

  @override
  String get inviteCopyFullLink => 'Copiar link completo';

  @override
  String get inviteLinkCopied => 'Link copiado';

  @override
  String get inviteLongPressHint => 'Mantenha pressionado para ações de link';

  @override
  String get inviteSendInChat => 'Enviar no bate-papo ResilNet…';

  @override
  String get inviteSendInChatHint =>
      'Somente pessoas para as quais você já possui uma chave pública';

  @override
  String get inviteSendInChatEmpty =>
      'Ainda não há bate-papos com mensagens.\nDigitalize um QR, abra Area/Mesh ou compartilhe o link fora do aplicativo primeiro.';

  @override
  String get inviteSentToChat => 'Convite enviado no chat';

  @override
  String get infoTabInfo => 'Informações';

  @override
  String get infoTabSettingsHint =>
      'Abra Configurações no menu para ferramentas de idioma, E2EE e dados';

  @override
  String get infoHowToTitle => 'Como usar';

  @override
  String get infoHowToBody =>
      '• Toque no ícone do canal para alternar Chat / #mesh / Área\n• Toque no local para escolher o tamanho do geohash\n• Toque nas pessoas para ver membros ou quem está on-line\n• Abra Identidade/QR de ⋮ para trocar chaves pessoalmente\n• A área “pública” envia E2EE selado para cada ponto on-line — não para uma sala de texto simples';

  @override
  String get infoFeaturesTitle => 'Características';

  @override
  String get infoFeatureOffline =>
      'Mensagens off-line via Bluetooth Low Energy';

  @override
  String get infoFeatureE2ee =>
      'Criptografia ponta a ponta com RSA-OAEP + AES-GCM (sem ruído)';

  @override
  String get infoFeatureMultihop =>
      'As mensagens podem passar por pares próximos para ir mais longe';

  @override
  String get infoFeatureBridge =>
      'Malha híbrida ↔ internet (Nostr) para envelopes lacrados';

  @override
  String get infoFeatureGeo =>
      'Canais locais de geohash para pessoas próximas (UX de descoberta)';

  @override
  String get infoFeatureNotices => 'Avisos com vencimento para #mesh e Área';

  @override
  String get infoPrivacyTitle => 'Privacidade';

  @override
  String get infoPrivacyNoRoom =>
      'Nenhuma aldeia de texto simples / sala de bate-papo pública na rede';

  @override
  String get infoPrivacyFanout =>
      'Envio de área = distribuição 1:1 selada para pares com chaves públicas conhecidas';

  @override
  String get infoPrivacyPresence =>
      'A presença na área da Internet usa chaves Nostr efêmeras';

  @override
  String get infoSymbolsTitle => 'Símbolos';

  @override
  String get infoSymBle => 'Link Bluetooth direto';

  @override
  String get infoSymMesh => 'Acessível via mesh (outros à frente)';

  @override
  String get infoSymInternet => 'Via internet (Nostr) — envelopes lacrados';

  @override
  String get infoSymBridge =>
      'Chegou através do caminho da ponte mesh↔internet';

  @override
  String get infoSymOffline => 'Off-line – não acessível no momento';

  @override
  String get infoSymInArea => 'Na área deste canal de localização';

  @override
  String get infoSymE2eeOk => 'Sessão criptografada de ponta a ponta';

  @override
  String get infoSymE2eeFail =>
      'Criptografia indisponível – não envie texto confidencial';

  @override
  String get infoSymVerified => 'Identidade verificada/chave conhecida';

  @override
  String get infoSymBlocked => 'Bloqueado';

  @override
  String get infoSymUnread => 'Mensagem privada não lida';

  @override
  String get infoEmergencyTitle => 'Modo de emergência';

  @override
  String get infoEmergencyBody =>
      'Toque três vezes no título ResilNet na tela inicial para limpar mensagens, chaves e identidade neste dispositivo.';

  @override
  String get infoLegendNote =>
      'Alguns ícones de caminho estão documentados aqui para maior clareza; os ticks de entrega no chat permanecem como o status de envio principal.';

  @override
  String get dangerZoneTitle => 'Zona de perigo';

  @override
  String get dangerZoneSubtitle =>
      'Exclui mensagens, chaves de criptografia, identidade Nostr, peers e apelidos neste dispositivo. Você irá configurar novamente.';

  @override
  String get panicWipeTitle => 'Limpeza de emergência';

  @override
  String get panicWipeSubtitle =>
      'Apague tudo localmente - o mesmo que tocar três vezes no título inicial (tocar duas vezes atualiza os rádios)';

  @override
  String get panicWipeConfirmTitle => 'Limpar todos os dados locais?';

  @override
  String get panicWipeConfirmBody =>
      'Isso exclui permanentemente bate-papos, chaves e identidade neste telefone.\nOs pares devem trocar novamente as chaves QR com sua nova identidade.\nIsto não pode ser desfeito.';

  @override
  String get panicWipeAction => 'Limpe tudo';

  @override
  String get panicWipeSnack =>
      'Identidade local apagada – configurada novamente';

  @override
  String panicWipeFailed(String error) {
    return 'Falha na limpeza: $error';
  }

  @override
  String get meshBridgeTitle => 'Ponte de malha';

  @override
  String get meshBridgeSubtitle =>
      'Quando ativado (padrão), os envelopes lacrados podem usar malha BLE e internet (Nostr) juntos para que ilhas de malha próximas possam se conectar. Quando desativado, os envios usam apenas um caminho — nunca colocam texto simples na transmissão.';

  @override
  String get favoritesTitle => 'Favoritos';

  @override
  String get favoritesAdd => 'Adicionar aos favoritos';

  @override
  String get favoritesRemove => 'Remover dos favoritos';

  @override
  String get favoritesEmpty =>
      'Ainda não há favoritos – marque com estrela um colega da lista de membros';

  @override
  String get favoritesNearbyTitle => 'Favorito nas proximidades';

  @override
  String favoritesNearbyBody(String name) {
    return '$name está próximo na malha';
  }

  @override
  String get favoritesInAreaTitle => 'Favorito na área';

  @override
  String favoritesInAreaBody(String name) {
    return '$name está online nesta área';
  }

  @override
  String get topologyTitle => 'Topologia de malha';

  @override
  String get topologySubtitle =>
      'Pares e dicas de conexão do anúncio de malha (somente leitura)';

  @override
  String get topologyConnectedNow => 'Conectado agora (BLE)';

  @override
  String get topologyNearby => 'Perto (BLE)';

  @override
  String get topologyKnown => 'Pares conhecidos';

  @override
  String get topologyEmpty =>
      'Nenhum colega aprendeu ainda — fique por perto com BLE ativado';

  @override
  String get topologyYou => 'você';

  @override
  String topologyStats(int peers, int links) {
    return '$peers pares · $links links';
  }

  @override
  String get topologyGraphHint =>
      'Estimado a partir da descoberta de malha próxima — seu dispositivo é destacado. Toque em um colega para abrir o bate-papo.';

  @override
  String get topologyOpen => 'Topologia de malha';

  @override
  String get slashHelpTitle => 'Comandos';

  @override
  String get slashHelpBody =>
      '/ajuda — esta lista\n/who — pessoas online no canal atual\n/drop <text> — fixe um aviso lacrado aqui (fan-out E2EE)\n\nGuia completo: use o guia Abrir abaixo ou Configurações → Guia do usuário.';

  @override
  String get slashWhoEmpty => 'Ninguém online neste canal no momento';

  @override
  String slashWhoTitle(int count) {
    return 'On-line ($count)';
  }

  @override
  String get slashDropNeedText => 'Uso: / solte o texto da sua nota';

  @override
  String slashDropDone(String channel) {
    return 'Aviso descartado em $channel';
  }

  @override
  String get slashUnknown => 'Comando desconhecido – tente /help';

  @override
  String get announceOpen => 'Anúncios';

  @override
  String get announceTitle => 'Anúncios';

  @override
  String get announceEmpty =>
      'Ainda não há painéis – crie um para postar avisos bloqueados ou abertos';

  @override
  String get announceCreate => 'Criar quadro';

  @override
  String get announceCreateHint => 'Nome do conselho';

  @override
  String get announceDefaultTitle => 'Conselho comunitário';

  @override
  String get announceSettings => 'Configurações do quadro';

  @override
  String get announceAllowLocked =>
      'Permitir postagens bloqueadas (criptografadas)';

  @override
  String get announceAllowLockedSub =>
      'Criptografado na chave do quadro – os leitores precisam de acesso';

  @override
  String get announceAllowOpen => 'Permitir postagens abertas (texto simples)';

  @override
  String get announceAllowOpenSub =>
      'Não E2EE — legível em mesh/relés. Desativado por padrão.';

  @override
  String get announceComposeHint => 'Escreva um anúncio…';

  @override
  String get announceMediaInternetOnly =>
      'Anúncios de foto/voz enviados pela Internet (não BLE)';

  @override
  String get announceNeedInternet =>
      'Conecte-se à Internet para enviar anúncios por foto ou voz';

  @override
  String announceVoiceFailed(String error) {
    return 'Não foi possível gravar a voz: $error';
  }

  @override
  String get announceImageTooLarge =>
      'A imagem é muito grande (máximo de aproximadamente 180 KB)';

  @override
  String get announcePlayVoice => 'Reproduzir nota de voz';

  @override
  String get announceImageLabel => '📷 Imagem';

  @override
  String get announceAudioLabel => '🎤 Nota de voz';

  @override
  String get announceModeLocked => 'Bloqueado';

  @override
  String get announceModeOpen => 'Abrir';

  @override
  String get announceOpenBadge => 'ABERTO · não criptografado';

  @override
  String get announceLockedBadge => 'Bloqueado';

  @override
  String get announceLockedPlaceholder =>
      'Criptografado – solicite acesso para leitura';

  @override
  String get announceRequestAccess => 'Solicitar acesso';

  @override
  String get announceRequestSent =>
      'Solicitação de acesso enviada ao proprietário do quadro';

  @override
  String get announceRequestFailed =>
      'Não foi possível solicitar acesso (precisa da chave pública do proprietário)';

  @override
  String get announceOpenConfirmTitle => 'Postar sem criptografia?';

  @override
  String get announceOpenConfirmBody =>
      'Postagens abertas não são E2EE. Qualquer pessoa no caminho (malha/relés) pode lê-los. Continuar?';

  @override
  String get announcePostAction => 'Publicar';

  @override
  String get announcePendingRequests => 'Solicitações de acesso';

  @override
  String get announceApprove => 'Aprovar';

  @override
  String get announceDeny => 'Negar';

  @override
  String get announceGranted =>
      'Você pode ler postagens bloqueadas neste fórum';

  @override
  String get announceOwner => 'Você possui este quadro';

  @override
  String get announceCopyInvite => 'Copiar texto do convite';

  @override
  String get announceShowInviteQr => 'Mostrar QR do convite';

  @override
  String get announceScanInviteQr => 'QR do convite do quadro de digitalização';

  @override
  String get announceFollow => 'Siga o quadro a partir do convite';

  @override
  String get announceFollowHint =>
      'Cole o texto do convite ou o link ResilNet do proprietário';

  @override
  String get announceFollowOk => 'Seguindo o quadro';

  @override
  String announceFollowOkNamed(String title) {
    return 'Agora seguindo “$title”';
  }

  @override
  String get announceFollowFail => 'O convite é inválido ou está danificado';

  @override
  String get announceInviteCopied => 'Texto do convite copiado';

  @override
  String get announceInviteSaveQr => 'Salvar QR';

  @override
  String get announceInviteShare => 'Compartilhar convite';

  @override
  String get announceFollowFromCompose =>
      'Convite para fórum detectado na caixa de mensagem';

  @override
  String get peerConfirmAddTitle => 'Adicionar membro da rede?';

  @override
  String peerConfirmAddBody(String name) {
    return 'Adicionar “$name” à chave pública para poder enviar mensagens privadas?';
  }

  @override
  String get peerConfirmAdd => 'Adicionar membro';

  @override
  String peerAddedOk(String name) {
    return 'Adicionado $name aos membros da rede';
  }

  @override
  String get peerAddFromCompose =>
      'Identidade/chave pública detectada na caixa de mensagem';

  @override
  String get peerHashCopied => 'Hash de chave pública copiado';

  @override
  String get peerHashOpenChat => 'Abrir bate-papo';

  @override
  String get peerHashAddHint =>
      'Hash copiado. Peça-lhes que compartilhem seu link de identidade ou QR para que você possa adicionar a chave pública completa do E2EE.';

  @override
  String get peerQrNoCode => 'Nenhum QR ResilNet encontrado nesta imagem';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet identidade: “$name”\nAbra o link ou cole-o no chat → Adicionar membro\nOu escaneie o QR da identidade.';
  }

  @override
  String get identityShareInvite => 'Compartilhar link de identidade';

  @override
  String get identityInviteCopied => 'Link de identidade copiado';

  @override
  String announceInviteSharePreamble(String title) {
    return 'Convite do conselho: “$title”\nAbrir ResilNet → Quadros da comunidade → Seguir a partir do convite\nOu escaneie o QR / toque no link abaixo.';
  }

  @override
  String get announceConfirmFollowTitle => 'Seguir este quadro?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'Seguir “$title” deste convite?';
  }

  @override
  String get announceConfirmFollow => 'Seguir';
}

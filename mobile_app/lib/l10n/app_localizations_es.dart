// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'Actualizando ResilNet…';

  @override
  String get appRefreshed => 'Actualizado: radios y descubrimiento reiniciados';

  @override
  String appRefreshFailed(String error) {
    return 'Error al actualizar: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'Doble toque = actualización suave. Pulsación larga = recuperación difícil. Triple toque = borrado de emergencia.';

  @override
  String get softRefreshTipTitle => 'Si ResilNet se siente atascado';

  @override
  String get softRefreshTipBody =>
      'Toque dos veces ResilNet (arriba a la izquierda) para una actualización suave de la radio. Si aún está atascado: mantenga presionado el título, use \"Recuperación → difícil\" o \"Configuración\". El toque triple es solo una toallita de emergencia.';

  @override
  String get softRefreshTipGotIt => 'Entiendo';

  @override
  String get infoSoftRefreshTitle => 'Si la aplicación se siente atascada';

  @override
  String get infoSoftRefreshStepRefresh =>
      'Toca dos veces ResilNet (arriba a la izquierda) → actualización suave de radios y personas cercanas';

  @override
  String get infoSoftRefreshStepHard =>
      '¿Sigues estancado? Mantenga presionado el título o ⋮ / Configuración → Recuperación completa';

  @override
  String get infoSoftRefreshStepWait =>
      'Espere el resultado snackbar y vuelva a intentarlo. El restablecimiento de sesión conserva sus claves.';

  @override
  String get infoSoftRefreshStepWipe =>
      'Triple toque = borrado de emergencia (elimina datos locales), solo si es intencional';

  @override
  String get appRecoverySection => 'Recuperación de aplicaciones';

  @override
  String get appRecoverySectionSubtitle =>
      'Úselo cuando la aplicación se sienta congelada. Suave = título doble toque. La recuperación dura es más fuerte. El restablecimiento de sesión reinicia los servicios sin borrar las claves.';

  @override
  String get appHardRecoverAction => 'recuperación difícil';

  @override
  String get appHardRecovering => 'Difícil recuperación…';

  @override
  String get appSessionResetAction => 'Restablecer sesión';

  @override
  String get appSessionResetRunning => 'Restableciendo sesión…';

  @override
  String get appSessionResetConfirmTitle => '¿Reiniciar sesión?';

  @override
  String get appSessionResetConfirmBody =>
      'Reinicia los servicios ResilNet en este dispositivo. Se conservan sus claves de identidad.';

  @override
  String get appRecoveryBusy => 'La recuperación ya está en marcha...';

  @override
  String get appRecoveryOk => 'Recuperación terminada';

  @override
  String get appRecoveryPartial =>
      'La recuperación finalizó con algunos pasos omitidos; inténtelo de nuevo si aún está atascado';

  @override
  String get appRecoveryFailed =>
      'La recuperación falló: intente restablecer la sesión o fuerce el cierre de la aplicación desde el sistema operativo';

  @override
  String get localWifiTitle => 'Locales Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'Vincula dispositivos cercanos sin Internet, igual que si estuvieras en una LAN.';

  @override
  String get localWifiNotGatewayHint =>
      'No la puerta de enlace ESP32 LoRa SoftAP. Esto es solo teléfono↔teléfono/LAN.';

  @override
  String get localWifiUnavailable =>
      'El Wi‑Fi local aún no está listo; espere a que se inicie la aplicación.';

  @override
  String get lxmfBridgeTitle => 'Nodo de inicio';

  @override
  String get lxmfBridgeSubtitle =>
      'Mac o Pi opcional en tu Wi‑Fi que transmite chats sellados. Desactivado de forma predeterminada. No reemplaza el cifrado de extremo a extremo.';

  @override
  String get lxmfBridgeEnable => 'Usar nodo de inicio';

  @override
  String get lxmfBridgeDisabledHint =>
      'Actívelo solo cuando la aplicación puente se esté ejecutando en una Mac o Pi en esta red.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'En línea: $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'No se puede llegar al nodo principal: $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'Dirección del nodo principal';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP o http://IP:puerto - ejemplo 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'Par → LXMF destino (JSON)';

  @override
  String get lxmfBridgeRefresh => 'Guardar y actualizar estado';

  @override
  String get lxmfBridgeLabHint => 'Avanzado: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'Configuración del nodo de inicio';

  @override
  String get lxmfBridgeCheckConnection => 'Comprobar conexión';

  @override
  String get lxmfBridgeStatusOnline => 'Conectado al nodo local';

  @override
  String get lxmfBridgeStatusOffline => 'Nodo de inicio no accesible';

  @override
  String get lxmfBridgeYourDest =>
      'La dirección de este nodo (compartir con amigos)';

  @override
  String get lxmfBridgeCopyDest => 'Copiar dirección';

  @override
  String get lxmfBridgeDestCopied => 'Dirección copiada';

  @override
  String get lxmfBridgeLinkedPeers => 'Amigos vinculados';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'Cada amigo necesita su dirección de nodo local una vez. Entonces los chats sellados pueden utilizar esta ruta.';

  @override
  String get lxmfBridgeNoLinks => 'Aún no hay amigos vinculados.';

  @override
  String get lxmfBridgeAddLink => 'Vincular a un amigo';

  @override
  String get lxmfBridgePickPeer => 'amigo';

  @override
  String get lxmfBridgePeerDest => 'Su dirección de nodo local';

  @override
  String get lxmfBridgePeerDestHint =>
      'Código de 32 caracteres desde la pantalla de su nodo de inicio';

  @override
  String get lxmfBridgeInvalidDest =>
      'Esa dirección no parece válida. Pegue el código completo de su nodo principal.';

  @override
  String get lxmfBridgeRemoveLink => 'Desconectar';

  @override
  String get lxmfBridgeSaveLink => 'Ahorrar';

  @override
  String get lxmfBridgeLinkSaved => 'Amigo vinculado';

  @override
  String get lxmfBridgeNoPeers =>
      'Aún no hay contactos a los que enviar mensajes; primero agrega un amigo.';

  @override
  String get lxmfBridgeHelp =>
      'Mantenga el puente funcionando en Mac/Pi. Esta ruta permanece en su LAN; no es LoRa y no reemplaza Internet ni la malla Bluetooth.';

  @override
  String get localWifiModeHotspot => 'Cercano';

  @override
  String get localWifiModeRouter => 'Enrutador';

  @override
  String get localWifiHotspotIntro =>
      'Un dispositivo comparte un punto de acceso personal. Otros se unen a ese punto de acceso y luego ResilNet los encuentra en la red local.';

  @override
  String get localWifiHostAction => 'Crear red (Anfitrión)';

  @override
  String get localWifiJoinAction => 'Unirse a la red';

  @override
  String get localWifiHostSteps =>
      '1. Abra Configuración de iOS/Android y active Personal Hotspot (o Compartir Internet).\n2. Dile a tus amigos el nombre del punto de acceso (y la contraseña).\n3. Vuelve aquí y toca \"El punto de acceso está activado: empieza a esperar\".';

  @override
  String get localWifiHostReady =>
      'El punto de acceso está activado: empieza a esperar';

  @override
  String get localWifiHostWaiting => 'Esperando que se unan amigos...';

  @override
  String get localWifiJoinSteps =>
      '1. Abra la Configuración del sistema y únase al Hotspot personal de su amigo.\n2. Regrese aquí y toque \"Estoy conectado - buscar\".';

  @override
  String get localWifiJoinReady => 'Estoy conectado - buscar';

  @override
  String get localWifiRouterIntro =>
      'Conecte todos los dispositivos al mismo enrutador/AP Wi‑Fi. El enrutador no necesita Internet, solo una red local compartida.';

  @override
  String get localWifiRouterSearch => 'Buscar en este Wi‑Fi';

  @override
  String get localWifiRefreshNetwork => 'Actualizar Wi‑Fi información';

  @override
  String get localWifiRouterNoWifiTitle => 'No en Wi‑Fi';

  @override
  String get localWifiRouterNoWifiBody =>
      'Únase al Wi‑Fi del enrutador en la Configuración del sistema y luego busque nuevamente.';

  @override
  String get localWifiDiscovering => 'Buscando en Wi‑Fi local…';

  @override
  String get localWifiPeersFound => 'Dispositivos en esta red';

  @override
  String get localWifiStop => 'Detener';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi nombre no disponible';

  @override
  String get localWifiStubBanner => 'Esperando la toma LAN...';

  @override
  String get localWifiLiveBanner =>
      'Descubrimiento de LAN en vivo (UDP): anuncio + chat sellado en este Wi‑Fi';

  @override
  String get localWifiEmptyHotspot =>
      'Todavía no hay dispositivos.\nComprueba que tus amigos se unieron a tu punto de acceso y permitieron el acceso a la red local.';

  @override
  String get localWifiEmptyRouter =>
      'Aún no hay dispositivos.\n¿El mismo SSID? ¿Se permite la red local? Algunos enrutadores bloquean el tráfico de dispositivo a dispositivo (aislamiento de AP).';

  @override
  String get localWifiIsolationHelp => '¿Por qué no podemos encontrarnos?';

  @override
  String get localWifiIsolationTitle =>
      'El enrutador puede aislar a los clientes';

  @override
  String get localWifiIsolationBody =>
      'Si el aislamiento de AP/Cliente (o una red de invitados) está activado, los teléfonos en el mismo Wi‑Fi no pueden hablar. Desactive el aislamiento, utilice el SSID principal o cambie al modo Cercano (Hotspot).';

  @override
  String get localWifiPeerReady => 'Listo para chatear (tiene clave)';

  @override
  String get localWifiPeerNeedKey =>
      'Encontrado: escanea QR para intercambiar claves';

  @override
  String get localWifiErrorTitle => 'Error local Wi‑Fi';

  @override
  String get localWifiErrorBody =>
      'Algo salió mal. Deténgase y vuelva a intentarlo.';

  @override
  String get preparingSystem => 'Preparación del sistema';

  @override
  String get bootFailedTitle => 'No se pudo iniciar';

  @override
  String get retry => 'Intentar otra vez';

  @override
  String get bootRecoveryAction =>
      'Iniciar nueva identidad (borrar datos locales)';

  @override
  String get bootRecoveryConfirmTitle => '¿Comenzar una nueva identidad?';

  @override
  String get bootRecoveryConfirmBody =>
      'Esto borrará permanentemente los chats locales, las claves y la identidad en este dispositivo.\nLos compañeros deberán escanear su QR nuevamente con su nueva identidad.\nEsto no se puede deshacer.';

  @override
  String get bootRecoveryRunning => 'Restableciendo la identidad local…';

  @override
  String get bootRecoverySuccess =>
      'Restablecimiento de identidad local completo';

  @override
  String bootRecoveryFailed(String error) {
    return 'No se pudo restablecer la identidad: $error';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Ahorrar';

  @override
  String get close => 'Cerca';

  @override
  String get start => 'Comenzar';

  @override
  String get send => 'Enviar';

  @override
  String get settings => 'Ajustes';

  @override
  String get language => 'Idioma';

  @override
  String get languageSubtitle =>
      'De forma predeterminada, la aplicación sigue el idioma de su teléfono (cuando sea compatible). Otros idiomas recurren al inglés. También puedes bloquear un idioma aquí.';

  @override
  String get languageSystem => 'Valor predeterminado del sistema';

  @override
  String get languageThai => 'tailandés';

  @override
  String get languageEnglish => 'Inglés';

  @override
  String get notificationsTooltip => 'Ajustes de notificaciones';

  @override
  String get enableMessageNotifications =>
      'Habilitar notificaciones de mensajes';

  @override
  String get settingsNotificationsSubtitle =>
      'Mensajes 1:1 y personas en línea (alertas locales)';

  @override
  String get networkMembersTooltip => 'Miembros de la red';

  @override
  String get identityQrTooltip => 'Identidad / QR';

  @override
  String get feedDirects => 'Charlar';

  @override
  String get feedMesh => 'Malla';

  @override
  String get feedGeo => 'Área';

  @override
  String get feedDirectsSubtitle => 'Mensajes privados E2EE';

  @override
  String get feedMeshSubtitle => 'Compañeros cercanos (BLE)';

  @override
  String get feedGeoSubtitle => 'Canal de descubrimiento de Geohash';

  @override
  String get peerIdHint =>
      'Pegue la ID del receptor (Hash de clave pública) para iniciar un chat';

  @override
  String get directsEmpty =>
      'Aún no hay chats: escanea un QR o pega un ID de receptor para comenzar\nLos mensajes se sellan con E2EE antes de enviarlos (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • toque para abrir el chat';

  @override
  String get meshIntro =>
      'Compañeros en el rango BLE: toque para un chat E2EE privado (sin redacción pública en #mesh)\nEnvíos a través de enrutador híbrido (BLE + LoRa + Nostr cuando está en línea)';

  @override
  String get meshEmptyRunning =>
      'Aún no hay compañeros cercanos: abre la aplicación en otro dispositivo dentro del alcance de BLE';

  @override
  String get meshEmptyStopped =>
      'no BLE se está ejecutando: conceder permiso de Bluetooth / ubicación';

  @override
  String get meshNearbyPrefix => 'Cercano';

  @override
  String get meshRetentionTitle => 'Eliminar mensajes automáticamente';

  @override
  String get meshRetentionSubtitle =>
      'El historial de chat local anterior se elimina automáticamente';

  @override
  String get meshRetentionKeep => 'Mantener';

  @override
  String get meshRetention1Day => '1 dia';

  @override
  String get meshRetention3Days => '3 dias';

  @override
  String get meshRetention7Days => '7 dias';

  @override
  String get refreshLocationTooltip => 'Actualizar ubicación';

  @override
  String get geoIntro =>
      'Las personas en línea en este geohash pueden recibir mensajes 1:1 o con un área de distribución pública (aún sellado E2EE por igual, no texto sin formato)';

  @override
  String geoEmpty(String channel) {
    return 'Todavía no hay nadie en $channel línea\nUtilice → Internet de transporte/Automático, espereNostr, actualice la ubicación';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'En línea en $channel • toca para 1:1 E2EE';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'Cerca (en espera de presencia en el área) • toque para E2EE 1:1';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'Visto en Nostr en $channel • solo descubrimiento (heredado)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'Presencia anónima heredada: espere a un par vinculado o intercambie QR';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE cerca: escanea el QR para iniciar E2EE 1:1';

  @override
  String get geoInternetDiscoverHint =>
      'El área de descubrimiento de Internet necesita Nostr conectado (Configuración → Transporte → Internet/Auto)';

  @override
  String get geoEmptyNoLocation =>
      'La ubicación aún no está resuelta: permite el GPS y actualiza para publicar tu geohash en Nostr';

  @override
  String get geoEmptyNeedsPermission =>
      'Permiso de ubicación denegado: permita ResilNet en Configuración → Privacidad → Ubicación';

  @override
  String get geoEmptyServicesDisabled =>
      'Los servicios de ubicación están desactivados: actívalos en Configuración';

  @override
  String get geoEmptyNoGpsFix =>
      'No se pudo obtener una posición de GPS (común en Wi‑Fi iPads): configure geohash manualmente a continuación';

  @override
  String get geoEmptyTeleportHint =>
      'Toque el ícono del lugar → ingrese un geohash (por ejemplo, w5) → Teletransportarse';

  @override
  String get geoSetGeohashManually => 'Establecer geohash';

  @override
  String get geoTeleportHint =>
      '¿Sin GPS? Ingrese el prefijo geohash (de 2 a 7 caracteres, por ejemplo, w5) y toque Teletransportarse';

  @override
  String get geoTeleportInvalid =>
      'Geohash no válido: use solo letras/números base32 (por ejemplo, w5 o w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'Área establecida en $channel';
  }

  @override
  String geoManualActive(String channel) {
    return 'Área manual: $channel (la actualización del GPS se anulará)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr no está listo — toque Reconectar (0/0 hasta que init tenga éxito)';

  @override
  String get geoEmptyMeshOnly =>
      'El transporte es solo en malla: cambie a Internet o Auto para descubrir pares en Nostr';

  @override
  String geoEmptyWaiting(String channel) {
    return 'No hay nadie en $channel todavía: mantenga abierto Área + Internet en ambos dispositivos y espere ~60 segundos.';
  }

  @override
  String get geoChannelFallback => '#área';

  @override
  String get geoRefreshLocation => 'Actualizar ubicación';

  @override
  String get settingsClearLocationTitle => 'Borrar ubicación';

  @override
  String get settingsClearLocationSubtitle =>
      'Eliminar GPS/teletransporte geohash (el área se convierte en #—)';

  @override
  String get settingsClearLocationConfirmTitle => '¿Borrar ubicación?';

  @override
  String get settingsClearLocationConfirmBody =>
      'Elimina el geohash almacenado en este dispositivo. Puedes actualizar el GPS o teletransportarte nuevamente después.';

  @override
  String get settingsClearLocationAction => 'Borrar ubicación';

  @override
  String get settingsClearLocationSnack => 'Ubicación borrada';

  @override
  String get chatVoiceTooLarge =>
      'Nota de voz demasiado grande: máximo ~30 segundos';

  @override
  String get chatVoiceNeedInternet =>
      'La nota de voz necesita Internet (Nostr) — demasiado grande para BLE solo';

  @override
  String get chatVoiceSentInternet => 'Nota de voz enviada vía Internet';

  @override
  String get noticeAnonMention => 'mencionar';

  @override
  String get noticeAnonDm => 'mensaje directo';

  @override
  String get noticeAnonHug => 'abrazo';

  @override
  String get noticeAnonSlap => 'bofetada';

  @override
  String get noticeAnonBlock => 'bloque';

  @override
  String get noticeAnonNeedKey =>
      'Aún no hay clave pública: primero intercambie QR por 1:1';

  @override
  String get noticeAnonActionSent => 'Enviado';

  @override
  String noticeAnonBlocked(String anon) {
    return 'Bloqueado $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '*abrazos $anon*';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* bofetadas $anon *';
  }

  @override
  String get geoReconnectNostr => 'Reconectar Nostr';

  @override
  String get nostrSectionTitle => 'Nostr relés';

  @override
  String get nostrSectionSubtitle =>
      'La mensajería de Internet y el descubrimiento de áreas utilizan estos relés. Toca volver a conectar si el estado permanece desconectado.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'Conectado $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'Sin conexión: relés enumerados pero ninguno conectado';

  @override
  String get nostrStatusNotInit =>
      'No iniciado (0/0): toque Reconectar para inicializar';

  @override
  String get nostrReconnectAction => 'Volver a conectar Nostr';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr conectado ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'Aún sin conexión: consulta Wi‑Fi/celular o inténtalo de nuevo';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'Error: $error';
  }

  @override
  String get nostrReconnecting => 'Conectando a relés...';

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
    return 'Internet (Nostr) en $channel • chat sellado listo';
  }

  @override
  String get transportModeTitle => 'Transporte de área';

  @override
  String get transportModeSubtitle =>
      'Mesh = BLE cerca (radio) cuando no hay Nostr · Internet y Auto = Nostr lista de personas';

  @override
  String get transportModeMesh => 'Malla';

  @override
  String get transportModeInternet => 'Internet';

  @override
  String get transportModeAuto => 'Auto';

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
      'Mensaje público a todos los que están en línea en esta área.';

  @override
  String get geoPublicSend => 'Público';

  @override
  String geoPublicHelp(int count) {
    return 'Distribución sellada para $count pares en línea: cada uno recibe un sobre privado';
  }

  @override
  String geoPublicSent(int count) {
    return 'Enviado a $count pares en esta área';
  }

  @override
  String get geoPublicSentNone =>
      'No hay compañeros en línea a los que se pueda enviar mensajes: abra Área/Malla con pares que tengan claves o espere BLE/Nostr';

  @override
  String get areaPublicBadge => 'Área pública';

  @override
  String get geoErrorPermission =>
      'No se pudo leer la ubicación: verifique el permiso de ubicación';

  @override
  String get geoPrecisionRegion => 'Región';

  @override
  String get geoPrecisionProvince => 'Provincia';

  @override
  String get geoPrecisionCity => 'Ciudad';

  @override
  String get geoPrecisionNeighborhood => 'Vecindario';

  @override
  String get geoPrecisionBlock => 'Bloquear';

  @override
  String get aliasTitle => 'Establecer apodo (alias de contacto)';

  @override
  String get aliasHintBody =>
      'Este alias se almacena solo en este dispositivo (solo local)\nNunca se envía con tráfico E2EE';

  @override
  String get aliasLabel => 'Apodo';

  @override
  String get aliasHint => 'p.ej. “jefe de aldea”, “P’Somchai”…';

  @override
  String get settingsDevices => 'Dispositivos';

  @override
  String get settingsFirmwareTitle => 'Descargar/actualizar ESP32 firmware';

  @override
  String get settingsFirmwareSubtitle =>
      'Descargue archivos .bin y actualice la placa ESP32 mediante OTA';

  @override
  String get mtBridgeTitle => 'Meshtastic puente';

  @override
  String get mtBridgeSettingsSubtitle =>
      'Puente A/B de solo texto: no ResilNet E2EE';

  @override
  String get mtBridgeIntro =>
      'Mueva texto sin formato corto entre Meshtastic y ResilNet. Los modos A y B no pueden funcionar al mismo tiempo. Esto no es cifrado de extremo a extremo.';

  @override
  String get mtBridgeModeLabel => 'Modo';

  @override
  String get mtBridgeModeOff => 'Apagado';

  @override
  String get mtBridgeModeA => 'Ingerir A';

  @override
  String get mtBridgeModeB => 'Salida B';

  @override
  String get mtBridgeModeOffShort => 'Apagado';

  @override
  String get mtBridgeModeAShort => 'en un';

  @override
  String get mtBridgeModeBShort => 'Fuera B';

  @override
  String get mtBridgeMutexHint =>
      'Al seleccionar un modo, el otro se apaga automáticamente. No se admite A+B simultáneo.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'Demostración (registro)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'El texto entrante aparece en Avisos como #meshtastic. El relé de malla es opcional (desactivado de forma predeterminada).';

  @override
  String get mtBridgeRelayTitle => 'También retransmitir en malla ResilNet';

  @override
  String get mtBridgeRelayHint =>
      'Cuando está activado, se transmiten boletines públicos firmados. Desactivado = solo Avisos de este teléfono.';

  @override
  String get mtBridgeSimulateHint => 'Mensaje de demostración';

  @override
  String get mtBridgeSimulate => 'Simular mensaje Meshtastic';

  @override
  String get mtBridgeIngestOk => 'Ingerido en avisos (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'Advertencia: los mensajes enviados aquí NO son ResilNet E2EE. Cualquiera en la ruta Meshtastic puede leerlos.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'Texto a publicar';

  @override
  String get mtBridgeSend => 'Enviar a Meshtastic';

  @override
  String get mtBridgeEgressOk =>
      'En cola para Meshtastic (ver registro/historial)';

  @override
  String get mtBridgeLastEgress => 'última salida';

  @override
  String get mtBridgeEgressHistory => 'Salida reciente';

  @override
  String get mtBridgeOffHint =>
      'Active la ingesta (A) o la salida (B) para usar el puente.';

  @override
  String get mtBridgeNoticeBadge => 'MASHTASTIC · no E2EE';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'Usar transporte MQTT';

  @override
  String get mtBridgeUseMqttHint =>
      'Desactivado = solo registro de demostración (MQTT entrada ignorada). Activado = MQTT para ingesta/salida cuando está conectado.';

  @override
  String get mtBridgeMqttHost => 'Anfitrión del corredor';

  @override
  String get mtBridgeMqttPort => 'Puerto';

  @override
  String get mtBridgeMqttTls => 'Utilice TLS (mqtts)';

  @override
  String get mtBridgeMqttTlsHint =>
      'Puerto típico 8883. Utiliza certificados del sistema; falla suavemente en errores de protocolo de enlace.';

  @override
  String get mtBridgeMqttAutoReconnect => 'Reconexión automática';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'Cuando está activado, el cliente intenta volver a conectarse después de las caídas. El estado muestra Conectando hasta que se restablezca.';

  @override
  String get mtBridgeMqttTopicHelpers => 'Ayudas temáticas';

  @override
  String get mtBridgeMqttRegion => 'Prefijo de región (opcional)';

  @override
  String get mtBridgeMqttRegionHint =>
      'Cuando está configurado, Aplicar reconstruye la raíz como msh/<región>/2/json (anula la raíz del tema).';

  @override
  String get mtBridgeMqttTopicRoot => 'Raíz del tema JSON';

  @override
  String get mtBridgeMqttDownlinkChannel =>
      'Nombre del canal de enlace descendente';

  @override
  String get mtBridgeMqttApplyTopics =>
      'Aplicar raíz → suscribirse / publicar temas';

  @override
  String get mtBridgeMqttAdvanced => 'Avanzado MQTT';

  @override
  String get mtBridgeMqttAdvancedHint => 'TLS, reconexión, temas, credenciales';

  @override
  String get mtBridgeMqttTopicIn => 'Suscribir tema';

  @override
  String get mtBridgeMqttTopicOut => 'Publicar tema';

  @override
  String get mtBridgeMqttGatewayFrom => 'ID del nodo de puerta de enlace (de)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'ID decimal o !hex: requerido para el enlace descendente de envío de texto';

  @override
  String get mtBridgeMqttChannelIndex =>
      'Índice de canal de malla (opcional 0–7)';

  @override
  String get mtBridgeMqttUser => 'Nombre de usuario (opcional)';

  @override
  String get mtBridgeMqttPass => 'Contraseña (opcional)';

  @override
  String get mtBridgeMqttPassStored =>
      'Se almacena una contraseña en este dispositivo (no se muestra).';

  @override
  String get mtBridgeMqttPassReplace =>
      'Nueva contraseña (déjela en blanco para conservarla)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'Déjelo vacío para conservar la contraseña almacenada.';

  @override
  String get mtBridgeMqttPassClear => 'Borrar contraseña';

  @override
  String get mtBridgeMqttSave => 'Guardar MQTT configuración';

  @override
  String get mtBridgeMqttSaved => 'MQTT configuración guardada';

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
  String get mtBridgeMqttError => 'error MQTT';

  @override
  String get mtBridgeErrModeIngest => 'Cambie primero a Ingesta (A)';

  @override
  String get mtBridgeErrModeEgress => 'Cambie primero a Salida (B)';

  @override
  String get mtBridgeErrRate => 'Reduzca la velocidad: tarifa limitada';

  @override
  String get mtBridgeErrDedupe => 'Mensaje duplicado ignorado';

  @override
  String get mtBridgeErrLoop => 'Caído para evitar un bucle de puente';

  @override
  String get mtBridgeErrEmpty => 'El mensaje está vacío.';

  @override
  String get mtBridgeErrPublish => 'Error de publicación';

  @override
  String get mtBridgeErrNotConnected => 'MQTT no conectado';

  @override
  String get mtBridgeErrMissingHost => 'Ingrese MQTT host del intermediario';

  @override
  String get mtBridgeErrMissingTopic => 'Entra a suscribirte y publicar temas.';

  @override
  String get mtBridgeErrMissingFromNode =>
      'Ingrese la identificación del nodo de puerta de enlace (de) para enviar texto';

  @override
  String get mtBridgeErrConnect => 'MQTT conexión fallida';

  @override
  String get mtBridgeErrConnectTls => 'MQTT Error de conexión TLS';

  @override
  String get settingsData => 'Datos';

  @override
  String get settingsDataHint =>
      'Elimine mensajes locales para reducir la base de datos: se conservan la identidad, las claves y los pares';

  @override
  String get settingsSaveHistoryTitle => 'Guardar historial de mensajes';

  @override
  String get settingsSaveHistorySubtitle =>
      'Cuando está desactivado, los mensajes permanecen E2EE en la red y se conservan solo para esta sesión (no en el historial de chat local). Su propio texto todavía se muestra como texto sin formato en este dispositivo.';

  @override
  String get settingsPrivacy => 'Privacidad';

  @override
  String get settingsE2eeTitle => 'Cifrado de extremo a extremo';

  @override
  String get settingsE2eeSubtitle =>
      'Siempre activo: los mensajes se sellan con RSA-OAEP + AES-GCM antes de enviarlos. Los relés y saltos cercanos no pueden leer contenidos.';

  @override
  String get settingsScreenshotTitle => 'Alertas de captura de pantalla';

  @override
  String get settingsScreenshotSubtitle =>
      'Mostrar una línea del sistema en el chat cuando este dispositivo capture la pantalla';

  @override
  String get settingsNostrExpiryTitle => 'Nostr mensaje mantener el tiempo';

  @override
  String get settingsNostrExpirySubtitle =>
      '¿Cuánto tiempo deben permanecer los sobres cerrados localmente cuando están en línea a través de Nostr?';

  @override
  String get noticeExpiresIn => 'caduca en';

  @override
  String get noticesTitle => 'Avisos';

  @override
  String get noticesMeshIntro =>
      'Boletín público: visible para todos los que se encuentren dentro del alcance de la radio, no cifrado. Salta de teléfono a teléfono sin conexión y las ResilNet cajas de retransmisión cercanas guardan una copia para que las personas que lleguen más tarde la vean.';

  @override
  String get noticesMeshPublicBadge => 'PÚBLICO · no cifrado';

  @override
  String get noticesGeoIntro =>
      'Agregue notas breves sobre este lugar para que otros visitantes puedan encontrarlas.';

  @override
  String get noticesEmpty => 'aún no hay avisos';

  @override
  String get noticesEmptyHint =>
      'Fija el primer aviso para la gente de por aquí.';

  @override
  String get noticesComposeHint => 'publicar un aviso...';

  @override
  String get noticesUrgent => 'urgente';

  @override
  String get noticesOpen => 'Avisos';

  @override
  String get screenshotTaken => '* tomaste una captura de pantalla *';

  @override
  String get chatAttachImage => 'Adjuntar imagen';

  @override
  String get chatImageLabel => 'Imagen';

  @override
  String get chatImageTooLarge =>
      'Imagen demasiado grande: prueba con otra foto.';

  @override
  String get chatNostrExpiry => 'Nostr mantener';

  @override
  String geoPublicComposeHint(String channel) {
    return 'Enviar a $channel: público';
  }

  @override
  String get settingsClearTitle => 'Borrar todos los mensajes';

  @override
  String get settingsClearSubtitle =>
      'Eliminar todos los chats en este dispositivo';

  @override
  String get settingsClearConfirmTitle => '¿Borrar todos los mensajes?';

  @override
  String get settingsClearConfirmBody =>
      'Esto elimina todos los mensajes de chat en este dispositivo.\nLos compañeros y apodos no se eliminan.';

  @override
  String get settingsClearAction => 'Borrar datos';

  @override
  String get settingsClearedSnack => 'Datos borrados';

  @override
  String settingsVersion(String version) {
    return 'versión $version';
  }

  @override
  String get meshBleScanning => 'BLE: buscando nodos';

  @override
  String get meshBleEsp32Scanning => 'ESP32: buscando un nodo cercano';

  @override
  String get meshBleSyncing => 'BLE: sincronizando con ESP32';

  @override
  String get meshNostrPublishing => 'Nostr: publicación';

  @override
  String get meshBleIdle =>
      'BLE malla activada: todavía no hay teléfonos cercanos';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE malla: $count teléfono(s) cerca';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: permiso requerido';

  @override
  String get meshBlePausedCamera =>
      'BLE en pausa para la cámara: toca Iniciar BLE';

  @override
  String get meshBleStopped =>
      'BLE está desactivado: comprueba que Bluetooth esté activado y luego toca Iniciar BLE';

  @override
  String get meshBleRestart => 'Iniciar BLE';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Ubicación $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'Verifique los permisos e inicie BLE';

  @override
  String get meshNostrOffline => 'Nostr sin conexión';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count pares cercanos • LoRa $lora • sincronización ~${meters}m';
  }

  @override
  String get meshLoraReady => 'listo';

  @override
  String get meshLoraNotReady => 'no listo';

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
    return 'Puerta de enlace UDP: $label';
  }

  @override
  String get meshGatewayReady => 'Puerta de enlace UDP: listo';

  @override
  String get permissionTitle =>
      'Permitir el acceso para iniciar la red en malla BLE';

  @override
  String get permissionBody =>
      'La aplicación necesita Bluetooth (escanear/conectar/publicar), ubicación (para dispositivos Android más antiguos) y micrófono (para notas de voz en el chat y anuncios) para mensajes comunitarios.';

  @override
  String get permissionE2ee =>
      'Cifrado de extremo a extremo (E2EE)\nLos nodos de retransmisión no pueden leer el contenido del mensaje';

  @override
  String get permissionReady => 'Permisos listos';

  @override
  String get permissionRequest => 'Permitir y continuar';

  @override
  String get permissionNotReadySnack =>
      'El sistema aún no está listo: espere un momento y vuelva a intentarlo.';

  @override
  String get permissionDeniedSnack =>
      'Permisos incompletos: abra Configuración > ResilNet y permita Bluetooth/Ubicación/Micrófono';

  @override
  String get permissionMicDenied =>
      'Acceso al micrófono denegado: permítalo en Configuración para grabar notas de voz';

  @override
  String get permissionMicOpenSettings => 'Ajustes';

  @override
  String get permissionCameraDenied =>
      'Acceso a la cámara denegado: permítale en Configuración escanear códigos QR';

  @override
  String get permissionCameraFailed =>
      'Se requiere permiso de la cámara para escanear códigos QR';

  @override
  String get permissionCameraOpenSettings => 'Ajustes';

  @override
  String get permissionPhotosDenied =>
      'Acceso denegado a la biblioteca de fotografías: permítalo en Configuración para guardar su código QR';

  @override
  String get permissionPhotosFailed =>
      'Se requiere permiso de la biblioteca de fotos para guardar su código QR';

  @override
  String get permissionPhotosOpenSettings => 'Ajustes';

  @override
  String permissionFailedSnack(String error) {
    return 'Error en la solicitud de permiso: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet Arquitectura • Multisalto de almacenamiento y reenvío';

  @override
  String get onboardingSkip => 'Saltar';

  @override
  String get onboardingNext => 'Próximo';

  @override
  String get onboardingStart => 'empezar';

  @override
  String get onboardingWelcomeTitle => 'Bienvenido a ResilNet';

  @override
  String get onboardingWelcomeBody =>
      'Chatea en ResilNet a través de una red en malla, incluso sin Internet';

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
  String get onboardingChannelsTitle => 'Chat cifrado + canales cercanos';

  @override
  String get onboardingChannelsBody =>
      'Cambie #mesh/Area (geohash) para buscar pares cercanos: los mensajes permanecen E2EE sobre BLE mesh y Nostr';

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
  String get chatTitle => 'Charla (E2EE)';

  @override
  String get chatScanTooltip => 'Escanee QR para agregar un compañero';

  @override
  String get chatBlockTooltip => 'Bloquear este remitente';

  @override
  String get chatBlockedSnack =>
      'Bloqueado: sin notificaciones / sin retransmisión';

  @override
  String get chatAliasTooltip => 'Establecer apodo';

  @override
  String get chatReceiverPemLabel => 'Clave pública del destinatario (PEM)';

  @override
  String get chatReceiverPemHint =>
      'Pega la clave pública de tu amigo (desde QR/archivo compartido)';

  @override
  String get chatNeedPeerKey =>
      'Escanee primero el QR de este par (se requiere clave pública verificada)';

  @override
  String get chatPeerKeyMismatch =>
      'La clave pública almacenada no coincide con este ID de par';

  @override
  String chatVoiceFailed(String error) {
    return 'No se pudo grabar audio: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'No se pudo reproducir la nota de voz: $error';
  }

  @override
  String get chatPlayVoice => 'Reproducir nota de voz';

  @override
  String get chatPauseVoice => 'Pausa';

  @override
  String get chatVoiceLabelSent => '🎤 Nota de voz (sellada)';

  @override
  String get chatVoiceLabel => '🎤 Nota de voz';

  @override
  String get chatDecryptFailed => '[falló el descifrado]';

  @override
  String chatSentSealed(String preview) {
    return '[sellado • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[sellado]';

  @override
  String get chatComposeHint => 'Escribe un mensaje… (sellado al enviar)';

  @override
  String get chatEmptyThread =>
      'Aún no hay mensajes\nEscriba a continuación para enviar la malla';

  @override
  String chatLoadFailed(String error) {
    return 'No se pudo cargar la conversación: $error';
  }

  @override
  String get chatEmojiTooltip => 'emojis';

  @override
  String get statusPending => 'Pendiente';

  @override
  String get statusSent => 'Enviado';

  @override
  String get statusRelayed => 'retransmitido';

  @override
  String get statusDelivered => 'Entregado';

  @override
  String get statusRead => 'Leer';

  @override
  String get statusFailed => 'Fallido';

  @override
  String get chatCopy => 'Copiar';

  @override
  String get chatDeleteLocal => 'Eliminar en este dispositivo';

  @override
  String get chatDeletedLocalSnack => 'Eliminado en este dispositivo';

  @override
  String get chatRetry => 'Rever';

  @override
  String get chatSendFailed => 'No entregado: toca Reintentar';

  @override
  String get chatImageNeedInternet =>
      'Conéctate a Internet para enviar imágenes.';

  @override
  String get chatImageTooLargeOnline =>
      'No se pudo comprimir la imagen lo suficiente para enviarla';

  @override
  String get chatOpenLinkFailed => 'No se pudo abrir el enlace';

  @override
  String get identityTitle => 'Identidad';

  @override
  String get identityScanTooltip => 'Escanear QR con cámara';

  @override
  String get identityCopiedHash => 'Hash de clave pública copiado';

  @override
  String get identityPeerSaved => 'Compañero salvado de QR';

  @override
  String get identityGalleryDenied =>
      'Permiso de la biblioteca de fotografías denegado';

  @override
  String get identityQrSaved => 'QR guardado en la biblioteca de fotos';

  @override
  String identityQrSaveFailed(String error) {
    return 'No se pudo guardar el QR: $error';
  }

  @override
  String get peersTitle => 'Miembros de la red';

  @override
  String get qrScanTitle => 'Escanee QR para agregar un amigo';

  @override
  String get qrInvalid => 'Error de escaneo: QR no válido';

  @override
  String get qrIdKeyMismatch =>
      'QR rechazado: la identificación no coincide con la clave pública';

  @override
  String get qrCameraNotReady => 'La cámara no está lista';

  @override
  String get qrRetrySettings => 'Inténtalo de nuevo/abre Configuración';

  @override
  String qrCameraOpenFailed(String error) {
    return 'No se pudo abrir la cámara: $error';
  }

  @override
  String get qrScanAlignHint => 'Alinee el código QR dentro del marco';

  @override
  String get firmwareDownloadTitle => 'Descargar firmware ESP32';

  @override
  String get firmwareSourceOnline => 'Lo último (en línea)';

  @override
  String get firmwareSourceCached => 'Copia guardada (sin conexión)';

  @override
  String get firmwareSourceBaseline => 'Línea base incluida (sin conexión)';

  @override
  String get firmwareSourceUnavailable => 'No hay firmware disponible';

  @override
  String get firmwareBaselineIncompatible =>
      'El firmware incluido es demasiado antiguo: conéctese a Internet para descargar una versión más reciente';

  @override
  String get firmwareChecksumFailed =>
      'Error en la verificación de integridad del firmware: parpadeo bloqueado';

  @override
  String firmwareReadyFromSource(String source) {
    return 'Firmware listo: $source';
  }

  @override
  String get peersRefreshTooltip => 'Refrescar';

  @override
  String get peersBlocked => 'Obstruido';

  @override
  String get peersNearbyBle => 'Cerca (BLE)';

  @override
  String get peersRecentlyOnline => 'Recientemente en línea';

  @override
  String get peersOnlineInArea => 'En línea en el área';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return 'Visto hace $minutes min';
  }

  @override
  String get peersOffline => 'Desconectado';

  @override
  String peersBlockedSnack(String id) {
    return 'Bloqueado $id';
  }

  @override
  String get peersUnblockedSnack => 'Desbloqueado';

  @override
  String get peersEmpty =>
      'Aún no hay miembros en la base de datos.\nEscanea un QR o espera a que BLE descubra la malla';

  @override
  String get peersOpenChat => 'abrir chat';

  @override
  String get peersBlockAction => 'Bloquear';

  @override
  String get peersUnblockAction => 'Desatascar';

  @override
  String get channelPickerTooltip => 'Chat / #mesh / Área';

  @override
  String get locationPickerTooltip => 'Canal de ubicación';

  @override
  String get transportPickerTooltip => 'Malla / Internet / Auto';

  @override
  String get onlinePeopleTooltip => 'personas en línea';

  @override
  String get unreadDirectsTooltipEmpty => 'Mensajes privados';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count mensajes privados no leídos';
  }

  @override
  String get onlinePeopleTitle => 'gente';

  @override
  String get onlinePeopleEmpty => 'No hay nadie en línea aquí todavía.';

  @override
  String onlinePeopleCount(int count) {
    return '$count en línea';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · cercano + área';

  @override
  String get peerOnlineMeshTitle => 'Alguien cerca en malla';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name está cerca en la malla';
  }

  @override
  String get peerOnlineAreaTitle => 'Alguien en línea en el área';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name está en línea a través de Nostr';
  }

  @override
  String get locationSheetTitle => '#canales de ubicación';

  @override
  String get channelPinsTitle => 'Fijado';

  @override
  String get channelPinsHint =>
      'Fija los canales que usas con frecuencia: permanecen en la parte superior';

  @override
  String get channelPinTooltip => 'Fijar este canal';

  @override
  String get channelUnpinTooltip => 'Desprender';

  @override
  String get locationSheetIntro =>
      'Chatea con personas cercanas usando geohash aproximado, no GPS preciso. La presencia en Internet utiliza claves Nostr anónimas.';

  @override
  String get locationMeshSubtitle => '#bluetooth • ~10–50 metros';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => 'Teletransportarse';

  @override
  String homeComposeHint(String channel) {
    return 'Mensaje $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return 'Enviar a $channel: público';
  }

  @override
  String get messageExpiryTitle => 'caduca en';

  @override
  String get voiceRecordTapToStart => 'Toque para grabar un mensaje de voz';

  @override
  String get voiceRecordTooShort =>
      'Grabación demasiado corta: inténtelo de nuevo';

  @override
  String get voiceRecordFailed =>
      'No se pudo guardar la grabación. Inténtalo de nuevo.';

  @override
  String get voicePttHold => 'Mantener para grabar';

  @override
  String get voicePttRelease => 'Liberar para obtener una vista previa';

  @override
  String get voicePttRecording => 'Grabación…';

  @override
  String get voicePttDraftReady => 'Nota de voz lista';

  @override
  String get voicePttDiscard => 'Desechar';

  @override
  String get voicePttReRecord => 'Grabar de nuevo';

  @override
  String get voicePttSend => 'Enviar nota de voz';

  @override
  String get voicePttPlayPreview => 'Reproducir vista previa';

  @override
  String get voicePttStopPreview => 'Detener vista previa';

  @override
  String get noticesBackfilling => 'Cargando avisos…';

  @override
  String get noticesNostrOnline => 'Nostr en línea';

  @override
  String get noticesNostrOffline =>
      'Nostr sin conexión: el boletín necesita Internet';

  @override
  String noticesBackfillLoaded(int count) {
    return '$count avisos cargados';
  }

  @override
  String get noticePublishFailed =>
      'No se pudo publicar el aviso a la junta del área. Verifique la conexión Nostr.';

  @override
  String get noticeMeshPublishNoLink =>
      'Guardado localmente. Conéctate a una radio en malla cercana (o puerta de enlace Wi‑Fi) para que otros puedan recibirla.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'Boletín enviado a $count dispositivos cercanos durante BLE.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'Se detectaron radios cercanas, pero BLE falló la escritura. Mantén ambas aplicaciones abiertas en la pantalla de Avisos e inténtalo de nuevo (o usa un repetidor ESP32).';

  @override
  String get noticeMeshPublishNoGatt =>
      'El receptor BLE de este dispositivo no está listo. Active Bluetooth y vuelva a abrir Avisos.';

  @override
  String get noticeDelete => 'Eliminar aviso';

  @override
  String get noticeDeleteConfirmTitle => '¿Eliminar este aviso?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'Esto lo elimina solo en este dispositivo. Otros que ya lo recibieron todavía lo verán.';

  @override
  String get noticeDeleted => 'Aviso eliminado';

  @override
  String get chatNoticeHidden => 'Aviso de área — abrir Avisos';

  @override
  String get identityDisplayNameTitle => 'Nombre para mostrar';

  @override
  String get identitySaveName => 'Guardar nombre';

  @override
  String get identityUserIdLabel => 'ID de usuario (hash de clave pública)';

  @override
  String get identityCopyHashTooltip => 'Copiar hash de clave pública';

  @override
  String get identityMyQrTitle => 'Mi QR (id + pubKey + nombre)';

  @override
  String identityQrFailed(String error) {
    return 'No se pudo crear QR\n$error';
  }

  @override
  String get identitySaving => 'Ahorro…';

  @override
  String get identitySaveQr => 'Guardar QR en la biblioteca de fotos';

  @override
  String get identityOpenScanner => 'Abre la cámara para escanear QR';

  @override
  String get identityQrHelp =>
      'Pídele a un amigo que escanee esto para guardar tu clave pública y (si es necesario) configurarte como emisor verificado.';

  @override
  String get identityChatTip =>
      'Consejo: también puedes escanear un QR en el chat para agregar una clave pública para E2EE';

  @override
  String get infoOpen => 'Acerca de / Información';

  @override
  String get docsGuideTitle => 'Guía de usuario';

  @override
  String get docsGuideSubtitle => 'Se abre en el navegador';

  @override
  String get docsOpenAction => 'abrir guia';

  @override
  String get docsOpenFailed => 'No se pudo abrir la guía del usuario';

  @override
  String get firmwareOtaGuideTitle => 'Guía flash y protocolo OTA';

  @override
  String get firmwareOtaGuideSubtitle =>
      'Abre la guía web: descargas .bin y pasos completos';

  @override
  String get firmwareWebDownloadsTitle => 'Descargas de firmware en la web';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'Enlaces por versión y sumas de verificación en el sitio de documentos';

  @override
  String get inviteCopyShortLink => 'Copiar enlace corto';

  @override
  String get inviteShareLink => 'Compartir enlace';

  @override
  String get inviteShowFullLink => 'enlace completo';

  @override
  String get inviteCopyFullLink => 'Copiar enlace completo';

  @override
  String get inviteLinkCopied => 'Enlace copiado';

  @override
  String get inviteLongPressHint =>
      'Mantenga presionado para acciones de enlace';

  @override
  String get inviteSendInChat => 'Enviar en ResilNet chat…';

  @override
  String get inviteSendInChatHint =>
      'Sólo las personas para las que ya tienes una clave pública';

  @override
  String get inviteSendInChatEmpty =>
      'Aún no hay chats para enviar mensajes.\nPrimero escanee un QR, abra Área/Malla o comparta el enlace fuera de la aplicación.';

  @override
  String get inviteSentToChat => 'Invitación enviada en el chat';

  @override
  String get infoTabInfo => 'Información';

  @override
  String get infoTabSettingsHint =>
      'Abra Configuración desde el menú para herramientas de idioma, E2EE y datos.';

  @override
  String get infoHowToTitle => 'Cómo utilizarlo';

  @override
  String get infoHowToBody =>
      '• Toque el ícono del canal para cambiar Chat / #mesh / Área\n• Toca el lugar para elegir el tamaño del geohash\n• Toque personas para miembros o quién está en línea\n• Open Identity/QR desde ⋮ para intercambiar claves en persona\n• El área “pública” envía E2EE sellado a cada par en línea, no a una sala de texto plano';

  @override
  String get infoFeaturesTitle => 'Características';

  @override
  String get infoFeatureOffline =>
      'Mensajería sin conexión a través de Bluetooth Low Energy';

  @override
  String get infoFeatureE2ee =>
      'Cifrado de extremo a extremo con RSA-OAEP + AES-GCM (sin ruido)';

  @override
  String get infoFeatureMultihop =>
      'Los mensajes pueden saltar a través de compañeros cercanos para ir más lejos';

  @override
  String get infoFeatureBridge =>
      'Malla híbrida ↔ internet (Nostr) para sobres cerrados';

  @override
  String get infoFeatureGeo =>
      'Canales geohash locales para personas cercanas (descubrimiento UX)';

  @override
  String get infoFeatureNotices => 'Avisos con vencimiento para #mesh y Area';

  @override
  String get infoPrivacyTitle => 'Privacidad';

  @override
  String get infoPrivacyNoRoom =>
      'Sin pueblo de texto sin formato/sala de chat pública en el cable';

  @override
  String get infoPrivacyFanout =>
      'Envío de área = distribución sellada 1:1 a pares con claves públicas conocidas';

  @override
  String get infoPrivacyPresence =>
      'La presencia en el área de Internet utiliza claves efímeras Nostr';

  @override
  String get infoSymbolsTitle => 'Símbolos';

  @override
  String get infoSymBle => 'Enlace Bluetooth directo';

  @override
  String get infoSymMesh => 'Accesible a través de malla (otros adelante)';

  @override
  String get infoSymInternet => 'Vía internet (Nostr) — sobres cerrados';

  @override
  String get infoSymBridge =>
      'Llegó a través de la ruta del puente de Internet mesh↔';

  @override
  String get infoSymOffline => 'Sin conexión: no accesible en este momento';

  @override
  String get infoSymInArea => 'En el área de este canal de ubicación';

  @override
  String get infoSymE2eeOk => 'Sesión cifrada de extremo a extremo';

  @override
  String get infoSymE2eeFail =>
      'Cifrado no disponible: no envíe mensajes de texto confidenciales';

  @override
  String get infoSymVerified => 'Identidad verificada/clave conocida';

  @override
  String get infoSymBlocked => 'Obstruido';

  @override
  String get infoSymUnread => 'Mensaje privado no leído';

  @override
  String get infoEmergencyTitle => 'Modo de emergencia';

  @override
  String get infoEmergencyBody =>
      'Toca tres veces el título ResilNet en la pantalla de inicio para borrar mensajes, claves e identidad en este dispositivo.';

  @override
  String get infoLegendNote =>
      'Algunos íconos de ruta están documentados aquí para mayor claridad; Los ticks de entrega en el chat siguen siendo el estado de envío principal.';

  @override
  String get dangerZoneTitle => 'Zona de peligro';

  @override
  String get dangerZoneSubtitle =>
      'Elimina mensajes, claves de cifrado, identidad Nostr, pares y apodos en este dispositivo. Lo configurarás nuevamente.';

  @override
  String get panicWipeTitle => 'Limpieza de emergencia';

  @override
  String get panicWipeSubtitle =>
      'Borrar todo lo local, lo mismo que tocar tres veces el título local (tocar dos veces actualiza las radios)';

  @override
  String get panicWipeConfirmTitle => '¿Borrar todos los datos locales?';

  @override
  String get panicWipeConfirmBody =>
      'Esto elimina permanentemente los chats, las claves y la identidad en este teléfono.\nLos compañeros deben volver a intercambiar claves QR con su nueva identidad.\nEsto no se puede deshacer.';

  @override
  String get panicWipeAction => 'Limpia todo';

  @override
  String get panicWipeSnack => 'Identidad local borrada: configurada de nuevo';

  @override
  String panicWipeFailed(String error) {
    return 'Error al borrar: $error';
  }

  @override
  String get meshBridgeTitle => 'Puente de malla';

  @override
  String get meshBridgeSubtitle =>
      'Cuando está activado (predeterminado), los sobres sellados pueden usar BLE malla e Internet (Nostr) juntos para que las islas de malla cercanas puedan conectarse. Cuando está desactivado, los envíos utilizan una sola ruta; nunca colocan texto sin formato en el cable.';

  @override
  String get favoritesTitle => 'Favoritos';

  @override
  String get favoritesAdd => 'Añadir a favoritos';

  @override
  String get favoritesRemove => 'Quitar de favoritos';

  @override
  String get favoritesEmpty =>
      'Aún no hay favoritos: destaca a un compañero de la lista de miembros';

  @override
  String get favoritesNearbyTitle => 'Favorito cercano';

  @override
  String favoritesNearbyBody(String name) {
    return '$name está cerca en la malla';
  }

  @override
  String get favoritesInAreaTitle => 'Favorito en la zona';

  @override
  String favoritesInAreaBody(String name) {
    return '$name está en línea en esta área';
  }

  @override
  String get topologyTitle => 'Topología de malla';

  @override
  String get topologySubtitle =>
      'Pares y sugerencias de conexión del anuncio de malla (solo lectura)';

  @override
  String get topologyConnectedNow => 'Conectado ahora (BLE)';

  @override
  String get topologyNearby => 'Cerca (BLE)';

  @override
  String get topologyKnown => 'Compañeros conocidos';

  @override
  String get topologyEmpty =>
      'Ningún compañero ha aprendido todavía: quédate cerca con BLE activado';

  @override
  String get topologyYou => 'tú';

  @override
  String topologyStats(int peers, int links) {
    return '$peers pares · $links enlaces';
  }

  @override
  String get topologyGraphHint =>
      'Estimado a partir del descubrimiento de malla cercana: su dispositivo está resaltado. Toque un compañero para abrir el chat.';

  @override
  String get topologyOpen => 'Topología de malla';

  @override
  String get slashHelpTitle => 'Comandos';

  @override
  String get slashHelpBody =>
      '/ayuda — esta lista\n/who — personas en línea en el canal actual\n/drop <text>: fije aquí un aviso sellado (distribución E2EE)\n\nGuía completa: use Abrir guía a continuación o Configuración → Guía del usuario.';

  @override
  String get slashWhoEmpty =>
      'No hay nadie en línea en este canal en este momento.';

  @override
  String slashWhoTitle(int count) {
    return 'En línea ($count)';
  }

  @override
  String get slashDropNeedText => 'Uso: /soltar el texto de su nota';

  @override
  String slashDropDone(String channel) {
    return 'Aviso eliminado el $channel';
  }

  @override
  String get slashUnknown => 'Comando desconocido: prueba /ayuda';

  @override
  String get announceOpen => 'Anuncios';

  @override
  String get announceTitle => 'Anuncios';

  @override
  String get announceEmpty =>
      'Aún no hay tableros: cree uno para publicar avisos abiertos o bloqueados';

  @override
  String get announceCreate => 'Crear tablero';

  @override
  String get announceCreateHint => 'Nombre del tablero';

  @override
  String get announceDefaultTitle => 'junta comunitaria';

  @override
  String get announceSettings => 'Configuración del tablero';

  @override
  String get announceAllowLocked =>
      'Permitir publicaciones bloqueadas (cifradas)';

  @override
  String get announceAllowLockedSub =>
      'Cifrado con la clave del tablero: los lectores necesitan acceso';

  @override
  String get announceAllowOpen =>
      'Permitir publicaciones abiertas (texto sin formato)';

  @override
  String get announceAllowOpenSub =>
      'No E2EE: legible en malla/relés. Desactivado de forma predeterminada.';

  @override
  String get announceComposeHint => 'Escribe un anuncio...';

  @override
  String get announceMediaInternetOnly =>
      'Los anuncios con foto o voz se envían a través de Internet (no BLE)';

  @override
  String get announceNeedInternet =>
      'Conéctese a Internet para enviar anuncios con fotografías o de voz.';

  @override
  String announceVoiceFailed(String error) {
    return 'No se pudo grabar la voz: $error';
  }

  @override
  String get announceImageTooLarge =>
      'La imagen es demasiado grande (máximo ~180 KB)';

  @override
  String get announcePlayVoice => 'Reproducir nota de voz';

  @override
  String get announceImageLabel => '📷 Imagen';

  @override
  String get announceAudioLabel => '🎤 Nota de voz';

  @override
  String get announceModeLocked => 'bloqueado';

  @override
  String get announceModeOpen => 'Abierto';

  @override
  String get announceOpenBadge => 'ABIERTO · no cifrado';

  @override
  String get announceLockedBadge => 'bloqueado';

  @override
  String get announceLockedPlaceholder => 'Cifrado: solicita acceso para leer';

  @override
  String get announceRequestAccess => 'Solicitar acceso';

  @override
  String get announceRequestSent =>
      'Solicitud de acceso enviada al propietario del tablero.';

  @override
  String get announceRequestFailed =>
      'No se pudo solicitar acceso (se necesita la clave pública del propietario)';

  @override
  String get announceOpenConfirmTitle => '¿Publicar sin cifrado?';

  @override
  String get announceOpenConfirmBody =>
      'Las publicaciones abiertas no son E2EE. Cualquiera que se encuentre en el camino (malla/relés) podrá leerlos. ¿Continuar?';

  @override
  String get announcePostAction => 'Correo';

  @override
  String get announcePendingRequests => 'Solicitudes de acceso';

  @override
  String get announceApprove => 'Aprobar';

  @override
  String get announceDeny => 'Denegar';

  @override
  String get announceGranted =>
      'Puedes leer publicaciones bloqueadas en este foro.';

  @override
  String get announceOwner => 'Eres dueño de este tablero';

  @override
  String get announceCopyInvite => 'Copiar texto de invitación';

  @override
  String get announceShowInviteQr => 'Mostrar invitación QR';

  @override
  String get announceScanInviteQr => 'Escanear tablero de invitación QR';

  @override
  String get announceFollow => 'Seguir el tablero desde la invitación';

  @override
  String get announceFollowHint =>
      'Pega el texto de la invitación o el enlace ResilNet del propietario.';

  @override
  String get announceFollowOk => 'siguiente tablero';

  @override
  String announceFollowOkNamed(String title) {
    return 'Ahora siguiendo “$title”';
  }

  @override
  String get announceFollowFail => 'La invitación no es válida o está dañada';

  @override
  String get announceInviteCopied => 'Texto de invitación copiado';

  @override
  String get announceInviteSaveQr => 'Guardar QR';

  @override
  String get announceInviteShare => 'Compartir invitación';

  @override
  String get announceFollowFromCompose =>
      'Invitación a la junta detectada en el cuadro de mensaje';

  @override
  String get peerConfirmAddTitle => '¿Añadir miembro de la red?';

  @override
  String peerConfirmAddBody(String name) {
    return '¿Agregar “$name” con su clave pública para poder enviarles mensajes de forma privada?';
  }

  @override
  String get peerConfirmAdd => 'Agregar miembro';

  @override
  String peerAddedOk(String name) {
    return 'Se agregó $name a los miembros de la red.';
  }

  @override
  String get peerAddFromCompose =>
      'Identidad/clave pública detectada en el cuadro de mensaje';

  @override
  String get peerHashCopied => 'Hash de clave pública copiado';

  @override
  String get peerHashOpenChat => 'abrir chat';

  @override
  String get peerHashAddHint =>
      'Hash copiado. Pídales que compartan su enlace de identidad o QR para que pueda agregar la clave pública completa para E2EE.';

  @override
  String get peerQrNoCode => 'No se encontró ningún ResilNet QR en esta imagen';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet identidad: “$name”\nAbra el enlace o péguelo en el chat → Agregar miembro\nO escanear el QR de identidad.';
  }

  @override
  String get identityShareInvite => 'Compartir enlace de identidad';

  @override
  String get identityInviteCopied => 'Enlace de identidad copiado';

  @override
  String announceInviteSharePreamble(String title) {
    return 'Invitación a la junta directiva: “$title”\nTableros de ResilNet → la comunidad abierta → Seguir desde la invitación\nO escanee el QR / toque el siguiente enlace.';
  }

  @override
  String get announceConfirmFollowTitle => '¿Seguir este tablero?';

  @override
  String announceConfirmFollowBody(String title) {
    return '¿Seguir a “$title” desde esta invitación?';
  }

  @override
  String get announceConfirmFollow => 'Seguir';
}

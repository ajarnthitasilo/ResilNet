#include "wifi_udp_bridge.h"

#if defined(NODE_TYPE_LORA_GATEWAY)

#include <WiFi.h>
#include <WiFiUdp.h>
#include <esp_mac.h>
#include <esp_wifi.h>

#include "config.h"
#include "transport_router.h"

static WifiUdpBridge s_wifiUdp;

WifiUdpBridge& wifiUdpBridge() { return s_wifiUdp; }

static String softApSsid() {
  uint8_t mac[6];
  esp_read_mac(mac, ESP_MAC_WIFI_SOFTAP);
  char buf[32];
  snprintf(buf, sizeof(buf), "ResilNet-Node-%02X%02X", mac[4], mac[5]);
  return String(buf);
}

static void onWifiEvent(WiFiEvent_t event, WiFiEventInfo_t /*info*/) {
  switch (event) {
    case ARDUINO_EVENT_WIFI_AP_STACONNECTED:
      s_wifiUdp.onStationConnected();
      break;
    case ARDUINO_EVENT_WIFI_AP_STADISCONNECTED:
      s_wifiUdp.onStationDisconnected();
      break;
    default:
      break;
  }
}

bool WifiUdpBridge::parseUdpPayload(const uint8_t* data, size_t len,
                                    ResilNetRadioPacket& out) {
  if (resilnet_decode_frame(data, len, out)) return true;

  if (len < 19) return false;
  memcpy(out.packet_id, data, 16);
  out.ttl = data[16];
  out.payload_len = (uint16_t)data[17] | ((uint16_t)data[18] << 8);
  if (out.payload_len > sizeof(out.payload)) return false;
  if (len < 19 + out.payload_len) return false;
  memcpy(out.payload, data + 19, out.payload_len);
  return true;
}

bool WifiUdpBridge::ensureApRunning() {
  if (_apActive) return true;

#if !WIFI_AP_ALWAYS_ON
  if (_apStoppedAtMs != 0 && (millis() - _apStoppedAtMs) < 30000UL) {
    return false;
  }
#endif

  const String ssid = softApSsid();
  WiFi.mode(WIFI_AP);
  WiFi.setSleep(false);

  const IPAddress localIp(192, 168, 4, 1);
  const IPAddress gateway(192, 168, 4, 1);
  const IPAddress subnet(255, 255, 255, 0);
  WiFi.softAPConfig(localIp, gateway, subnet);

  bool ok = false;
  if (WIFI_AP_PASSWORD[0] != '\0') {
    ok = WiFi.softAP(ssid.c_str(), WIFI_AP_PASSWORD);
  } else {
    ok = WiFi.softAP(ssid.c_str());
  }

  if (!ok) {
    Serial.println("[WiFi] softAP start failed");
    return false;
  }

  _udp.stop();
  if (!_udp.begin(WIFI_UDP_PORT)) {
    Serial.println("[WiFi] UDP bind failed");
    WiFi.softAPdisconnect(true);
    return false;
  }

  _apActive = true;
  _lastStationActivityMs = millis();
  _apStoppedAtMs = 0;
  Serial.printf("[WiFi] SoftAP \"%s\" IP %s UDP :%u\n", ssid.c_str(),
                WiFi.softAPIP().toString().c_str(), WIFI_UDP_PORT);
  return true;
}

void WifiUdpBridge::stopSoftAp() {
  if (!_apActive) return;

  _udp.stop();
  WiFi.softAPdisconnect(true);
  WiFi.mode(WIFI_OFF);
  _apActive = false;
  _apStoppedAtMs = millis();
  Serial.println("[WiFi] SoftAP stopped (power save)");
}

void WifiUdpBridge::pollPowerSave() {
#if WIFI_AP_ALWAYS_ON
  return;
#else
  if (!_apActive) return;

  if (WiFi.softAPgetStationNum() > 0) {
    _lastStationActivityMs = millis();
    return;
  }

  if (millis() - _lastStationActivityMs >= WIFI_AP_IDLE_TIMEOUT_MS) {
    stopSoftAp();
  }
#endif
}

void WifiUdpBridge::onStationConnected() {
  _lastStationActivityMs = millis();
  Serial.printf("[WiFi] station connected (total=%d)\n", WiFi.softAPgetStationNum());
}

void WifiUdpBridge::onStationDisconnected() {
  _lastStationActivityMs = millis();
  Serial.printf("[WiFi] station disconnected (total=%d)\n",
                WiFi.softAPgetStationNum());
}

void WifiUdpBridge::onBleActivity() {
  _apStoppedAtMs = 0;
  ensureApRunning();
  _lastStationActivityMs = millis();
}

void WifiUdpBridge::broadcastPacket(const ResilNetRadioPacket& pkt) {
  if (!_apActive) return;

  uint8_t frame[RESILNET_RADIO_FRAME_MAX];
  const size_t frameLen = resilnet_encode_frame(pkt, frame, sizeof(frame));
  if (frameLen == 0) return;

  const IPAddress broadcast(192, 168, 4, 255);
  _udp.beginPacket(broadcast, WIFI_UDP_PORT);
  _udp.write(frame, frameLen);
  if (_udp.endPacket()) {
    Serial.printf("[WiFi] UDP broadcast %u bytes\n", (unsigned)frameLen);
  }
}

bool WifiUdpBridge::begin() {
  WiFi.onEvent(onWifiEvent);
  return ensureApRunning();
}

void WifiUdpBridge::taskUdp(void* arg) {
  auto* self = static_cast<WifiUdpBridge*>(arg);
  uint8_t buf[RESILNET_RADIO_FRAME_MAX];

  while (true) {
    if (!self->_apActive) {
      self->ensureApRunning();
      vTaskDelay(pdMS_TO_TICKS(500));
      continue;
    }

    self->pollPowerSave();

    const int packetSize = self->_udp.parsePacket();
    if (packetSize > 0) {
      const int n = self->_udp.read(buf, sizeof(buf));
      if (n > 0) {
        ResilNetRadioPacket pkt{};
        if (self->parseUdpPayload(buf, static_cast<size_t>(n), pkt)) {
          self->_lastStationActivityMs = millis();
          transportForwardFromUdp(pkt);
        } else {
          Serial.printf("[WiFi] invalid UDP payload (%d bytes)\n", n);
        }
      }
    }

    vTaskDelay(pdMS_TO_TICKS(10));
  }
}

void WifiUdpBridge::startTask() {
  xTaskCreatePinnedToCore(taskUdp, "TaskWiFiUDP", TASK_WIFI_UDP_STACK, this,
                          TASK_WIFI_UDP_PRIO, nullptr, 1);
}

#endif  // NODE_TYPE_LORA_GATEWAY

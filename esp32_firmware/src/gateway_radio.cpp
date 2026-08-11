#include "gateway_radio.h"

#if defined(NODE_TYPE_LORA_GATEWAY)

#include "halow_manager.h"

static GatewayRadioManager s_gatewayRadio;

GatewayRadioManager& gatewayRadio() { return s_gatewayRadio; }

void GatewayRadioManager::begin() {
#if HALOW_ENABLE
  _preference = GW_RADIO_AUTO;
#else
  _preference = GW_RADIO_LORA;
#endif
}

void GatewayRadioManager::setPreference(uint8_t mode) {
  if (mode > GW_RADIO_AUTO) return;
  _preference = mode;
}

uint8_t GatewayRadioManager::resolvedRadio() const {
  switch (_preference) {
    case GW_RADIO_HALOW:
#if HALOW_ENABLE
      if (halow().isCapable() && (halow().linkUp() || halow().isStub()))
        return GW_RADIO_HALOW;
#endif
      return GW_RADIO_LORA;
    case GW_RADIO_LORA:
      return GW_RADIO_LORA;
    case GW_RADIO_AUTO:
    default:
#if HALOW_ENABLE
      if (halow().isCapable() && halow().linkUp()) return GW_RADIO_HALOW;
#endif
      return GW_RADIO_LORA;
  }
}

uint8_t GatewayRadioManager::buildCapsMask() const {
  uint8_t mask = GW_CAP_LORA;
#if HALOW_ENABLE
  if (halow().isCapable()) mask |= GW_CAP_HALOW;
  if (halow().linkUp()) mask |= GW_CAP_HALOW_UP;
  if (halow().isStub()) mask |= GW_CAP_HALOW_STUB;
#endif
  return mask;
}

#endif  // NODE_TYPE_LORA_GATEWAY

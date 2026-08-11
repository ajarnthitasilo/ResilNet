#pragma once

#include <Arduino.h>

#include "gateway_control.h"

/// Resolved gateway radio preference (LoRa / HaLow / Auto).
class GatewayRadioManager {
 public:
  void begin();
  void setPreference(uint8_t mode);
  uint8_t preference() const { return _preference; }

  /// Effective TX path after Auto resolution.
  uint8_t resolvedRadio() const;

  uint8_t buildCapsMask() const;
  uint8_t activeRadioWire() const { return resolvedRadio(); }

 private:
  uint8_t _preference = GW_RADIO_AUTO;
};

GatewayRadioManager& gatewayRadio();

#include "lora_manager.h"

#if defined(NODE_TYPE_LORA_GATEWAY)

#include <RadioLib.h>
#include <SPI.h>

#include "config.h"

static Module* s_module = nullptr;
static SX1262* s_radio = nullptr;
static LoRaManager s_lora;

LoRaManager& lora() { return s_lora; }

bool LoRaManager::begin() {
  SPI.begin(LORA_PIN_SCK, LORA_PIN_MISO, LORA_PIN_MOSI, LORA_PIN_NSS);

  s_module = new Module(LORA_PIN_NSS, LORA_PIN_DIO1, LORA_PIN_RST, LORA_PIN_BUSY);
  s_radio = new SX1262(s_module);

  Serial.printf("[LoRa] Init SX1262 @ %lu Hz\n", (unsigned long)LORA_FREQ_HZ);

  int state = s_radio->begin((float)LORA_FREQ_HZ / 1e6f, LORA_BW_KHZ, LORA_SF, LORA_CR,
                             LORA_SYNC_WORD, LORA_TX_POWER_DBM, LORA_PREAMBLE_LEN, LORA_CRC_ON);
  if (state != RADIOLIB_ERR_NONE) {
    Serial.printf("[LoRa] begin() failed: %d\n", state);
    return false;
  }

  _tx_queue = xQueueCreate(LORA_TX_QUEUE_LEN, sizeof(ResilNetRadioPacket));
  if (!_tx_queue) {
    Serial.println("[LoRa] TX queue create failed");
    return false;
  }

  _ready = true;
  Serial.println("[LoRa] Radio ready");
  return true;
}

void LoRaManager::setRxCallback(LoRaRxCallback cb, void* user) {
  _rx_cb = cb;
  _rx_user = user;
}

bool LoRaManager::enqueueTx(const ResilNetRadioPacket& pkt) {
  if (!_tx_queue) return false;
  return xQueueSend(_tx_queue, &pkt, pdMS_TO_TICKS(100)) == pdTRUE;
}

bool LoRaManager::transmitNow(const ResilNetRadioPacket& pkt) {
  if (!_ready || !s_radio) return false;

  uint8_t frame[RESILNET_RADIO_FRAME_MAX];
  const size_t len = resilnet_encode_frame(pkt, frame, sizeof(frame));
  if (len == 0) {
    Serial.println("[LoRa] encode failed");
    return false;
  }

  const int state = s_radio->transmit(frame, len);
  if (state != RADIOLIB_ERR_NONE) {
    Serial.printf("[LoRa] TX error: %d\n", state);
    return false;
  }

  Serial.printf("[LoRa] TX ok len=%u ttl=%u\n", (unsigned)len, pkt.ttl);
  return true;
}

void LoRaManager::onPacketReceived(const ResilNetRadioPacket& pkt) {
  // กรองซ้ำก่อนประมวลผลต่อ
  if (!_dedup.accept(pkt.packet_id)) {
    Serial.println("[LoRa] dedup drop");
    return;
  }

  if (_rx_cb) _rx_cb(pkt, _rx_user);
}

void LoRaManager::taskRx(void* arg) {
  auto* self = static_cast<LoRaManager*>(arg);
  uint8_t buf[RESILNET_RADIO_FRAME_MAX];

  Serial.println("[LoRa] TaskLoRaRx started");

  while (true) {
    if (!s_radio) {
      vTaskDelay(pdMS_TO_TICKS(500));
      continue;
    }

    const int state = s_radio->receive(buf, sizeof(buf));
    if (state == RADIOLIB_ERR_NONE) {
      const size_t len = s_radio->getPacketLength();
      ResilNetRadioPacket pkt{};
      if (resilnet_decode_frame(buf, len, pkt)) {
        self->onPacketReceived(pkt);
      } else {
        Serial.println("[LoRa] invalid frame (CRC/magic)");
      }
    } else if (state != RADIOLIB_ERR_RX_TIMEOUT) {
      Serial.printf("[LoRa] RX err: %d\n", state);
    }

    vTaskDelay(pdMS_TO_TICKS(5));
  }
}

void LoRaManager::taskTx(void* arg) {
  auto* self = static_cast<LoRaManager*>(arg);
  ResilNetRadioPacket pkt;

  Serial.println("[LoRa] TaskLoRaTx started");

  while (true) {
    if (xQueueReceive(self->_tx_queue, &pkt, portMAX_DELAY) == pdTRUE) {
      self->transmitNow(pkt);
      vTaskDelay(pdMS_TO_TICKS(10));
    }
  }
}

void LoRaManager::startTasks() {
  xTaskCreatePinnedToCore(taskRx, "TaskLoRaRx", TASK_LORA_RX_STACK, this, TASK_LORA_RX_PRIO,
                          nullptr, 1);
  xTaskCreatePinnedToCore(taskTx, "TaskLoRaTx", TASK_LORA_TX_STACK, this, TASK_LORA_TX_PRIO,
                          nullptr, 1);
}

uint8_t LoRaManager::readBatteryPercent() const {
  // TODO: อ่าน ADC แบตจริง — ตอนนี้จำลอง ~85%
#ifdef NODE_TYPE_STANDALONE_REPEATER
  return 85;
#else
  return 100;
#endif
}

#endif  // NODE_TYPE_LORA_GATEWAY

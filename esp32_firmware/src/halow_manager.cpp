#include "halow_manager.h"

#if defined(NODE_TYPE_LORA_GATEWAY)

static HaLowManager s_halow;

HaLowManager& halow() { return s_halow; }

bool HaLowManager::begin() {
#if !HALOW_ENABLE
  _ready = false;
  return false;
#else
  _dedup_mutex = xSemaphoreCreateMutex();
  _tx_queue =
      xQueueCreate(8, sizeof(ResilNetRadioPacket));
  _ready = _dedup_mutex != nullptr && _tx_queue != nullptr;
#if HALOW_STUB_LOOPBACK
  _link_up = false;
#else
  _link_up = false;
#endif
  Serial.println("[HaLow] stub driver ready (HALOW_ENABLE=1, link_up=0 until assoc)");
  return _ready;
#endif
}

void HaLowManager::setRxCallback(HaLowRxCallback cb, void* user) {
  _rx_cb = cb;
  _rx_user = user;
}

bool HaLowManager::isCapable() const {
#if HALOW_ENABLE
  return _ready;
#else
  return false;
#endif
}

bool HaLowManager::linkUp() const {
#if HALOW_ENABLE
  return _ready && _link_up;
#else
  return false;
#endif
}

bool HaLowManager::isStub() const {
#if HALOW_ENABLE
  return _ready;
#else
  return false;
#endif
}

bool HaLowManager::dedupCheckAndRegister(const uint8_t packet_id[16]) {
  if (_dedup_mutex == nullptr) return _dedup.accept(packet_id);
  xSemaphoreTake(_dedup_mutex, portMAX_DELAY);
  const bool fresh = _dedup.accept(packet_id);
  xSemaphoreGive(_dedup_mutex);
  return fresh;
}

bool HaLowManager::transmitNow(const ResilNetRadioPacket& pkt) {
#if !HALOW_ENABLE
  (void)pkt;
  return false;
#else
  Serial.printf("[HaLow] TX stub ttl=%u len=%u\n", pkt.ttl, pkt.payload_len);
#if HALOW_STUB_LOOPBACK
  onPacketReceived(pkt);
#endif
  return true;
#endif
}

bool HaLowManager::enqueueTx(const ResilNetRadioPacket& pkt) {
#if !HALOW_ENABLE
  (void)pkt;
  return false;
#else
  if (_tx_queue == nullptr) return false;
  return xQueueSend(_tx_queue, &pkt, pdMS_TO_TICKS(50)) == pdTRUE;
#endif
}

void HaLowManager::flushTxQueue() {
#if HALOW_ENABLE
  if (_tx_queue == nullptr) return;
  xQueueReset(_tx_queue);
  Serial.println("[HaLow] TX queue flushed (radio switch)");
#endif
}

void HaLowManager::onPacketReceived(const ResilNetRadioPacket& pkt) {
  if (!dedupCheckAndRegister(pkt.packet_id)) {
    Serial.println("[HaLow] duplicate RX — drop");
    return;
  }
  if (_rx_cb) _rx_cb(pkt, _rx_user);
}

void HaLowManager::taskTx(void* arg) {
  auto* self = static_cast<HaLowManager*>(arg);
  ResilNetRadioPacket pkt{};
  while (true) {
    if (xQueueReceive(self->_tx_queue, &pkt, portMAX_DELAY) == pdTRUE) {
      self->transmitNow(pkt);
    }
  }
}

void HaLowManager::startTasks() {
#if HALOW_ENABLE
  xTaskCreatePinnedToCore(taskTx, "TaskHaLowTx", 4096, this, 2, nullptr, 0);
#endif
}

#endif  // NODE_TYPE_LORA_GATEWAY

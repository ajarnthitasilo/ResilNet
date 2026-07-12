#include "packet.h"

#if defined(NODE_TYPE_LORA_GATEWAY)

uint16_t resilnet_crc16(const uint8_t* data, size_t len) {
  uint16_t crc = 0xFFFF;
  for (size_t i = 0; i < len; i++) {
    crc ^= (uint16_t)data[i] << 8;
    for (int b = 0; b < 8; b++) {
      if (crc & 0x8000)
        crc = (crc << 1) ^ 0x1021;
      else
        crc <<= 1;
    }
  }
  return crc;
}

size_t resilnet_encode_frame(const ResilNetRadioPacket& pkt, uint8_t* out, size_t out_cap) {
  if (pkt.payload_len > sizeof(pkt.payload)) return 0;

  const size_t body_len = 16 + 1 + 2 + pkt.payload_len;
  const size_t frame_len = 2 + body_len + 2;
  if (out_cap < frame_len) return 0;

  size_t idx = 0;
  out[idx++] = RESILNET_RADIO_MAGIC_HI;
  out[idx++] = RESILNET_RADIO_MAGIC_LO;

  memcpy(out + idx, pkt.packet_id, 16);
  idx += 16;
  out[idx++] = pkt.ttl;
  out[idx++] = (uint8_t)(pkt.payload_len & 0xFF);
  out[idx++] = (uint8_t)((pkt.payload_len >> 8) & 0xFF);
  memcpy(out + idx, pkt.payload, pkt.payload_len);
  idx += pkt.payload_len;

  const uint16_t crc = resilnet_crc16(out + 2, body_len);
  out[idx++] = (uint8_t)(crc & 0xFF);
  out[idx++] = (uint8_t)((crc >> 8) & 0xFF);

  return frame_len;
}

bool resilnet_decode_frame(const uint8_t* data, size_t len, ResilNetRadioPacket& out) {
  if (len < 2 + 16 + 1 + 2 + 2) return false;
  if (data[0] != RESILNET_RADIO_MAGIC_HI || data[1] != RESILNET_RADIO_MAGIC_LO) return false;

  size_t idx = 2;
  memcpy(out.packet_id, data + idx, 16);
  idx += 16;
  out.ttl = data[idx++];
  out.payload_len = (uint16_t)data[idx] | ((uint16_t)data[idx + 1] << 8);
  idx += 2;

  if (out.payload_len > sizeof(out.payload)) return false;
  if (idx + out.payload_len + 2 > len) return false;

  memcpy(out.payload, data + idx, out.payload_len);
  idx += out.payload_len;

  const uint16_t recv_crc = (uint16_t)data[idx] | ((uint16_t)data[idx + 1] << 8);
  const uint16_t calc_crc = resilnet_crc16(data + 2, 16 + 1 + 2 + out.payload_len);
  return recv_crc == calc_crc;
}

bool resilnet_packet_id_equal(const uint8_t* a, const uint8_t* b) {
  return memcmp(a, b, 16) == 0;
}

void resilnet_packet_id_copy(uint8_t* dst, const uint8_t* src) {
  memcpy(dst, src, 16);
}

void resilnet_generate_uuid_v4(uint8_t out[16]) {
  for (int i = 0; i < 16; i++) out[i] = (uint8_t)(esp_random() & 0xFF);
  out[6] = (out[6] & 0x0F) | 0x40;
  out[8] = (out[8] & 0x3F) | 0x80;
}

void resilnet_build_heartbeat(ResilNetRadioPacket& pkt, uint8_t battery_pct) {
  memset(&pkt, 0, sizeof(pkt));
  resilnet_generate_uuid_v4(pkt.packet_id);
  pkt.ttl = 1;
  pkt.payload[0] = 'H';
  pkt.payload[1] = 'B';
  pkt.payload[2] = battery_pct;
  pkt.payload[3] = 0;
  pkt.payload_len = 4;
}

#endif  // NODE_TYPE_LORA_GATEWAY

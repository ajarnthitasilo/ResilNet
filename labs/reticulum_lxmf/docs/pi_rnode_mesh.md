# Pi + RNode mesh — phone ↔ Pi ↔(LoRa)↔ Pi ↔ phone

คู่มือตั้งโหนดบ้านแบบพกพา 2 เครื่อง ให้คุยกันด้วย **Reticulum บน LoRa (RNode)**
โดยมือถือคุยกับ Pi ข้างตัวผ่าน **HTTP** เท่านั้น

> Lab / operator setup — ยังไม่ใช่ product สำเร็จรูป และ **คนละ stack** กับ
> ESP32/Heltec LoRa ของ ResilNet (เฟรม 230B) ดู [`overhead.md`](overhead.md)

---

## สถาปัตยกรรม

```text
มือถือ A ──HTTP(LAN)──► Pi A (bridge + rnsd + RNode)
                                     │
                                     │  Reticulum over LoRa
                                     │  (RNode ↔ RNode, พารามิเตอร์วิทยุตรงกัน)
                                     ▼
มือถือ B ──HTTP(LAN)──► Pi B (bridge + rnsd + RNode)
```

- มือถือ **ไม่รัน** Reticulum — ส่ง **ซอง E2EE (sealed)** ให้ Pi ผ่าน HTTP
- Pi ห่อเป็น **LXMF (RNLB blob)** แล้วส่งข้าม LoRa ด้วย Reticulum
- bridge **ถอดข้อความไม่ได้** — เห็นแค่ opaque bytes

---

## สิ่งที่ทำได้แล้ว vs ยังไม่ทำ

| ส่วน | สถานะ |
|------|--------|
| มือถือ → HTTP → Pi (bridge) | ทำได้ (โค้ด lab เดียวกับ Mac) |
| Pi ↔ Pi ส่ง LXMF opaque | พิสูจน์แล้วใน lab (ผ่าน TCP; วิทยุใช้ config เดียวกัน) |
| LoRa/RNode ระหว่าง Pi | **คุณตั้งเอง** ใน `config/pi_home/config` (ฮาร์ดแวร์จริง) |
| ค้นหา Pi เพื่อนอัตโนมัติ | ยังไม่มี — แลก LXMF dest เอง |
| `TransportType::LxmfBridge` (Rust) | ยังไม่ทำ — แอปส่ง HTTP จาก Flutter |
| แฟลช RNode จาก lab นี้ | **ไม่ทำ** — ใช้เครื่องมือ RNode/rnodeconf แยก |

---

## BOM (ต่อ 1 ฝั่ง — ต้องมี 2 ชุด)

| ของ | หมายเหตุ |
|-----|----------|
| Raspberry Pi (Zero 2 W / 3 / 4 / 5) | + microSD + ไฟ/พาวเวอร์แบงก์ |
| อุปกรณ์ **RNode** | บอร์ด LoRa ที่แฟลช **RNode firmware** (ไม่ใช่ ESP32 ResilNet) |
| เสาอากาศตรงย่านความถี่ | ต่อก่อนเปิดส่งเสมอ |
| สาย USB / (ออปชัน) BLE/WiFi | เชื่อม Pi ↔ RNode |

> **กฎหมายวิทยุ:** เลือกความถี่/กำลังส่งที่ถูกกฎหมายในประเทศคุณ
> (เช่น EU 868 MHz duty-cycle, US 915 MHz) และไม่เกินเพดานฮาร์ดแวร์
> ตั้ง `txpower` แบบระมัดระวัง ทดสอบระยะในที่โล่งก่อนพึ่งพา

---

## Checklist ตั้งค่า (ทำทั้ง 2 Pi)

### 1) OS / repo
- [ ] Raspberry Pi OS ล่าสุด, SSH ได้, เวลาถูกต้อง
- [ ] คัดลอก repo มาที่ Pi → เข้า `labs/reticulum_lxmf/`
- [ ] ใช้ **path จริง** (อย่ารันผ่าน symlink — RNS shared instance อาจพัง)

### 2) venv
```bash
cd labs/reticulum_lxmf
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
```

### 3) RNode + Reticulum config
- [ ] เสียบ RNode, หา serial port: `ls /dev/ttyUSB* /dev/ttyACM*`
- [ ] แก้ `config/pi_home/config`:
  - [ ] `port =` ให้ตรงอุปกรณ์
  - [ ] `frequency / bandwidth / spreadingfactor / codingrate` **ตรงกันทั้งสอง Pi**
  - [ ] `txpower` ภายในเพดานกฎหมาย + ฮาร์ดแวร์
- [ ] (ออปชัน) เปิด `[[Test TCP ...]]` เพื่อทดสอบ path ก่อนมีวิทยุ

ตัวอย่างบล็อก RNode (มีเต็มในไฟล์ template):

```ini
[[RNode LoRa]]
  type = RNodeInterface
  enabled = yes
  port = /dev/ttyUSB0
  frequency = 868200000
  bandwidth = 125000
  txpower = 7
  spreadingfactor = 8
  codingrate = 5
```

### 4) เปิดโหนด
```bash
# ตรวจก่อน (ไม่ต้องมีวิทยุ):
DRY_RUN=1 ./start_home_node_pi.sh

# เปิดจริง (ต้องเสียบ RNode):
./start_home_node_pi.sh
```
- [ ] `curl http://127.0.0.1:8765/status` ได้ `"ok": true` + `lxmf_destination`
- [ ] ตรวจวิทยุขึ้นใน `logs/rnsd-pi.log` (ไม่ error/loop)
- [ ] ดู path RNS ระหว่างสอง Pi: `.venv/bin/rnstatus --config config/pi_home`

### 5) ผูกกับแอป
- [ ] มือถืออยู่ hotspot/LAN เดียวกับ Pi
- [ ] Settings → Home node → ใส่ `IP_ของ_Pi:8765`
- [ ] กดตรวจการเชื่อมต่อ → ออนไลน์
- [ ] **แลก LXMF dest** ระหว่างสองฝั่ง → ผูกเพื่อนในแอป
- [ ] ส่งแชต 1:1 sealed ผ่าน Home node ขณะ **ไม่มีเน็ต** (มีแต่ LoRa)

---

## ทดสอบก่อนมีวิทยุ (สองเครื่อง / VPN)

ใน `config/pi_home/config` เปิด `[[Test TCP Server]]` บน Pi หนึ่ง และ
`[[Test TCP Client]]` (ชี้ IP ของอีกฝั่ง) บนอีก Pi แล้วรัน
`./start_home_node_pi.sh` ทั้งคู่ จากนั้นทดสอบส่งด้วย fake client:

```bash
DEST=$(curl -s http://<PI_B_IP>:8765/status | .venv/bin/python -c 'import sys,json;print(json.load(sys.stdin)["lxmf_destination"])')
.venv/bin/python -m bridge send --config config/pi_home --name pi-a \
  --dest "$DEST" --to-peer-id peer_b --from-peer-id peer_a --sealed-hex cafe
```
บน Pi B ดู `GET /inbox` ว่ามี `RNLB DELIVERED` — พอ path RNS วิ่งได้แล้ว
ค่อยสลับไปใช้ RNode LoRa

---

## Troubleshooting

| อาการ | แก้ |
|-------|-----|
| `Not connected to shared rnsd` | ใช้ path จริง; `enable_transport`+`share_instance = Yes`; รัน `rnsd` ก่อน bridge |
| RNode device ไม่พบ | เช็ค `port =` / `ls /dev/ttyUSB*`; สิทธิ์ `dialout` group |
| interface ไม่ขึ้น / loop | ดู `logs/rnsd-pi.log`; ตรวจ firmware = RNode จริง |
| ไม่มี path ระหว่าง Pi | พารามิเตอร์วิทยุ **ต้องตรงกันเป๊ะ**; ทั้งคู่ต้อง `announce`; ระยะ/เสาอากาศ |
| `No path to destination` | เปิดทั้งสองโหนด, รอ announce, เช็ค `rnstatus` |
| ข้อความใหญ่/ช้า | LoRa bandwidth ต่ำ — LXMF overhead สูง (ดู `overhead.md`); ใช้ข้อความสั้น |

---

## ขอบเขต (สำคัญ)

- Path นี้ = Reticulum/LXMF บน RNode — **ไม่ใช่** ESP32/Heltec LoRa 230B ของ ResilNet
- **อย่า** ใส่ full LXMF ลง path วิทยุ 230B ของ ResilNet (ดู `overhead.md`, `bridge_app_integration.md`)
- มือถือไม่ได้ฝัง Reticulum ใน 1.9.64 — คุยกับ Pi ผ่าน HTTP เท่านั้น

---

## Quick EN summary

Two portable Raspberry Pis each run the lab **bridge + rnsd + an RNode LoRa
interface**. Phones talk to their local Pi over **HTTP** (sealed opaque bytes);
the Pis relay those as **LXMF over Reticulum on LoRa**. Radio params
(`frequency/bandwidth/spreadingfactor/codingrate`) **must match** on both Pis.
Edit `config/pi_home/config`, run `./start_home_node_pi.sh`, exchange each
node's `lxmf_destination`, and link peers in the app. This is an operator/lab
setup and is a **different radio stack** from ResilNet's ESP32 230B LoRa path —
do not put full LXMF on that path.

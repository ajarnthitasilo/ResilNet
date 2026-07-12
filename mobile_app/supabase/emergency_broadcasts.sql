-- ประกาศเตือนภัยฉุกเฉิน (ช่องทาง Internet / dual-channel กับ BLE Mesh)
-- รันใน Supabase SQL Editor

-- สร้างตารางเก็บข้อมูลประกาศฉุกเฉิน
CREATE TABLE IF NOT EXISTS public.emergency_broadcasts (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  local_id TEXT NOT NULL,
  sender_id TEXT NOT NULL,
  payload TEXT NOT NULL,
  lat DOUBLE PRECISION NOT NULL,
  lon DOUBLE PRECISION NOT NULL,
  radius_m DOUBLE PRECISION NOT NULL,
  broadcast_timestamp BIGINT NOT NULL,
  signature TEXT NOT NULL,
  signed_payload TEXT NOT NULL,
  ttl INTEGER DEFAULT 3600,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Index สำหรับประสิทธิภาพในการดึงข้อมูลตามพื้นที่หรือเวลา
CREATE INDEX IF NOT EXISTS idx_broadcasts_timestamp
  ON public.emergency_broadcasts (broadcast_timestamp DESC);

-- เปิดใช้งาน Row Level Security
ALTER TABLE public.emergency_broadcasts ENABLE ROW LEVEL SECURITY;

-- 1. อ่านได้ทุกคน (Public Broadcasts)
DROP POLICY IF EXISTS "anon_read_broadcasts" ON public.emergency_broadcasts;
CREATE POLICY "anon_read_broadcasts" ON public.emergency_broadcasts
  FOR SELECT TO anon USING (true);

-- 2. กรรมการ/ผู้นำส่งข้อมูลได้ (Authenticated Insert)
DROP POLICY IF EXISTS "auth_insert_broadcasts" ON public.emergency_broadcasts;
CREATE POLICY "auth_insert_broadcasts" ON public.emergency_broadcasts
  FOR INSERT TO authenticated WITH CHECK (true);

-- หมายเหตุสำหรับแอป ResilNet:
-- แอปใช้ Anonymous Sign-In ตอนเปิด Supabase เพื่อได้ session แบบ authenticated
-- เปิดใช้งานที่ Dashboard → Authentication → Providers → Anonymous sign-ins

-- Realtime: เปิด Replication สำหรับตารางนี้ใน Dashboard → Database → Replication

-- รายชื่อกรรมการที่มีสิทธิ์ส่งเตือนภัย (Trusted Issuers)
-- รันใน Supabase SQL Editor

-- 1. ลบตารางเก่า (ถ้ามี) เพื่อเริ่มโครงสร้างใหม่
DROP TABLE IF EXISTS public.committee_keys;

-- 2. สร้างตารางใหม่ตาม Schema ที่คุณกำหนด
CREATE TABLE public.committee_keys (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  public_key_hash TEXT NOT NULL UNIQUE,
  display_name TEXT,
  public_key_pem TEXT NOT NULL,
  is_active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- 3. สร้าง Index เพื่อความเร็วในการค้นหา
CREATE INDEX idx_committee_keys_active
  ON public.committee_keys (is_active)
  WHERE is_active = true;

-- 4. ตั้งค่า RLS และ Policy
ALTER TABLE public.committee_keys ENABLE ROW LEVEL SECURITY;

CREATE POLICY "anon_read_committee_keys" ON public.committee_keys
  FOR SELECT TO anon USING (is_active = true);

-- 5. Migration จาก schema เก่า (ถ้ามีคอลัมน์ name / ไม่มี public_key_pem)
-- ALTER TABLE public.committee_keys RENAME COLUMN name TO display_name;
-- ALTER TABLE public.committee_keys ADD COLUMN IF NOT EXISTS public_key_pem TEXT;

-- 6. ตัวอย่าง seed (แทน public_key_hash / PEM ด้วยค่าจริงจากหน้า Identity ในแอป)
-- INSERT INTO public.committee_keys (public_key_hash, display_name, public_key_pem)
-- VALUES (
--   'YOUR_PUBLIC_KEY_HASH',
--   'นายก อบต.',
--   '-----BEGIN PUBLIC KEY-----
-- MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA...
-- -----END PUBLIC KEY-----'
-- );

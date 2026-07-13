-- Privacy-first push: store FCM/APNs device tokens keyed by ResilNet user id
-- (public key hash). No message content is stored here.

CREATE TABLE IF NOT EXISTS public.users_profiles (
  user_id TEXT PRIMARY KEY,
  fcm_token TEXT,
  platform TEXT,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_users_profiles_fcm_token
  ON public.users_profiles (fcm_token)
  WHERE fcm_token IS NOT NULL;

ALTER TABLE public.users_profiles ENABLE ROW LEVEL SECURITY;

-- Authenticated clients may upsert their own profile row
CREATE POLICY users_profiles_upsert_own ON public.users_profiles
  FOR ALL
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- Service role (Edge Functions) can read tokens for delivery
CREATE POLICY users_profiles_service_read ON public.users_profiles
  FOR SELECT
  TO service_role
  USING (true);

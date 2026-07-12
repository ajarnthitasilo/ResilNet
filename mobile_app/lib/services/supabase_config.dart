/// ตั้งค่า Supabase ของโปรเจกต์
///
/// ใส่ค่าจริงของคุณที่นี่ (อย่า commit secret หาก repo เป็น public)
/// - URL: https://xxxx.supabase.co  (ไม่ต้องใส่ /rest/v1)
/// - KEY: anon public key (เริ่มต้นด้วย eyJ...)
class SupabaseConfig {
  SupabaseConfig._();

  static const url = 'https://bjhwmehtwzydluimkrid.supabase.co';
  static const anonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJqaHdtZWh0d3p5ZGx1aW1rcmlkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODM1ODkwNjQsImV4cCI6MjA5OTE2NTA2NH0.6gzo0DaATj7aPJDad1HdRGupbORqij1fl7E5iFd7-VM';

  /// ตาราง Postgres สำหรับระบบเตือนภัย
  static const committeeKeysTable = 'committee_keys';
  static const emergencyBroadcastsTable = 'emergency_broadcasts';

  /// Legacy: Supabase Storage (fallback ถ้าดึงจากตารางไม่ได้)
  static const trustedKeysBucket = 'config';
  static const trustedKeysPath = 'trusted_keys.json';
}

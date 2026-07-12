import 'package:supabase_flutter/supabase_flutter.dart';

/// เรียกใช้ครั้งเดียวตอนเริ่มแอป (เช่นใน main()).
///
/// ใส่ค่า URL + Anon key ของคุณแทน placeholder ก่อนนำไปใช้จริง
Future<void> initSupabase() async {
  await Supabase.initialize(
    url: '[https://bjhwmehtwzydluimkrid.supabase.co/rest/v1/]',
    // supabase_flutter รุ่นใหม่ใช้ publishableKey แทน anonKey
    publishableKey:
        '[eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJqaHdtZWh0d3p5ZGx1aW1rcmlkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODM1ODkwNjQsImV4cCI6MjA5OTE2NTA2NH0.6gzo0DaATj7aPJDad1HdRGupbORqij1fl7E5iFd7-VM]',
  );
}

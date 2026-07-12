/// ช่วย map คอลัมน์จาก Supabase (รองรับชื่อที่ต่างกันเล็กน้อย)
class SupabaseRowMapper {
  static String pickString(Map<String, dynamic> row, List<String> keys) {
    for (final k in keys) {
      final v = row[k];
      if (v == null) continue;
      final s = v.toString().trim();
      if (s.isNotEmpty) return s;
    }
    return '';
  }

  static double? pickDouble(Map<String, dynamic> row, List<String> keys) {
    for (final k in keys) {
      final v = row[k];
      if (v is num) return v.toDouble();
      if (v is String) {
        final parsed = double.tryParse(v);
        if (parsed != null) return parsed;
      }
    }
    return null;
  }

  static int? pickInt(Map<String, dynamic> row, List<String> keys) {
    for (final k in keys) {
      final v = row[k];
      if (v is num) return v.toInt();
      if (v is String) {
        final parsed = int.tryParse(v);
        if (parsed != null) return parsed;
      }
    }
    return null;
  }

  static bool isActive(Map<String, dynamic> row) {
    final v = row['is_active'] ?? row['active'];
    if (v == null) return true;
    if (v is bool) return v;
    if (v is num) return v != 0;
    final s = v.toString().toLowerCase();
    return s == 'true' || s == '1' || s == 'yes';
  }

  static int updatedAtMs(Map<String, dynamic> row) {
    final raw = row['updated_at'] ?? row['created_at'];
    if (raw is String) {
      return DateTime.tryParse(raw)?.millisecondsSinceEpoch ?? 0;
    }
    if (raw is DateTime) return raw.millisecondsSinceEpoch;
    return 0;
  }
}

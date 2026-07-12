use std::collections::HashMap;
use std::time::{Duration, Instant};

use parking_lot::Mutex;

/// ผลการตรวจสอบข้อความซ้ำ
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum DedupDecision {
    /// ข้อความใหม่ — ควรประมวลผลต่อ
    Accept,
    /// เคยเห็นแล้วภายในหน้าต่างเวลา — ทิ้ง (กันซ้ำจาก Internet + BLE)
    Duplicate,
}

/// LRU + TTL cache สำหรับกรอง message id ซ้ำ
///
/// ใช้ HashMap + ลำดับการเข้าถึงแบบง่าย (evict ตัวเก่าสุดเมื่อเต็ม)
/// และลบรายการที่หมดอายุตาม `ttl`
pub struct DedupCache {
    capacity: usize,
    ttl: Duration,
    /// id -> (เวลาที่บันทึก, ลำดับเข้าถึงล่าสุด)
    entries: Mutex<HashMap<String, (Instant, u64)>>,
    access_seq: Mutex<u64>,
}

impl DedupCache {
    pub fn new(capacity: usize, ttl: Duration) -> Self {
        assert!(capacity > 0, "dedup capacity must be > 0");
        Self {
            capacity,
            ttl,
            entries: Mutex::new(HashMap::with_capacity(capacity)),
            access_seq: Mutex::new(0),
        }
    }

    /// ตรวจและบันทึก id — คืน Duplicate หากเคยเห็นภายใน TTL
    pub fn check_and_record(&self, id: &str) -> DedupDecision {
        let now = Instant::now();
        let mut map = self.entries.lock();
        let mut seq = self.access_seq.lock();
        *seq += 1;
        let current_seq = *seq;

        // ลบรายการหมดอายุ
        map.retain(|_, (ts, _)| now.duration_since(*ts) < self.ttl);

        if let Some((ts, _)) = map.get(id) {
            if now.duration_since(*ts) < self.ttl {
                return DedupDecision::Duplicate;
            }
        }

        // Evict เก่าสุดถ้าเต็ม
        if map.len() >= self.capacity {
            if let Some(oldest_key) = map
                .iter()
                .min_by_key(|(_, (_, s))| *s)
                .map(|(k, _)| k.clone())
            {
                map.remove(&oldest_key);
            }
        }

        map.insert(id.to_owned(), (now, current_seq));
        DedupDecision::Accept
    }

    pub fn len(&self) -> usize {
        self.entries.lock().len()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn rejects_duplicate_within_ttl() {
        let cache = DedupCache::new(100, Duration::from_secs(60));
        assert_eq!(cache.check_and_record("msg-1"), DedupDecision::Accept);
        assert_eq!(cache.check_and_record("msg-1"), DedupDecision::Duplicate);
    }

    #[test]
    fn accepts_after_ttl_expires() {
        let cache = DedupCache::new(100, Duration::from_millis(1));
        assert_eq!(cache.check_and_record("msg-2"), DedupDecision::Accept);
        std::thread::sleep(Duration::from_millis(5));
        assert_eq!(cache.check_and_record("msg-2"), DedupDecision::Accept);
    }
}

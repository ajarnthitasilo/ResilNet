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
/// แยก cache สำหรับ chunk stream (audio/firmware) เพื่อไม่ให้ thrash หลัก
pub struct DedupCache {
    capacity: usize,
    ttl: Duration,
    /// id -> (เวลาที่บันทึก, ลำดับเข้าถึงล่าสุด)
    entries: Mutex<HashMap<String, (Instant, u64)>>,
    access_seq: Mutex<u64>,
    /// chunk frame dedup — TTL สั้นกว่า, จำกัดจำนวน
    chunk_capacity: usize,
    chunk_ttl: Duration,
    chunk_entries: Mutex<HashMap<String, Instant>>,
}

impl DedupCache {
    pub fn new(capacity: usize, ttl: Duration) -> Self {
        assert!(capacity > 0, "dedup capacity must be > 0");
        Self {
            capacity,
            ttl,
            entries: Mutex::new(HashMap::with_capacity(capacity)),
            access_seq: Mutex::new(0),
            chunk_capacity: capacity.saturating_mul(2).max(512),
            chunk_ttl: Duration::from_secs(45),
            chunk_entries: Mutex::new(HashMap::with_capacity(512)),
        }
    }

    fn next_seq(&self) -> u64 {
        let mut seq = self.access_seq.lock();
        *seq += 1;
        *seq
    }

    fn purge_expired(map: &mut HashMap<String, (Instant, u64)>, ttl: Duration, now: Instant) {
        map.retain(|_, (ts, _)| now.duration_since(*ts) < ttl);
    }

    fn purge_expired_chunks(map: &mut HashMap<String, Instant>, ttl: Duration, now: Instant) {
        map.retain(|_, ts| now.duration_since(*ts) < ttl);
    }

    fn evict_lru(map: &mut HashMap<String, (Instant, u64)>, capacity: usize) {
        if map.len() < capacity {
            return;
        }
        if let Some(oldest_key) = map
            .iter()
            .min_by_key(|(_, (_, s))| *s)
            .map(|(k, _)| k.clone())
        {
            map.remove(&oldest_key);
        }
    }

    fn evict_oldest_chunk(map: &mut HashMap<String, Instant>, capacity: usize) {
        while map.len() >= capacity {
            if let Some(oldest_key) = map
                .iter()
                .min_by_key(|(_, ts)| *ts)
                .map(|(k, _)| k.clone())
            {
                map.remove(&oldest_key);
            } else {
                break;
            }
        }
    }

    /// ตรวจและบันทึก id — คืน Duplicate หากเคยเห็นภายใน TTL
    pub fn check_and_record(&self, id: &str) -> DedupDecision {
        let now = Instant::now();
        let mut map = self.entries.lock();
        let current_seq = self.next_seq();

        Self::purge_expired(&mut map, self.ttl, now);

        if let Some((ts, _)) = map.get(id) {
            if now.duration_since(*ts) < self.ttl {
                return DedupDecision::Duplicate;
            }
        }

        Self::evict_lru(&mut map, self.capacity);
        map.insert(id.to_owned(), (now, current_seq));
        DedupDecision::Accept
    }

    /// กรอง chunk frame ซ้ำระหว่าง reassembly (ไม่แตะ message cache หลัก)
    pub fn check_and_record_chunk(&self, msg_id: u16, chunk_index: u8) -> DedupDecision {
        let key = format!("{msg_id}:{chunk_index}");
        let now = Instant::now();
        let mut map = self.chunk_entries.lock();

        Self::purge_expired_chunks(&mut map, self.chunk_ttl, now);

        if let Some(ts) = map.get(&key) {
            if now.duration_since(*ts) < self.chunk_ttl {
                return DedupDecision::Duplicate;
            }
        }

        Self::evict_oldest_chunk(&mut map, self.chunk_capacity);
        map.insert(key, now);
        DedupDecision::Accept
    }

    /// ล้าง chunk cache ของ msg_id เมื่อประกอบเสร็จ (ลด memory footprint)
    pub fn clear_chunk_stream(&self, msg_id: u16) {
        let prefix = format!("{msg_id}:");
        let mut map = self.chunk_entries.lock();
        map.retain(|k, _| !k.starts_with(&prefix));
    }

    pub fn len(&self) -> usize {
        self.entries.lock().len()
    }

    pub fn chunk_len(&self) -> usize {
        self.chunk_entries.lock().len()
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

    #[test]
    fn chunk_stream_dedup_and_clear() {
        let cache = DedupCache::new(8, Duration::from_secs(60));
        let msg_id = 0xABCD_u16;

        for i in 0..8u8 {
            assert_eq!(
                cache.check_and_record_chunk(msg_id, i),
                DedupDecision::Accept
            );
        }
        assert_eq!(
            cache.check_and_record_chunk(msg_id, 0),
            DedupDecision::Duplicate
        );

        cache.clear_chunk_stream(msg_id);
        assert_eq!(
            cache.check_and_record_chunk(msg_id, 0),
            DedupDecision::Accept
        );
        assert_eq!(cache.chunk_len(), 1);
    }

    #[test]
    fn high_frequency_chunks_do_not_thrash_message_cache() {
        let cache = DedupCache::new(4, Duration::from_secs(60));
        let msg_id = 42_u16;

        for i in 0..200u8 {
            let _ = cache.check_and_record_chunk(msg_id, i);
        }

        assert!(cache.chunk_len() <= cache.chunk_capacity);
        assert_eq!(cache.len(), 0);

        assert_eq!(cache.check_and_record("logical-msg"), DedupDecision::Accept);
        assert_eq!(cache.len(), 1);
    }
}

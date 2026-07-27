use std::sync::OnceLock;

use parking_lot::Mutex;
use tokio::sync::mpsc;
use tokio::task::JoinHandle;

use crate::hybrid_router::{
    HybridRouterHandle, MessagePacket, ResilNetRouter, RoutedPacket, RouterConfig, RouterError,
};
use crate::nostr::NostrPoolHandle;

/// เก็บ router + incoming channel ไว้ตลอดอายุ process
struct RouterState {
    _router: ResilNetRouter,
    handle: HybridRouterHandle,
    incoming_rx: Mutex<Option<mpsc::Receiver<MessagePacket>>>,
    /// task ที่ forward MPSC → StreamSink (ถ้ามี)
    stream_task: Mutex<Option<JoinHandle<()>>>,
}

static ROUTER_STATE: OnceLock<Mutex<RouterState>> = OnceLock::new();
static NOSTR_POOL: OnceLock<NostrPoolHandle> = OnceLock::new();

/// เริ่มต้น router ครั้งเดียวต่อ process (เก็บ handle ไว้ใน `ROUTER_STATE`)
pub(crate) fn init_router_state(config: RouterConfig) -> Result<(), String> {
    let (router, handle, incoming_rx) = ResilNetRouter::new(config);

    let state = RouterState {
        _router: router,
        handle,
        incoming_rx: Mutex::new(Some(incoming_rx)),
        stream_task: Mutex::new(None),
    };

    ROUTER_STATE
        .set(Mutex::new(state))
        .map_err(|_| "ResilNet router already initialized".to_string())?;

    let _ = NOSTR_POOL.set(NostrPoolHandle::new());

    Ok(())
}

pub(crate) fn is_initialized() -> bool {
    ROUTER_STATE.get().is_some()
}

/// Clone handle สำหรับ async FFI calls
pub(crate) fn get_handle() -> Result<HybridRouterHandle, String> {
    let guard = ROUTER_STATE
        .get()
        .ok_or_else(|| "Router not initialized — call init_router() first".to_string())?;
    Ok(guard.lock().handle.clone())
}

pub(crate) fn get_nostr_pool() -> Result<NostrPoolHandle, String> {
    // Ensure pool exists even if router init raced
    if NOSTR_POOL.get().is_none() {
        let _ = NOSTR_POOL.set(NostrPoolHandle::new());
    }
    NOSTR_POOL
        .get()
        .cloned()
        .ok_or_else(|| "Nostr pool not available".to_string())
}

/// ดึง incoming receiver (ครั้งเดียว) สำหรับ subscribe stream
pub(crate) fn take_incoming_rx() -> Result<mpsc::Receiver<MessagePacket>, String> {
    let guard = ROUTER_STATE
        .get()
        .ok_or_else(|| "Router not initialized".to_string())?;
    let state = guard.lock();
    let mut slot = state.incoming_rx.lock();
    slot.take()
        .ok_or_else(|| "Incoming receiver already taken (subscribe once)".to_string())
}

pub(crate) fn set_stream_task(handle: JoinHandle<()>) -> Result<(), String> {
    let guard = ROUTER_STATE
        .get()
        .ok_or_else(|| "Router not initialized".to_string())?;
    let state = guard.lock();
    let mut slot = state.stream_task.lock();
    if let Some(old) = slot.replace(handle) {
        old.abort();
    }
    Ok(())
}

/// ส่งออกแพ็กเก็ตผ่าน global router handle
pub(crate) async fn route_packet_async_mapped(
    packet: MessagePacket,
) -> Result<RoutedPacket, RouterError> {
    let handle = get_handle().expect("router must be initialized before route_packet");
    handle.route_packet(packet).await
}

/// รับแพ็กเก็ตขาเข้าผ่าน global router handle
pub(crate) async fn ingest_packet_async(packet: MessagePacket) -> Result<(), RouterError> {
    let handle = get_handle().expect("router must be initialized before ingest_packet");
    handle.ingest_packet(packet).await
}

pub(crate) async fn offline_queue_len_async() -> Result<usize, String> {
    let handle = get_handle()?;
    Ok(handle.offline_queue_len().await)
}

pub(crate) async fn drain_offline_queue_async() -> Result<Vec<MessagePacket>, String> {
    let handle = get_handle()?;
    Ok(handle.drain_offline_queue().await)
}

pub(crate) async fn clear_offline_queue_async() -> Result<usize, String> {
    let handle = get_handle()?;
    Ok(handle.clear_offline_queue().await)
}

pub(crate) fn update_network_status_mapped(
    is_internet_available: bool,
    active_ble_peers_count: u32,
    lora_available: bool,
) -> Result<(), String> {
    let handle = get_handle()?;
    handle.update_network_status(crate::hybrid_router::NetworkStatus::with_lora(
        is_internet_available,
        active_ble_peers_count as usize,
        lora_available,
    ));
    Ok(())
}

pub(crate) fn get_network_status_mapped() -> Result<crate::hybrid_router::NetworkStatus, String> {
    let handle = get_handle()?;
    Ok(handle.network_status())
}

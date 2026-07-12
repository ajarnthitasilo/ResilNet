import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../models/broadcast_alert.dart';
import '../services/geo_service.dart';

/// ผลจากหน้าส่งเตือนภัย
class BroadcastComposeResult {
  const BroadcastComposeResult({required this.text, required this.location});

  final String text;
  final AlertLocation location;
}

/// ฟอร์มส่งประกาศเตือนภัย พร้อมแผนที่เลือกพิกัด
class BroadcastComposeSheet extends StatefulWidget {
  const BroadcastComposeSheet({super.key});

  @override
  State<BroadcastComposeSheet> createState() => _BroadcastComposeSheetState();
}

class _BroadcastComposeSheetState extends State<BroadcastComposeSheet> {
  final _text = TextEditingController();
  final _mapController = MapController();
  LatLng _center = const LatLng(18.7883, 98.9853); // บ้านปู่คำ (default)
  double _radiusM = 2000;
  bool _loadingGps = true;

  @override
  void initState() {
    super.initState();
    _loadGps();
  }

  Future<void> _loadGps() async {
    final pos = await GeoService.getCurrentPosition();
    if (!mounted) return;
    if (pos != null) {
      setState(() {
        _center = LatLng(pos.latitude, pos.longitude);
        _loadingGps = false;
      });
      _mapController.move(_center, 14);
    } else {
      setState(() => _loadingGps = false);
    }
  }

  @override
  void dispose() {
    _text.dispose();
    _mapController.dispose();
    super.dispose();
  }

  void _submit() {
    final t = _text.text.trim();
    if (t.isEmpty) return;
    Navigator.of(context).pop(
      BroadcastComposeResult(
        text: t,
        location: AlertLocation(
          lat: _center.latitude,
          lon: _center.longitude,
          radius: _radiusM,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 14,
        right: 14,
        top: 14,
        bottom: MediaQuery.of(context).viewInsets.bottom + 14,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ส่งเตือนภัยฉุกเฉิน',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 6),
            Text(
              'พิกัดจุดเกิดเหตุจะแนบอัตโนมัติ — แตะแผนที่เพื่อปรับตำแหน่ง',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.white70),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _text,
              minLines: 2,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'พิมพ์ข้อความเตือนภัย…',
                labelText: 'ข้อความประกาศ',
              ),
            ),
            const SizedBox(height: 12),
            if (_loadingGps)
              const LinearProgressIndicator()
            else
              SizedBox(
                height: 220,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      initialCenter: _center,
                      initialZoom: 14,
                      onTap: (_, point) => setState(() => _center = point),
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.resilnet',
                      ),
                      CircleLayer(
                        circles: [
                          CircleMarker(
                            point: _center,
                            radius: _radiusM,
                            useRadiusInMeter: true,
                            color: Colors.orange.withValues(alpha: 0.2),
                            borderColor: Colors.orangeAccent,
                            borderStrokeWidth: 2,
                          ),
                        ],
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: _center,
                            width: 40,
                            height: 40,
                            child: const Icon(
                              Icons.location_on,
                              color: Colors.redAccent,
                              size: 36,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 8),
            Text(
              'พิกัด: ${_center.latitude.toStringAsFixed(5)}, ${_center.longitude.toStringAsFixed(5)}',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: _radiusM,
                    min: 500,
                    max: 20000,
                    divisions: 39,
                    label: '${_radiusM.round()} m',
                    onChanged: (v) => setState(() => _radiusM = v),
                  ),
                ),
                Text('${_radiusM.round()} m'),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _submit,
                icon: const Icon(Icons.warning_amber_rounded),
                label: const Text('ส่งเตือนภัย (Internet + Mesh)'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

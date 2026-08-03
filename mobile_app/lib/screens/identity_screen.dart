import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gal/gal.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../app/theme.dart';
import '../services/camera_permission.dart';
import '../services/photos_permission.dart';
import '../l10n/l10n_ext.dart';
import '../state/app_state.dart';
import '../widgets/invite_actions_sheet.dart';
import 'qr_scanner_screen.dart';

class IdentityScreen extends StatefulWidget {
  const IdentityScreen({super.key});

  @override
  State<IdentityScreen> createState() => _IdentityScreenState();
}

class _IdentityScreenState extends State<IdentityScreen> {
  late final TextEditingController _name;
  final _nameFocus = FocusNode();
  bool _saving = false;
  bool _nameDirty = false;
  String? _cachedQrData;
  String? _cachedName;
  String? _cachedUserId;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController();
    _name.addListener(_onNameEdited);
  }

  @override
  void dispose() {
    _name.removeListener(_onNameEdited);
    _nameFocus.dispose();
    _name.dispose();
    super.dispose();
  }

  void _onNameEdited() {
    _nameDirty = true;
  }

  void _syncNameField(String displayName) {
    // On iOS/iPad, tapping Save dismisses the keyboard first (viewInsets
    // rebuild). Syncing here would overwrite the typed name with the old
    // AppState value before onPressed runs — so skip while dirty.
    if (_nameDirty || _nameFocus.hasFocus || _name.text == displayName) return;
    _name.removeListener(_onNameEdited);
    _name.value = _name.value.copyWith(
      text: displayName,
      selection: TextSelection.collapsed(offset: displayName.length),
    );
    _name.addListener(_onNameEdited);
  }

  Future<void> _saveDisplayName() async {
    // Snapshot before any keyboard/unfocus rebuild can touch the controller.
    final next = _name.text.trim();
    _nameDirty = true;
    try {
      await context.read<AppState>().setDisplayName(next);
      if (!mounted) return;
      _nameDirty = false;
      _nameFocus.unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.identitySaveName)),
      );
    } catch (e) {
      debugPrint('[ResilNet] setDisplayName failed: $e');
      if (!mounted) return;
      // Name may still be in memory / prefs — tell the user.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${context.l10n.identitySaveName}: $e')),
      );
    }
  }

  Future<void> _copyUserId(String userId) async {
    await Clipboard.setData(ClipboardData(text: userId));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(context.l10n.identityCopiedHash)),
    );
  }

  Future<void> _shareIdentityLink() async {
    final s = context.read<AppState>();
    final l10n = context.l10n;
    final text = s.identityInviteShareText(
      preamble: l10n.identityInviteSharePreamble,
    );
    final box = context.findRenderObject() as RenderBox?;
    final origin = box == null
        ? const Rect.fromLTWH(0, 0, 100, 100)
        : box.localToGlobal(Offset.zero) & box.size;
    await SharePlus.instance.share(
      ShareParams(text: text, sharePositionOrigin: origin),
    );
  }

  Future<void> _openScanner() async {
    if (!mounted) return;
    final l10n = context.l10n;
    try {
      await ensureCameraPermission();
    } catch (e) {
      if (!mounted) return;
      showCameraPermissionError(
        context,
        error: e,
        deniedMessage: l10n.permissionCameraDenied,
        failedMessage: l10n.permissionCameraFailed,
        openSettingsLabel: l10n.permissionCameraOpenSettings,
      );
      return;
    }
    if (!mounted) return;
    final ok = await Navigator.of(
      context,
    ).push<bool>(MaterialPageRoute(builder: (_) => const QrScannerScreen()));
    if (!mounted) return;
    // เผื่อ resume radios ยังไม่ทัน — เรียกซ้ำแบบปลอดภัย
    try {
      await context.read<AppState>().resumeRadiosAfterCamera();
    } catch (_) {}
    if (!mounted) return;
    if (ok == true) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.l10n.identityPeerSaved)));
    }
  }

  Future<void> _saveQrToGallery(String qrData) async {
    if (_saving) return;
    setState(() => _saving = true);
    try {
      await ensurePhotosPermission();

      final hasAccess = await Gal.hasAccess(toAlbum: true);
      if (!hasAccess) {
        final granted = await Gal.requestAccess(toAlbum: true);
        if (!granted) {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.l10n.identityGalleryDenied)),
          );
          return;
        }
      }

      // สร้าง PNG จาก QrPainter โดยตรง (ไม่พึ่ง widget tree / ไม่ค้างจาก rebuild)
      final painter = QrPainter(
        data: qrData,
        version: QrVersions.auto,
        errorCorrectionLevel: QrErrorCorrectLevel.M,
        gapless: true,
        eyeStyle: const QrEyeStyle(
          eyeShape: QrEyeShape.square,
          color: Color(0xFF000000),
        ),
        dataModuleStyle: const QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.square,
          color: Color(0xFF000000),
        ),
      );
      final byteData = await painter.toImageData(
        1024,
        format: ui.ImageByteFormat.png,
      );
      if (byteData == null) throw StateError('QR encode failed');
      final bytes = byteData.buffer.asUint8List();

      await Gal.putImageBytes(
        Uint8List.fromList(bytes),
        name: 'resilnet_qr_${DateTime.now().millisecondsSinceEpoch}',
      );

      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.l10n.identityQrSaved)));
    } catch (e, st) {
      debugPrint('[ResilNet] save QR failed: $e\n$st');
      if (!mounted) return;
      if (e is StateError &&
          (e.message == photosPermanentlyDeniedCode ||
              e.message == 'PHOTOS_DENIED')) {
        showPhotosPermissionError(
          context,
          error: e,
          deniedMessage: context.l10n.permissionPhotosDenied,
          failedMessage: context.l10n.permissionPhotosFailed,
          openSettingsLabel: context.l10n.permissionPhotosOpenSettings,
        );
        return;
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.l10n.identityQrSaveFailed('$e'))));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // ใช้ Selector เฉพาะ field ที่เกี่ยวกับ QR — ไม่ rebuild ทุกครั้งที่ mesh อัปเดต
    final userId = context.select<AppState, String>((s) => s.myUserId);
    final displayName = context.select<AppState, String>((s) => s.displayName);
    final appState = context.read<AppState>();
    _syncNameField(displayName);

    if (_cachedUserId != userId ||
        _cachedName != displayName ||
        _cachedQrData == null) {
      _cachedUserId = userId;
      _cachedName = displayName;
      _cachedQrData = appState.identityInvitePayload(displayName: displayName);
    }
    final qrData = _cachedQrData!;
    final shortLink = qrData;
    final fullLink = appState.identityInviteDeepLink(displayName: displayName);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(context.l10n.identityTitle),
        actions: [
          IconButton(
            tooltip: context.l10n.identityScanTooltip,
            onPressed: _openScanner,
            icon: const Icon(Icons.qr_code_scanner),
          ),
        ],
      ),
      body: Container(
        decoration: ResilNetTheme.pageDecoration(context),
        child: SafeArea(
          child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            Text(
              context.l10n.identityUserIdLabel,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => _copyUserId(userId),
                borderRadius: BorderRadius.circular(12),
                child: Ink(
                  decoration: ResilNetTheme.glassDecoration(
                    context,
                    borderRadius: BorderRadius.circular(12),
                    blurSigma: 12,
                  ).copyWith(
                    border: Border.all(
                      color: ResilNetTheme.emerald.withValues(alpha: 0.45),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 4, 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SelectableText(
                            userId,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontFamily: 'monospace',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.2,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withValues(alpha: 0.92),
                                ),
                          ),
                        ),
                        IconButton(
                          tooltip: context.l10n.identityCopyHashTooltip,
                          onPressed: () => _copyUserId(userId),
                          icon: Icon(
                            Icons.copy,
                            color: ResilNetTheme.emerald.withValues(alpha: 0.95),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              context.l10n.identityDisplayNameTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _name,
              focusNode: _nameFocus,
              textInputAction: TextInputAction.done,
              // No floating labelText — it was clipped mid-glyph by the filled
              // OutlineInputBorder (esp. light / liquid glass). Title stays above.
              decoration: const InputDecoration(),
              onSubmitted: (_) => unawaited(_saveDisplayName()),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Listener(
                onPointerDown: (_) {
                  // Capture typed text before iOS keyboard dismiss rebuild.
                  _nameDirty = true;
                },
                child: TextButton(
                  onPressed: () => unawaited(_saveDisplayName()),
                  child: Text(context.l10n.identitySaveName),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.qr_code_2,
                          color: ResilNetTheme.emerald,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            context.l10n.identityMyQrTitle,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: GestureDetector(
                        onLongPress: () => unawaited(
                          showInviteActionsSheet(
                            context: context,
                            title: displayName.isNotEmpty
                                ? displayName
                                : context.l10n.identityMyQrTitle,
                            subtitle: context.l10n.inviteLongPressHint,
                            shortLink: shortLink,
                            fullLink: fullLink,
                            acceptLabel: context.l10n.inviteCopyShortLink,
                            onAccept: () async {
                              await Clipboard.setData(
                                ClipboardData(text: shortLink),
                              );
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(context.l10n.inviteLinkCopied),
                                ),
                              );
                            },
                          ),
                        ),
                        child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: QrImageView(
                          data: qrData,
                          size: 240,
                          version: QrVersions.auto,
                          errorCorrectionLevel: QrErrorCorrectLevel.M,
                          gapless: true,
                          eyeStyle: const QrEyeStyle(
                            eyeShape: QrEyeShape.square,
                            color: Colors.black,
                          ),
                          dataModuleStyle: const QrDataModuleStyle(
                            dataModuleShape: QrDataModuleShape.square,
                            color: Colors.black,
                          ),
                          errorStateBuilder: (context, error) {
                            return SizedBox(
                              width: 240,
                              height: 240,
                              child: Center(
                                child: Text(
                                  context.l10n.identityQrFailed('$error'),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: _saving
                            ? null
                            : () => _saveQrToGallery(qrData),
                        icon: _saving
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.save_alt),
                        label: Text(
                          _saving
                              ? context.l10n.identitySaving
                              : context.l10n.identitySaveQr,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: _shareIdentityLink,
                        icon: const Icon(Icons.share_outlined),
                        label: Text(context.l10n.identityShareInvite),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: _openScanner,
                        icon: const Icon(Icons.photo_camera),
                        label: Text(context.l10n.identityOpenScanner),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      context.l10n.identityQrHelp,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ResilNetTheme.mutedOnSurface(
                          context,
                          alpha: 0.72,
                        ),
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              context.l10n.identityChatTip,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ResilNetTheme.mutedOnSurface(context, alpha: 0.6),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../app/glass_overlays.dart';

const photosPermanentlyDeniedCode = 'PHOTOS_PERMANENTLY_DENIED';

Future<bool> photosPermissionGranted() async {
  if (Platform.isIOS || Platform.isMacOS) {
    final addOnly = await Permission.photosAddOnly.status;
    if (addOnly.isGranted) return true;
    return (await Permission.photos.status).isGranted;
  }
  if (Platform.isAndroid) {
    final photos = await Permission.photos.status;
    if (photos.isGranted) return true;
    return (await Permission.storage.status).isGranted;
  }
  return true;
}

Future<void> ensurePhotosPermission() async {
  if (Platform.isIOS || Platform.isMacOS) {
    var status = await Permission.photosAddOnly.status;
    if (!status.isGranted) {
      status = await Permission.photosAddOnly.request();
    }
    if (status.isGranted) return;

    status = await Permission.photos.status;
    if (!status.isGranted) {
      status = await Permission.photos.request();
    }
    if (status.isGranted || status.isLimited) return;
    if (status.isPermanentlyDenied) {
      throw StateError(photosPermanentlyDeniedCode);
    }
    throw StateError('PHOTOS_DENIED');
  }

  if (Platform.isAndroid) {
    var status = await Permission.photos.status;
    if (!status.isGranted) {
      status = await Permission.photos.request();
    }
    if (status.isGranted) return;

    status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
    }
    if (status.isGranted) return;
    if (status.isPermanentlyDenied) {
      throw StateError(photosPermanentlyDeniedCode);
    }
    throw StateError('PHOTOS_DENIED');
  }
}

void showPhotosPermissionError(
  BuildContext context, {
  required Object error,
  required String deniedMessage,
  required String failedMessage,
  required String openSettingsLabel,
}) {
  if (error is StateError && error.message == photosPermanentlyDeniedCode) {
    ScaffoldMessenger.of(context).showSnackBar(
      GlassSnackBar(
        content: Text(deniedMessage),
        action: SnackBarAction(
          label: openSettingsLabel,
          onPressed: openAppSettings,
        ),
      ),
    );
    return;
  }
  ScaffoldMessenger.of(context).showSnackBar(
    GlassSnackBar(content: Text(failedMessage)),
  );
}

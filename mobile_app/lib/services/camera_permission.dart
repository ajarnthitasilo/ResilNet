import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

const cameraPermanentlyDeniedCode = 'CAMERA_PERMANENTLY_DENIED';

Future<bool> cameraPermissionGranted() async {
  return (await Permission.camera.status).isGranted;
}

Future<void> ensureCameraPermission() async {
  var status = await Permission.camera.status;
  if (!status.isGranted) {
    status = await Permission.camera.request();
  }
  if (status.isGranted) return;
  if (status.isPermanentlyDenied) {
    throw StateError(cameraPermanentlyDeniedCode);
  }
  throw StateError('CAMERA_DENIED');
}

void showCameraPermissionError(
  BuildContext context, {
  required Object error,
  required String deniedMessage,
  required String failedMessage,
  required String openSettingsLabel,
}) {
  if (error is StateError && error.message == cameraPermanentlyDeniedCode) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
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
    SnackBar(content: Text(failedMessage)),
  );
}

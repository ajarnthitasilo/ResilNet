import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

/// Thrown when the user permanently denied microphone access.
const micPermanentlyDeniedCode = 'MIC_PERMANENTLY_DENIED';

Future<bool> micPermissionGranted() async {
  return (await Permission.microphone.status).isGranted;
}

Future<void> ensureMicPermission() async {
  var status = await Permission.microphone.status;
  if (!status.isGranted) {
    status = await Permission.microphone.request();
  }
  if (status.isGranted) return;
  if (status.isPermanentlyDenied) {
    throw StateError(micPermanentlyDeniedCode);
  }
  throw StateError('ไม่ได้รับอนุญาตไมโครโฟน');
}

void showMicPermissionError(
  BuildContext context, {
  required Object error,
  required String deniedMessage,
  required String failedMessage,
  required String openSettingsLabel,
}) {
  if (error is StateError && error.message == micPermanentlyDeniedCode) {
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

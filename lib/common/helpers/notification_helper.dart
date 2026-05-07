import 'package:cyna/common/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class TNotifications {
  // Toast de Succès
  static void success({required String message, String? title}) {
    toastification.show(
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      title: Text(title ?? "Succès"),
      description: Text(message),
      alignment: Alignment.topRight,
      autoCloseDuration: const Duration(seconds: 4),
      icon: const Icon(Icons.check_circle_outline),
      primaryColor: Colors.green,
      foregroundColor: Colors.black,
      pauseOnHover: true,
    );
  }

  // Toast d'Erreur
  static void error({required String message, String? title}) {
    toastification.show(
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      title: Text(title ?? "Erreur"),
      description: Text(message),
      alignment: Alignment.topRight,
      autoCloseDuration: const Duration(seconds: 4),
      icon: const Icon(Icons.error_outline),
      primaryColor: Colors.red,
      foregroundColor: Colors.black,
      pauseOnHover: true,
    );
  }

  // Toast d'Information (Optionnel)
  static void info({required String message, String? title}) {
    toastification.show(
      type: ToastificationType.info,
      style: ToastificationStyle.flatColored,
      title: Text(title ?? "Information"),
      description: Text(message),
      alignment: Alignment.topRight,
      autoCloseDuration: const Duration(seconds: 4),
      primaryColor: Colors.blue,
      foregroundColor: Colors.black,
      pauseOnHover: true,
    );
  }
}

// Modèle pour l'état initial
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class AppInitalState {
  final bool hasSeenOnboarding;
  final bool isAuthenticated;
  AppInitalState(
      {required this.hasSeenOnboarding, required this.isAuthenticated});
}

final appStartupProvider = FutureProvider<AppInitalState>((ref) async {
  final getStorage = GetStorage();

  // On récupère les deux informations
  final token = getStorage.read('auth_token');
  final onboarding = getStorage.read('has_seen_onboarding');

  return AppInitalState(
    hasSeenOnboarding: onboarding == 'true',
    isAuthenticated: token != null,
  );
});

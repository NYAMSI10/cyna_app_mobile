import 'package:cyna/common/helpers/notification_helper.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/profile/data/model/request/user_change_password.dart';
import 'package:cyna/features/profile/data/model/request/user_request.dart';
import 'package:cyna/features/profile/data/model/response/user_response.dart';
import 'package:cyna/features/profile/data/usecasesImpl/user_usecase_impl.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  @override
  FutureOr<ApiResponse<UserResponse>> build() async {
    // 1. On récupère le UseCase
    final usecase = ref.read(userUsecaseProvider);

    // 2. On effectue l'appel API directement ici
    final result = await usecase.currentUser();

    // 3. On traite le résultat pour initialiser l'état du provider
    return result.when(
      (user) => user, // Succès : l'état sera AsyncData(user)
      (failure) {
        // En cas d'erreur, on peut soit jeter l'erreur pour que l'UI passe en AsyncError
        // soit retourner null selon ton besoin.
        throw failure.message;
      },
    );
  }

  // Optionnel : Tu gardes cette méthode pour permettre un "Pull to refresh"
  Future<void> refreshUser() async {
    state = const AsyncLoading();
    ref.invalidateSelf(); // Cela force le build() à se relancer
    await future; // Attend que le nouveau build soit terminé
  }

  // logout
  void logout() async {
    final getStorage = GetStorage();
    await getStorage.remove('auth_token');
  }

  Future<void> updateUser(UserRequest user, String id) async {
    final usecase = ref.read(userUsecaseProvider);
    // démarre le loader

    final result = await usecase.updateUser(user, id);

    return result.when(
      (response) {
        TNotifications.success(message: response.message!);
        // Si la mise à jour est réussie, on peut rafraîchir les données de l'utilisateur

        refreshUser();
      },
      (failure) {
        // Gérer l'erreur de mise à jour, par exemple en affichant un message d'erreur
        TNotifications.error(message: failure.message);
      },
    );
  }

  Future<void> changePassword(UserChangePassword user) async {
    final usecase = ref.read(userUsecaseProvider);
    // démarre le loader
    final result = await usecase.changePassword(user);

    return result.when(
      (response) {
        TNotifications.success(message: response.message!);
      },
      (failure) {
        // Gérer l'erreur de mise à jour, par exemple en affichant un message d'erreur
        TNotifications.error(message: failure.message);
      },
    );
  }
}

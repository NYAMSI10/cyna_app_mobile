import 'package:cyna/common/model/response/api_response.dart';
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
}

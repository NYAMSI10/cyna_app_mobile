import 'package:cyna/features/authentication/data/model/request/login/login_request.dart';
import 'package:cyna/features/authentication/data/usecasesImpl/auth_usecase_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<void> build() {
    // On retourne void car on ne stocke pas de données persistantes ici,
    // on gère juste l'état de l'action "Login".
  }

  Future<void> login(String email, String password) async {
    final usecase = ref.read(authUsecaseProvider);
    // 1. On passe l'état en "loading"
    state = const AsyncLoading();

    final request = LoginRequest(email: email, password: password);

    // 2. Appel du UseCase
    final result = await usecase.login(request);

    // 3. On traite le résultat (Pattern Matching sur ton objet Result)
    result.when(
      (loginResponse) {
        // Succès ! On passe l'état en data
        state = const AsyncData(null);
      },
      (failure) {
        // Erreur ! On passe l'état en error pour que l'UI puisse l'afficher
        state = AsyncError(failure.message, failure.stackTrace);
      },
    );
  }
}

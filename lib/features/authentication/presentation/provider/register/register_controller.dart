import 'package:cyna/features/authentication/data/model/request/register/register_request.dart';
import 'package:cyna/features/authentication/data/usecasesImpl/auth_usecase_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_controller.g.dart';

@riverpod
class RegisterController extends _$RegisterController {
  @override
  FutureOr<String?> build() {
    // Aucune donnée persistante : on gère l'état de l'action "Register".
    return null;
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final usecase = ref.read(authUsecaseProvider);

    state = const AsyncLoading();

    final request = RegisterRequest(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );

    final result = await usecase.register(request);

    result.when(
      (response) {
        // Succès : on conserve le message renvoyé par le backend.
        state = AsyncData(response.message);
      },
      (failure) {
        state = AsyncError(failure.message, failure.stackTrace);
      },
    );
  }
}

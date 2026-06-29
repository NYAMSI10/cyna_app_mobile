import 'package:cyna/features/authentication/data/usecasesImpl/auth_usecase_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_password_controller.g.dart';

@riverpod
class ForgotPasswordController extends _$ForgotPasswordController {
  @override
  FutureOr<void> build() {}

  Future<void> forgotPassword(String email) async {
    final usecase = ref.read(authUsecaseProvider);
    state = const AsyncLoading();

    final result = await usecase.forgotPassword(email);

    result.when(
      (_) {
        state = const AsyncData(null);
      },
      (failure) {
        state = AsyncError(failure.message, failure.stackTrace);
      },
    );
  }
}

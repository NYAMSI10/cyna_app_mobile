import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/authentication/data/model/request/login/login_request.dart';
import 'package:cyna/features/authentication/data/model/response/login/login_response.dart';
import 'package:cyna/features/authentication/data/repositoryImpl/auth_repository_impl.dart';
import 'package:cyna/features/authentication/domain/repository/auth_repository.dart';
import 'package:cyna/features/authentication/domain/usecases/auth_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

final authUsecaseProvider = Provider.autoDispose<AuthUsecase>((ref) {
  final loginRepository = ref.watch(authRepositoryProvider);

  return AuthUsecaseImpl(loginRepository);
});

final class AuthUsecaseImpl implements AuthUsecase {
  final AuthRepository _loginRepository;

  AuthUsecaseImpl(this._loginRepository);

  @override
  Future<Result<ApiResponse<LoginResponse>, Failure>> login(
      LoginRequest loginRequest) async {
    try {
      final response = await _loginRepository.login(loginRequest);

      if (!response.success) {
        return Result.error(
          Failure(
            message: response.message ??
                "Une erreur inattendue est survenue".hardcoded,
          ),
        );
      }

      return Result.success(response);
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred".hardcoded,
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }
}

import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/profile/data/model/request/user_change_password.dart';
import 'package:cyna/features/profile/data/model/request/user_request.dart';
import 'package:cyna/features/profile/data/model/response/user_response.dart';
import 'package:cyna/features/profile/data/repositoryImpl/user_repository_impl.dart';
import 'package:cyna/features/profile/domain/repository/user_repository.dart';
import 'package:cyna/features/profile/domain/usecases/user_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';

final userUsecaseProvider = Provider.autoDispose<UserUsecase>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);

  return UserUsecaseImpl(userRepository);
});

final class UserUsecaseImpl implements UserUsecase {
  final UserRepository _userRepository;
  UserUsecaseImpl(this._userRepository);

  @override
  Future<Result<ApiResponse<UserResponse>, Failure>> currentUser() async {
    try {
      final response = await _userRepository.currentUser();

      if (!response.success) {
        return Result.error(
          Failure(
            message: response.message ??
                "Une erreur inattendue est survenue".hardcoded,
          ),
        );
      }
      return Success(response);
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred".hardcoded,
        // Si 'e' est déjà une Exception, on la garde, sinon on crée une nouvelle Exception
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }

  @override
  Future<Result<ApiResponse<UserResponse>, Failure>> updateUser(
      UserRequest user, String id) async {
    try {
      final response = await _userRepository.updateUser(user, id);

      if (!response.success) {
        return Result.error(
          Failure(
            message: response.message ??
                "Une erreur inattendue est survenue".hardcoded,
          ),
        );
      }
      return Success(response);
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred".hardcoded,
        // Si 'e' est deja une Exception, on la garde, sinon on cree une nouvelle Exception
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }

  @override
  Future<Result<ApiResponse<UserResponse>, Failure>> changePassword(
      UserChangePassword user) async {
    try {
      final response = await _userRepository.changePassword(user);

      if (!response.success) {
        return Result.error(
          Failure(
            message: response.message ??
                "Une erreur inattendue est survenue".hardcoded,
          ),
        );
      }
      return Success(response);
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred".hardcoded,
        // Si 'e' est deja une Exception, on la garde, sinon on cree une nouvelle Exception
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }
}

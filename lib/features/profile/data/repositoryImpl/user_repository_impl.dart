import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/profile/data/datasources/user_api.dart';
import 'package:cyna/features/profile/data/model/response/user_response.dart';
import 'package:cyna/features/profile/domain/repository/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';
import 'package:cyna/core/dio_eroor_exception.dart';

final userRepositoryProvider = Provider.autoDispose<UserRepository>((ref) {
  final userApi = ref.watch(userApiProvider);

  return UserRepositoryImpl(userApi);
});

class UserRepositoryImpl implements UserRepository {
  final UserApi userApi;

  UserRepositoryImpl(this.userApi);

  @override
  Future<ApiResponse<UserResponse>> currentUser() async {
    try {
      final response = await userApi.getCurrentUser();
      return response;
    } on DioException catch (e) {
      throw e.toFailure();
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred".hardcoded,
        // Si 'e' est déjà une Exception, on la garde, sinon on crée une nouvelle Exception
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }
}

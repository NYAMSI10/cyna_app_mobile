import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/profile/data/datasources/user_api.dart';
import 'package:cyna/features/profile/data/model/request/user_change_password.dart';
import 'package:cyna/features/profile/data/model/request/user_request.dart';
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

  @override
  Future<ApiResponse<UserResponse>> updateUser(
      UserRequest user, String id) async {
    try {
      final response = await userApi.updateUser(user, id);
      return response;
    } on DioException catch (e) {
      throw e.toFailure();
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
  Future<ApiResponse<UserResponse>> changePassword(
      UserChangePassword user) async {
    try {
      final response = await userApi.changePassword(user);
      return response;
    } on DioException catch (e) {
      throw e.toFailure();
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

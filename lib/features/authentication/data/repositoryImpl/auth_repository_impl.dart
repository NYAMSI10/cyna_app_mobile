import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/core/dio_eroor_exception.dart';
import 'package:cyna/features/authentication/data/datasources/login_api.dart';
import 'package:cyna/features/authentication/data/model/request/login/login_request.dart';
import 'package:cyna/features/authentication/data/model/request/register/register_request.dart';
import 'package:cyna/features/authentication/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

final authRepositoryProvider = Provider.autoDispose<AuthRepository>((ref) {
  final loginApi = ref.watch(loginApiProvider);

  return AuthRepositoryImpl(loginApi);
});

final class AuthRepositoryImpl implements AuthRepository {
  final LoginApi _loginApi;

  AuthRepositoryImpl(this._loginApi);

  @override
  Future<ApiResponse<dynamic>> login(LoginRequest loginRequest) async {
    try {
      final formData = FormData.fromMap({
        'email': loginRequest.email,
        'password': loginRequest.password,
      });
      final response = await _loginApi.login(formData);
      final getStorage = GetStorage();

      // On sauvegarde le token immédiatement en cas de succès
      if (response.data?.token != null) {
        getStorage.write('auth_token', response.data?.token);
      }

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
  Future<ApiResponse<dynamic>> register(
    RegisterRequest registerRequest,
  ) async {
    try {
      final formData = FormData.fromMap({
        'email': registerRequest.email,
        'password': registerRequest.password,
        'firstName': registerRequest.firstName,
        'lastName': registerRequest.lastName,
      });
      final response = await _loginApi.register(formData);
      return response;
    } on DioException catch (e) {
      throw e.toFailure();
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred".hardcoded,
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }
}

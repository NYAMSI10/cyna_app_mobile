import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/authentication/data/model/request/login/login_request.dart';
import 'package:cyna/features/authentication/data/model/request/register/register_request.dart';

abstract interface class AuthRepository {
  Future<ApiResponse<dynamic>> login(LoginRequest loginRequest);

  Future<ApiResponse<dynamic>> register(RegisterRequest registerRequest);

  Future<ApiResponse<dynamic>> forgotPassword(String email);
}

import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/authentication/data/model/request/login/login_request.dart';
import 'package:cyna/features/authentication/data/model/request/register/register_request.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class AuthUsecase {
  Future<Result<ApiResponse<dynamic>, Failure>> login(
      LoginRequest loginRequest);

  Future<Result<ApiResponse<dynamic>, Failure>> register(
      RegisterRequest registerRequest);

  Future<Result<ApiResponse<dynamic>, Failure>> forgotPassword(String email);
}

import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/authentication/data/model/request/login/login_request.dart';
import 'package:cyna/features/authentication/data/model/response/login/login_response.dart';

abstract interface class AuthRepository {
  Future<ApiResponse<LoginResponse>> login(LoginRequest loginRequest);
}

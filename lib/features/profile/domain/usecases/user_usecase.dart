import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/profile/data/model/request/user_change_password.dart';
import 'package:cyna/features/profile/data/model/request/user_request.dart';
import 'package:cyna/features/profile/data/model/response/user_response.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:cyna/common/exception/failure.dart';

abstract interface class UserUsecase {
  Future<Result<ApiResponse<UserResponse>, Failure>> currentUser();
  Future<Result<ApiResponse<UserResponse>, Failure>> updateUser(
      UserRequest user, String id);
  Future<Result<ApiResponse<UserResponse>, Failure>> changePassword(
      UserChangePassword user);
}

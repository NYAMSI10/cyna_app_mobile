import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/profile/data/model/request/user_change_password.dart';
import 'package:cyna/features/profile/data/model/request/user_request.dart';
import 'package:cyna/features/profile/data/model/response/user_response.dart';

abstract interface class UserRepository {
  Future<ApiResponse<UserResponse>> currentUser();

  Future<ApiResponse<UserResponse>> updateUser(UserRequest user, String id);
  Future<ApiResponse<UserResponse>> changePassword(UserChangePassword user);
}

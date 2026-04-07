import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/profile/data/model/response/user_response.dart';

abstract interface class UserRepository {
  Future<ApiResponse<UserResponse>> currentUser();
}

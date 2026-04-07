import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/profile/data/model/response/user_response.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:cyna/common/exception/failure.dart';

abstract interface class UserUsecase {
  Future<Result<ApiResponse<UserResponse>, Failure>> currentUser();
}

import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/profile/data/model/response/user_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:cyna/core/data/remote/endpoint.dart';
import 'package:cyna/core/data/remote/network_service.dart';

part 'user_api.g.dart';

final userApiProvider = Provider.autoDispose<UserApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return UserApi(dio);
});

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio) => _UserApi(dio);

  @GET(currentUserEndPoint)
  Future<ApiResponse<UserResponse>> getCurrentUser();
}

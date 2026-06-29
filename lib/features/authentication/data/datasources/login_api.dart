import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/core/data/remote/endpoint.dart';
import 'package:cyna/core/data/remote/network_service.dart';
import 'package:cyna/features/authentication/data/model/response/login/login_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'login_api.g.dart';

final loginApiProvider = Provider.autoDispose<LoginApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return LoginApi(dio);
});

@RestApi()
abstract class LoginApi {
  factory LoginApi(Dio dio) => _LoginApi(dio);

  @POST(loginEndPoint)
  Future<ApiResponse<LoginResponse>> login(@Body() FormData formData);

  @POST(registerEndPoint)
  Future<ApiResponse<dynamic>> register(@Body() FormData formData);
}

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

// import 'package:school_api/common/http_status/status_code.dart';

final networkServiceInterceptorProvider =
    Provider.family<NetworkServiceInterceptor, Dio>((ref, dio) {
  return NetworkServiceInterceptor(dio);
});

final class NetworkServiceInterceptor extends Interceptor {
  final Dio dio;

  NetworkServiceInterceptor(this.dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final getStorage = GetStorage();

    final accessToken = await getStorage.read('auth_token');

    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = '*/*';
    // if the access token is not null, add it to the request headers
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    super.onRequest(options, handler);
  }
}

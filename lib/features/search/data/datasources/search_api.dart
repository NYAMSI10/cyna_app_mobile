import 'package:cyna/core/data/remote/endpoint.dart';
import 'package:cyna/core/data/remote/network_service.dart';
import 'package:cyna/features/search/data/model/search_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'search_api.g.dart';

final searchApiProvider = Provider.autoDispose<SearchApi>((ref) {
  final dio = ref.watch(networkServiceProvider);
  return SearchApi(dio);
});

@RestApi()
abstract class SearchApi {
  factory SearchApi(Dio dio) => _SearchApi(dio);

  @GET(searchEndPoint)
  Future<SearchPaginatedResponse> search(
    @Queries() Map<String, dynamic> queryParams,
  );
}

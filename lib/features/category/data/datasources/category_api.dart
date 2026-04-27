import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/core/data/remote/endpoint.dart';
import 'package:cyna/core/data/remote/network_service.dart';

import 'package:cyna/features/category/data/model/category_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'category_api.g.dart';

final categoryApiProvider = Provider.autoDispose<CategoryApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return CategoryApi(dio);
});

@RestApi()
abstract class CategoryApi {
  factory CategoryApi(Dio dio) => _CategoryApi(dio);

  @GET(getCategoriesByOrderEndPoint)
  Future<ApiResponse<List<CategoryResponse>>> getCategoriesByOrder();
}

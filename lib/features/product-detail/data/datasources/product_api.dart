import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/core/data/remote/endpoint.dart';
import 'package:cyna/core/data/remote/network_service.dart';

import 'package:cyna/features/product-detail/data/model/product_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'product_api.g.dart';

final productApiProvider = Provider.autoDispose<ProductApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return ProductApi(dio);
});

@RestApi()
abstract class ProductApi {
  factory ProductApi(Dio dio) => _ProductApi(dio);

  @GET(getProductsByOrderEndPoint)
  Future<ApiResponse<List<ProductResponse>>> getProductsByOrder();
}

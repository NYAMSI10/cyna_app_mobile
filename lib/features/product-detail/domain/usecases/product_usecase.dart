import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/product-detail/data/model/product_response.dart';
import 'package:cyna/features/product-detail/data/model/sliders/slider_response.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class ProductUseCase {
  Future<Result<ApiResponse<List<ProductResponse>>, Failure>>
      getProductsByOrder();
  Future<Result<ApiResponse<List<ProductResponse>>, Failure>>
      getSimilarProducts(String categoryId);
  Future<Result<ApiResponse<List<SliderResponse>>, Failure>> getTopSliders({
    int? limit,
  });
}

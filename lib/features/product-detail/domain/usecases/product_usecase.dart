import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/product-detail/data/model/product_response.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class ProductUseCase {
  Future<Result<ApiResponse<List<ProductResponse>>, Failure>>
      getProductsByOrder();
}

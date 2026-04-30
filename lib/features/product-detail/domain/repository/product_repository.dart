import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/product-detail/data/model/product_response.dart';

abstract interface class ProductRepository {
  Future<ApiResponse<List<ProductResponse>>> getProductsByOrder();
}

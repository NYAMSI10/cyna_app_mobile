import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/category/data/model/category_response.dart';

abstract interface class CategoryRepository {
  Future<ApiResponse<List<CategoryResponse>>> getCategoriesByOrder();
}

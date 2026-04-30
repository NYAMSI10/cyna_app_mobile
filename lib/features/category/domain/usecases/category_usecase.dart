import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/category/data/model/category_response.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class CategoryUsecase {
  Future<Result<ApiResponse<List<CategoryResponse>>, Failure>>
      getCategoriesByOrder();
}

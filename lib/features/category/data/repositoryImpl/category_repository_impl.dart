import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/core/dio_eroor_exception.dart';
import 'package:cyna/features/category/data/datasources/category_api.dart';
import 'package:cyna/features/category/data/model/category_response.dart';
import 'package:cyna/features/category/domain/repository/category_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryRepositoryProvider =
    Provider.autoDispose<CategoryRepository>((ref) {
  final categoryApi = ref.watch(categoryApiProvider);

  return CategoryRepositoryImpl(categoryApi);
});

final class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryApi _categoryApi;

  CategoryRepositoryImpl(this._categoryApi);

  @override
  Future<ApiResponse<List<CategoryResponse>>> getCategoriesByOrder() async {
    try {
      final response = await _categoryApi.getCategoriesByOrder();
      return response;
    } on DioException catch (e) {
      throw e.toFailure();
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred".hardcoded,
        // Si 'e' est déjà une Exception, on la garde, sinon on crée une nouvelle Exception
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }
}

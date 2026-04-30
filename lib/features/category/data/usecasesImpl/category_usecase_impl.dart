import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/category/data/model/category_response.dart';
import 'package:cyna/features/category/data/repositoryImpl/category_repository_impl.dart';
import 'package:cyna/features/category/domain/repository/category_repository.dart';
import 'package:cyna/features/category/domain/usecases/category_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

final categoryUsecaseProvider = Provider.autoDispose<CategoryUsecase>((ref) {
  final categoryRepository = ref.watch(categoryRepositoryProvider);

  return CategoryUsecaseImpl(categoryRepository);
});

final class CategoryUsecaseImpl implements CategoryUsecase {
  final CategoryRepository _categoryRepository;

  CategoryUsecaseImpl(this._categoryRepository);

  @override
  Future<Result<ApiResponse<List<CategoryResponse>>, Failure>>
      getCategoriesByOrder() async {
    try {
      final response = await _categoryRepository.getCategoriesByOrder();

      if (!response.success) {
        return Result.error(
          Failure(
            message: response.message ??
                "Une erreur inattendue est survenue".hardcoded,
          ),
        );
      }

      return Result.success(response);
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred".hardcoded,
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }
}

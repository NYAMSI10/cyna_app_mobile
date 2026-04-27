import 'package:cyna/features/category/data/model/category_response.dart';
import 'package:cyna/features/category/data/usecasesImpl/category_usecase_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_controller.g.dart';

@riverpod
class CategoryController extends _$CategoryController {
  @override
  FutureOr<List<CategoryResponse>> build() {
    return getCategoriesByOrder();
  }

  Future<List<CategoryResponse>> getCategoriesByOrder() async {
    final usecase = ref.read(categoryUsecaseProvider);

    // 2. Appel du UseCase
    final result = await usecase.getCategoriesByOrder();
    if (kDebugMode) {
      print("Result from UseCase: $result");
    }
    // 3. On traite le résultat (Pattern Matching sur ton objet Result)
    result.when(
      (categories) => categories,
      (failure) {
        // Erreur ! On passe l'état en error pour que l'UI puisse l'afficher
        state = AsyncError(failure.message, failure.stackTrace);
      },
    );
    // Add a return statement to ensure a non-null value is returned
    return [];
  }
}

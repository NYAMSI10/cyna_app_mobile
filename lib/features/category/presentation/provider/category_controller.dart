import 'package:cyna/features/category/data/model/category_response.dart';
import 'package:cyna/features/category/data/usecasesImpl/category_usecase_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_controller.g.dart';

@riverpod
class CategoryController extends _$CategoryController {
  @override
  FutureOr<List<CategoryResponse>> build() {
    // Retire le '?' ici si possible pour simplifier
    return getCategoriesByOrder();
  }

  Future<List<CategoryResponse>> getCategoriesByOrder() async {
    final usecase = ref.read(categoryUsecaseProvider);

    final result = await usecase.getCategoriesByOrder();

    return result.when(
      (categories) =>
          categories.data ??
          [], // Si categories.data est List<CategoryResponse>
      (failure) {
        // Au lieu de mettre à jour le state manuellement ici,
        // on throw l'erreur. Riverpod la transformera en AsyncError automatiquement.
        throw failure.message;
      },
    );
  }
}

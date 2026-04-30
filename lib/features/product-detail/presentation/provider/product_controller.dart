import 'package:cyna/features/product-detail/data/model/product_response.dart';
import 'package:cyna/features/product-detail/data/usecasesImpl/product_usecase_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_controller.g.dart';

@riverpod
class ProductController extends _$ProductController {
  @override
  FutureOr<List<ProductResponse>> build() {
    // Retire le '?' ici si possible pour simplifier
    return getProductsByOrder();
  }

  Future<List<ProductResponse>> getProductsByOrder() async {
    final usecase = ref.read(productUsecaseProvider);

    final result = await usecase.getProductsByOrder();

    return result.when(
      (products) =>
          products.data ?? [], // Si products.data est List<ProductResponse>
      (failure) {
        // Au lieu de mettre à jour le state manuellement ici,
        // on throw l'erreur. Riverpod la transformera en AsyncError automatiquement.
        throw failure.message;
      },
    );
  }
}

import 'package:cyna/features/product-detail/data/model/product_response.dart';
import 'package:cyna/features/product-detail/data/model/sliders/slider_response.dart';
import 'package:cyna/features/product-detail/data/usecasesImpl/product_usecase_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_controller.g.dart';

/// Liste les produits de la même catégorie (API `/products/similar/{categoryId}`).
final similarProductsProvider = FutureProvider.autoDispose
    .family<List<ProductResponse>, String>((ref, categoryId) async {
  final usecase = ref.watch(productUsecaseProvider);
  final result = await usecase.getSimilarProducts(categoryId);

  return result.when(
    (products) => products.data ?? [],
    (failure) => throw failure.message,
  );
});

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

  Future<List<SliderResponse>> getTopSliders({int? limit}) async {
    final usecase = ref.read(productUsecaseProvider);

    final result = await usecase.getTopSliders(limit: limit);

    return result.when(
      (sliders) =>
          sliders.data ?? [], // Si sliders.data est List<SliderResponse>
      (failure) {
        // Au lieu de mettre à jour le state manuellement ici,
        // on throw l'erreur. Riverpod la transformera en AsyncError automatiquement.
        throw failure.message;
      },
    );
  }
}

import 'package:cyna/features/category/data/model/category_response.dart';
import 'package:cyna/features/product-detail/data/model/product_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_detail_response.freezed.dart';
part 'category_detail_response.g.dart';

/// Réponse de l'endpoint `categories/category-for-user/{slug}` :
/// renvoie la catégorie ainsi que la liste de ses produits.
@freezed
abstract class CategoryDetailResponse with _$CategoryDetailResponse {
  const factory CategoryDetailResponse({
    required CategoryResponse category,
    @Default(<ProductResponse>[]) List<ProductResponse> products,
  }) = _CategoryDetailResponse;

  factory CategoryDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryDetailResponseFromJson(json);
}

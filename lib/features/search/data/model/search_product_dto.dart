import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_product_dto.freezed.dart';
part 'search_product_dto.g.dart';

@freezed
abstract class SearchProductDto with _$SearchProductDto {
  const factory SearchProductDto({
    @JsonKey(name: '_id') required String id,
    String? name,
    List<SearchImageDto>? images,
    String? slug,
    double? priceMonth,
    double? priceYear,
    int? stock,
    String? description,
    bool? priority,
    int? order,
    // Champs spécifiques au résultat de recherche (jointure backend)
    @JsonKey(name: 'service_info') SearchServiceDto? serviceInfo,
    @JsonKey(name: 'category_info') SearchCategoryDto? categoryInfo,
  }) = _SearchProductDto;

  factory SearchProductDto.fromJson(Map<String, dynamic> json) =>
      _$SearchProductDtoFromJson(json);
}

@freezed
abstract class SearchImageDto with _$SearchImageDto {
  const factory SearchImageDto({
    @JsonKey(name: '_id') required String id,
    required String url,
  }) = _SearchImageDto;

  factory SearchImageDto.fromJson(Map<String, dynamic> json) =>
      _$SearchImageDtoFromJson(json);
}

@freezed
abstract class SearchServiceDto with _$SearchServiceDto {
  const factory SearchServiceDto({
    @JsonKey(name: '_id') String? id,
    String? name,
    String? slug,
    bool? available,
  }) = _SearchServiceDto;

  factory SearchServiceDto.fromJson(Map<String, dynamic> json) =>
      _$SearchServiceDtoFromJson(json);
}

@freezed
abstract class SearchCategoryDto with _$SearchCategoryDto {
  const factory SearchCategoryDto({
    @JsonKey(name: '_id') String? id,
    String? name,
    String? slug,
    String? image,
  }) = _SearchCategoryDto;

  factory SearchCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$SearchCategoryDtoFromJson(json);
}

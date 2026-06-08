import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_response.freezed.dart';
part 'product_response.g.dart';

@freezed
abstract class ProductResponse with _$ProductResponse {
  const factory ProductResponse({
    @JsonKey(name: '_id') required String id,
    String? name,
    List<ImageDto>? images,
    String? slug,
    double? priceMonth,
    double? priceYear,
    int? stock,
    String? description,
    bool? priority,
    int? order,
    // Le service porte la catégorie (peuplée par product-by-order).
    // ignore: invalid_annotation_target
    @JsonKey(fromJson: _serviceFromJson) ServiceDto? service,
  }) = _ProductResponse;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}

@freezed
abstract class ImageDto with _$ImageDto {
  const factory ImageDto({
    @JsonKey(name: '_id') required String id,
    required String url,
  }) = _ImageDto;

  factory ImageDto.fromJson(Map<String, dynamic> json) =>
      _$ImageDtoFromJson(json);
}

@freezed
abstract class ServiceDto with _$ServiceDto {
  const factory ServiceDto({
    @JsonKey(name: '_id') String? id,
    String? name,
    String? slug,
    // ignore: invalid_annotation_target
    @JsonKey(fromJson: _categoryFromJson) CategoryDto? category,
  }) = _ServiceDto;

  factory ServiceDto.fromJson(Map<String, dynamic> json) =>
      _$ServiceDtoFromJson(json);
}

@freezed
abstract class CategoryDto with _$CategoryDto {
  const factory CategoryDto({
    @JsonKey(name: '_id') String? id,
    String? name,
    String? slug,
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);
}

// Le backend renvoie parfois un simple ObjectId (string), parfois l'objet
// peuplé : on gère les deux cas pour éviter tout crash de désérialisation.
ServiceDto? _serviceFromJson(Object? json) {
  if (json == null) return null;
  if (json is String) return ServiceDto(id: json);
  if (json is Map) return ServiceDto.fromJson(Map<String, dynamic>.from(json));
  return null;
}

CategoryDto? _categoryFromJson(Object? json) {
  if (json == null) return null;
  if (json is String) return CategoryDto(id: json);
  if (json is Map) return CategoryDto.fromJson(Map<String, dynamic>.from(json));
  return null;
}

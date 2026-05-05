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

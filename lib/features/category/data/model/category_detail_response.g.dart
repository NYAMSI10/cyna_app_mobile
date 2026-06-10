// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryDetailResponse _$CategoryDetailResponseFromJson(
        Map<String, dynamic> json) =>
    _CategoryDetailResponse(
      category:
          CategoryResponse.fromJson(json['category'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => ProductResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProductResponse>[],
    );

Map<String, dynamic> _$CategoryDetailResponseToJson(
        _CategoryDetailResponse instance) =>
    <String, dynamic>{
      'category': instance.category,
      'products': instance.products,
    };

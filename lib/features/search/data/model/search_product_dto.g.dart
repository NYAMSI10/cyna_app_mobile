// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchProductDto _$SearchProductDtoFromJson(Map<String, dynamic> json) =>
    _SearchProductDto(
      id: json['_id'] as String,
      name: json['name'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => SearchImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      slug: json['slug'] as String?,
      priceMonth: (json['priceMonth'] as num?)?.toDouble(),
      priceYear: (json['priceYear'] as num?)?.toDouble(),
      stock: (json['stock'] as num?)?.toInt(),
      description: json['description'] as String?,
      priority: json['priority'] as bool?,
      order: (json['order'] as num?)?.toInt(),
      serviceInfo: json['service_info'] == null
          ? null
          : SearchServiceDto.fromJson(
              json['service_info'] as Map<String, dynamic>),
      categoryInfo: json['category_info'] == null
          ? null
          : SearchCategoryDto.fromJson(
              json['category_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchProductDtoToJson(_SearchProductDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'images': instance.images,
      'slug': instance.slug,
      'priceMonth': instance.priceMonth,
      'priceYear': instance.priceYear,
      'stock': instance.stock,
      'description': instance.description,
      'priority': instance.priority,
      'order': instance.order,
      'service_info': instance.serviceInfo,
      'category_info': instance.categoryInfo,
    };

_SearchImageDto _$SearchImageDtoFromJson(Map<String, dynamic> json) =>
    _SearchImageDto(
      id: json['_id'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$SearchImageDtoToJson(_SearchImageDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'url': instance.url,
    };

_SearchServiceDto _$SearchServiceDtoFromJson(Map<String, dynamic> json) =>
    _SearchServiceDto(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      available: json['available'] as bool?,
    );

Map<String, dynamic> _$SearchServiceDtoToJson(_SearchServiceDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'available': instance.available,
    };

_SearchCategoryDto _$SearchCategoryDtoFromJson(Map<String, dynamic> json) =>
    _SearchCategoryDto(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$SearchCategoryDtoToJson(_SearchCategoryDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
    };

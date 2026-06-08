// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    _ProductResponse(
      id: json['_id'] as String,
      name: json['name'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      slug: json['slug'] as String?,
      priceMonth: (json['priceMonth'] as num?)?.toDouble(),
      priceYear: (json['priceYear'] as num?)?.toDouble(),
      stock: (json['stock'] as num?)?.toInt(),
      description: json['description'] as String?,
      priority: json['priority'] as bool?,
      order: (json['order'] as num?)?.toInt(),
      service: _serviceFromJson(json['service']),
    );

Map<String, dynamic> _$ProductResponseToJson(_ProductResponse instance) =>
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
      'service': instance.service,
    };

_ImageDto _$ImageDtoFromJson(Map<String, dynamic> json) => _ImageDto(
      id: json['_id'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$ImageDtoToJson(_ImageDto instance) => <String, dynamic>{
      '_id': instance.id,
      'url': instance.url,
    };

_ServiceDto _$ServiceDtoFromJson(Map<String, dynamic> json) => _ServiceDto(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      category: _categoryFromJson(json['category']),
    );

Map<String, dynamic> _$ServiceDtoToJson(_ServiceDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'category': instance.category,
    };

_CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => _CategoryDto(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$CategoryDtoToJson(_CategoryDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };

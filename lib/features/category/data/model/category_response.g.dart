// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    _CategoryResponse(
      id: json['_id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      slug: json['slug'] as String,
      order: (json['order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CategoryResponseToJson(_CategoryResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'slug': instance.slug,
      'order': instance.order,
    };

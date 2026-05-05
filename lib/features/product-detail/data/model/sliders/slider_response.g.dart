// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SliderResponse _$SliderResponseFromJson(Map<String, dynamic> json) =>
    _SliderResponse(
      id: json['_id'] as String,
      title: json['title'] as String?,
      image: json['image'] as String?,
      nameUrl: json['nameUrl'] as String?,
      linkUrl: json['linkUrl'] as String?,
      order: (json['order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SliderResponseToJson(_SliderResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'nameUrl': instance.nameUrl,
      'linkUrl': instance.linkUrl,
      'order': instance.order,
    };

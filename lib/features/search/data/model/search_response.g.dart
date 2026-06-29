// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchPaginatedResponse _$SearchPaginatedResponseFromJson(
        Map<String, dynamic> json) =>
    _SearchPaginatedResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => SearchProductDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      lastPage: (json['lastPage'] as num).toInt(),
    );

Map<String, dynamic> _$SearchPaginatedResponseToJson(
        _SearchPaginatedResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
      'page': instance.page,
      'lastPage': instance.lastPage,
    };

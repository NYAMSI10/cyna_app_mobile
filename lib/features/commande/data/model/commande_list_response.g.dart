// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commande_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommandeListResponse _$CommandeListResponseFromJson(
        Map<String, dynamic> json) =>
    _CommandeListResponse(
      results: (json['results'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map(
                    (e) => CommandeResponse.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      totalPage: (json['totalPage'] as num).toInt(),
    );

Map<String, dynamic> _$CommandeListResponseToJson(
        _CommandeListResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
      'totalPage': instance.totalPage,
    };

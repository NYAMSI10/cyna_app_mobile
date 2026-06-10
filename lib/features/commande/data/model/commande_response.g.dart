// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commande_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommandeResponse _$CommandeResponseFromJson(Map<String, dynamic> json) =>
    _CommandeResponse(
      id: json['_id'] as String,
      reference: json['reference'] as String,
      periode: json['periode'] as String,
      nbreProducts: (json['nbreProducts'] as num).toInt(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      statut: json['statut'] as String,
      cb: json['cb'] == null
          ? null
          : CarteBancaireResponse.fromJson(json['cb'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      addresseFacturation: json['addresseFacturation'] == null
          ? null
          : AdresseFacturationResponse.fromJson(
              json['addresseFacturation'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdAtStr: json['createdAtStr'] as String?,
      abonnements: (json['abonnements'] as List<dynamic>?)
              ?.map(
                  (e) => AbonnementResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CommandeResponseToJson(_CommandeResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'reference': instance.reference,
      'periode': instance.periode,
      'nbreProducts': instance.nbreProducts,
      'totalPrice': instance.totalPrice,
      'statut': instance.statut,
      'cb': instance.cb,
      'user': instance.user,
      'addresseFacturation': instance.addresseFacturation,
      'createdAt': instance.createdAt.toIso8601String(),
      'createdAtStr': instance.createdAtStr,
      'abonnements': instance.abonnements,
    };

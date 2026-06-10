// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abonnement_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AbonnementResponse _$AbonnementResponseFromJson(Map<String, dynamic> json) =>
    _AbonnementResponse(
      id: json['_id'] as String,
      dateFin: json['dateFin'] as String,
      dateDebut: json['dateDebut'] as String,
      quantity: (json['quantity'] as num).toInt(),
      keyLicence: json['keyLicence'] as String,
      periode: json['periode'] as String,
      price: (json['price'] as num).toInt(),
      statut: json['statut'] as String,
      product: json['product'] == null
          ? null
          : ProductResponse.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AbonnementResponseToJson(_AbonnementResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'dateFin': instance.dateFin,
      'dateDebut': instance.dateDebut,
      'quantity': instance.quantity,
      'keyLicence': instance.keyLicence,
      'periode': instance.periode,
      'price': instance.price,
      'statut': instance.statut,
      'product': instance.product,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adresse_facturation_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdresseFacturationResponse _$AdresseFacturationResponseFromJson(
        Map<String, dynamic> json) =>
    _AdresseFacturationResponse(
      id: json['_id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      adresse: json['adresse'] as String,
      complementAdresse: json['complementAdresse'] as String?,
      city: json['city'] as String,
      codePostal: json['codePostal'] as String,
      region: json['region'] as String,
      country: json['country'] as String,
      phone: json['phone'] as String,
      isDefault: json['isDefault'] as bool?,
    );

Map<String, dynamic> _$AdresseFacturationResponseToJson(
        _AdresseFacturationResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'adresse': instance.adresse,
      'complementAdresse': instance.complementAdresse,
      'city': instance.city,
      'codePostal': instance.codePostal,
      'region': instance.region,
      'country': instance.country,
      'phone': instance.phone,
      'isDefault': instance.isDefault,
    };

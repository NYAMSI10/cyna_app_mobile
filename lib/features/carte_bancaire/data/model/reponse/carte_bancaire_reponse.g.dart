// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carte_bancaire_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CarteBancaireResponse _$CarteBancaireResponseFromJson(
        Map<String, dynamic> json) =>
    _CarteBancaireResponse(
      id: json['_id'] as String,
      carteName: json['carteName'] as String,
      carteNumber: json['carteNumber'] as String,
      carteDate: json['carteDate'] as String,
      carteCVV: json['carteCVV'] as String?,
      isDefault: json['isDefault'] as bool?,
      stripePaymentMethodId: json['stripePaymentMethodId'] as String?,
      stripeCustomerId: json['stripeCustomerId'] as String?,
    );

Map<String, dynamic> _$CarteBancaireResponseToJson(
        _CarteBancaireResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'carteName': instance.carteName,
      'carteNumber': instance.carteNumber,
      'carteDate': instance.carteDate,
      'carteCVV': instance.carteCVV,
      'isDefault': instance.isDefault,
      'stripePaymentMethodId': instance.stripePaymentMethodId,
      'stripeCustomerId': instance.stripeCustomerId,
    };

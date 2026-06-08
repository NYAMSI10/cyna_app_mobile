// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carte_bancaire_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CarteBancaireRequest _$CarteBancaireRequestFromJson(
        Map<String, dynamic> json) =>
    _CarteBancaireRequest(
      carteName: json['carteName'] as String,
      stripePaymentMethodId: json['stripePaymentMethodId'] as String?,
      isDefault: json['isDefault'] as bool?,
    );

Map<String, dynamic> _$CarteBancaireRequestToJson(
        _CarteBancaireRequest instance) =>
    <String, dynamic>{
      'carteName': instance.carteName,
      'stripePaymentMethodId': instance.stripePaymentMethodId,
      'isDefault': instance.isDefault,
    };

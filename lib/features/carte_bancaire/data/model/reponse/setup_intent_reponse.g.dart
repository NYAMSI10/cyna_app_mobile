// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup_intent_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SetupIntentResponse _$SetupIntentResponseFromJson(Map<String, dynamic> json) =>
    _SetupIntentResponse(
      clientSecret: json['clientSecret'] as String,
      setupIntentId: json['setupIntentId'] as String?,
      stripeCustomerId: json['stripeCustomerId'] as String?,
    );

Map<String, dynamic> _$SetupIntentResponseToJson(
        _SetupIntentResponse instance) =>
    <String, dynamic>{
      'clientSecret': instance.clientSecret,
      'setupIntentId': instance.setupIntentId,
      'stripeCustomerId': instance.stripeCustomerId,
    };

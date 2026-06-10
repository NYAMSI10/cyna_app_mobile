// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_commande_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateCommandeResponse _$CreateCommandeResponseFromJson(
        Map<String, dynamic> json) =>
    _CreateCommandeResponse(
      orderId: json['orderId'] as String?,
      paymentIntentId: json['paymentIntentId'] as String?,
      clientSecret: json['clientSecret'] as String?,
      paymentStatus: json['paymentStatus'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CreateCommandeResponseToJson(
        _CreateCommandeResponse instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'paymentIntentId': instance.paymentIntentId,
      'clientSecret': instance.clientSecret,
      'paymentStatus': instance.paymentStatus,
      'status': instance.status,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_change_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserChangePassword _$UserChangePasswordFromJson(Map<String, dynamic> json) =>
    _UserChangePassword(
      confirmPassword: json['confirmPassword'] as String,
      currentPassword: json['currentPassword'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$UserChangePasswordToJson(_UserChangePassword instance) =>
    <String, dynamic>{
      'confirmPassword': instance.confirmPassword,
      'currentPassword': instance.currentPassword,
      'newPassword': instance.newPassword,
    };

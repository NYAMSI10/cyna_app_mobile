import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_change_password.freezed.dart';
part 'user_change_password.g.dart';

@freezed
abstract class UserChangePassword with _$UserChangePassword {
  factory UserChangePassword({
    required String confirmPassword,
    required String currentPassword,
    required String newPassword,
  }) = _UserChangePassword;

  factory UserChangePassword.fromJson(Map<String, dynamic> json) =>
      _$UserChangePasswordFromJson(json);
}

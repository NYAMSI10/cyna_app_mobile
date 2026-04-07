import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
abstract class UserResponse with _$UserResponse {
  factory UserResponse({
    @JsonKey(name: '_id') String? id,
    String? firstName,
    String? lastName,
    String? email, // On utilise l'enum ici au lieu de String
    String? role,
    bool? confirmed,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}

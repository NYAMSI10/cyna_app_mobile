import 'package:cyna/features/profile/data/model/response/user_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'adresse_facturation_reponse.freezed.dart';
part 'adresse_facturation_reponse.g.dart';

@freezed
abstract class AdresseFacturationResponse with _$AdresseFacturationResponse {
  factory AdresseFacturationResponse({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id') required String id,
    required String firstName,
    required String lastName,
    required String adresse,
    String? complementAdresse,
    required String city,
    required String codePostal,
    required String region,
    required String country,
    required String phone,
    bool? isDefault,
    // @JsonKey(fromJson: _userFromJson, toJson: _userToJson)
    // UserResponse? user,
  }) = _AdresseFacturationResponse;

  factory AdresseFacturationResponse.fromJson(Map<String, dynamic> json) =>
      _$AdresseFacturationResponseFromJson(json);
}

UserResponse? _userFromJson(Object? json) {
  if (json == null) return null;

  if (json is String) {
    return UserResponse(id: json);
  }

  if (json is Map<String, dynamic>) {
    return UserResponse.fromJson(json);
  }

  if (json is Map) {
    return UserResponse.fromJson(Map<String, dynamic>.from(json));
  }

  return null;
}

Object? _userToJson(UserResponse? user) => user?.toJson();

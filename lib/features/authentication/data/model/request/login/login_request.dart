import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_request.freezed.dart';
part 'login_request.g.dart';

@freezed
abstract class LoginRequest with _$LoginRequest {
  // Ajoute cette ligne pour permettre l'ajout de méthodes/getters plus tard
  const LoginRequest._();

  factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

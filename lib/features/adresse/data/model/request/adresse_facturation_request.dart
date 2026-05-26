import 'package:freezed_annotation/freezed_annotation.dart';

part 'adresse_facturation_request.freezed.dart';
part 'adresse_facturation_request.g.dart';

@freezed
abstract class AdresseFacturationRequest with _$AdresseFacturationRequest {
  factory AdresseFacturationRequest({
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
  }) = _AdresseFacturationRequest;

  factory AdresseFacturationRequest.fromJson(Map<String, dynamic> json) =>
      _$AdresseFacturationRequestFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'carte_bancaire_reponse.freezed.dart';
part 'carte_bancaire_reponse.g.dart';

@freezed
abstract class CarteBancaireResponse with _$CarteBancaireResponse {
  factory CarteBancaireResponse({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id') required String id,
    required String carteName,
    required String carteNumber,
    required String carteDate,
    String? carteCVV,
    bool? isDefault,
    String? stripePaymentMethodId,
    String? stripeCustomerId,
  }) = _CarteBancaireResponse;

  factory CarteBancaireResponse.fromJson(Map<String, dynamic> json) =>
      _$CarteBancaireResponseFromJson(json);
}

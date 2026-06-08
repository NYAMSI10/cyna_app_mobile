import 'package:freezed_annotation/freezed_annotation.dart';

part 'carte_bancaire_request.freezed.dart';
part 'carte_bancaire_request.g.dart';

@freezed
abstract class CarteBancaireRequest with _$CarteBancaireRequest {
  factory CarteBancaireRequest({
    required String carteName,
    String? stripePaymentMethodId,
    bool? isDefault,
  }) = _CarteBancaireRequest;

  factory CarteBancaireRequest.fromJson(Map<String, dynamic> json) =>
      _$CarteBancaireRequestFromJson(json);
}

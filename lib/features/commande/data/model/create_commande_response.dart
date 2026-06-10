import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_commande_response.freezed.dart';
part 'create_commande_response.g.dart';

/// Réponse du paiement d'une commande (`POST /api/commandes/create`).
///
/// `status` peut valoir : PAID, REQUIRES_ACTION, PENDING.
/// `clientSecret` n'est renseigné que lorsqu'une authentification 3DS est
/// nécessaire (status REQUIRES_ACTION).
@freezed
abstract class CreateCommandeResponse with _$CreateCommandeResponse {
  factory CreateCommandeResponse({
    String? orderId,
    String? paymentIntentId,
    String? clientSecret,
    String? paymentStatus,
    String? status,
  }) = _CreateCommandeResponse;

  factory CreateCommandeResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCommandeResponseFromJson(json);
}

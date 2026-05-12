import 'package:cyna/features/abonnement/data/model/abonnement_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'commande_response.freezed.dart';
part 'commande_response.g.dart';

@freezed
abstract class CommandeResponse with _$CommandeResponse {
  factory CommandeResponse({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id')
    required String
        id, // Changement ici : paramètre nommé sans _, annotation pour le JSON
    required String reference,
    required String periode,
    required int nbreProducts,
    required int totalPrice,
    required String statut,
    required List<AbonnementResponse> abonnements,
  }) = _CommandeResponse;

  factory CommandeResponse.fromJson(Map<String, dynamic> json) =>
      _$CommandeResponseFromJson(json);
}

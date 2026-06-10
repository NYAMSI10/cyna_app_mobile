import 'package:cyna/features/abonnement/data/model/abonnement_response.dart';
import 'package:cyna/features/adresse/data/model/reponse/adresse_facturation_reponse.dart';
import 'package:cyna/features/carte_bancaire/data/model/reponse/carte_bancaire_reponse.dart';
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
    required double totalPrice,
    required String statut,
    CarteBancaireResponse? cb,
    AdresseFacturationResponse? addresseFacturation,
    required DateTime createdAt,
    required String createdAtStr,
    @Default([]) List<AbonnementResponse> abonnements,
  }) = _CommandeResponse;

  factory CommandeResponse.fromJson(Map<String, dynamic> json) =>
      _$CommandeResponseFromJson(json);
}

import 'package:cyna/features/product-detail/data/model/product_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'abonnement_response.freezed.dart';
part 'abonnement_response.g.dart';

@freezed
abstract class AbonnementResponse with _$AbonnementResponse {
  factory AbonnementResponse({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id')
    required String
        id, // Changement ici : paramètre nommé sans _, annotation pour le JSON
    required String dateFin,
    required String dateDebut,
    required int quantity,
    required String keyLicence,
    required String periode,
    required int price,
    required String statut,
    required ProductResponse product,
  }) = _AbonnementResponse;

  factory AbonnementResponse.fromJson(Map<String, dynamic> json) =>
      _$AbonnementResponseFromJson(json);
}

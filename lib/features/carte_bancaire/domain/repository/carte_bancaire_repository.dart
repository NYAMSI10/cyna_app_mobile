import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/carte_bancaire/data/model/reponse/carte_bancaire_reponse.dart';
import 'package:cyna/features/carte_bancaire/data/model/reponse/setup_intent_reponse.dart';
import 'package:cyna/features/carte_bancaire/data/model/request/carte_bancaire_request.dart';

abstract interface class CarteBancaireRepository {
  Future<ApiResponse<List<CarteBancaireResponse>>> getCartes();
  Future<ApiResponse<SetupIntentResponse>> createSetupIntent();
  Future<ApiResponse<CarteBancaireResponse>> createCarte(
      CarteBancaireRequest carte);
  Future<ApiResponse<CarteBancaireResponse>> updateCarte(
      CarteBancaireRequest carte, String id);
  Future<ApiResponse<dynamic>> deleteCarte(String id);
  Future<ApiResponse<dynamic>> setDefaultCarte(String id);
}

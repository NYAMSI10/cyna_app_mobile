import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/carte_bancaire/data/model/reponse/carte_bancaire_reponse.dart';
import 'package:cyna/features/carte_bancaire/data/model/reponse/setup_intent_reponse.dart';
import 'package:cyna/features/carte_bancaire/data/model/request/carte_bancaire_request.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class CarteBancaireUsecase {
  Future<Result<ApiResponse<List<CarteBancaireResponse>>, Failure>>
      getCartes();
  Future<Result<ApiResponse<SetupIntentResponse>, Failure>>
      createSetupIntent();
  Future<Result<ApiResponse<CarteBancaireResponse>, Failure>> createCarte(
      CarteBancaireRequest carte);
  Future<Result<ApiResponse<CarteBancaireResponse>, Failure>> updateCarte(
      CarteBancaireRequest carte, String id);
  Future<Result<ApiResponse<dynamic>, Failure>> deleteCarte(String id);
  Future<Result<ApiResponse<dynamic>, Failure>> setDefaultCarte(String id);
}

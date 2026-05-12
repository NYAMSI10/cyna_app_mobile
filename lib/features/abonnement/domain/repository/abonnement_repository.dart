import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/abonnement/data/model/abonnement_response.dart';

abstract interface class AbonnementRepository {
  Future<ApiResponse<List<AbonnementResponse>>> getAbonnements();
}

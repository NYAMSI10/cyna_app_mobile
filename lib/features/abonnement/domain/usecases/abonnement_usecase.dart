import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/abonnement/data/model/abonnement_response.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class AbonnementUseCase {
  Future<Result<ApiResponse<List<AbonnementResponse>>, Failure>>
      getAbonnements();
}

import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/commande/data/model/commande_response.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class CommandeUsecase {
  Future<Result<ApiResponse<List<CommandeResponse>>, Failure>> getCommandes(
    Map<String, dynamic>? queries,
  );
}

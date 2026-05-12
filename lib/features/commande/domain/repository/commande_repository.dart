import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/commande/data/model/commande_response.dart';

abstract interface class CommandeRepository {
  Future<ApiResponse<List<CommandeResponse>>> getCommandes(
    Map<String, dynamic>? queries,
  );
}

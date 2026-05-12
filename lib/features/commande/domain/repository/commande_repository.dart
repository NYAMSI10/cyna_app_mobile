import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/commande/data/model/commande_list_response.dart';

abstract interface class CommandeRepository {
  Future<ApiResponse<CommandeListResponse>> getCommandes(
    Map<String, dynamic>? queries,
  );
}

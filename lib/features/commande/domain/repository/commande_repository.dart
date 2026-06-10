import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/commande/data/model/commande_list_response.dart';
import 'package:cyna/features/commande/data/model/create_commande_response.dart';

abstract interface class CommandeRepository {
  Future<ApiResponse<CommandeListResponse>> getCommandes(
    Map<String, dynamic>? queries,
  );

  Future<ApiResponse<CreateCommandeResponse>> createCommande(
    Map<String, dynamic> body,
  );

  Future<ApiResponse<dynamic>> confirmPayment(Map<String, dynamic> queries);
}

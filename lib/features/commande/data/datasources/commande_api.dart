import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/core/data/remote/endpoint.dart';
import 'package:cyna/core/data/remote/network_service.dart';

import 'package:cyna/features/commande/data/model/commande_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'commande_api.g.dart';

final commandeApiProvider = Provider.autoDispose<CommandeApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return CommandeApi(dio);
});

@RestApi()
abstract class CommandeApi {
  factory CommandeApi(Dio dio) => _CommandeApi(dio);

  @GET(getCommandesEndPoint)
  Future<ApiResponse<List<CommandeResponse>>> getCommandes(
    @Queries() Map<String, dynamic>? queries,
  );
}

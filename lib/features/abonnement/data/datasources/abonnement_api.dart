import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/core/data/remote/endpoint.dart';
import 'package:cyna/core/data/remote/network_service.dart';

import 'package:cyna/features/abonnement/data/model/abonnement_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'abonnement_api.g.dart';

final abonnementApiProvider = Provider.autoDispose<AbonnementApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return AbonnementApi(dio);
});

@RestApi()
abstract class AbonnementApi {
  factory AbonnementApi(Dio dio) => _AbonnementApi(dio);

  @GET(getAbonnementEndPoint)
  Future<ApiResponse<List<AbonnementResponse>>> getAbonnements();
}

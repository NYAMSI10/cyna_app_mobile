import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/core/data/remote/endpoint.dart';
import 'package:cyna/core/data/remote/network_service.dart';
import 'package:cyna/features/adresse/data/model/reponse/adresse_facturation_reponse.dart';
import 'package:cyna/features/adresse/data/model/request/adresse_facturation_request.dart';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'adresse_api.g.dart';

final adresseApiProvider = Provider.autoDispose<AdresseApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return AdresseApi(dio);
});

@RestApi()
abstract class AdresseApi {
  factory AdresseApi(Dio dio) => _AdresseApi(dio);

  @GET(getAdressesEndPoint)
  Future<ApiResponse<List<AdresseFacturationResponse>>> getAdresses();

  @POST(createAdresseEndPoint)
  Future<ApiResponse<dynamic>> createAdresse(
      @Body() AdresseFacturationRequest adresse);
}

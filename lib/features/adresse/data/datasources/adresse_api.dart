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

  @PATCH(updateAdresseEndPoint)
  Future<ApiResponse<AdresseFacturationResponse>> updateAdresse(
      @Body() AdresseFacturationRequest adresse, @Path("id") String id);

  @DELETE(deleteAdresseEndPoint)
  Future<ApiResponse<dynamic>> deleteAdresse(@Path("id") String id);

  @GET(setDefaultAdresseEndPoint)
  Future<ApiResponse<dynamic>> setDefaultAdresse(@Path("id") String id);
}

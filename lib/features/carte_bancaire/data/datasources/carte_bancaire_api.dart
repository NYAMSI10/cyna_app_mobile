import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/core/data/remote/endpoint.dart';
import 'package:cyna/core/data/remote/network_service.dart';
import 'package:cyna/features/carte_bancaire/data/model/reponse/carte_bancaire_reponse.dart';
import 'package:cyna/features/carte_bancaire/data/model/reponse/setup_intent_reponse.dart';
import 'package:cyna/features/carte_bancaire/data/model/request/carte_bancaire_request.dart';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'carte_bancaire_api.g.dart';

final carteBancaireApiProvider = Provider.autoDispose<CarteBancaireApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return CarteBancaireApi(dio);
});

@RestApi()
abstract class CarteBancaireApi {
  factory CarteBancaireApi(Dio dio) => _CarteBancaireApi(dio);

  @GET(getCartesEndPoint)
  Future<ApiResponse<List<CarteBancaireResponse>>> getCartes();

  @POST(setupIntentCarteEndPoint)
  Future<ApiResponse<SetupIntentResponse>> createSetupIntent();

  @POST(createCarteEndPoint)
  Future<ApiResponse<dynamic>> createCarte(
      @Body() CarteBancaireRequest carte);

  @PATCH(updateCarteEndPoint)
  Future<ApiResponse<CarteBancaireResponse>> updateCarte(
      @Body() CarteBancaireRequest carte, @Path("id") String id);

  @DELETE(deleteCarteEndPoint)
  Future<ApiResponse<dynamic>> deleteCarte(@Path("id") String id);

  @GET(setDefaultCarteEndPoint)
  Future<ApiResponse<dynamic>> setDefaultCarte(@Path("id") String id);
}

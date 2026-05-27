import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/adresse/data/model/reponse/adresse_facturation_reponse.dart';
import 'package:cyna/features/adresse/data/model/request/adresse_facturation_request.dart';

abstract interface class AdresseFacturationRepository {
  Future<ApiResponse<List<AdresseFacturationResponse>>> getAdresses();
  Future<ApiResponse<AdresseFacturationResponse>> createAdresse(
      AdresseFacturationRequest adresse);
  Future<ApiResponse<AdresseFacturationResponse>> updateAdresse(
      AdresseFacturationRequest adresse, String id);
  Future<ApiResponse<dynamic>> deleteAdresse(String id);
  Future<ApiResponse<dynamic>> setDefaultAdresse(String id);
}

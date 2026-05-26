import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/adresse/data/model/reponse/adresse_facturation_reponse.dart';
import 'package:cyna/features/adresse/data/model/request/adresse_facturation_request.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class AdresseFacturationUsecase {
  Future<Result<ApiResponse<List<AdresseFacturationResponse>>, Failure>>
      getAdresses();
  Future<Result<ApiResponse<AdresseFacturationResponse>, Failure>>
      createAdresse(AdresseFacturationRequest adresse);
}

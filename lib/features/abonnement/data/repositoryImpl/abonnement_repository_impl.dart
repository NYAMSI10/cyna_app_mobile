import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/core/dio_eroor_exception.dart';
import 'package:cyna/features/abonnement/data/datasources/abonnement_api.dart';
import 'package:cyna/features/abonnement/data/model/abonnement_response.dart';
import 'package:cyna/features/abonnement/domain/repository/abonnement_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final abonnementRepositoryProvider =
    Provider.autoDispose<AbonnementRepository>((ref) {
  final abonnementApi = ref.watch(abonnementApiProvider);

  return AbonnementRepositoryImpl(abonnementApi);
});

final class AbonnementRepositoryImpl implements AbonnementRepository {
  final AbonnementApi _abonnementApi;

  AbonnementRepositoryImpl(this._abonnementApi);

  @override
  Future<ApiResponse<List<AbonnementResponse>>> getAbonnements() async {
    try {
      final response = await _abonnementApi.getAbonnements();
      return response;
    } on DioException catch (e) {
      throw e.toFailure();
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred".hardcoded,
        // Si 'e' est déjà une Exception, on la garde, sinon on crée une nouvelle Exception
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }
}

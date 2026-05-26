import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/core/dio_eroor_exception.dart';
import 'package:cyna/features/adresse/data/datasources/adresse_api.dart';
import 'package:cyna/features/adresse/data/model/reponse/adresse_facturation_reponse.dart';
import 'package:cyna/features/adresse/data/model/request/adresse_facturation_request.dart';
import 'package:cyna/features/adresse/domain/repository/adresse_facturation_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final adresseFacturationRepositoryProvider =
    Provider.autoDispose<AdresseFacturationRepository>((ref) {
  final adresseApi = ref.watch(adresseApiProvider);

  return AdresseFacturationRepositoryImpl(adresseApi);
});

final class AdresseFacturationRepositoryImpl
    implements AdresseFacturationRepository {
  final AdresseApi _adresseApi;

  AdresseFacturationRepositoryImpl(this._adresseApi);

  @override
  Future<ApiResponse<List<AdresseFacturationResponse>>> getAdresses() async {
    try {
      final response = await _adresseApi.getAdresses();
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

  @override
  Future<ApiResponse<AdresseFacturationResponse>> createAdresse(
      AdresseFacturationRequest adresse) async {
    try {
      final response = await _adresseApi.createAdresse(adresse);
      return ApiResponse<AdresseFacturationResponse>(
        success: response.success,
        message: response.message,
        data: _adresseFromJson(response.data),
      );
    } on DioException catch (e) {
      throw e.toFailure();
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred".hardcoded,
        // Si 'e' est deja une Exception, on la garde, sinon on cree une nouvelle Exception
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }

  AdresseFacturationResponse? _adresseFromJson(dynamic json) {
    if (json == null) return null;

    if (json is AdresseFacturationResponse) {
      return json;
    }

    if (json is Map<String, dynamic>) {
      return AdresseFacturationResponse.fromJson(json);
    }

    if (json is Map) {
      return AdresseFacturationResponse.fromJson(
        Map<String, dynamic>.from(json),
      );
    }

    return null;
  }
}

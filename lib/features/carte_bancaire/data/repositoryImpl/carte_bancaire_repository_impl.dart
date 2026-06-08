import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/core/dio_eroor_exception.dart';
import 'package:cyna/features/carte_bancaire/data/datasources/carte_bancaire_api.dart';
import 'package:cyna/features/carte_bancaire/data/model/reponse/carte_bancaire_reponse.dart';
import 'package:cyna/features/carte_bancaire/data/model/reponse/setup_intent_reponse.dart';
import 'package:cyna/features/carte_bancaire/data/model/request/carte_bancaire_request.dart';
import 'package:cyna/features/carte_bancaire/domain/repository/carte_bancaire_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final carteBancaireRepositoryProvider =
    Provider.autoDispose<CarteBancaireRepository>((ref) {
  final carteApi = ref.watch(carteBancaireApiProvider);

  return CarteBancaireRepositoryImpl(carteApi);
});

final class CarteBancaireRepositoryImpl implements CarteBancaireRepository {
  final CarteBancaireApi _carteApi;

  CarteBancaireRepositoryImpl(this._carteApi);

  @override
  Future<ApiResponse<List<CarteBancaireResponse>>> getCartes() async {
    try {
      final response = await _carteApi.getCartes();
      return response;
    } on DioException catch (e) {
      throw e.toFailure();
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred".hardcoded,
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }

  @override
  Future<ApiResponse<SetupIntentResponse>> createSetupIntent() async {
    try {
      final response = await _carteApi.createSetupIntent();
      return response;
    } on DioException catch (e) {
      throw e.toFailure();
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred".hardcoded,
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }

  @override
  Future<ApiResponse<CarteBancaireResponse>> createCarte(
      CarteBancaireRequest carte) async {
    try {
      final response = await _carteApi.createCarte(carte);
      return ApiResponse<CarteBancaireResponse>(
        success: response.success,
        message: response.message,
        data: _carteFromJson(response.data),
      );
    } on DioException catch (e) {
      throw e.toFailure();
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred".hardcoded,
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }

  @override
  Future<ApiResponse<CarteBancaireResponse>> updateCarte(
      CarteBancaireRequest carte, String id) async {
    try {
      final response = await _carteApi.updateCarte(carte, id);
      return ApiResponse<CarteBancaireResponse>(
        success: response.success,
        message: response.message,
        data: _carteFromJson(response.data),
      );
    } on DioException catch (e) {
      throw e.toFailure();
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred".hardcoded,
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }

  @override
  Future<ApiResponse<dynamic>> deleteCarte(String id) async {
    try {
      final response = await _carteApi.deleteCarte(id);
      return response;
    } on DioException catch (e) {
      throw e.toFailure();
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred".hardcoded,
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }

  @override
  Future<ApiResponse<dynamic>> setDefaultCarte(String id) async {
    try {
      final response = await _carteApi.setDefaultCarte(id);
      return response;
    } on DioException catch (e) {
      throw e.toFailure();
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred".hardcoded,
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }

  CarteBancaireResponse? _carteFromJson(dynamic json) {
    if (json == null) return null;

    if (json is CarteBancaireResponse) {
      return json;
    }

    if (json is Map<String, dynamic>) {
      return CarteBancaireResponse.fromJson(json);
    }

    if (json is Map) {
      return CarteBancaireResponse.fromJson(
        Map<String, dynamic>.from(json),
      );
    }

    return null;
  }
}

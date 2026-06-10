import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/core/dio_eroor_exception.dart';
import 'package:cyna/features/commande/data/datasources/commande_api.dart';
import 'package:cyna/features/commande/data/model/commande_list_response.dart';
import 'package:cyna/features/commande/data/model/create_commande_response.dart';
import 'package:cyna/features/commande/domain/repository/commande_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commandeRepositoryProvider =
    Provider.autoDispose<CommandeRepository>((ref) {
  final commandeApi = ref.watch(commandeApiProvider);

  return CommandeRepositoryImpl(commandeApi);
});

final class CommandeRepositoryImpl implements CommandeRepository {
  final CommandeApi _commandeApi;

  CommandeRepositoryImpl(this._commandeApi);

  @override
  Future<ApiResponse<CommandeListResponse>> getCommandes(
    Map<String, dynamic>? queries,
  ) async {
    try {
      final response = await _commandeApi.getCommandes(queries);
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
  Future<ApiResponse<CreateCommandeResponse>> createCommande(
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await _commandeApi.createCommande(body);
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
  Future<ApiResponse<dynamic>> confirmPayment(
    Map<String, dynamic> queries,
  ) async {
    try {
      final response = await _commandeApi.confirmPayment(queries);
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
}

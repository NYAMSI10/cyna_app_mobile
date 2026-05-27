import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/adresse/data/model/request/adresse_facturation_request.dart';
import 'package:cyna/features/adresse/domain/usecases/adresse_facturation_usecase.dart';
import 'package:cyna/features/adresse/data/model/reponse/adresse_facturation_reponse.dart';
import 'package:cyna/features/adresse/data/repositoryImpl/adresse_facturation_repository_impl.dart';
import 'package:cyna/features/adresse/domain/repository/adresse_facturation_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

final adresseFacturationUsecaseProvider =
    Provider.autoDispose<AdresseFacturationUsecase>((ref) {
  final adresseRepository = ref.watch(adresseFacturationRepositoryProvider);

  return AdresseFacturationUsecaseImpl(adresseRepository);
});

final class AdresseFacturationUsecaseImpl implements AdresseFacturationUsecase {
  final AdresseFacturationRepository _adresseRepository;

  AdresseFacturationUsecaseImpl(this._adresseRepository);

  @override
  Future<Result<ApiResponse<List<AdresseFacturationResponse>>, Failure>>
      getAdresses() async {
    try {
      final response = await _adresseRepository.getAdresses();

      if (!response.success) {
        return Result.error(
          Failure(
            message: response.message ??
                "Une erreur inattendue est survenue".hardcoded,
          ),
        );
      }

      return Result.success(response);
    } catch (e, s) {
      return Result.error(_toFailure(e, s));
    }
  }

  @override
  Future<Result<ApiResponse<AdresseFacturationResponse>, Failure>>
      createAdresse(AdresseFacturationRequest adresse) async {
    try {
      final response = await _adresseRepository.createAdresse(adresse);

      if (!response.success) {
        return Result.error(
          Failure(
            message: response.message ??
                "Une erreur inattendue est survenue".hardcoded,
          ),
        );
      }

      return Result.success(response);
    } catch (e, s) {
      return Result.error(_toFailure(e, s));
    }
  }

  @override
  Future<Result<ApiResponse<AdresseFacturationResponse>, Failure>>
      updateAdresse(AdresseFacturationRequest adresse, String id) async {
    try {
      final response = await _adresseRepository.updateAdresse(adresse, id);

      if (!response.success) {
        return Result.error(
          Failure(
            message: response.message ??
                "Une erreur inattendue est survenue".hardcoded,
          ),
        );
      }
      return Result.success(response);
    } catch (e, s) {
      return Result.error(_toFailure(e, s));
    }
  }

  @override
  Future<Result<ApiResponse<dynamic>, Failure>> deleteAdresse(String id) async {
    try {
      final response = await _adresseRepository.deleteAdresse(id);

      if (!response.success) {
        return Result.error(
          Failure(
            message: response.message ??
                "Une erreur inattendue est survenue".hardcoded,
          ),
        );
      }

      return Result.success(response);
    } catch (e, s) {
      return Result.error(_toFailure(e, s));
    }
  }

  @override
  Future<Result<ApiResponse<dynamic>, Failure>> setDefaultAdresse(
      String id) async {
    try {
      final response = await _adresseRepository.setDefaultAdresse(id);

      if (!response.success) {
        return Result.error(
          Failure(
            message: response.message ??
                "Une erreur inattendue est survenue".hardcoded,
          ),
        );
      }

      return Result.success(response);
    } catch (e, s) {
      return Result.error(_toFailure(e, s));
    }
  }

  Failure _toFailure(Object e, StackTrace s) {
    if (e is Failure) return e;

    return Failure(
      message: "An unexpected error occurred".hardcoded,
      exception: e is Exception ? e : Exception(e.toString()),
      stackTrace: s,
    );
  }
}

import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/carte_bancaire/data/model/reponse/carte_bancaire_reponse.dart';
import 'package:cyna/features/carte_bancaire/data/model/reponse/setup_intent_reponse.dart';
import 'package:cyna/features/carte_bancaire/data/model/request/carte_bancaire_request.dart';
import 'package:cyna/features/carte_bancaire/data/repositoryImpl/carte_bancaire_repository_impl.dart';
import 'package:cyna/features/carte_bancaire/domain/repository/carte_bancaire_repository.dart';
import 'package:cyna/features/carte_bancaire/domain/usecases/carte_bancaire_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

final carteBancaireUsecaseProvider =
    Provider.autoDispose<CarteBancaireUsecase>((ref) {
  final carteRepository = ref.watch(carteBancaireRepositoryProvider);

  return CarteBancaireUsecaseImpl(carteRepository);
});

final class CarteBancaireUsecaseImpl implements CarteBancaireUsecase {
  final CarteBancaireRepository _carteRepository;

  CarteBancaireUsecaseImpl(this._carteRepository);

  @override
  Future<Result<ApiResponse<List<CarteBancaireResponse>>, Failure>>
      getCartes() async {
    try {
      final response = await _carteRepository.getCartes();

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
  Future<Result<ApiResponse<SetupIntentResponse>, Failure>>
      createSetupIntent() async {
    try {
      final response = await _carteRepository.createSetupIntent();

      if (!response.success || response.data == null) {
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
  Future<Result<ApiResponse<CarteBancaireResponse>, Failure>> createCarte(
      CarteBancaireRequest carte) async {
    try {
      final response = await _carteRepository.createCarte(carte);

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
  Future<Result<ApiResponse<CarteBancaireResponse>, Failure>> updateCarte(
      CarteBancaireRequest carte, String id) async {
    try {
      final response = await _carteRepository.updateCarte(carte, id);

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
  Future<Result<ApiResponse<dynamic>, Failure>> deleteCarte(String id) async {
    try {
      final response = await _carteRepository.deleteCarte(id);

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
  Future<Result<ApiResponse<dynamic>, Failure>> setDefaultCarte(
      String id) async {
    try {
      final response = await _carteRepository.setDefaultCarte(id);

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

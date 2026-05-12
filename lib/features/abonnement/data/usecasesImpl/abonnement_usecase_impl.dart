import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/abonnement/data/model/abonnement_response.dart';
import 'package:cyna/features/abonnement/data/repositoryImpl/abonnement_repository_impl.dart';
import 'package:cyna/features/abonnement/domain/repository/abonnement_repository.dart';
import 'package:cyna/features/abonnement/domain/usecases/abonnement_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

final abonnementUsecaseProvider =
    Provider.autoDispose<AbonnementUseCase>((ref) {
  final abonnementRepository = ref.watch(abonnementRepositoryProvider);

  return AbonnementUsecaseImpl(abonnementRepository);
});

final class AbonnementUsecaseImpl implements AbonnementUseCase {
  final AbonnementRepository _abonnementRepository;

  AbonnementUsecaseImpl(this._abonnementRepository);

  @override
  Future<Result<ApiResponse<List<AbonnementResponse>>, Failure>>
      getAbonnements() async {
    try {
      final response = await _abonnementRepository.getAbonnements();

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
      throw Failure(
        message: "An unexpected error occurred".hardcoded,
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }
}

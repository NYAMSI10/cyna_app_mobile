import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/commande/data/model/commande_list_response.dart';
import 'package:cyna/features/commande/data/repositoryImpl/commande_repository_impl.dart';
import 'package:cyna/features/commande/domain/repository/commande_repository.dart';
import 'package:cyna/features/commande/domain/usecases/commande_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

final commandeUsecaseProvider = Provider.autoDispose<CommandeUsecase>((ref) {
  final commandeRepository = ref.watch(commandeRepositoryProvider);

  return CommandeUsecaseImpl(commandeRepository);
});

final class CommandeUsecaseImpl implements CommandeUsecase {
  final CommandeRepository _commandeRepository;

  CommandeUsecaseImpl(this._commandeRepository);

  @override
  Future<Result<ApiResponse<CommandeListResponse>, Failure>> getCommandes(
    Map<String, dynamic>? queries,
  ) async {
    try {
      final response = await _commandeRepository.getCommandes(queries);

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

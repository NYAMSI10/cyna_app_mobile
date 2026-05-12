import 'package:cyna/common/helpers/notification_helper.dart';
import 'package:cyna/features/commande/data/model/commande_response.dart';
import 'package:cyna/features/commande/data/usecasesImpl/commande_usecase_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'commande_controller.g.dart';

@riverpod
class CommandeController extends _$CommandeController {
  @override
  FutureOr<List<CommandeResponse>> build() {
    // Retire le '?' ici si possible pour simplifier
    return getCommandes();
  }

  Future<void> refreshCommande() async {
    state = const AsyncLoading();
    ref.invalidateSelf(); // Cela force le build() à se relancer
    await future; // Attend que le nouveau build soit terminé
  }

// Ajoute des paramètres optionnels à ta fonction
  Future<List<CommandeResponse>> getCommandes({
    int page = 1,
    int limit = 10,
    String? search,
    String? status,
    String? year,
  }) async {
    final usecase = ref.read(commandeUsecaseProvider);

    // On prépare les queries pour le repository
    final Map<String, dynamic> queries = {
      'page': page,
      'limit': limit,
      if (search != null && search.isNotEmpty) 'search': search,
      if (status != null) 'status': status,
      if (year != null) 'year': year,
    };

    // On passe les queries au usecase (pense à mettre à jour la signature du usecase)
    final result = await usecase.getCommandes(queries);

    return result.when(
      (commandes) => commandes.data ?? [],
      (failure) {
        TNotifications.error(message: failure.message);
        throw failure;
      },
    );
  }
}

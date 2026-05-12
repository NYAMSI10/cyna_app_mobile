import 'package:cyna/common/helpers/notification_helper.dart';
import 'package:cyna/features/abonnement/data/model/abonnement_response.dart';
import 'package:cyna/features/abonnement/data/usecasesImpl/abonnement_usecase_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'abonnement_controller.g.dart';

@riverpod
class AbonnementController extends _$AbonnementController {
  @override
  FutureOr<List<AbonnementResponse>> build() {
    // Retire le '?' ici si possible pour simplifier
    return getAbonnements();
  }

  Future<void> refreshAbonnement() async {
    state = const AsyncLoading();
    ref.invalidateSelf(); // Cela force le build() à se relancer
    await future; // Attend que le nouveau build soit terminé
  }

  Future<List<AbonnementResponse>> getAbonnements() async {
    final usecase = ref.read(abonnementUsecaseProvider);

    final result = await usecase.getAbonnements();

    return result.when(
      (abonnements) =>
          abonnements.data ??
          [], // Si abonnements.data est List<AbonnementResponse>
      (failure) {
        // Au lieu de mettre à jour le state manuellement ici,
        // on throw l'erreur. Riverpod la transformera en AsyncError automatiquement.
        TNotifications.error(message: failure.message);
        throw failure;
      },
    );
  }
}

import 'package:cyna/common/helpers/notification_helper.dart';
import 'package:cyna/features/adresse/data/model/reponse/adresse_facturation_reponse.dart';
import 'package:cyna/features/adresse/data/model/request/adresse_facturation_request.dart';
import 'package:cyna/features/adresse/data/usecasesImpl/adresse_facturation_usecase_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'adresse_facturation_controller.g.dart';

@riverpod
class AdresseFacturationController extends _$AdresseFacturationController {
  @override
  FutureOr<List<AdresseFacturationResponse>> build() {
    // Retire le '?' ici si possible pour simplifier
    return getAdresses();
  }

  Future<List<AdresseFacturationResponse>> getAdresses() async {
    final usecase = ref.read(adresseFacturationUsecaseProvider);

    final result = await usecase.getAdresses();

    return result.when(
      (adresses) =>
          adresses.data ??
          [], // Si adresses.data est List<AdresseFacturationResponse>
      (failure) {
        // Au lieu de mettre à jour le state manuellement ici,
        // on throw l'erreur. Riverpod la transformera en AsyncError automatiquement.
        throw failure.message;
      },
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => getAdresses());
  }

  Future<void> createAdresse(AdresseFacturationRequest adresse) async {
    final usecase = ref.read(adresseFacturationUsecaseProvider);

    final result = await usecase.createAdresse(adresse);

    return result.when(
      (response) {
        TNotifications.success(message: response.message!);
        // Après la création, on rafraîchit la liste des adresses
        refresh();
      },
      (failure) {
        TNotifications.error(message: failure.message);
      },
    );
  }
}

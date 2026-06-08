import 'package:cyna/common/helpers/notification_helper.dart';
import 'package:cyna/features/carte_bancaire/data/model/reponse/carte_bancaire_reponse.dart';
import 'package:cyna/features/carte_bancaire/data/model/request/carte_bancaire_request.dart';
import 'package:cyna/features/carte_bancaire/data/usecasesImpl/carte_bancaire_usecase_impl.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'carte_bancaire_controller.g.dart';

@riverpod
class CarteBancaireController extends _$CarteBancaireController {
  @override
  FutureOr<List<CarteBancaireResponse>> build() {
    return getCartes();
  }

  Future<List<CarteBancaireResponse>> getCartes() async {
    final usecase = ref.read(carteBancaireUsecaseProvider);

    final result = await usecase.getCartes();

    return result.when(
      (cartes) => cartes.data ?? [],
      (failure) {
        // Riverpod transformera l'erreur en AsyncError automatiquement.
        throw failure.message;
      },
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => getCartes());
  }

  /// Ajoute une carte via le flux sécurisé Stripe :
  /// 1. Création d'un SetupIntent côté backend (clientSecret).
  /// 2. Confirmation avec les données de carte saisies (CardField) → PaymentMethod.
  /// 3. Enregistrement de la carte (pm_...) côté backend.
  Future<bool> createCarte({
    required String carteName,
    required bool isDefault,
  }) async {
    final usecase = ref.read(carteBancaireUsecaseProvider);

    // 1. SetupIntent
    final setupResult = await usecase.createSetupIntent();

    final clientSecret = setupResult.when(
      (response) => response.data?.clientSecret,
      (failure) {
        TNotifications.error(message: failure.message);
        return null;
      },
    );

    if (clientSecret == null) return false;

    // 2. Confirmation Stripe (utilise les données saisies dans le CardField).
    final String paymentMethodId;
    try {
      final setupIntent = await Stripe.instance.confirmSetupIntent(
        paymentIntentClientSecret: clientSecret,
        params: const PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(),
        ),
      );

      paymentMethodId = setupIntent.paymentMethodId;
    } on StripeException catch (e) {
      TNotifications.error(
        message: e.error.localizedMessage ??
            "La validation de la carte a échoué.",
      );
      return false;
    } catch (_) {
      TNotifications.error(
        message: "La validation de la carte a échoué.",
      );
      return false;
    }

    // 3. Enregistrement de la carte côté backend.
    final request = CarteBancaireRequest(
      carteName: carteName,
      stripePaymentMethodId: paymentMethodId,
      isDefault: isDefault,
    );

    final result = await usecase.createCarte(request);

    return result.when(
      (response) {
        TNotifications.success(message: response.message!);
        refresh();
        return true;
      },
      (failure) {
        TNotifications.error(message: failure.message);
        return false;
      },
    );
  }

  /// Met à jour le nom / le statut par défaut d'une carte (sans re-saisie Stripe).
  Future<bool> updateCarte(CarteBancaireRequest carte, String id) async {
    final usecase = ref.read(carteBancaireUsecaseProvider);

    final result = await usecase.updateCarte(carte, id);
    return result.when(
      (response) {
        TNotifications.success(message: response.message!);
        refresh();
        return true;
      },
      (failure) {
        TNotifications.error(message: failure.message);
        return false;
      },
    );
  }

  Future<bool> deleteCarte(String id) async {
    final usecase = ref.read(carteBancaireUsecaseProvider);
    final result = await usecase.deleteCarte(id);
    return result.when(
      (response) {
        TNotifications.success(message: response.message!);
        refresh();
        return true;
      },
      (failure) {
        TNotifications.error(message: failure.message);
        return false;
      },
    );
  }

  Future<bool> setDefaultCarte(String id) async {
    final usecase = ref.read(carteBancaireUsecaseProvider);
    final result = await usecase.setDefaultCarte(id);
    return result.when(
      (response) {
        TNotifications.success(message: response.message!);
        refresh();
        return true;
      },
      (failure) {
        TNotifications.error(message: failure.message);
        return false;
      },
    );
  }
}

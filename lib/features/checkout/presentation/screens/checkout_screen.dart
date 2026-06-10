import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/helpers/notification_helper.dart';
import 'package:cyna/common/route/route_name.dart';
import 'package:cyna/features/adresse/data/model/reponse/adresse_facturation_reponse.dart';
import 'package:cyna/features/adresse/presentation/provider/adresse_facturation_controller.dart';
import 'package:cyna/features/carte_bancaire/data/model/reponse/carte_bancaire_reponse.dart';
import 'package:cyna/features/carte_bancaire/presentation/provider/carte_bancaire_controller.dart';
import 'package:cyna/features/checkout/presentation/widgets/checkout_section.dart';
import 'package:cyna/features/checkout/presentation/widgets/selectable_tile.dart';
import 'package:cyna/features/commande/data/usecasesImpl/commande_usecase_impl.dart';
import 'package:cyna/features/commande/presentation/provider/commande_controller.dart';
import 'package:cyna/features/panier/presentation/provider/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  static final NumberFormat _money = NumberFormat.currency(
    locale: 'fr_FR',
    symbol: '€',
    decimalDigits: 2,
  );

  String? _selectedAdresseId;
  String? _selectedCarteId;
  bool _isPaying = false;

  String? _defaultOrFirstAdresse(List<AdresseFacturationResponse> items) {
    if (items.isEmpty) return null;
    final def = items.where((a) => a.isDefault == true);
    return def.isNotEmpty ? def.first.id : items.first.id;
  }

  String? _defaultOrFirstCarte(List<CarteBancaireResponse> items) {
    if (items.isEmpty) return null;
    final def = items.where((c) => c.isDefault == true);
    return def.isNotEmpty ? def.first.id : items.first.id;
  }

  Future<void> _pay({
    required AdresseFacturationResponse adresse,
    required CarteBancaireResponse carte,
    required CartState cart,
  }) async {
    setState(() => _isPaying = true);

    final usecase = ref.read(commandeUsecaseProvider);
    final periode = cart.period == BillingPeriod.annuel ? 'ANNEE' : 'MOIS';

    // Le serveur recalcule le prix : on lui envoie seulement carte, adresse
    // et la liste des produits (id, quantité, périodicité).
    final body = <String, dynamic>{
      'cbId': carte.id,
      'adresseFacturationId': adresse.id,
      'abonnements': cart.availableItems
          .map((item) => {
                'productId': item.id,
                'quantity': item.quantity,
                'periode': periode,
              })
          .toList(),
    };

    try {
      final result = await usecase.createCommande(body);

      final payment = result.when(
        (response) => response.data,
        (failure) {
          TNotifications.error(message: failure.message);
          return null;
        },
      );

      if (payment == null) return;

      // Authentification 3D Secure requise : on la déclenche puis on confirme.
      if (payment.status == 'REQUIRES_ACTION' &&
          (payment.clientSecret ?? '').isNotEmpty) {
        try {
          await Stripe.instance.handleNextAction(payment.clientSecret!);
        } on StripeException catch (e) {
          TNotifications.error(
            message: e.error.localizedMessage ??
                "L'authentification de la carte a échoué.",
          );
          return;
        }

        final confirm = await usecase.confirmPayment({
          'orderId': payment.orderId,
          'payment_intent': payment.paymentIntentId,
        });

        final confirmed = confirm.when(
          (response) => true,
          (failure) {
            TNotifications.error(message: failure.message);
            return false;
          },
        );
        if (!confirmed) return;
      } else if (payment.status != 'PAID') {
        // PENDING / processing : le paiement n'est pas confirmé.
        TNotifications.info(
          message: 'Votre paiement est en cours de traitement.',
        );
        return;
      }

      // Paiement confirmé : on vide le panier et on rafraîchit les commandes.
      ref.read(cartControllerProvider.notifier).clear();
      ref.invalidate(commandeControllerProvider);

      if (!mounted) return;
      await _showSuccessDialog();
    } finally {
      if (mounted) setState(() => _isPaying = false);
    }
  }

  Future<void> _showSuccessDialog() async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0x1A388E3C),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_rounded,
                  color: TColors.success, size: 40),
            ),
            const SizedBox(height: 16),
            const Text(
              'Paiement réussi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              'Votre commande a bien été enregistrée. Merci pour votre confiance !',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.pushNamed(commandeRoute);
            },
            child: const Text('Voir mes commandes',
                style: TextStyle(
                    color: TColors.primaryColor, fontWeight: FontWeight.w600)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.pushNamed(navigationMenuRoute);
            },
            child:
                Text('Accueil', style: TextStyle(color: Colors.grey.shade700)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartControllerProvider);
    final adresseState = ref.watch(adresseFacturationControllerProvider);
    final carteState = ref.watch(carteBancaireControllerProvider);

    final addresses = adresseState.asData?.value ?? const [];
    final cartes = carteState.asData?.value ?? const [];

    final selectedAdresseId =
        _selectedAdresseId ?? _defaultOrFirstAdresse(addresses);
    final selectedCarteId = _selectedCarteId ?? _defaultOrFirstCarte(cartes);

    final canPay = cart.canCheckout &&
        selectedAdresseId != null &&
        selectedCarteId != null &&
        !_isPaying;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F6),
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
        backgroundColor: TColors.primaryColor,
        title: const Text(
          'Validation de la commande',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          // ---------- Adresse de facturation ----------
          CheckoutSection(
            title: 'Adresse de facturation',
            icon: Icons.location_on_outlined,
            child: adresseState.when(
              loading: () => const _SectionLoader(),
              error: (e, _) => _SectionError(
                message: 'Impossible de charger vos adresses.',
                onRetry: () => ref
                    .read(adresseFacturationControllerProvider.notifier)
                    .refresh(),
              ),
              data: (items) {
                if (items.isEmpty) {
                  return _EmptySection(
                    message: 'Aucune adresse de facturation.',
                    actionLabel: 'Ajouter une adresse',
                    onPressed: () => context.pushNamed(adresseRoute),
                  );
                }
                return Column(
                  children: items.map((adresse) {
                    return SelectableTile(
                      selected: adresse.id == selectedAdresseId,
                      isDefault: adresse.isDefault == true,
                      onTap: () =>
                          setState(() => _selectedAdresseId = adresse.id),
                      title: '${adresse.firstName} ${adresse.lastName}',
                      subtitle:
                          '${adresse.adresse}\n${adresse.codePostal} ${adresse.city}, ${adresse.country}',
                      leadingIcon: Icons.home_outlined,
                    );
                  }).toList(),
                );
              },
            ),
          ),
          const SizedBox(height: 16),

          // ---------- Moyen de paiement ----------
          CheckoutSection(
            title: 'Moyen de paiement',
            icon: Icons.credit_card,
            child: carteState.when(
              loading: () => const _SectionLoader(),
              error: (e, _) => _SectionError(
                message: 'Impossible de charger vos cartes.',
                onRetry: () => ref
                    .read(carteBancaireControllerProvider.notifier)
                    .refresh(),
              ),
              data: (items) {
                if (items.isEmpty) {
                  return _EmptySection(
                    message: 'Aucune carte bancaire enregistrée.',
                    actionLabel: 'Ajouter une carte',
                    onPressed: () => context.pushNamed(carteBancaireRoute),
                  );
                }
                return Column(
                  children: items.map((carte) {
                    return SelectableTile(
                      selected: carte.id == selectedCarteId,
                      isDefault: carte.isDefault == true,
                      onTap: () => setState(() => _selectedCarteId = carte.id),
                      title: carte.carteName,
                      subtitle:
                          '${carte.carteNumber}  •  Expire ${carte.carteDate}',
                      leadingIcon: Icons.credit_card,
                    );
                  }).toList(),
                );
              },
            ),
          ),
          const SizedBox(height: 16),

          // ---------- Récapitulatif ----------
          CheckoutSection(
            title: 'Récapitulatif de la commande',
            icon: Icons.receipt_long_outlined,
            child: _OrderRecap(cart: cart, money: _money),
          ),
        ],
      ),
      bottomNavigationBar: _PayBar(
        total: cart.total,
        periodSuffix: cart.period.suffix,
        money: _money,
        enabled: canPay,
        isLoading: _isPaying,
        onPay: () {
          final adresse =
              addresses.firstWhere((a) => a.id == selectedAdresseId);
          final carte = cartes.firstWhere((c) => c.id == selectedCarteId);
          _pay(adresse: adresse, carte: carte, cart: cart);
        },
      ),
    );
  }
}

class _OrderRecap extends StatelessWidget {
  const _OrderRecap({required this.cart, required this.money});

  final CartState cart;
  final NumberFormat money;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...cart.availableItems.map(
          (item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${item.name}  ×${item.quantity}',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  money.format(item.lineTotal(cart.multiplier)),
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        const Divider(height: 24),
        _recapLine('Périodicité', cart.period.label),
        const SizedBox(height: 6),
        _recapLine('Sous-total', money.format(cart.subTotal)),
        const SizedBox(height: 6),
        _recapLine('TVA (20%)', money.format(cart.taxes)),
        const Divider(height: 24),
        Row(
          children: [
            const Text('Total',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            const Spacer(),
            Text(
              money.format(cart.total),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: TColors.primaryColor,
              ),
            ),
            Text(' ${cart.period.suffix}',
                style: const TextStyle(fontSize: 13, color: Color(0xFF8C8C95))),
          ],
        ),
      ],
    );
  }

  Widget _recapLine(String label, String value) {
    return Row(
      children: [
        Text(label,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade700)),
        const Spacer(),
        Text(value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class _PayBar extends StatelessWidget {
  const _PayBar({
    required this.total,
    required this.periodSuffix,
    required this.money,
    required this.enabled,
    required this.isLoading,
    required this.onPay,
  });

  final double total;
  final String periodSuffix;
  final NumberFormat money;
  final bool enabled;
  final bool isLoading;
  final VoidCallback onPay;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x17000000),
            blurRadius: 20,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Total à payer',
                    style:
                        TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                Text(
                  '${money.format(total)} $periodSuffix',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: TColors.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TColors.secondColor,
                    disabledBackgroundColor: TColors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: enabled ? onPay : null,
                  child: isLoading
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.4,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Payer',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionLoader extends StatelessWidget {
  const _SectionLoader();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: SizedBox(
          height: 26,
          width: 26,
          child: CircularProgressIndicator(
              strokeWidth: 2.4, color: TColors.primaryColor),
        ),
      ),
    );
  }
}

class _SectionError extends StatelessWidget {
  const _SectionError({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(message,
            style: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
        TextButton(onPressed: onRetry, child: const Text('Réessayer')),
      ],
    );
  }
}

class _EmptySection extends StatelessWidget {
  const _EmptySection({
    required this.message,
    required this.actionLabel,
    required this.onPressed,
  });

  final String message;
  final String actionLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(message,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
        ),
        OutlinedButton.icon(
          onPressed: onPressed,
          icon: const Icon(Icons.add, color: TColors.primaryColor),
          label: Text(actionLabel,
              style: const TextStyle(color: TColors.primaryColor)),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: TColors.primaryColor),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}

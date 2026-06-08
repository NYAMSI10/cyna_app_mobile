import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/route/route_name.dart';
import 'package:cyna/features/panier/presentation/provider/cart_controller.dart';
import 'package:cyna/features/panier/presentation/widgets/billing_period_selector.dart';
import 'package:cyna/features/panier/presentation/widgets/cart_summary.dart';
import 'package:cyna/features/panier/presentation/widgets/service_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class PanierScreen extends ConsumerWidget {
  const PanierScreen({super.key});

  static final NumberFormat _moneyFormatter = NumberFormat.currency(
    locale: 'fr_FR',
    symbol: '€',
    decimalDigits: 2,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartControllerProvider);
    final controller = ref.read(cartControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.primaryColor,
        automaticallyImplyLeading: false,
        title: const Text(
          'Mon Panier',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
          maxLines: 1,
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF4F4F6),
      body: cart.isEmpty
          ? const Center(
              child: Text(
                'Votre panier est vide',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Périodicité de l\'abonnement',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      BillingPeriodSelector(
                        selected: cart.period,
                        onChanged: controller.setPeriod,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(12),
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return ServiceCard(
                        item: item,
                        lineTotal: item.lineTotal(cart.multiplier),
                        periodSuffix: cart.period.suffix,
                        moneyFormatter: _moneyFormatter,
                        onIncrement: () => controller.increment(item),
                        onDecrement: () => controller.decrement(item),
                        onRemove: () => controller.removeItem(item),
                        onReplace: () => controller.replaceUnavailable(item),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: cart.items.length,
                  ),
                ),
                CartSummary(
                  subTotal: cart.subTotal,
                  promotion: cart.promotion,
                  taxes: cart.taxes,
                  total: cart.total,
                  productCount: cart.productCount,
                  periodSuffix: cart.period.suffix,
                  moneyFormatter: _moneyFormatter,
                  canCheckout: cart.canCheckout,
                  onCheckout: () => context.pushNamed(checkoutRoute),
                ),
              ],
            ),
    );
  }
}

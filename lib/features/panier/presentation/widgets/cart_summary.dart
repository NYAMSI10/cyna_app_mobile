import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/panier/presentation/widgets/summary_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({
    super.key,
    required this.subTotal,
    required this.taxes,
    required this.total,
    required this.productCount,
    required this.periodSuffix,
    required this.moneyFormatter,
    required this.canCheckout,
    required this.onCheckout,
  });

  final double subTotal;
  final double taxes;
  final double total;
  final int productCount;
  final String periodSuffix;
  final NumberFormat moneyFormatter;
  final bool canCheckout;
  final VoidCallback onCheckout;

  @override
  Widget build(BuildContext context) {
    final productLabel =
        productCount > 1 ? '$productCount produits' : '$productCount produit';

    return Container(
      padding: Responsive.pagePadding(context),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SummaryLine(
              label: 'Sous-total',
              value: moneyFormatter.format(subTotal),
            ),
            const SizedBox(height: 8),
            SummaryLine(
              label: 'TVA (20%)',
              value: moneyFormatter.format(taxes),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(height: 1),
            ),
            Row(
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF161628),
                  ),
                ),
                const Spacer(),
                Text(
                  moneyFormatter.format(total),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: TColors.primaryColor,
                  ),
                ),
                Text(
                  ' $periodSuffix',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8C8C95),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.secondColor,
                  disabledBackgroundColor: TColors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: canCheckout ? onCheckout : null,
                child: Text(
                  'Passer la commande ($productLabel)',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: Colors.white, fontWeightDelta: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

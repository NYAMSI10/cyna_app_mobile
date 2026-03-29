import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/features/panier/presentation/widgets/summary_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({
    super.key,
    required this.subTotal,
    required this.promotion,
    required this.taxes,
    required this.total,
    required this.moneyFormatter,
    required this.canCheckout,
  });

  final double subTotal;
  final double promotion;
  final double taxes;
  final double total;
  final NumberFormat moneyFormatter;
  final bool canCheckout;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
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
            const SizedBox(height: 6),
            SummaryLine(
              label: 'Promotions',
              value: '-${moneyFormatter.format(promotion)}',
            ),
            const SizedBox(height: 6),
            SummaryLine(
              label: 'Taxes',
              value: moneyFormatter.format(taxes),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(height: 1),
            ),
            SummaryLine(
              label: 'Total à payer',
              value: moneyFormatter.format(total),
              emphasized: true,
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: TColors.secondColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: canCheckout ? () {} : null,
                child: Text(
                  'Passer à la caisse',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
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

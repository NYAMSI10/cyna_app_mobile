import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/helpers/responsive.dart';
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
              emphasized: true,
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(20),
                  backgroundColor: TColors.secondColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: canCheckout ? () {} : null,
                child: Text(
                  'Passer la commande (3 produits)',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: Colors.white, fontWeightDelta: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

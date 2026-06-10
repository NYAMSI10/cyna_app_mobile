import 'package:cyna/features/panier/presentation/widgets/cart_service_item.dart';
import 'package:cyna/features/panier/presentation/widgets/quantity_stepper.dart';
import 'package:cyna/features/panier/presentation/widgets/unavailable_badge.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.item,
    required this.lineTotal,
    required this.periodSuffix,
    required this.moneyFormatter,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
    required this.onReplace,
  });

  final CartServiceItem item;
  final double lineTotal;
  final String periodSuffix;
  final NumberFormat moneyFormatter;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;
  final VoidCallback onReplace;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: item.isUnavailable ? 0.65 : 1,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE9E9EE)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(14),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: item.isNetworkImage
                    ? Image.network(
                        item.imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                          Icons.image_not_supported_outlined,
                          color: Color(0xFFB0B0B8),
                        ),
                      )
                    : Image.asset(
                        item.imagePath,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      if (item.isUnavailable)
                        const UnavailableBadge(),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.unitLabel,
                    style: Theme.of(context).textTheme.bodySmall?.apply(
                        color: const Color(0xFF8C8C95), fontSizeDelta: 1),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: moneyFormatter.format(lineTotal),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: const Color(0xFF080B35),
                            fontWeight: FontWeight.w700,
                          ),
                      children: [
                        TextSpan(
                          text: ' $periodSuffix',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: const Color(0xFF8C8C95),
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    spacing: 10,
                    children: [
                      QuantityStepper(
                        quantity: item.quantity,
                        enabled: item.isUnavailable == false,
                        onIncrement: onIncrement,
                        onDecrement: onDecrement,
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          shape: BoxShape.rectangle,
                          border: Border.all(color: const Color(0xFFDEDEE4)),
                        ),
                        child: TextButton(
                            onPressed: onRemove,
                            child: Text(
                              "supprimer",
                              style: Theme.of(context).textTheme.bodyMedium,
                            )),
                      )
                    ],
                  ),
                  if (item.isUnavailable) ...[
                    const SizedBox(height: 8),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        TextButton.icon(
                          onPressed: onReplace,
                          icon: const Icon(Icons.swap_horiz),
                          label: const Text('Remplacer'),
                        ),
                        TextButton.icon(
                          onPressed: onRemove,
                          icon: const Icon(Icons.delete_outline),
                          label: const Text('Retirer'),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

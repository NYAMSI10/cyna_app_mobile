import 'package:cyna/features/panier/presentation/widgets/cart_service_item.dart';
import 'package:cyna/features/panier/presentation/widgets/quantity_stepper.dart';
import 'package:cyna/features/panier/presentation/widgets/unavailable_badge.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.item,
    required this.moneyFormatter,
    required this.durationMultipliers,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
    required this.onDurationChanged,
    required this.onReplace,
  });

  final CartServiceItem item;
  final NumberFormat moneyFormatter;
  final Map<String, double> durationMultipliers;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;
  final ValueChanged<String?> onDurationChanged;
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
                child: Image.asset(
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
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.unitLabel,
                    style: Theme.of(context).textTheme.bodySmall?.apply(
                        color: const Color(0xFF8C8C95), fontSizeDelta: 1),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xFFDEDEE4)),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: item.selectedDuration,
                              isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              style: const TextStyle(
                                color: Color(0xFF252536),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              onChanged:
                                  item.isUnavailable ? null : onDurationChanged,
                              items: durationMultipliers.keys
                                  .map(
                                    (duration) => DropdownMenuItem(
                                      value: duration,
                                      child: Text(duration),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                      if (item.isUnavailable)
                        const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: UnavailableBadge(),
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    moneyFormatter.format(item.totalPrice),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFF080B35),
                          fontWeight: FontWeight.w700,
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

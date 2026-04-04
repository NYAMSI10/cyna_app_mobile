import 'package:cyna/features/panier/presentation/widgets/step_button.dart';
import 'package:flutter/material.dart';

class QuantityStepper extends StatelessWidget {
  const QuantityStepper({
    super.key,
    required this.quantity,
    required this.enabled,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int quantity;
  final bool enabled;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        children: [
          StepButton(
            icon: Icons.remove,
            onTap: enabled ? onDecrement : null,
          ),
          SizedBox(
            width: 40,
            child: Text(
              quantity.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          StepButton(
            icon: Icons.add,
            isPrimary: true,
            onTap: enabled ? onIncrement : null,
          ),
        ],
      ),
    );
  }
}

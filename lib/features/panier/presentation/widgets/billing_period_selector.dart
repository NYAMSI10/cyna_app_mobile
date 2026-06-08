import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/features/panier/presentation/provider/cart_controller.dart';
import 'package:flutter/material.dart';

class BillingPeriodSelector extends StatelessWidget {
  const BillingPeriodSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final BillingPeriod selected;
  final ValueChanged<BillingPeriod> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDF2),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: BillingPeriod.values.map((period) {
          final isSelected = period == selected;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(period),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                height: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: isSelected
                      ? const [
                          BoxShadow(
                            color: Color(0x14000000),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Text(
                  period.label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isSelected
                        ? TColors.primaryColor
                        : const Color(0xFF8C8C95),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

import 'package:cyna/common/constant/colors.dart';
import 'package:flutter/material.dart';

class UnavailableBadge extends StatelessWidget {
  const UnavailableBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE9E9),
        borderRadius: BorderRadius.circular(99),
      ),
      child: const Text(
        'Indisponible',
        style: TextStyle(
          color: TColors.error,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

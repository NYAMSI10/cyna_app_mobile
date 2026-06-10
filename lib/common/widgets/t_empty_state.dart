import 'package:cyna/common/constant/colors.dart';
import 'package:flutter/material.dart';

/// Widget réutilisable affiché lorsqu'une liste est vide.
/// Affiche une icône et un message centrés.
class TEmptyState extends StatelessWidget {
  const TEmptyState({
    super.key,
    required this.icon,
    required this.message,
  });

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 64,
            color: TColors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

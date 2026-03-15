import 'package:flutter/material.dart';

class TEmptyState extends StatelessWidget {
  final bool hasFilters;
  final VoidCallback onReset;

  const TEmptyState({
    super.key,
    required this.hasFilters,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt_long,
              size: 48,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              hasFilters
                  ? 'Aucune commande ne correspond à vos critères.'
                  : 'Vous n’avez pas encore de commande.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            if (hasFilters) ...[
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: onReset,
                child: const Text('Réinitialiser les filtres'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

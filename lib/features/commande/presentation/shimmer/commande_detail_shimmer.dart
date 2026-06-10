import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// Placeholder animé pour les sections Paiement + Adresse de facturation
/// pendant le chargement du détail d'une commande.
class CommandeDetailShimmer extends StatelessWidget {
  const CommandeDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _SectionShimmer(rowCount: 4),
          SizedBox(height: 24),
          _SectionShimmer(rowCount: 5),
        ],
      ),
    );
  }
}

class _SectionShimmer extends StatelessWidget {
  const _SectionShimmer({required this.rowCount});

  final int rowCount;

  @override
  Widget build(BuildContext context) {
    Widget bar(double w, double h) => Container(
          width: w,
          height: h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Titre de section
        bar(140, 16),
        const SizedBox(height: 12),
        ...List.generate(
          rowCount,
          (_) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                bar(110, 13),
                bar(140, 13),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

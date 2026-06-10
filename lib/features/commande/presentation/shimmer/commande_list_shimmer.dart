import 'package:cyna/common/helpers/responsive.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// Placeholder animé affiché pendant le chargement de la liste des commandes,
/// reproduisant l'en-tête d'année + plusieurs cartes de commande.
class CommandeListShimmer extends StatelessWidget {
  const CommandeListShimmer({super.key, this.cardCount = 5});

  final int cardCount;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: Responsive.pagePadding(context),
        children: [
          // En-tête d'année
          _bar(width: 80, height: 18),
          const SizedBox(height: 16),
          ...List.generate(
            cardCount,
            (_) => const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: _OrderCardShimmer(),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _bar({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class _OrderCardShimmer extends StatelessWidget {
  const _OrderCardShimmer();

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

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bar(140, 16),
                const SizedBox(height: 8),
                bar(220, 13),
                const SizedBox(height: 8),
                bar(90, 14),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(height: 12),
              const Icon(Icons.chevron_right, size: 22, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}

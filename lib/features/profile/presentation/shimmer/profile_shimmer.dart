import 'package:cyna/common/helpers/responsive.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// Placeholder animé (shimmer) affiché pendant le chargement de l'écran
/// "Mon Compte", reproduisant la disposition réelle (avatar, identité,
/// titre de section et lignes de menu).
class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key, this.menuItemCount = 7});

  final int menuItemCount;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: Responsive.pagePadding(context),
        children: [
          // En-tête : avatar + nom + email
          Center(
            child: Column(
              children: [
                const CircleAvatar(radius: 35, backgroundColor: Colors.white),
                const SizedBox(height: 16),
                _bar(width: 200, height: 18),
                const SizedBox(height: 8),
                _bar(width: 150, height: 14),
              ],
            ),
          ),
          const SizedBox(height: 40),

          // Titre de section
          _bar(width: 160, height: 16),
          const Divider(),

          // Lignes de menu
          ...List.generate(menuItemCount, (_) => const _MenuTileShimmer()),
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

class _MenuTileShimmer extends StatelessWidget {
  const _MenuTileShimmer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          // Icône
          Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const SizedBox(width: 16),
          // Libellé
          Container(
            width: 180,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const Spacer(),
          // Chevron
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}

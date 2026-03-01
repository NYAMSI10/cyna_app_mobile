import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class THomeCategory extends ConsumerWidget {
  const THomeCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Map<String, dynamic>> categories = [
      {'name': 'Dry Cat Food fdfdfdfdf', 'icon': 'assets/logos/logo.png'},
      {'name': 'Bird Food', 'icon': 'assets/logos/logo.png'},
      {'name': 'Fish Food', 'icon': 'assets/logos/logo.png'},
      {'name': 'Dog Food', 'icon': 'assets/logos/logo.png'},
      {'name': 'Cat Food', 'icon': 'assets/images/station.png'},
      {'name': 'Bird Food', 'icon': 'assets/logos/logo.png'},
      {'name': 'Fish Food', 'icon': 'assets/logos/logo.png'},
      {'name': 'Dog Food', 'icon': 'assets/logos/logo.png'},
    ];

    return Column(
      children: [
        Row(
          children: [
            Text(
              "Catégories",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .apply(fontWeightDelta: 5, fontSizeDelta: -3),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                "Voir plus",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: TColors.darkGrey),
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 130, // Hauteur suffisante pour la boîte + le texte
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: categories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final category = categories[index];
              return Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: TColors.secondColor
                          .withOpacity(0.1), // Couleur de fond pour la boîte

                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(category['icon']),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 80, // Limite la largeur du texte
                    child: Text(
                      category['name'],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

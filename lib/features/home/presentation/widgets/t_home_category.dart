import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class THomeCategory extends ConsumerWidget {
  const THomeCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Map<String, dynamic>> categories = [
      {
        'name': 'Dry Cat Food',
        'icon': 'assets/logos/logo.png',
        'color': Color(0xFFFDE8E8)
      },
      {
        'name': 'Bird Food',
        'icon': 'assets/logos/logo.png',
        'color': Color(0xFFE8F5E9)
      },
      {
        'name': 'Fish Food',
        'icon': 'assets/logos/logo.png',
        'color': Color(0xFFE3F2FD)
      },
      {
        'name': 'Dog Food',
        'icon': 'assets/logos/logo.png',
        'color': Color(0xFFE8F5E9)
      },
      {
        'name': 'Cat Food',
        'icon': 'assets/images/station.png',
        'color': Color(0xFFFDE8E8)
      },
      {
        'name': 'Bird Food',
        'icon': 'assets/logos/logo.png',
        'color': Color(0xFFE8F5E9)
      },
      {
        'name': 'Fish Food',
        'icon': 'assets/logos/logo.png',
        'color': Color(0xFFE3F2FD)
      },
      {
        'name': 'Dog Food',
        'icon': 'assets/logos/logo.png',
        'color': Color(0xFFE8F5E9)
      },
    ];
    return Column(
      spacing: TSizes.defaultSpace,
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
                  "voir plus",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: TColors.darkGrey),
                ))
          ],
        ),
        SizedBox(
          height: 50, // Hauteur de la "pilule"
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
                horizontal: 20), // Aligne avec ton design
            itemCount: categories.length,
            separatorBuilder: (context, index) =>
                const SizedBox(width: 12), // L'espace entre les items
            itemBuilder: (context, index) {
              final category = categories[index];

              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: TColors.secondColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    // Le cercle de couleur pour l'icône
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: category['color'],
                        shape: BoxShape.circle,
                      ),
                      child:
                          Image.asset(category['icon'], width: 20, height: 20),
                    ),
                    const SizedBox(width: 10),
                    // Le texte de la catégorie
                    Text(
                      category['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: TColors.white, // Ton Cyan foncé
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

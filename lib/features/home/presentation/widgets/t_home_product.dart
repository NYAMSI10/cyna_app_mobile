import 'package:cyna/common/widgets/t_grid_layout.dart';
import 'package:cyna/common/widgets/t_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class THomeProduct extends ConsumerWidget {
  const THomeProduct({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // La nouvelle liste avec uniquement 'name' et 'image'
    final List<Map<String, dynamic>> topProducts = [
      {
        'id': 1,
        'name': 'Veste en Lin Premium',
        'price': 129.99,
        'image':
            'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?q=80&w=500',
        'stock': 10,
      },
      {
        'id': 2,
        'name': 'Sac à dos Urbain',
        'price': 85.0,
        'image':
            'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?q=80&w=500',
        'stock': 5,
      },
      {
        'id': 3,
        'name': 'Montre Minimaliste Noir',
        'price': 199.0,
        'image':
            'https://images.unsplash.com/photo-1524592094714-0f0654e20314?q=80&w=500',
        'stock': 0, // Affichera "Rupture"
      },
      {
        'id': 4,
        'name': 'Sneakers White Edition',
        'price': 110.5,
        'image':
            'https://images.unsplash.com/photo-1549298916-b41d501d3772?q=80&w=500',
        'stock': 12,
      },
      {
        'id': 5,
        'name': 'Lunettes de Soleil Classic',
        'price': 45.0,
        'image':
            'https://images.unsplash.com/photo-1549298916-b41d501d3772?q=80&w=500',
        'stock': 8,
      },
    ];

    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Les Top Produits du moment",
              style: Theme.of(context).textTheme.titleMedium!.apply(
                    fontWeightDelta: 5,
                  ),
            ),
            const SizedBox(height: 16),
            TGridLayout(
                itemCount: 4,
                itemBuilder: (context, index) {
                  final product = topProducts[index];
                  return TProductCard(product: product);
                }),
            const SizedBox(height: 25),
          ],
        ),
      ],
    );
  }
}

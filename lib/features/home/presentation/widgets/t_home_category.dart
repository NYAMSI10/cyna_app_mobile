import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/features/category/presentation/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class THomeCategory extends ConsumerWidget {
  const THomeCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // La nouvelle liste avec uniquement 'name' et 'image'
    final List<Map<String, dynamic>> categories = [
      {
        'name': 'Vêtements',
        'image':
            'https://images.unsplash.com/photo-1434389677669-e08b4cac3105?q=80&w=500',
      },
      {
        'name': 'Accessoires',
        'image':
            'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=500',
      },
      {
        'name': 'Chaussures',
        'image':
            'https://images.unsplash.com/photo-1549298916-b41d501d3772?q=80&w=500',
      },
      {
        'name': 'Nouveautés',
        'image':
            'https://images.unsplash.com/photo-1441986300917-64674bd600d8?q=80&w=500',
      },
      {
        'name': 'Nouveautés',
        'image':
            'https://images.unsplash.com/photo-1441986300917-64674bd600d8?q=80&w=500',
      },
      {
        'name': 'Nouveautés',
        'image':
            'https://images.unsplash.com/photo-1441986300917-64674bd600d8?q=80&w=500',
      },
      {
        'name': 'Nouveautés',
        'image':
            'https://images.unsplash.com/photo-1441986300917-64674bd600d8?q=80&w=500',
      },
    ];

    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nos Catégories",
              style: Theme.of(context).textTheme.titleMedium!.apply(
                    fontWeightDelta: 5,
                  ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(left: 5, right: 5),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: 130,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: TColors.secondColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        // Ajout de ClipRRect pour respecter les bords arrondis du Container
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            category['image'], // Appel de la bonne clé 'image'
                            fit: BoxFit.cover,
                            // Ajout conseillé : gère le chargement et les erreurs d'image réseau
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.broken_image,
                                    color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 80,
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
            )
          ],
        ),
      ],
    );
  }
}

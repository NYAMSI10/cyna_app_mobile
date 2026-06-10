import 'package:cyna/features/category/presentation/provider/category_controller.dart';
import 'package:cyna/features/category/presentation/screens/category_screen.dart';
import 'package:cyna/features/home/presentation/shimmers/home_category_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class THomeCategory extends ConsumerWidget {
  const THomeCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesState = ref.watch(categoryControllerProvider);

    return categoriesState.when(
      data: (categories) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (categories.isEmpty)
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Aucune catégorie disponible pour le moment.",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            else
              const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 2,
                mainAxisExtent: 140, // Augmenté un peu pour le texte
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CategoryScreen()),
                      ),
                      child: Container(
                        width: 85,
                        height: 85,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(20), // Bords plus arrondis
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            category.image,
                            fit: BoxFit
                                .cover, // <--- L'image ne sera plus zoomée/coupée
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.category_outlined,
                                    color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      category.name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                      maxLines: 1, // Autorise 1 ligne si le nom est long
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                );
              },
            ),
          ],
        );
      },
      loading: () => HomeCategoryShimmer(),
      error: (error, stack) => const HomeCategoryShimmer(),
    );
  }
}

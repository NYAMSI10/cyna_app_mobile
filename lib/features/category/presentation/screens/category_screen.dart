import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/widgets/t_grid_layout.dart';
import 'package:cyna/common/widgets/t_product_card.dart';
import 'package:cyna/features/category/data/model/category_response.dart';
import 'package:cyna/features/category/presentation/provider/category_controller.dart';
import 'package:cyna/features/home/presentation/shimmers/home_product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key, required this.category});

  /// Catégorie sélectionnée depuis l'accueil (nom + image affichés
  /// immédiatement, le détail/produits étant chargés via l'API par slug).
  final CategoryResponse category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(categoryDetailProvider(category.slug));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.primaryColor,
        leading: const BackButton(color: Colors.white),
        title: Text(
          category.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.bold,
              fontSize: 17),
          maxLines: 1,
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        color: TColors.primaryColor,
        onRefresh: () async =>
            ref.refresh(categoryDetailProvider(category.slug).future),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- 1. IMAGE PRINCIPALE AVEC SURIMPRESSION ---
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    category.image,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Container(height: 250, color: Colors.grey),
                  ),
                  Container(
                    width: double.infinity,
                    height: 250,
                    color: Colors.black.withOpacity(0.4),
                  ),
                  Text(
                    category.name,
                    style: Theme.of(context).textTheme.headlineSmall!.apply(
                          color: Colors.white,
                          fontWeightDelta: 2,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              // --- 2. CONTENU (description + produits) ---
              detailState.when(
                data: (detail) {
                  final products = detail.products;
                  final description = detail.category.description;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (description != null && description.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            description,
                            style:
                                Theme.of(context).textTheme.bodyMedium!.apply(
                                      color: Colors.grey[700],
                                      heightFactor: 1,
                                    ),
                            textAlign: TextAlign.justify,
                          ),
                        ),

                      // En-tête de la liste de produits
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Text(
                          "${products.length} Produit${products.length > 1 ? 's' : ''}",
                          style: Theme.of(context).textTheme.titleSmall!.apply(
                                color: Colors.black,
                                fontWeightDelta: 2,
                              ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Grille des produits (identique à l'accueil)
                      if (products.isEmpty)
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 40),
                          child: Center(
                            child: Text(
                              "Aucun produit disponible dans cette catégorie.",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TGridLayout(
                            itemCount: products.length,
                            itemBuilder: (context, index) =>
                                TProductCard(product: products[index]),
                          ),
                        ),

                      const SizedBox(height: 40),
                    ],
                  );
                },
                loading: () => const Padding(
                  padding: EdgeInsets.fromLTRB(16, 24, 16, 40),
                  child: HomeProductShimmer(),
                ),
                error: (error, stackTrace) => Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 40),
                  child: Center(
                    child: Text(
                      "Impossible de charger les produits.\n$error",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/widgets/icons/t_circular_icon.dart';
import 'package:cyna/features/product-detail/data/model/product_response.dart';
import 'package:cyna/features/product-detail/presentation/screen/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart'; // N'oublie pas l'import pour Iconsax.heart

class TProductCard extends ConsumerWidget {
  // On déclare la variable produit qui sera passée au widget
  final ProductResponse product;

  // Le produit est requis pour construire la carte
  const TProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // On calcule la rupture de stock directement ici
    final bool isOutOfStock = product.stock == 0;

    return GestureDetector(
      onTap: () {
        // On passe le produit en argument
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Image avec badge "Stack"
            Expanded(
              child: Stack(
                children: [
                  // Image
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16)),
                      child: Builder(
                        builder: (context) {
                          // 1. On vérifie si la liste n'est pas nulle ET pas vide
                          final hasImages = product.images != null &&
                              product.images!.isNotEmpty;

                          // 2. On récupère l'URL si elle existe, sinon le placeholder
                          final String imageUrl = hasImages
                              ? "http://10.0.2.2:3000/${product.images![0].url}"
                              : "https://img-0.journaldunet.com/JgOAEEaKp00acGdrktPUB8Y2__8=/1500x/smart/32d90de13a5f411c86709152f70fc67c/ccmcms-jdn/10861192.jpg";

                          return Image.network(
                            imageUrl,
                            height: 200,
                            width: double.infinity, // Optionnel mais conseillé
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                              Icons.broken_image,
                              color: Colors.grey,
                              size: 50,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // Badge "Rupture de stock"
                  if (isOutOfStock)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.red.withAlpha(150),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Rupture",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .apply(color: Colors.white, fontWeightDelta: 2),
                        ),
                      ),
                    ),
                  // Bouton favoris
                  const Positioned(
                    top: 2,
                    right: 1,
                    child: TCircularIcon(
                      // Assure-toi que ce widget est bien importé !
                      icon: Iconsax.heart,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // Section Texte et Prix
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name!,
                    style: Theme.of(context).textTheme.bodySmall!.apply(
                          fontSizeDelta: 1,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       "${product.priceMonth?.toStringAsFixed(2)} € / mois",
                      //       style: Theme.of(context)
                      //           .textTheme
                      //           .labelLarge!
                      //           .apply(fontWeightDelta: 3),
                      //     ),
                      //     Text(
                      //       "${product.priceYear?.toStringAsFixed(2)} € / an",
                      //       style: Theme.of(context)
                      //           .textTheme
                      //           .labelLarge!
                      //           .apply(fontWeightDelta: 3),
                      //     ),
                      //   ],
                      // ),
                      Text(
                        "1000 € / mois",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .apply(fontWeightDelta: 3),
                      ),
                      const Spacer(),
                      // BOUTON AJOUTER
                      InkWell(
                        onTap: () {
                          // Action : Ajouter au panier
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: TColors.secondColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                          child: const SizedBox(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

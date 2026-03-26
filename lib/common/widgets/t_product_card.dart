import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/widgets/icons/t_circular_icon.dart';
import 'package:cyna/features/product/presentation/screen/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart'; // N'oublie pas l'import pour Iconsax.heart

class TProductCard extends ConsumerWidget {
  // On déclare la variable produit qui sera passée au widget
  final Map<String, dynamic> product;

  // Le produit est requis pour construire la carte
  const TProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // On calcule la rupture de stock directement ici
    final bool isOutOfStock = product['stock'] == 0;

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
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
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
                      color: TColors.secondColor.withOpacity(0.1),
                    ),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.network(
                        product[
                            'image'], // L'argument positionnel doit être en premier
                        height: 200, // La hauteur ensuite
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, color: Colors.grey),
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
                          color: Colors.red.withOpacity(0.9),
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
                    product['name'],
                    style: Theme.of(context).textTheme.bodySmall!.apply(
                          fontSizeDelta: 1,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // PRIX
                      Text(
                        "${product['price'].toStringAsFixed(2)} €",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(fontWeightDelta: 2),
                      ),

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

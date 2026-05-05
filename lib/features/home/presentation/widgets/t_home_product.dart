import 'package:cyna/common/widgets/t_grid_layout.dart';
import 'package:cyna/common/widgets/t_product_card.dart';
import 'package:cyna/features/home/presentation/shimmers/home_product_shimmer.dart';
import 'package:cyna/features/product-detail/presentation/provider/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class THomeProduct extends ConsumerWidget {
  const THomeProduct({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // La nouvelle liste avec uniquement 'name' et 'image'

    final productState = ref.watch(productControllerProvider);
    return productState.when(
      data: (products) {
        return Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (products.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Aucun produit disponible pour le moment.",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                else
                  const SizedBox(height: 16),
                TGridLayout(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return TProductCard(product: product);
                    }),
                const SizedBox(height: 25),
              ],
            ),
          ],
        );
      },
      error: (error, stackTrace) => const HomeProductShimmer(),
      loading: () => const HomeProductShimmer(),
    );
  }
}

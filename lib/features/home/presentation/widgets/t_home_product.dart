import 'package:cyna/common/widgets/t_grid_layout.dart';
import 'package:cyna/common/widgets/t_product_card.dart';
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
                Text(
                  "Les Top Produits du moment",
                  style: Theme.of(context).textTheme.titleMedium!.apply(
                        fontWeightDelta: 5,
                      ),
                ),
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
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const CircularProgressIndicator(),
    );
  }
}

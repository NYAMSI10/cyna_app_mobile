import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/features/product-detail/data/model/product_response.dart';
import 'package:cyna/features/product-detail/presentation/screen/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TProductCard extends ConsumerWidget {
  final ProductResponse product;

  const TProductCard({
    super.key,
    required this.product,
  });

  String get _imageUrl {
    final images = product.images;

    if (images != null && images.isNotEmpty) {
      return "http://localhost:3000/${images.first.url}";
    }

    return "https://img-0.journaldunet.com/JgOAEEaKp00acGdrktPUB8Y2__8=/1500x/smart/32d90de13a5f411c86709152f70fc67c/ccmcms-jdn/10861192.jpg";
  }

  String get _monthlyPrice {
    final price = product.priceMonth;

    if (price == null) return "Prix indisponible";

    final formattedPrice = price % 1 == 0
        ? price.toStringAsFixed(0)
        : price.toStringAsFixed(2).replaceAll('.', ',');

    return "$formattedPrice € / mois";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOutOfStock = product.stock == 0;
    final textTheme = Theme.of(context).textTheme;

    return Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(),
              ),
            );
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(10),
                  offset: const Offset(0, 8),
                  blurRadius: 18,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          _imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            color: Colors.grey.shade100,
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.broken_image_outlined,
                              color: Colors.grey.shade400,
                              size: 34,
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withAlpha(20),
                                Colors.transparent,
                                Colors.black.withAlpha(12),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (isOutOfStock)
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: TColors.error,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              "Rupture",
                              style: textTheme.labelSmall!.apply(
                                  color: Colors.white, fontWeightDelta: 2),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name ?? "Produit",
                        style: textTheme.bodyMedium!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              _monthlyPrice,
                              style: textTheme.titleMedium!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          InkWell(
                            onTap: isOutOfStock
                                ? null
                                : () {
                                    // Action : Ajouter au panier
                                  },
                            child: Container(
                              width: 48,
                              height: 44,
                              decoration: BoxDecoration(
                                color: isOutOfStock
                                    ? Colors.grey.shade300
                                    : TColors.secondColor,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                ),
                              ),
                              child: Icon(
                                Icons.add,
                                color: isOutOfStock
                                    ? Colors.grey.shade600
                                    : Colors.white,
                                size: 20,
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
        ));
  }
}

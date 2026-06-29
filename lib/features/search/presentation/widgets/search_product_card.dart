import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/features/product-detail/data/model/product_response.dart';
import 'package:cyna/features/product-detail/presentation/screen/product_detail_screen.dart';
import 'package:cyna/features/search/data/model/search_product_dto.dart';
import 'package:flutter/material.dart';

class SearchProductCard extends StatelessWidget {
  final SearchProductDto product;

  const SearchProductCard({super.key, required this.product});

  String get _imageUrl {
    final images = product.images;
    if (images != null && images.isNotEmpty) return images.first.url;
    return "https://img-0.journaldunet.com/JgOAEEaKp00acGdrktPUB8Y2__8=/1500x/smart/32d90de13a5f411c86709152f70fc67c/ccmcms-jdn/10861192.jpg";
  }

  String get _monthlyPrice {
    final price = product.priceMonth;
    if (price == null) return "Prix indisponible";
    final formatted = price % 1 == 0
        ? price.toStringAsFixed(0)
        : price.toStringAsFixed(2).replaceAll('.', ',');
    return "$formatted € / mois";
  }

  // Convertit vers ProductResponse pour réutiliser ProductDetailScreen
  ProductResponse _toProductResponse() {
    return ProductResponse(
      id: product.id,
      name: product.name,
      images: product.images
          ?.map((img) => ImageDto(id: img.id, url: img.url))
          .toList(),
      slug: product.slug,
      priceMonth: product.priceMonth,
      priceYear: product.priceYear,
      stock: product.stock,
      description: product.description,
      priority: product.priority,
      order: product.order,
      service: product.serviceInfo != null
          ? ServiceDto(
              id: product.serviceInfo!.id,
              name: product.serviceInfo!.name,
              slug: product.serviceInfo!.slug,
              category: product.categoryInfo != null
                  ? CategoryDto(
                      id: product.categoryInfo!.id,
                      name: product.categoryInfo!.name,
                      slug: product.categoryInfo!.slug,
                    )
                  : null,
            )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
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
              builder: (_) =>
                  ProductDetailScreen(product: _toProductResponse()),
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
                        errorBuilder: (_, __, ___) => Container(
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
                            style: textTheme.labelSmall!
                                .apply(color: Colors.white, fontWeightDelta: 2),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
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
                    Text(
                      product.categoryInfo?.name ?? "",
                      style: textTheme.titleMedium!.copyWith(
                        color: TColors.success,
                        fontWeight: FontWeight.w800,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _monthlyPrice,
                      style: textTheme.bodySmall!.copyWith(
                        color: TColors.darkGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/mok_data.dart';
import 'package:cyna/common/constant/sizes.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/common/widgets/t_product_card.dart';
import 'package:cyna/features/product-detail/presentation/widgets/circle_action_button.dart';
import 'package:cyna/features/product-detail/presentation/widgets/t_info_badge.dart';
import 'package:cyna/features/product-detail/presentation/widgets/t_plan_tile.dart';
import 'package:cyna/features/product-detail/presentation/widgets/t_product_detail_carousel.dart';
import 'package:cyna/features/product-detail/presentation/widgets/t_section_card.dart';
import 'package:cyna/features/product-detail/presentation/widgets/t_selectable_plan_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';

enum _PlanType { monthly, yearly }

class ProductDetailScreen extends ConsumerStatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  _PlanType _selectedPlan = _PlanType.yearly;

  @override
  Widget build(BuildContext context) {
    final product = TMokData.productDetail;
    final List<Map<String, dynamic>> products = TMokData.categoryProducts;
    final monthlyPrice = (product['priceMonth'] as num).toDouble();
    final yearlyPrice = (product['priceYear'] as num).toDouble();
    final stock = product['stock'] as int;
    final yearlyEquivalent = monthlyPrice * 12;
    final yearlySavings = yearlyEquivalent - yearlyPrice;
    final isYearlySelected = _selectedPlan == _PlanType.yearly;
    final selectedPriceLabel = isYearlySelected
        ? '${yearlyPrice.toStringAsFixed(2)} € / an'
        : '${monthlyPrice.toStringAsFixed(2)} € / mois';
    final selectedPlanTitle =
        isYearlySelected ? 'Formule annuelle' : 'Formule mensuelle';

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: TColors.primaryColor,
        title: const Text(
          'Détail du produit',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 18),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x12000000),
                blurRadius: 24,
                offset: Offset(0, -8),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedPriceLabel,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF111827),
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      selectedPlanTitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: const Color(0xFF6B7280),
                          ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$selectedPlanTitle sélectionnée'),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: TColors.secondColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Text(
                      'Ajouter au panier',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          Responsive.pagePadding(context).left,
          20,
          Responsive.pagePadding(context).right,
          28,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF8E2CFF),
                    TColors.primaryColor,
                    Color(0xFF1E88E5),
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x228000FF),
                    blurRadius: 30,
                    offset: Offset(0, 18),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 14, 14, 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TInfoBadge(
                          label: stock > 0 ? 'En stock' : 'Indisponible',
                          color: stock > 0
                              ? const Color(0xFFDCFCE7)
                              : const Color(0xFFFEE2E2),
                          textColor: stock > 0
                              ? const Color(0xFF166534)
                              : const Color(0xFF991B1B),
                        ),
                        const SizedBox(width: 8),
                        const Spacer(),
                        TCircleActionButton(
                          icon: Icons.favorite_border,
                          onTap: () {},
                        ),
                        const SizedBox(width: 8),
                        TCircleActionButton(
                          icon: Icons.share_outlined,
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Container(
                        color: Colors.white.withValues(alpha: 0.08),
                        child: TProductDetailCarousel(
                          images: List<String>.from(product['images'] as List),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Titre
            Text(
              product['name'] as String,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF111827),
                    height: 1.15,
                  ),
            ),
            const SizedBox(height: 24),

            // Disponibilité
            TSectionCard(
              title: 'Disponibilité',
              child: Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: stock > 0
                          ? const Color(0xFF22C55E)
                          : const Color(0xFFEF4444),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      stock > 0
                          ? '$stock unités disponibles actuellement'
                          : 'Produit temporairement indisponible',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFF374151),
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Description

            TSectionCard(
              title: 'Description',
              child: ReadMoreText(
                product['description'] as String,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.72,
                      color: const Color(0xFF374151),
                    ),
                textScaler: TextScaler.linear(1.1),
                trimMode: TrimMode.Line,
                trimLines: 4,
                colorClickableText: TColors.secondColor,
                trimCollapsedText: 'Voir plus',
                trimExpandedText: 'Voir moins',
                lessStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: TColors.secondColor,
                ),
                moreStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: TColors.secondColor),
              ),
            ),
            const SizedBox(height: 24),

            // Choisissez votre formule
            Container(
              width: double.infinity,
              padding: Responsive.pagePadding(context),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF6FF),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.workspace_premium_outlined,
                          color: TColors.secondColor,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Choisissez votre formule',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: const Color(0xFF111827),
                                  ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  TSelectablePlanTile(
                    isSelected: _selectedPlan == _PlanType.monthly,
                    onTap: () =>
                        setState(() => _selectedPlan = _PlanType.monthly),
                    child: TPlanTile(
                      title: 'Mensuel',
                      priceLabel: '${monthlyPrice.toStringAsFixed(2)} € / mois',
                      subtitle: 'Flexible, sans engagement long terme',
                      accentColor: const Color(0xFFF3E8FF),
                      borderColor: const Color(0xFFD8B4FE),
                      icon: Icons.calendar_today_outlined,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TSelectablePlanTile(
                    isSelected: _selectedPlan == _PlanType.yearly,
                    onTap: () =>
                        setState(() => _selectedPlan = _PlanType.yearly),
                    child: TPlanTile(
                      title: 'Annuel',
                      priceLabel: '${yearlyPrice.toStringAsFixed(2)} € / an',
                      subtitle:
                          'Vous économisez ${yearlySavings.toStringAsFixed(2)} € par an',
                      accentColor: const Color(0xFFDBEAFE),
                      borderColor: const Color(0xFF93C5FD),
                      icon: Icons.auto_awesome_outlined,
                      tag: 'Meilleure valeur',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Text(
              "Les produits similaires",
              style: Theme.of(context).textTheme.titleMedium!.apply(
                    color: Colors.black,
                    fontWeightDelta: 2,
                  ),
            ),
            const SizedBox(height: 16),

            // --- 4. LA GRILLE DES PRODUITS ---
            GridView.builder(
              shrinkWrap: true, // Indispensable ici
              physics:
                  const NeverScrollableScrollPhysics(), // Indispensable ici
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: 260, // La même hauteur fixe que sur l'accueil
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                // On appelle simplement la carte produit que tu as déjà codée !
                return TProductCard(product: products[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

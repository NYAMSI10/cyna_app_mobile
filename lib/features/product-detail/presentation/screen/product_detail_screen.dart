import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/helpers/notification_helper.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/panier/presentation/provider/cart_controller.dart';
import 'package:cyna/features/panier/presentation/widgets/cart_service_item.dart';
import 'package:cyna/features/product-detail/data/model/product_response.dart';
import 'package:cyna/features/product-detail/presentation/provider/product_controller.dart';
import 'package:cyna/features/product-detail/presentation/widgets/t_plan_tile.dart';
import 'package:cyna/features/product-detail/presentation/widgets/t_section_card.dart';
import 'package:cyna/features/product-detail/presentation/widgets/t_selectable_plan_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';

enum _PlanType { monthly, yearly }

const String _imageBaseUrl = 'https://cyna-backend.vercel.app/';

class ProductDetailScreen extends ConsumerStatefulWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductResponse product;

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  late final PageController _imageController;
  int _imageIndex = 0;
  int _quantity = 1;
  _PlanType _selectedPlan = _PlanType.monthly;

  ProductResponse get _product => widget.product;

  @override
  void initState() {
    super.initState();
    _imageController = PageController();
  }

  @override
  void dispose() {
    _imageController.dispose();
    super.dispose();
  }

  List<String> get _imageUrls {
    final images = _product.images;
    if (images != null && images.isNotEmpty) {
      return images.map((image) => image.url).toList();
    }
    return [];
  }

  double get _monthlyPrice => _product.priceMonth ?? 0;
  double get _yearlyPrice => _product.priceYear ?? 0;
  bool get _hasMonthly => _product.priceMonth != null;
  bool get _hasYearly => _product.priceYear != null;
  bool get _isYearly => _selectedPlan == _PlanType.yearly;

  double get _selectedUnitPrice => _isYearly ? _yearlyPrice : _monthlyPrice;
  double get _totalPrice => _selectedUnitPrice * _quantity;

  String _money(double value) => '${value.toStringAsFixed(2)} €';
  String get _unitSuffix => _isYearly ? '/ an' : '/ mois';

  void _shareProduct() {
    final name = _product.name ?? 'ce produit';
    final link = '$_imageBaseUrl${_product.slug ?? _product.id}';
    Clipboard.setData(
      ClipboardData(text: 'Découvrez « $name » sur Cyna : $link'),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Lien du produit copié, prêt à être partagé'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _addToCart() {
    final images = _imageUrls;
    final item = CartServiceItem(
      id: _product.id,
      name: _product.name ?? 'Produit',
      unitLabel: _product.service?.category?.name ?? 'Abonnement',
      // Le panier applique le multiplicateur de période (x1 mensuel / x10 annuel)
      // sur ce prix de base : on stocke donc le prix mensuel.
      unitPrice: _hasMonthly ? _monthlyPrice : _yearlyPrice,
      quantity: _quantity,
      imagePath: images.isNotEmpty ? images.first : '',
    );

    ref.read(cartControllerProvider.notifier).addItem(item);

    TNotifications.success(
      title: 'Panier',
      message: '${_product.name ?? 'Produit'} ajouté au panier',
    );
  }

  @override
  Widget build(BuildContext context) {
    final stock = _product.stock ?? 0;
    final inStock = stock > 0;
    final pagePadding = Responsive.pagePadding(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      bottomNavigationBar: _BottomBar(
        totalLabel: _money(_totalPrice),
        suffix: _unitSuffix,
        enabled: inStock && _selectedUnitPrice > 0,
        onAddToCart: _addToCart,
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- En-tête : image + actions ---
              _buildHeader(inStock),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  pagePadding.left,
                  20,
                  pagePadding.right,
                  28,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nom + disponibilité
                    Text(
                      _product.name ?? 'Produit',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF111827),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _StockChip(inStock: inStock, stock: stock),
                    const SizedBox(height: 18),

                    // Prix + sélecteur de quantité
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: _selectedUnitPrice > 0
                              ? RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: TColors.secondColor,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: _money(_selectedUnitPrice)),
                                      TextSpan(
                                        text: ' $_unitSuffix',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF6B7280),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : const Text(
                                  'Prix indisponible',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF6B7280),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                        ),
                        _QuantityStepper(
                          quantity: _quantity,
                          onDecrement: _quantity > 1
                              ? () => setState(() => _quantity--)
                              : null,
                          onIncrement: () => setState(() => _quantity++),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Description
                    if ((_product.description ?? '').trim().isNotEmpty) ...[
                      TSectionCard(
                        title: 'Description',
                        child: ReadMoreText(
                          _product.description!,
                          style: const TextStyle(
                            fontSize: 13.5,
                            height: 1.6,
                            color: Color(0xFF374151),
                          ),
                          trimMode: TrimMode.Line,
                          trimLines: 4,
                          colorClickableText: TColors.secondColor,
                          trimCollapsedText: 'Voir plus',
                          trimExpandedText: 'Voir moins',
                          lessStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: TColors.secondColor,
                          ),
                          moreStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: TColors.secondColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],

                    // Choix de la formule
                    if (_hasMonthly || _hasYearly) _buildPlanSelector(),

                    const SizedBox(height: 28),

                    // Recommandations
                    _buildRecommendations(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(bool inStock) {
    final images = _imageUrls;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFEFF1FB), Color(0xFFF7F8FC)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
        child: Column(
          children: [
            // Barre d'actions : retour / titre / partage (pas de favori)
            Row(
              children: [
                _CircleIconButton(
                  icon: Icons.arrow_back_ios_new,
                  onTap: () => Navigator.pop(context),
                ),
                Expanded(
                  child: Text(
                    'Détail du produit',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF111827),
                        ),
                  ),
                ),
                _CircleIconButton(
                  icon: Icons.share_outlined,
                  onTap: _shareProduct,
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Image(s) produit
            SizedBox(
              height: 260,
              child: images.isEmpty
                  ? _imagePlaceholder()
                  : PageView.builder(
                      controller: _imageController,
                      onPageChanged: (index) =>
                          setState(() => _imageIndex = index),
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Image.network(
                            images[index],
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                _imagePlaceholder(),
                          ),
                        );
                      },
                    ),
            ),

            // Indicateurs
            if (images.length > 1) ...[
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < images.length; i++)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: _imageIndex == i ? 22 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _imageIndex == i
                            ? TColors.secondColor
                            : const Color(0xFFCBD5E1),
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      alignment: Alignment.center,
      child: Icon(
        Icons.image_not_supported_outlined,
        size: 56,
        color: Colors.grey.shade400,
      ),
    );
  }

  Widget _buildPlanSelector() {
    final yearlySavings = (_monthlyPrice * 12) - _yearlyPrice;

    return Container(
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
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF111827),
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          if (_hasMonthly) ...[
            TSelectablePlanTile(
              isSelected: _selectedPlan == _PlanType.monthly,
              onTap: () => setState(() => _selectedPlan = _PlanType.monthly),
              child: TPlanTile(
                title: 'Mensuel',
                priceLabel: '${_money(_monthlyPrice)} / mois',
                subtitle: 'Flexible, sans engagement long terme',
                accentColor: const Color(0xFFF3E8FF),
                borderColor: const Color(0xFFD8B4FE),
                icon: Icons.calendar_today_outlined,
              ),
            ),
            if (_hasYearly) const SizedBox(height: 12),
          ],
          if (_hasYearly)
            TSelectablePlanTile(
              isSelected: _selectedPlan == _PlanType.yearly,
              onTap: () => setState(() => _selectedPlan = _PlanType.yearly),
              child: TPlanTile(
                title: 'Annuel',
                priceLabel: '${_money(_yearlyPrice)} / an',
                subtitle: yearlySavings > 0
                    ? 'Vous économisez ${_money(yearlySavings)} par an'
                    : 'Engagement annuel',
                accentColor: const Color(0xFFDBEAFE),
                borderColor: const Color(0xFF93C5FD),
                icon: Icons.auto_awesome_outlined,
                tag: 'Meilleure valeur',
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRecommendations() {
    // La catégorie est portée par le service du produit (peuplé par product-by-order).
    final categoryId = _product.service?.category?.id;
    if (categoryId == null) return const SizedBox.shrink();

    final similarAsync = ref.watch(similarProductsProvider(categoryId));

    return similarAsync.maybeWhen(
      data: (products) {
        final others =
            products.where((p) => p.id != _product.id).take(10).toList();
        if (others.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recommandations',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xFF111827),
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              height: 188,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: others.length,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (context, index) {
                  final reco = others[index];
                  return _RecommendationCard(
                    product: reco,
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailScreen(product: reco),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }
}

/// Bouton circulaire clair (fond blanc + ombre) pour l'en-tête.
class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: 2,
      shadowColor: Colors.black26,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: Icon(icon, color: TColors.secondColor, size: 20),
        ),
      ),
    );
  }
}

/// Pastille de disponibilité basée sur le stock réel.
class _StockChip extends StatelessWidget {
  const _StockChip({required this.inStock, required this.stock});

  final bool inStock;
  final int stock;

  @override
  Widget build(BuildContext context) {
    final color = inStock ? const Color(0xFF16A34A) : const Color(0xFFDC2626);
    final bg = inStock ? const Color(0xFFDCFCE7) : const Color(0xFFFEE2E2);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Text(
            inStock ? '$stock en stock' : 'Indisponible',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

/// Sélecteur de quantité ( - 01 + ).
class _QuantityStepper extends StatelessWidget {
  const _QuantityStepper({
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback? onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _StepButton(
            icon: Icons.remove,
            onTap: onDecrement,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              quantity.toString().padLeft(2, '0'),
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 16,
                color: Color(0xFF111827),
              ),
            ),
          ),
          _StepButton(
            icon: Icons.add,
            onTap: onIncrement,
          ),
        ],
      ),
    );
  }
}

class _StepButton extends StatelessWidget {
  const _StepButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(
          icon,
          size: 18,
          color: enabled ? TColors.secondColor : const Color(0xFFCBD5E1),
        ),
      ),
    );
  }
}

/// Carte produit compacte pour la liste de recommandations.
class _RecommendationCard extends StatelessWidget {
  const _RecommendationCard({required this.product, required this.onTap});

  final ProductResponse product;
  final VoidCallback onTap;

  String get _imageUrl {
    final images = product.images;
    if (images != null && images.isNotEmpty) {
      return images.first.url;
    }
    return '';
  }

  String get _price {
    final price = product.priceMonth;
    if (price == null) return 'Prix indisponible';
    return '${price.toStringAsFixed(2)} € / mois';
  }

  @override
  Widget build(BuildContext context) {
    final url = _imageUrl;
    return SizedBox(
      width: 150,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 110,
                  width: double.infinity,
                  color: const Color(0xFFF1F5F9),
                  child: url.isEmpty
                      ? Icon(Icons.image_outlined,
                          color: Colors.grey.shade400, size: 32)
                      : Image.network(
                          url,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.broken_image_outlined,
                            color: Colors.grey.shade400,
                            size: 32,
                          ),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name ?? 'Produit',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: Color(0xFF111827),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        product.service?.category?.name ?? '',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: TColors.success,
                                  fontWeight: FontWeight.w800,
                                ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Barre inférieure : prix total + bouton ajouter au panier.
class _BottomBar extends StatelessWidget {
  const _BottomBar({
    required this.totalLabel,
    required this.suffix,
    required this.enabled,
    required this.onAddToCart,
  });

  final String totalLabel;
  final String suffix;
  final bool enabled;
  final VoidCallback onAddToCart;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Prix total',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF6B7280),
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  totalLabel,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF111827),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SizedBox(
                height: 54,
                child: ElevatedButton.icon(
                  onPressed: enabled ? onAddToCart : null,
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: TColors.secondColor,
                    disabledBackgroundColor: const Color(0xFFCBD5E1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  icon: const Icon(Icons.shopping_bag_outlined,
                      color: Colors.white, size: 20),
                  label: const Text(
                    'Ajouter au panier',
                    style: TextStyle(
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
    );
  }
}

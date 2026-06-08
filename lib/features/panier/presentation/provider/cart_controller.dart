import 'package:cyna/features/panier/presentation/widgets/cart_service_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Périodicité d'abonnement choisie pour l'ensemble du panier.
enum BillingPeriod {
  mensuel(label: 'Mensuel', suffix: '/mois', multiplier: 1),
  annuel(label: 'Annuel', suffix: '/an', multiplier: 10);

  const BillingPeriod({
    required this.label,
    required this.suffix,
    required this.multiplier,
  });

  final String label;
  final String suffix;
  final double multiplier;
}

/// État immuable du panier : la liste des services et la période choisie.
class CartState {
  const CartState({
    required this.items,
    this.period = BillingPeriod.mensuel,
  });

  final List<CartServiceItem> items;
  final BillingPeriod period;

  CartState copyWith({
    List<CartServiceItem>? items,
    BillingPeriod? period,
  }) {
    return CartState(
      items: items ?? this.items,
      period: period ?? this.period,
    );
  }

  double get multiplier => period.multiplier;

  List<CartServiceItem> get availableItems =>
      items.where((item) => !item.isUnavailable).toList();

  bool get isEmpty => items.isEmpty;

  /// Nombre de produits commandables (hors indisponibles).
  int get productCount => availableItems.length;

  double get subTotal => availableItems.fold(
        0,
        (sum, item) => sum + item.lineTotal(multiplier),
      );

  /// Remise de 8% sur les lignes en promotion.
  double get promotion => availableItems
      .where((item) => item.hasPromotion)
      .fold(0, (sum, item) => sum + item.lineTotal(multiplier) * 0.08);

  double get taxes {
    final taxable = (subTotal - promotion).clamp(0, double.infinity);
    return taxable * 0.2;
  }

  double get total => subTotal - promotion + taxes;

  bool get canCheckout => availableItems.isNotEmpty && total > 0;
}

class CartController extends Notifier<CartState> {
  @override
  CartState build() {
    // Données de démonstration en attendant le branchement de l'API panier.
    return CartState(
      items: [
        CartServiceItem(
          id: 'edr',
          name: 'Cyna EDR',
          unitLabel: 'Par appareil',
          unitPrice: 59.00,
          quantity: 1,
          imagePath: 'assets/images/station.png',
        ),
        CartServiceItem(
          id: 'xdr',
          name: 'Cyna XDR',
          unitLabel: 'Par utilisateur',
          unitPrice: 99.00,
          quantity: 1,
          imagePath: 'assets/images/avatar.png',
          hasPromotion: true,
        ),
        CartServiceItem(
          id: 'soc',
          name: 'SOC Managé',
          unitLabel: 'Pack entreprise',
          unitPrice: 149.00,
          quantity: 1,
          imagePath: 'assets/images/brice.png',
          isUnavailable: true,
        ),
      ],
    );
  }

  void setPeriod(BillingPeriod period) {
    state = state.copyWith(period: period);
  }

  void increment(CartServiceItem item) {
    if (item.isUnavailable) return;
    item.quantity += 1;
    state = state.copyWith(items: [...state.items]);
  }

  void decrement(CartServiceItem item) {
    if (item.isUnavailable || item.quantity <= 1) return;
    item.quantity -= 1;
    state = state.copyWith(items: [...state.items]);
  }

  void removeItem(CartServiceItem item) {
    state = state.copyWith(
      items: state.items.where((current) => current.id != item.id).toList(),
    );
  }

  void replaceUnavailable(CartServiceItem item) {
    if (!item.isUnavailable) return;
    item.isUnavailable = false;
    item.quantity = 1;
    state = state.copyWith(items: [...state.items]);
  }

  void clear() {
    state = state.copyWith(items: []);
  }
}

final cartControllerProvider =
    NotifierProvider<CartController, CartState>(CartController.new);

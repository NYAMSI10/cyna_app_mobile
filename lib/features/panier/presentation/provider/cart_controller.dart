import 'package:cyna/features/panier/presentation/widgets/cart_service_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

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

  /// Quantité totale d'articles dans le panier (somme des quantités).
  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);

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
  static const _itemsKey = 'cart_items';
  static const _periodKey = 'cart_period';

  final GetStorage _storage = GetStorage();

  @override
  CartState build() {
    // Restauration du panier persisté pour qu'il survive à la fermeture de l'app.
    final rawItems = _storage.read(_itemsKey);
    final items = <CartServiceItem>[];
    if (rawItems is List) {
      for (final raw in rawItems) {
        if (raw is Map) {
          items.add(CartServiceItem.fromJson(Map<String, dynamic>.from(raw)));
        }
      }
    }

    final periodName = _storage.read(_periodKey);
    final period = BillingPeriod.values.firstWhere(
      (p) => p.name == periodName,
      orElse: () => BillingPeriod.mensuel,
    );

    return CartState(items: items, period: period);
  }

  /// Sauvegarde l'état courant du panier dans GetStorage.
  void _persist() {
    _storage.write(_itemsKey, state.items.map((e) => e.toJson()).toList());
    _storage.write(_periodKey, state.period.name);
  }

  void setPeriod(BillingPeriod period) {
    state = state.copyWith(period: period);
    _persist();
  }

  /// Ajoute un produit au panier. Si un article de même id existe déjà,
  /// on cumule la quantité au lieu de créer un doublon.
  void addItem(CartServiceItem item) {
    final index = state.items.indexWhere((current) => current.id == item.id);
    if (index >= 0) {
      state.items[index].quantity += item.quantity;
      state = state.copyWith(items: [...state.items]);
    } else {
      state = state.copyWith(items: [...state.items, item]);
    }
    _persist();
  }

  void increment(CartServiceItem item) {
    if (item.isUnavailable) return;
    item.quantity += 1;
    state = state.copyWith(items: [...state.items]);
    _persist();
  }

  void decrement(CartServiceItem item) {
    if (item.isUnavailable || item.quantity <= 1) return;
    item.quantity -= 1;
    state = state.copyWith(items: [...state.items]);
    _persist();
  }

  void removeItem(CartServiceItem item) {
    state = state.copyWith(
      items: state.items.where((current) => current.id != item.id).toList(),
    );
    _persist();
  }

  void replaceUnavailable(CartServiceItem item) {
    if (!item.isUnavailable) return;
    item.isUnavailable = false;
    item.quantity = 1;
    state = state.copyWith(items: [...state.items]);
    _persist();
  }

  void clear() {
    state = state.copyWith(items: []);
    _persist();
  }
}

final cartControllerProvider =
    NotifierProvider<CartController, CartState>(CartController.new);

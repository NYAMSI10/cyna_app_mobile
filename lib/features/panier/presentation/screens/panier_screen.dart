import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/features/panier/presentation/widgets/cart_service_item.dart';
import 'package:cyna/features/panier/presentation/widgets/cart_summary.dart';
import 'package:cyna/features/panier/presentation/widgets/service_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class PanierScreen extends ConsumerStatefulWidget {
  const PanierScreen({super.key});

  @override
  ConsumerState<PanierScreen> createState() => _PanierScreenState();
}

class _PanierScreenState extends ConsumerState<PanierScreen> {
  static const Map<String, double> _durationMultipliers = {
    'Mensuel': 1,
    'Annuel': 10,
    '2 ans': 18,
  };

  final NumberFormat _moneyFormatter = NumberFormat.currency(
    locale: 'fr_FR',
    symbol: '€',
    decimalDigits: 2,
  );

  final List<CartServiceItem> _items = [
    CartServiceItem(
      id: 'edr',
      name: 'Cyna EDR',
      unitLabel: 'Par appareil',
      unitPrice: 59.00,
      quantity: 1,
      selectedDuration: 'Mensuel',
      imagePath: 'assets/images/station.png',
    ),
    CartServiceItem(
      id: 'xdr',
      name: 'Cyna XDR',
      unitLabel: 'Par utilisateur',
      unitPrice: 99.00,
      quantity: 1,
      selectedDuration: 'Annuel',
      imagePath: 'assets/images/avatar.png',
      hasPromotion: true,
    ),
    CartServiceItem(
      id: 'soc',
      name: 'SOC Managé',
      unitLabel: 'Pack entreprise',
      unitPrice: 149.00,
      quantity: 1,
      selectedDuration: 'Mensuel',
      imagePath: 'assets/images/brice.png',
      isUnavailable: true,
    ),
  ];

  double get _subTotal {
    return _items
        .where((item) => !item.isUnavailable)
        .fold(0, (sum, item) => sum + item.totalPrice);
  }

  double get _promotion {
    return _items
        .where((item) => !item.isUnavailable && item.hasPromotion)
        .fold(0, (sum, item) => sum + (item.totalPrice * 0.08));
  }

  double get _taxes {
    final taxable = (_subTotal - _promotion).clamp(0, double.infinity);
    return taxable * 0.2;
  }

  double get _grandTotal => _subTotal - _promotion + _taxes;

  void _increment(CartServiceItem item) {
    if (item.isUnavailable) return;
    setState(() {
      item.quantity += 1;
    });
  }

  void _decrement(CartServiceItem item) {
    if (item.isUnavailable || item.quantity <= 1) return;
    setState(() {
      item.quantity -= 1;
    });
  }

  void _removeItem(CartServiceItem item) {
    setState(() {
      _items.removeWhere((current) => current.id == item.id);
    });
  }

  void _replaceUnavailable(CartServiceItem item) {
    setState(() {
      item.isUnavailable = false;
      item.selectedDuration = 'Mensuel';
      item.quantity = 1;
    });
  }

  void _changeDuration(CartServiceItem item, String? duration) {
    if (duration == null || item.isUnavailable) return;
    setState(() {
      item.selectedDuration = duration;
    });
  }

  bool get _canCheckout =>
      _items.any((item) => !item.isUnavailable) && _grandTotal > 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.primaryColor,
        automaticallyImplyLeading: false,
        title: const Text(
          'Mon Panier',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
          maxLines: 1,
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF4F4F6),
      body: Column(
        children: [
          CartSummary(
            subTotal: _subTotal,
            promotion: _promotion,
            taxes: _taxes,
            total: _grandTotal,
            moneyFormatter: _moneyFormatter,
            canCheckout: _canCheckout,
          ),
          Expanded(
            child: _items.isEmpty
                ? const Center(
                    child: Text(
                      'Votre panier est vide',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(3),
                    itemBuilder: (context, index) {
                      final item = _items[index];
                      return ServiceCard(
                        item: item,
                        moneyFormatter: _moneyFormatter,
                        durationMultipliers: _durationMultipliers,
                        onIncrement: () => _increment(item),
                        onDecrement: () => _decrement(item),
                        onRemove: () => _removeItem(item),
                        onDurationChanged: (duration) =>
                            _changeDuration(item, duration),
                        onReplace: () => _replaceUnavailable(item),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 2),
                    itemCount: _items.length,
                  ),
          ),
        ],
      ),
    );
  }
}

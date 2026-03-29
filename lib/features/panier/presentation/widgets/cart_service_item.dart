class CartServiceItem {
  CartServiceItem({
    required this.id,
    required this.name,
    required this.unitLabel,
    required this.unitPrice,
    required this.quantity,
    required this.selectedDuration,
    required this.imagePath,
    this.isUnavailable = false,
    this.hasPromotion = false,
  });

  final String id;
  final String name;
  final String unitLabel;
  final double unitPrice;
  int quantity;
  String selectedDuration;
  final String imagePath;
  bool isUnavailable;
  bool hasPromotion;

  static const Map<String, double> _multipliers = {
    'Mensuel': 1,
    'Annuel': 10,
    '2 ans': 18,
  };

  double get totalPrice {
    final durationFactor = _multipliers[selectedDuration] ?? 1;
    return unitPrice * quantity * durationFactor;
  }
}

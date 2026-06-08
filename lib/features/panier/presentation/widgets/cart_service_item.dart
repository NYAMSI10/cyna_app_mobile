class CartServiceItem {
  CartServiceItem({
    required this.id,
    required this.name,
    required this.unitLabel,
    required this.unitPrice,
    required this.quantity,
    required this.imagePath,
    this.isUnavailable = false,
    this.hasPromotion = false,
  });

  final String id;
  final String name;
  final String unitLabel;
  final double unitPrice;
  int quantity;
  final String imagePath;
  bool isUnavailable;
  bool hasPromotion;

  /// Prix total de la ligne pour un multiplicateur de période donné
  /// (1 pour Mensuel, 10 pour Annuel).
  double lineTotal(double periodMultiplier) {
    return unitPrice * quantity * periodMultiplier;
  }
}

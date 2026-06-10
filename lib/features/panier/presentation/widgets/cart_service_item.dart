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

  /// Vrai si l'image provient du réseau (URL) plutôt que d'un asset local.
  bool get isNetworkImage =>
      imagePath.startsWith('http://') || imagePath.startsWith('https://');

  /// Prix total de la ligne pour un multiplicateur de période donné
  /// (1 pour Mensuel, 10 pour Annuel).
  double lineTotal(double periodMultiplier) {
    return unitPrice * quantity * periodMultiplier;
  }

  /// Sérialisation pour la persistance (GetStorage).
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'unitLabel': unitLabel,
        'unitPrice': unitPrice,
        'quantity': quantity,
        'imagePath': imagePath,
        'isUnavailable': isUnavailable,
        'hasPromotion': hasPromotion,
      };

  factory CartServiceItem.fromJson(Map<String, dynamic> json) {
    return CartServiceItem(
      id: json['id'] as String,
      name: json['name'] as String,
      unitLabel: json['unitLabel'] as String,
      unitPrice: (json['unitPrice'] as num).toDouble(),
      quantity: json['quantity'] as int,
      imagePath: json['imagePath'] as String,
      isUnavailable: json['isUnavailable'] as bool? ?? false,
      hasPromotion: json['hasPromotion'] as bool? ?? false,
    );
  }
}

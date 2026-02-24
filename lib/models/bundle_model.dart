class BundleModel {
  final String id;
  final String dataAmount;
  final String validity;
  final double price;
  final bool isSelected;

  BundleModel({
    required this.id,
    required this.dataAmount,
    required this.validity,
    required this.price,
    this.isSelected = false,
  });
}

import 'bundle_model.dart';

class CartItemModel {
  final BundleModel bundle;
  int quantity;

  CartItemModel({
    required this.bundle,
    this.quantity = 1,
  });

  double get totalPrice => bundle.price * quantity;

  CartItemModel copyWith({
    BundleModel? bundle,
    int? quantity,
  }) {
    return CartItemModel(
      bundle: bundle ?? this.bundle,
      quantity: quantity ?? this.quantity,
    );
  }
}

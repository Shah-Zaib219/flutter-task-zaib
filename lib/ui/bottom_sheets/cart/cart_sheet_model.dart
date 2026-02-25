import 'package:flutter/material.dart';
import '../../../app/app.locator.dart';
import '../../../models/cart_item_model.dart';
import '../../../services/cart_service.dart';

class CartSheetModel extends ChangeNotifier {
  final _cartService = locator<CartService>();

  CartSheetModel() {
    _cartService.addListener(notifyListeners);
  }

  @override
  void dispose() {
    _cartService.removeListener(notifyListeners);
    super.dispose();
  }

  List<CartItemModel> get cartItems => _cartService.items;

  double get totalPrice => _cartService.getTotalPrice();

  void incrementQuantity(String id) {
    _cartService.updateQuantity(id, 1);
  }

  void decrementQuantity(String id) {
    _cartService.updateQuantity(id, -1);
  }

  void removeItem(String id) {
    _cartService.removeBundle(id);
  }

  void clearCart() {
    _cartService.clearCart();
  }
}

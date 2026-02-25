import 'package:flutter/material.dart';
import '../models/bundle_model.dart';
import '../models/cart_item_model.dart';

class CartService extends ChangeNotifier {
  final List<CartItemModel> _items = [];
  List<CartItemModel> get items => _items;

  void addBundle(BundleModel bundle) {
    final index = _items.indexWhere((item) => item.bundle.id == bundle.id);
    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(CartItemModel(bundle: bundle));
    }
    notifyListeners();
  }

  void removeBundle(String id) {
    _items.removeWhere((item) => item.bundle.id == id);
    notifyListeners();
  }

  void updateQuantity(String id, int delta) {
    final index = _items.indexWhere((item) => item.bundle.id == id);
    if (index != -1) {
      _items[index].quantity += delta;
      if (_items[index].quantity <= 0) {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  double getTotalPrice() {
    return _items.fold(0, (total, item) => total + item.totalPrice);
  }

  List<CartItemModel> getCartItems() => _items;

  int get cartCount => _items.length;

  bool isInCart(String id) {
    return _items.any((item) => item.bundle.id == id);
  }
}

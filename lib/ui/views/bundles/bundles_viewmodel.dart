import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.bottomsheets.dart';
import '../../../../services/bundle_service.dart';
import '../../../../services/plan_service.dart';
import '../../../../services/cart_service.dart';
import '../../../../models/bundle_model.dart';
import '../../../../models/plan_model.dart';
import '../../../../models/cart_item_model.dart';

class BundlesViewModel extends ChangeNotifier {
  final _bundleService = locator<BundleService>();
  final _planService = locator<PlanService>();
  final _cartService = locator<CartService>();
  final _bottomSheetService = locator<BottomSheetService>();

  BundlesViewModel() {
    _cartService.addListener(notifyListeners);
  }

  @override
  void dispose() {
    _cartService.removeListener(notifyListeners);
    super.dispose();
  }

  List<BundleModel> _bundles = [];
  List<BundleModel> get bundles => _bundles;

  List<PlanModel> _plans = [];
  List<PlanModel> get plans => _plans;

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  int get cartCount => _cartService.cartCount;
  double get cartTotal => _cartService.getTotalPrice();
  List<CartItemModel> get cartItems => _cartService.items;

  void incrementQuantity(String id) => _cartService.updateQuantity(id, 1);
  void decrementQuantity(String id) => _cartService.updateQuantity(id, -1);
  void removeItem(String id) => _cartService.removeBundle(id);

  Future<void> init() async {
    _isBusy = true;
    notifyListeners();
    try {
      final results = await Future.wait([
        _bundleService.getBundles(),
        _planService.getPlans(),
      ]);

      _bundles = results[0] as List<BundleModel>;
      _plans = results[1] as List<PlanModel>;
    } catch (e) {
      debugPrint('Error fetching data: $e');
    } finally {
      _isBusy = false;
      notifyListeners();
    }
  }

  void toggleBundleSelection(BundleModel bundle) {
    if (_cartService.isInCart(bundle.id)) {
      _cartService.removeBundle(bundle.id);
    } else {
      _cartService.addBundle(bundle);
    }
    notifyListeners();
  }

  bool isSelected(String id) => _cartService.isInCart(id);

  Future<void> showCart() async {
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.cart,
      barrierDismissible: true,
      isScrollControlled: true,
    );
  }
}

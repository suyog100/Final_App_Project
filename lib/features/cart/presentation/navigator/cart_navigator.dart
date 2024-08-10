
import 'package:riverpod/riverpod.dart';

import '../../../../app/navigator/navigator.dart';
import '../view/cart_view.dart';

final cartViewNavigatorProvider = Provider((ref) => CartViewNavigator());

class CartViewNavigator {
  void openCartView() {
    NavigateRoute.pushRoute(const CartView());
  }
}

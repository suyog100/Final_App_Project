import 'package:finalproject/features/menu/presentation/view/Menu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../../app/navigator/navigator.dart';


final menuViewNavigatorProvider =
Provider<MenuViewNavigator>((ref) => MenuViewNavigator());

class MenuViewNavigator {}

mixin MenuViewRoute {
  void openHomeView() {
    NavigateRoute.pushRoute(const MenuPage());
  }
}

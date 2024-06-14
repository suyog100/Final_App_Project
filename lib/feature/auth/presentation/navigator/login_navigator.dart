import 'package:finalproject/feature/auth/presentation/navigator/register_navigator.dart';
import 'package:finalproject/feature/auth/presentation/view/login_view.dart';
import 'package:finalproject/feature/home/presenatation/navigator/home_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/navigator/navigator.dart';

final loginViewNavigatorProvider = Provider((ref) => LoginViewNavigator());

class LoginViewNavigator with RegisterViewRoute, HomeViewRoute {}

mixin LoginViewRoute {
  openLoginView() {
    NavigateRoute.popAndPushRoute(const LoginView());
  }
}

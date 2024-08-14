import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/navigator/navigator.dart';
import '../view/register_view.dart';
import '../view/login_view.dart'; // Make sure to import LoginView
import 'login_navigator.dart';

final registerViewNavigatorProvider =
    Provider((ref) => RegisterViewNavigator());

class RegisterViewNavigator with LoginViewRoute {
  openLoginView() {
    NavigateRoute.pushReplacementRoute(const LoginView());
  }
}

mixin RegisterViewRoute {
  openRegisterView() {
    NavigateRoute.pushRoute(const RegisterView());
  }
}



import 'package:finalproject/app/navigator/navigator.dart';
import 'package:finalproject/feature/auth/presentation/view/register_view.dart';

class RegisterViewNavigator {}

mixin RegisterViewRoute {
  openRegisterView() {
    NavigateRoute.pushRoute(const RegisterView());
  }
}

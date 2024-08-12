import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/navigator/navigator.dart';
import '../../../auth/presentation/navigator/login_navigator.dart';

final profileViewNavigatorProvider = Provider((ref) => ProfileViewNavigator());

class ProfileViewNavigator with DashboardViewRoute, LoginViewRoute {}

mixin ProfileViewRoute {
  openProfileView() {
    NavigateRoute.popAndPushRoute(const ProfileView());
  }
}

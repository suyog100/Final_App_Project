import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gift_bazar/app/navigator/navigator.dart';
import 'package:gift_bazar/features/auth/presentation/navigator/login_navigator.dart';
import 'package:gift_bazar/features/dashboard/presentation/navigator/dashboard_navigator.dart';
import 'package:gift_bazar/features/profile/presentation/view/profile_view.dart';

final profileViewNavigatorProvider = Provider((ref) => ProfileViewNavigator());

class ProfileViewNavigator with DashboardViewRoute, LoginViewRoute {}

mixin ProfileViewRoute {
  openProfileView() {
    NavigateRoute.popAndPushRoute(const ProfileView());
  }
}

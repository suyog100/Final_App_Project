import 'package:finalproject/features/home/presentation/view/dashborad_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../../app/navigator/navigator.dart';
import '../view/home_view.dart';

final homeViewNavigatorProvider = Provider((ref) => HomeNavigator());

class HomeNavigator {}

mixin HomeViewRoute {
  openHomeView() {
    NavigateRoute.pushRoute(const DashboardTest());
  }
}
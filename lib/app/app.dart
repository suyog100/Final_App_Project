import 'package:finalproject/features/auth/presentation/view/login_view.dart';
import 'package:finalproject/features/cart/presentation/view/cart_view.dart';
import 'package:finalproject/features/home/presentation/view/dashboard_view.dart';
import 'package:finalproject/features/home/presentation/view/dashborad_test.dart';
import 'package:finalproject/features/home/presentation/view/home_view.dart';
import 'package:finalproject/features/splash/screeen/internet_checker_view.dart';
import 'package:flutter/material.dart';

import '../features/splash/presentation/view/splash_view.dart';
import 'navigator_key/navigator_key.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      home: const SplashView(),
      debugShowCheckedModeBanner: false,
      title: 'BeSushi Pokebowl',
    );
  }
}

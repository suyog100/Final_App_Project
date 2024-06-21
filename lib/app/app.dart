import 'package:flutter/material.dart';


import '../features/splash/presentation/view/splash_view.dart';
import 'navigator_key/navigator_key.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      home:  const SplashView(),
      debugShowCheckedModeBanner: false,
      title: 'Fund Nepal',
    );
  }
}

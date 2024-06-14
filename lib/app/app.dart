import 'package:finalproject/app/themes/app_theme.dart';
import 'package:finalproject/feature/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'navigator_key/navigator_key.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Student Management',
      theme: AppTheme.getApplicationTheme(false),
      home: const SplashView(),
    );
  }
}

import 'package:flutter/material.dart';

import '../../app/navigator_key/navigator_key.dart';



showMySnackBar({required String message, Color? color}) {
  ScaffoldMessenger.of(
    AppNavigator.navigatorKey.currentState!.context,
  ).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color ?? Colors.green,
      duration: const Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
import 'dart:async';
import 'package:flutter/material.dart';

import '../../app/navigator_key/navigator_key.dart';

Future<bool> myYesNoDialog({required String title, Colors? color}) async {
  bool result = false;
  result = await showDialog<bool>(
    context: AppNavigator.navigatorKey.currentState!.context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text('No'),
          ),
        ],
      );
    },
  ) ??
      false; // Default to false if the dialog is dismissed by other means
  return result;
}


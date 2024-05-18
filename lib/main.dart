import 'package:finalproject/screen/dashboard_screen.dart';
import 'package:finalproject/screen/first_screen.dart';
import 'package:finalproject/screen/register_screen.dart';
import 'package:finalproject/screen/log_in_screen.dart';
import 'package:finalproject/screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SignIn() ,
    );
  }
}

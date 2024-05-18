import "package:flutter/material.dart";
import 'package:finalproject/model/colors.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Suyog"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: backgroundColor1,
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size.height * 0.53,
                width: size.width,
                decoration: BoxDecoration(
                    color: primaryColor,
                    image: const DecorationImage(
                        image: AssetImage("assets/images/image.png",
                        ),
                    ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

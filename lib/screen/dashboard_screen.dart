import 'package:flutter/material.dart';


import 'about_screen.dart';
import 'cart_screen.dart';
import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  int _selectedIndex = 0;

  List<Widget> lstBottomScreen =[
    const HomeScreen(),
    const CartScreen(),
    const AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Row(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Image.asset(
      //           'assets/images/logo.png',
      //           height: 50,
      //           width: 50,
      //         ),
      //       ),
      //       const Text(
      //         "BeSushiPokeBowl",
      //         style: TextStyle(fontSize: 20),
      //       ),
      //     ],
      //   ),
      //   backgroundColor: Colors.orangeAccent,
      //   centerTitle: true,
      // ),

      // body:Container(
      //   child: Column(
      //     children: [
      //       // const Spacer(),
      //       const SizedBox(height: 16), // Adds some padding from the top
      //       Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //         child: TextField(
      //           decoration: InputDecoration(
      //             filled: true,
      //             fillColor: Colors.grey.withOpacity(0.5),
      //             hintText: 'Search',
      //             prefixIcon: const Icon(Icons.search),
      //             border: const OutlineInputBorder(
      //               borderRadius: BorderRadius.all(Radius.circular(30.0)),
      //               borderSide: BorderSide.none,
      //             ),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(height: 80),
      //     ],
      //   ),
      // ),
      //
       body:lstBottomScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person),
            label: 'About',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (idx){
          setState(() {
            _selectedIndex=idx;
          });
        },
      ),
    );
  }
}

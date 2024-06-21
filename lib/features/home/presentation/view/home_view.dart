import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int _selectedIndex = 0;
  List<Widget> lstBottomScreen = [
    const Center(
      child: Text(
        "Home",
        style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
      ),
    ),
    const Center(
      child: Text(
        "Profile",
        style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BeSushi Pokebowl"),
      ),
      body: lstBottomScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType
            .fixed, // it will fix the issue if we add 4 items
        backgroundColor: Colors.pinkAccent,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.dashboard),
          ),
          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person_2)),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}

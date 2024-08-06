import 'package:flutter/material.dart';
import 'package:finalproject/features/cart/presentation/view/cart_view.dart';
import '../../../home/presentation/view/dashborad_test.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 1; // Start with Menu selected

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      if (index == 0) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashboardTest(),
        ));
      } else if (index == 2) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CartView(),
        ));
      } else if (index == 3) {
        // Navigate to Profile page
        // Add your Profile page navigation here
      } else {
        setState(() {
          _selectedIndex = index;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBar(),
            CategoryList(),
            SortDropdown(),
            FoodGrid(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Icon(Icons.search, color: Colors.grey),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search here',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 16),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(Icons.tune, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'icon': '🍔', 'label': 'Food'},
    {'icon': '🍓', 'label': 'Fruits'},
    {'icon': '🍹', 'label': 'Drinks'},
    {'icon': '🍰', 'label': 'Desserts'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryChip(
            icon: categories[index]['icon']!,
            label: categories[index]['label']!,
          );
        },
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String icon;
  final String label;

  CategoryChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: TextStyle(fontSize: 20)),
          SizedBox(width: 8),
          Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class SortDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Category', style: TextStyle(fontWeight: FontWeight.bold)),
          DropdownButton<String>(
            value: 'Most Popular',
            items: ['Most Popular', 'Newest', 'Price'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }
}

class FoodGrid extends StatelessWidget {
  final List<Map<String, dynamic>> foodItems = [
    {
      'imagePath': 'assets/images/sushi.png',
      'title': 'Sushi Platter',
      'price': 15.99,
      'description': 'Assorted fresh sushi',
    },
    {
      'imagePath': 'assets/images/burger.png',
      'title': 'Classic Burger',
      'price': 9.99,
      'description': 'Juicy beef patty with fresh veggies',
    },
    {
      'imagePath': 'assets/images/pizza.png',
      'title': 'Pepperoni Pizza',
      'price': 12.50,
      'description': 'Crispy crust with pepperoni and cheese',
    },
    {
      'imagePath': 'assets/images/tacos.png',
      'title': 'Greek Salad',
      'price': 7.25,
      'description': 'Fresh vegetables with feta cheese',
    },
    {
      'imagePath': 'assets/images/pasta.png',
      'title': 'Spaghetti Carbonara',
      'price': 11.75,
      'description': 'Creamy pasta with bacon and parmesan',
    },
    {
      'imagePath': 'assets/images/momo.png',
      'title': 'Grilled Steak',
      'price': 18.99,
      'description': 'Tender steak with herb butter',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 600 ? 2 : 1;
        final childAspectRatio = constraints.maxWidth > 600 ? 4.5 : 3.0;

        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            crossAxisSpacing: 16,
            mainAxisSpacing: 8,
          ),
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            final item = foodItems[index];
            return FoodItem(
              imagePath: item['imagePath'],
              title: item['title'],
              price: item['price'],
              description: item['description'],
            );
          },
        );
      },
    );
  }

}

class FoodItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final double price;
  final String description;

  FoodItem({
    required this.imagePath,
    required this.title,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 70, height: 70, fit: BoxFit.cover),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  SizedBox(height: 2),
                  Text(description,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  SizedBox(height: 2),
                  Text('\$${price.toStringAsFixed(2)}',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 12)),
                ],
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                print('Added $title to cart');
              },
              child: Text('Add', style: TextStyle(fontSize: 12)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                minimumSize: Size(60, 30),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
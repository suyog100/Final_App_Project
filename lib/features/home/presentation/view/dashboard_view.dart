import 'package:finalproject/app/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    // return  Scaffold(
    //   backgroundColor: Colors.white,
    //   body: SafeArea(
    //     child: Column(
    //       children: [
    //         Padding(
    //           padding: EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 10),
    //           child: TextField(
    //             decoration: InputDecoration(
    //                   labelText: "Search",
    //                   prefixIcon: Icon(Icons.location_on_rounded),
    //                   fillColor: Colors.grey,
    //                   filled: true,
    //                 border: OutlineInputBorder(
    //                   // borderRadius:BorderRadius.all(Radius.circular(20),
    //                   borderSide: BorderSide(
    //                     width: 0,
    //                     style: BorderStyle.none,
    //                   ),
    //                   borderRadius: BorderRadius.all(Radius.circular(20))
    //                 ),
    //             ),
    //           ),
    //
    //         ),
    //   ListView(
    //     shrinkWrap: true,
    //     //padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
    //     children: const <Widget>[
    //       Text('ddedede'),
    //       Row(
    //         // crossAxisAlignment: CrossAxisAlignment.stretch,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Text('Set'),
    //           Text('Set'),
    //           Text('Set'),
    //           Text('Set'),
    //           Text('Set'),
    //           Text('Set'),
    //           Text('Set'),
    //           Text('Set'),
    //           Text('Set'),
    //           Text('Set'),
    //           Text('Set'),
    //           Text('Set'),
    //           Text('Set'),
    //           Text('Set'),
    //           Text('Set'),
    //           Text('Set'),
    //           Text('Set'),
    //           Text('Set'),
    //           Text('Set'),
    //           Text('Set'),
    //         ],
    //       ),
    //     ],
    //   ),
    //
    //
    //       ],
    //
    //
    //     ),
    //
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search on BeSushi",
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.filter_list)
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.all(16.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Category",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                TextButton(onPressed: (){},child: Text("See all")),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryCard(icon: Icons.food_bank, label: 'Sandwich'),
                  CategoryCard(icon: Icons.local_pizza, label: 'Pizza'),
                  CategoryCard(icon: Icons.fastfood, label: 'Burgers'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Best Partners', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(onPressed: () {}, child: Text('See all')),
                ],
              ),
            ),
            PartnerCard(
              image: 'assets/images/subway.png',
              name: 'Subway',
              distance: '1.8km',
              deliveryTime: 'Free shipping',
              rating: 4.5,
            ),
            PartnerCard(
              image: 'assets/images/tacobell.png',
              name: 'Taco Bell',
              distance: '0.2km',
              deliveryTime: 'Free shipping',
              rating: 4.2,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Nearby', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            PartnerCard(
              image: 'assets/images/burger_king.png',
              name: 'Burger King',
              distance: '2.6km',
              deliveryTime: 'Free shipping',
              rating: 4.8,
            ),
            PartnerCard(
              image: 'assets/images/kfc.png',
              name: 'KFC',
              distance: '3.0km',
              deliveryTime: 'Free shipping',
              rating: 4.0,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label:'home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label:'cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label:'Profile'),

        ],
      ),
    );
  }
}
class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            child: Icon(icon, size: 30),
          ),
          SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}
class PartnerCard extends StatelessWidget {
  final String image;
  final String name;
  final String distance;
  final String deliveryTime;
  final double rating;

  const PartnerCard({
    required this.image,
    required this.name,
    required this.distance,
    required this.deliveryTime,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading: Image.asset(image),
          title: Text(name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$distance • $deliveryTime'),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 16),
                  SizedBox(width: 4),
                  Text('$rating'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



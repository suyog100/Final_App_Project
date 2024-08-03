import 'dart:async';

import 'package:all_sensors2/all_sensors2.dart';
import 'package:finalproject/app/app.dart';
import 'package:finalproject/features/home/presentation/widget/product_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/common/dialog.dart';
import '../../../../core/common/my_snackbar.dart';
import '../../domain/entity/paginated_products.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  bool showYesNoDialog = true;
  bool isDialogShowing = false;

  final key = GlobalKey<FormState>();

  List<double> _gyroscopeValues = [];
  final List<StreamSubscription<dynamic>> _streamSubscription = [];

  @override
  void initState() {
    _streamSubscription.add(gyroscopeEvents!.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = <double>[event.x, event.y, event.z];

        _checkGyroscopeValues(_gyroscopeValues);
      });
    }));

    super.initState();
  }

  @override
  void dispose() {
    for (final subscription in _streamSubscription) {
      subscription.cancel();
    }
    super.dispose();
  }

  void _checkGyroscopeValues(List<double> values) async {
    const double threshold = 5; // Example threshold value, adjust as needed
    if (values.any((value) => value.abs() > threshold)) {
      if (showYesNoDialog && !isDialogShowing) {
        isDialogShowing = true;
        final result = await myYesNoDialog(
          title: 'Are you sure you want to send feedback?',
        );
        isDialogShowing = false;
        if (result) {
          showMySnackBar(
            message: 'Feedback sent',
            color: Colors.green,
          );
        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {


    ProductEntity productOne = ProductEntity(
        id: "123", productName: "chowmein",
        productPrice: 58, productCategory: "nepali dish",
        productDescription: "filled with plate",
        productImage: "https://media.istockphoto.com/id/1195969549/photo/nepali-chinese-chowmein.jpg?b=1&s=612x612&w=0&k=20&c=qvroyjT3TV0RlxnI--NWwJrE8SCrei3gDc_44QaPzmA=");

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
           ProductCart(product: productOne),



            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Nearby', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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



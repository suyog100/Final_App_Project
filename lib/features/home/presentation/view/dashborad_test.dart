import 'package:finalproject/features/cart/presentation/view/cart_view.dart';
import 'package:finalproject/features/menu/presentation/view/Menu.dart';
import 'package:finalproject/features/profile/presentation/view/profile.dart';

import 'package:flutter/material.dart';
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
import 'package:finalproject/features/home/presentation/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/constants/api_endpoint.dart';
import '../../../../core/common/product_cart.dart';

class DashboardTest extends StatefulWidget {
  const DashboardTest({super.key});

  @override
  _DashboardTestState createState() => _DashboardTestState();
}

class _DashboardTestState extends State<DashboardTest> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DeliveryScreen(),
    MenuPage(),
    CartView(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
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
      ),
    );
  }
}

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 16.0), // Add gap at the bottom
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Search bar
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 5.0),
                            Text(
                              'Search on app',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.0),
                      // Delivery location
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.orange),
                              SizedBox(width: 8.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Delivery to',
                                    style: TextStyle(
                                        color: Colors.orange, fontSize: 14),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Dillibazar Road',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(Icons.keyboard_arrow_down,
                                          color: Colors.orange),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 6.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.tune,
                                    size: 18, color: Colors.grey[600]),
                                SizedBox(width: 4.0),
                                Text(
                                  'Filter',
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                CategorySection(),
                SizedBox(height: 16.0),
                BestSellerSection(),
                SizedBox(height: 16.0),
                OfferSection(),
                SizedBox(height: 16.0),
                ReviewSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // See all action
                },
                child: Text(
                  'See all',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: CategoryItem(
                  imagePath:
                      'assets/images/sandwich.png', // Adjust the path to your image
                  text: 'Sandwich',
                ),
              ),
              Expanded(
                child: CategoryItem(
                  imagePath:
                      'assets/images/pizza.png', // Adjust the path to your image
                  text: 'Pizza',
                ),
              ),
              Expanded(
                child: CategoryItem(
                  imagePath:
                      'assets/images/burger.png', // Adjust the path to your image
                  text: 'Burgers',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BestSellerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best Sellers',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // See all action
                },
                child: Text(
                  'See all',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Container(
            height: 220, // Adjust this height as needed
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                BestSellerItem(
                  imagePath: 'assets/images/sandwich2.png',
                  text: 'Sandwich',
                  rating: 4.5,
                  availability: 'Available',
                  shippingInfo: 'Free shipping',
                ),
                SizedBox(width: 16.0),
                BestSellerItem(
                  imagePath: 'assets/images/tacos.png',
                  text: 'Tacos',
                  rating: 4.5,
                  availability: 'Out of Stock',
                  shippingInfo: 'Free shipping',
                ),
                SizedBox(width: 16.0),
                BestSellerItem(
                  imagePath: 'assets/images/momo.png',
                  text: 'Momo',
                  rating: 4.7,
                  availability: 'Available',
                  shippingInfo: 'Free shipping',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BestSellerItem extends StatelessWidget {
  final String imagePath;
  final String text;
  final double rating;
  final String availability;
  final String shippingInfo;

  const BestSellerItem({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.rating,
    required this.availability,
    required this.shippingInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Fixed width for each item
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.0),
          Text(
            availability,
            style: TextStyle(
              color: availability == 'Available' ? Colors.green : Colors.red,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 4.0),
          Row(
            children: [
              Icon(Icons.star, color: Colors.orange, size: 14),
              SizedBox(width: 4.0),
              Text(
                rating.toString(),
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  shippingInfo,
                  style: TextStyle(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String text;

  const CategoryItem({
    Key? key,
    required this.imagePath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.orange[50],
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Image.asset(
            imagePath,
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class OfferSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Offer',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          isTablet
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: OfferCard(
                        imagePath: 'assets/images/sushi.png',
                        title: 'Sushi',
                        rating: 4.8,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: OfferCard(
                        imagePath: 'assets/images/momo.png',
                        title: 'Momo',
                        rating: 4.6,
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    OfferCard(
                      imagePath: 'assets/images/sushi.png',
                      title: 'Sushi',
                      rating: 4.8,
                    ),
                    SizedBox(height: 16.0),
                    OfferCard(
                      imagePath: 'assets/images/momo.png',
                      title: 'Momo',
                      rating: 4.6,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double rating;

  const OfferCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Image.asset(
            imagePath,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4.0),
        Text(
          'Available',
          style: TextStyle(color: Colors.green, fontSize: 14),
        ),
        SizedBox(height: 4.0),
        Row(
          children: [
            Icon(Icons.star, color: Colors.orange, size: 14),
            SizedBox(width: 4.0),
            Text(
              rating.toString(),
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(width: 8.0),
            Text(
              'Free shipping',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}

class ReviewSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reviews',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          ReviewCard(
            reviewerName: 'John Doe',
            rating: 4.5,
            reviewText: 'Great food and quick delivery! Highly recommended.',
          ),
          SizedBox(height: 16.0),
          ReviewCard(
            reviewerName: 'Jane Smith',
            rating: 5.0,
            reviewText: 'Absolutely loved the sushi. Will order again!',
          ),
          SizedBox(height: 16.0),
          WriteReviewSection(),
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String reviewerName;
  final double rating;
  final String reviewText;

  const ReviewCard({
    Key? key,
    required this.reviewerName,
    required this.rating,
    required this.reviewText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                reviewerName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 18),
                  SizedBox(width: 4.0),
                  Text(
                    rating.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(reviewText),
        ],
      ),
    );
  }
}

class WriteReviewSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Write a Review',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter your review here...',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Text('Rating: '),
            for (int i = 1; i <= 5; i++)
              Icon(Icons.star_border, color: Colors.orange),
          ],
        ),
        SizedBox(height: 8.0),
        ElevatedButton(
          onPressed: () {
            // Submit review logic here
          },
          child: Text('Submit Review'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.orange,
          ),
        ),
      ],
    );
  }
}

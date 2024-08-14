// import 'package:finalproject/features/cart/presentation/viewmodel/cart_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:finalproject/features/home/presentation/view/dashborad_test.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../menu/presentation/view/Menu.dart';

// class CartView extends ConsumerStatefulWidget {
//   const CartView({super.key});

//   @override
//   ConsumerState<CartView> createState() => _CartViewState();
// }

// class _CartViewState extends ConsumerState<CartView> {
//   // Start with Cart selected

//   @override
//   Widget build(BuildContext context) {
//     final cartData = ref.watch(cartViewModelProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Confirm Order'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Delivery to',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.1),
//                             spreadRadius: 1,
//                             blurRadius: 5,
//                             offset: Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Row(
//                           children: [
//                             Container(
//                               width: 60,
//                               height: 60,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(12),
//                                 child: Image.asset(
//                                   'assets/images/map_thumbnail.png',
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 16),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     '123 West Thali Boudha Kathmandu',
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(height: 4),
//                                   Row(
//                                     children: [
//                                       Icon(Icons.access_time,
//                                           size: 16, color: Colors.grey),
//                                       SizedBox(width: 4),
//                                       Text(
//                                         '15 km',
//                                         style: TextStyle(
//                                           color: Colors.grey,
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 24),
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.1),
//                             spreadRadius: 1,
//                             blurRadius: 5,
//                             offset: Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'BeSushi Pokebowl',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Divider(),
//                             // SizedBox(height: 16),
//                             // OrderItem(
//                             //   imagePath: 'assets/images/burger.png',
//                             //   name: 'Prime Beef - Pizza Beautifu...',
//                             //   initialQuantity: 2,
//                             //   price: 400,
//                             // ),
//                             // SizedBox(height: 16),
//                             // const OrderItem(
//                             //   imagePath: 'assets/images/burger.png',
//                             //   name: 'Double BBQ bacon cheese...',
//                             //   initialQuantity: 2,
//                             //   price: 500,
//                             // ),
//                             Column(
//                               children: cartData.cartItems
//                                   .map(
//                                     (item) => ListTile(
//                                       title: Text(item.productName),
//                                       leading: Icon(Icons.food_bank),
//                                       trailing:
//                                           Text(item.productPrice.toString()),
//                                     ),
//                                   )
//                                   .toList(),
//                             ),
//                             SizedBox(height: 16),
//                             Divider(),
//                             SizedBox(height: 16),
//                             OrderSummaryItem(
//                                 title: 'Subtotal (2 items)', value: 'Rs 900'),
//                             SizedBox(height: 8),
//                             OrderSummaryItem(
//                                 title: 'Delivery', value: '\$0.00'),
//                             SizedBox(height: 8),
//                             OrderSummaryItem(title: 'Voucher', value: '-'),
//                             SizedBox(height: 16),
//                             Divider(),
//                             SizedBox(height: 16),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'Total',
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(
//                                   'Rs 900',
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.orange,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 // Add your submit logic here
//               },
//               child: Text('Submit'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.orange,
//                 minimumSize:
//                     Size(double.infinity, 50), // full width and 50 height
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class OrderItem extends StatefulWidget {
//   final String imagePath;
//   final String name;
//   final int initialQuantity;
//   final int price;

//   const OrderItem({
//     Key? key,
//     required this.imagePath,
//     required this.name,
//     required this.initialQuantity,
//     required this.price,
//   }) : super(key: key);

//   @override
//   _OrderItemState createState() => _OrderItemState();
// }

// class _OrderItemState extends State<OrderItem> {
//   late int quantity;

//   @override
//   void initState() {
//     super.initState();
//     quantity = widget.initialQuantity;
//   }

//   void _incrementQuantity() {
//     setState(() {
//       quantity++;
//     });
//   }

//   void _decrementQuantity() {
//     if (quantity > 1) {
//       setState(() {
//         quantity--;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Image.asset(widget.imagePath, width: 50, height: 50),
//         SizedBox(width: 16),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(widget.name, style: TextStyle(fontWeight: FontWeight.bold)),
//               SizedBox(height: 4),
//               Row(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.remove, size: 16),
//                           onPressed: _decrementQuantity,
//                           padding: EdgeInsets.zero,
//                           constraints: BoxConstraints(),
//                         ),
//                         SizedBox(width: 8),
//                         Text('$quantity'),
//                         SizedBox(width: 8),
//                         IconButton(
//                           icon: Icon(Icons.add, size: 16),
//                           onPressed: _incrementQuantity,
//                           padding: EdgeInsets.zero,
//                           constraints: BoxConstraints(),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Spacer(),
//                   Text('Rs ${widget.price}',
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class OrderSummaryItem extends StatelessWidget {
//   final String title;
//   final String value;

//   const OrderSummaryItem({
//     Key? key,
//     required this.title,
//     required this.value,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(title),
//         Text(value),
//       ],
//     );
//   }
// }

//prasanna le sikayepachi yo code bata image chai aayo hai
// import 'package:finalproject/app/constants/api_endpoint.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:finalproject/features/cart/presentation/viewmodel/cart_view_model.dart';

// class CartView extends ConsumerStatefulWidget {
//   const CartView({Key? key}) : super(key: key);

//   @override
//   ConsumerState<CartView> createState() => _CartViewState();
// }

// class _CartViewState extends ConsumerState<CartView> {
//   @override
//   Widget build(BuildContext context) {
//     final cartData = ref.watch(cartViewModelProvider);

//     // Calculate subtotal
//     double subtotal = cartData.cartItems
//         .fold(0, (sum, item) => sum + (item.productPrice * item.quantity));

//     // Assuming delivery is free and no voucher for simplicity
//     double deliveryFee = 0;
//     double voucherDiscount = 0;

//     // Calculate total
//     double total = subtotal + deliveryFee - voucherDiscount;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Confirm Order'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Delivery to',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.1),
//                             spreadRadius: 1,
//                             blurRadius: 5,
//                             offset: Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Row(
//                           children: [
//                             Container(
//                               width: 60,
//                               height: 60,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(12),
//                                 child: Image.asset(
//                                   'assets/images/map_thumbnail.png',
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 16),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     '123 West Thali Boudha Kathmandu',
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(height: 4),
//                                   Row(
//                                     children: [
//                                       Icon(Icons.access_time,
//                                           size: 16, color: Colors.grey),
//                                       SizedBox(width: 4),
//                                       Text(
//                                         '15 km',
//                                         style: TextStyle(
//                                           color: Colors.grey,
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 24),
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.1),
//                             spreadRadius: 1,
//                             blurRadius: 5,
//                             offset: Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'BeSushi Pokebowl',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Divider(),
//                             Column(
//                               children: cartData.cartItems.asMap().entries.map(
//                                 (entry) {
//                                   final index = entry.key;
//                                   final item = entry.value;
//                                   return Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         vertical: 8.0),
//                                     child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                           child: _buildProductImage(
//                                               item.productImage),
//                                         ),
//                                         SizedBox(width: 12),
//                                         Expanded(
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 item.productName,
//                                                 style: TextStyle(
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                               SizedBox(height: 4),
//                                               Text(
//                                                 item.productDescription,
//                                                 style: TextStyle(
//                                                     fontSize: 12,
//                                                     color: Colors.grey[600]),
//                                                 maxLines: 2,
//                                                 overflow: TextOverflow.ellipsis,
//                                               ),
//                                               SizedBox(height: 8),
//                                               Row(
//                                                 children: [
//                                                   IconButton(
//                                                     icon: Icon(Icons.remove,
//                                                         size: 20),
//                                                     onPressed: () => ref
//                                                         .read(
//                                                             cartViewModelProvider
//                                                                 .notifier)
//                                                         .decrementQuantity(
//                                                             index),
//                                                     padding: EdgeInsets.zero,
//                                                     constraints:
//                                                         BoxConstraints(),
//                                                   ),
//                                                   SizedBox(width: 8),
//                                                   Text('${item.quantity}'),
//                                                   SizedBox(width: 8),
//                                                   IconButton(
//                                                     icon: Icon(Icons.add,
//                                                         size: 20),
//                                                     onPressed: () => ref
//                                                         .read(
//                                                             cartViewModelProvider
//                                                                 .notifier)
//                                                         .incrementQuantity(
//                                                             index),
//                                                     padding: EdgeInsets.zero,
//                                                     constraints:
//                                                         BoxConstraints(),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         SizedBox(width: 8),
//                                         Text(
//                                           'Rs ${(item.productPrice * item.quantity).toStringAsFixed(2)}',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 },
//                               ).toList(),
//                             ),
//                             SizedBox(height: 16),
//                             Divider(),
//                             SizedBox(height: 16),
//                             OrderSummaryItem(
//                                 title:
//                                     'Subtotal (${cartData.cartItems.length} items)',
//                                 value: 'Rs ${subtotal.toStringAsFixed(2)}'),
//                             SizedBox(height: 8),
//                             OrderSummaryItem(
//                                 title: 'Delivery',
//                                 value: 'Rs ${deliveryFee.toStringAsFixed(2)}'),
//                             SizedBox(height: 8),
//                             OrderSummaryItem(
//                                 title: 'Voucher',
//                                 value: voucherDiscount > 0
//                                     ? '-Rs ${voucherDiscount.toStringAsFixed(2)}'
//                                     : '-'),
//                             SizedBox(height: 16),
//                             Divider(),
//                             SizedBox(height: 16),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'Total',
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(
//                                   'Rs ${total.toStringAsFixed(2)}',
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.orange,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 // Add your submit logic here
//               },
//               child: Text('Submit'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.orange,
//                 minimumSize: Size(double.infinity, 50),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildProductImage(String? imageUrl) {
//     if (imageUrl != null && imageUrl.isNotEmpty) {
//       final fullImageUrl = ApiEndpoints.imageUrl + imageUrl;
//       return Image.network(
//         fullImageUrl,
//         width: 60,
//         height: 60,
//         fit: BoxFit.cover,
//         errorBuilder: (context, error, stackTrace) {
//           print('Error loading image: $error');
//           return _buildPlaceholderImage();
//         },
//       );
//     } else {
//       return _buildPlaceholderImage();
//     }
//   }

//   Widget _buildPlaceholderImage() {
//     return Container(
//       width: 60,
//       height: 60,
//       color: Colors.grey[300],
//       child: Icon(Icons.image, color: Colors.grey[600]),
//     );
//   }
// }

// class OrderSummaryItem extends StatelessWidget {
//   final String title;
//   final String value;

//   const OrderSummaryItem({
//     Key? key,
//     required this.title,
//     required this.value,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(title),
//         Text(value),
//       ],
//     );
//   }
// }

import 'package:finalproject/app/constants/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:finalproject/features/cart/presentation/viewmodel/cart_view_model.dart';

class CartView extends ConsumerStatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  ConsumerState<CartView> createState() => _CartViewState();
}

class _CartViewState extends ConsumerState<CartView> {
  @override
  Widget build(BuildContext context) {
    final cartData = ref.watch(cartViewModelProvider);

    // Calculate subtotal
    double subtotal = cartData.cartItems
        .fold(0, (sum, item) => sum + (item.productPrice * item.quantity));

    // Assuming delivery is free and no voucher for simplicity
    double deliveryFee = 0;
    double voucherDiscount = 0;

    // Calculate total
    double total = subtotal + deliveryFee - voucherDiscount;

    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Order'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery to',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  'assets/images/map_thumbnail.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '123 West Thali Boudha Kathmandu',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time,
                                          size: 16, color: Colors.grey),
                                      SizedBox(width: 4),
                                      Text(
                                        '15 km',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
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
                    ),
                    SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'BeSushi Pokebowl',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Divider(),
                            Column(
                              children: cartData.cartItems
                                  .map(
                                    (item) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: _buildProductImage(
                                                item.productImage),
                                          ),
                                          SizedBox(width: 12),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  item.productName,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  item.productDescription,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey[600]),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                SizedBox(height: 8),
                                                Row(
                                                  children: [
                                                    Text(
                                                        'Quantity: ${item.quantity}'),
                                                    Spacer(),
                                                    IconButton(
                                                      icon: Icon(Icons.delete,
                                                          size: 20,
                                                          color: Colors.red),
                                                      onPressed: () => ref
                                                          .read(
                                                              cartViewModelProvider
                                                                  .notifier)
                                                          .removeProductFromCart(
                                                              item.productId),
                                                      padding: EdgeInsets.zero,
                                                      constraints:
                                                          BoxConstraints(),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            'Rs ${(item.productPrice * item.quantity).toStringAsFixed(2)}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            SizedBox(height: 16),
                            Divider(),
                            SizedBox(height: 16),
                            OrderSummaryItem(
                                title:
                                    'Subtotal (${cartData.cartItems.length} items)',
                                value: 'Rs ${subtotal.toStringAsFixed(2)}'),
                            SizedBox(height: 8),
                            OrderSummaryItem(
                                title: 'Delivery',
                                value: 'Rs ${deliveryFee.toStringAsFixed(2)}'),
                            SizedBox(height: 8),
                            OrderSummaryItem(
                                title: 'Voucher',
                                value: voucherDiscount > 0
                                    ? '-Rs ${voucherDiscount.toStringAsFixed(2)}'
                                    : '-'),
                            SizedBox(height: 16),
                            Divider(),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Rs ${total.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Add your submit logic here
              },
              child: Text('Proceed to'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage(String? imageUrl) {
    if (imageUrl != null && imageUrl.isNotEmpty) {
      final fullImageUrl = ApiEndpoints.imageUrl + imageUrl;
      return Image.network(
        fullImageUrl,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          print('Error loading image: $error');
          return _buildPlaceholderImage();
        },
      );
    } else {
      return _buildPlaceholderImage();
    }
  }

  Widget _buildPlaceholderImage() {
    return Container(
      width: 60,
      height: 60,
      color: Colors.grey[300],
      child: Icon(Icons.image, color: Colors.grey[600]),
    );
  }
}

class OrderSummaryItem extends StatelessWidget {
  final String title;
  final String value;

  const OrderSummaryItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}

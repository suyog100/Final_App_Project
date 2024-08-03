// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// class HomeView extends ConsumerStatefulWidget {
//   const HomeView({super.key});
//
//   @override
//   ConsumerState<HomeView> createState() => _HomeViewState();
// }
//
// class _HomeViewState extends ConsumerState<HomeView> {
//   int _selectedIndex = 0;
//   List<Widget> lstBottomScreen = [
//     const Center(
//       child: Text(
//         "Home",
//         style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
//       ),
//     ),
//     const Center(
//       child: Text(
//         "Profile",
//         style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
//       ),
//     )
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("BeSushi Pokebowl"),
//       ),
//       body: lstBottomScreen[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType
//             .fixed, // it will fix the issue if we add 4 items
//         backgroundColor: Colors.pinkAccent,
//         selectedItemColor: Colors.white,
//         items: const [
//           BottomNavigationBarItem(
//             label: 'Home',
//             icon: Icon(Icons.dashboard),
//           ),
//           BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person_2)),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: (index) {
//           setState(
//             () {
//               _selectedIndex = index;
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:finalproject/features/home/presentation/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/constants/api_endpoint.dart';
import '../../../../core/common/product_cart.dart';




class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productViewModelProvider);

    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          // Scroll garda feri last ma ho ki haina bhanera check garne ani data call garne
          if (_scrollController.position.extentAfter == 0) {
            // Data fetch gara api bata
            ref.read(productViewModelProvider.notifier).getProduct();
          }
        }
        return true;
      },
      child: Scaffold(
        // backgroundColor: Colors.amber[100],
        appBar: AppBar(
          backgroundColor: Colors.yellow[400],
          title: const Text('Photos Pagination'),
          actions: [
            TextButton.icon(
              onPressed: () {
                ref.read(productViewModelProvider.notifier).resetState();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Refresh'),
            ),
          ],
        ),
        body: RefreshIndicator(
          // Yo chai pull to refresh ko lagi ho
          color: Colors.green,
          backgroundColor: Colors.amberAccent,
          onRefresh: () async {
            ref.read(productViewModelProvider.notifier).resetState();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    controller: _scrollController,
                    itemCount: state.productListings.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final productListings = state.productListings[index];
                      return ProductCard(
                        image: '${ApiEndpoints.imageBaseUrl}products/${productListings.productImage}',
                        name: productListings.productName,
                        size: productListings.productPrice,);

                      // return Card(
                      //   color: Colors.brown,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Column(
                      //       children: [
                      //         // Text(
                      //         //   petListings.petid.toString(),
                      //         //   style: const TextStyle(
                      //         //     fontSize: 20,
                      //         //     fontWeight: FontWeight.bold,
                      //         //   ),
                      //         // ),
                      //         DecoratedBox(
                      //           decoration: BoxDecoration(
                      //             color: Colors.brown,
                      //             border: Border.all(),
                      //             borderRadius: BorderRadius.circular(20),
                      //           ),
                      //           child: Image.network(
                      //             petListings.petImage,
                      //             height: 200,
                      //             width: 200,
                      //             loadingBuilder: (BuildContext context,
                      //                 Widget child,
                      //                 ImageChunkEvent? loadingProgress) {
                      //               if (loadingProgress == null) {
                      //                 return child;
                      //               } else if (loadingProgress
                      //                   .expectedTotalBytes !=
                      //                   null) {
                      //                 return Center(
                      //                   child: CircularProgressIndicator(
                      //                     color: Colors.red,
                      //                     value: loadingProgress
                      //                         .cumulativeBytesLoaded /
                      //                         loadingProgress
                      //                             .expectedTotalBytes!,
                      //                   ),
                      //                 );
                      //               } else {
                      //                 // If total bytes are unknown, you may want to handle it differently
                      //                 return const Center(
                      //                   child: CircularProgressIndicator(
                      //                       color: Colors.red),
                      //                 );
                      //               }
                      //             },
                      //             errorBuilder: (BuildContext context,
                      //                 Object error, StackTrace? stackTrace) {
                      //               return const Center(
                      //                 child: Text('Failed to load image'),
                      //               );
                      //             },
                      //           ),
                      //         ),
                      //         Text(
                      //           petListings.petName,
                      //           textAlign: TextAlign.center,
                      //           style: const TextStyle(
                      //             fontSize: 20,
                      //             color: Colors.white
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // );
                    },
                  ),
                ),
                // Data load huda feri progress bar dekhaune natra banda garne
                if (state.isLoading)
                  const CircularProgressIndicator(color: Colors.red),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

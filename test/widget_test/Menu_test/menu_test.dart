// import 'package:finalproject/features/cart/presentation/state/cart_state.dart';
// import 'package:finalproject/features/cart/presentation/viewmodel/cart_view_model.dart';
// import 'package:finalproject/features/menu/domain/entity/get_product_entity.dart';
// import 'package:finalproject/features/menu/presentation/state/product_state.dart';
// import 'package:finalproject/features/menu/presentation/view/Menu.dart';
// import 'package:finalproject/features/menu/presentation/viewmodel/menu_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mockito/mockito.dart';

// // Mock classes
// class MockMenuViewModel extends StateNotifier<ProductState>
//     with Mock
//     implements MenuViewModel {
//   MockMenuViewModel() : super(ProductState.initial());
// }

// class MockCartViewModel extends StateNotifier<CartState>
//     with Mock
//     implements CartViewModel {
//   MockCartViewModel() : super(CartState.init());
// }

// void main() {
//   late MockMenuViewModel mockMenuViewModel;
//   late MockCartViewModel mockCartViewModel;

//   setUp(() {
//     mockMenuViewModel = MockMenuViewModel();
//     mockCartViewModel = MockCartViewModel();
//   });

//   testWidgets('MenuPage displays AppBar with correct title',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(
//       ProviderScope(
//         overrides: [
//           menuViewModelProvider.overrideWithValue(mockMenuViewModel),
//           cartViewModelProvider.overrideWithValue(mockCartViewModel),
//         ],
//         child: MaterialApp(home: MenuPage()),
//       ),
//     );

//     expect(find.text('Menu'), findsOneWidget);
//     expect(find.byType(AppBar), findsOneWidget);
//   });

//   testWidgets('MenuPage displays SearchBar', (WidgetTester tester) async {
//     await tester.pumpWidget(
//       ProviderScope(
//         overrides: [
//           menuViewModelProvider.overrideWithValue(mockMenuViewModel),
//           cartViewModelProvider.overrideWithValue(mockCartViewModel),
//         ],
//         child: MaterialApp(home: MenuPage()),
//       ),
//     );

//     expect(find.byType(SearchBar), findsOneWidget);
//     expect(find.text('Search here'), findsOneWidget);
//   });

//   testWidgets('MenuPage displays CategoryList', (WidgetTester tester) async {
//     await tester.pumpWidget(
//       ProviderScope(
//         overrides: [
//           menuViewModelProvider.overrideWithValue(mockMenuViewModel),
//           cartViewModelProvider.overrideWithValue(mockCartViewModel),
//         ],
//         child: MaterialApp(home: MenuPage()),
//       ),
//     );

//     expect(find.byType(CategoryList), findsOneWidget);
//     expect(find.text('Food'), findsOneWidget);
//     expect(find.text('Fruits'), findsOneWidget);
//     expect(find.text('Drinks'), findsOneWidget);
//     expect(find.text('Desserts'), findsOneWidget);
//   });

//   testWidgets('MenuPage displays FoodGrid with items',
//       (WidgetTester tester) async {
//     final mockProducts = [
//       GetProductEntity(
//         productId: '1',
//         productName: 'Test Product',
//         productPrice: 10,
//         productDescription: 'Test Description',
//         productCategory: 'Food',
//         productImage: 'test_image.jpg',
//       ),
//     ];

//     when(() => mockMenuViewModel.state).thenReturn(
//       ProductState(
//         lstproduct: mockProducts,
//         isLoading: false,
//         hasReachedMax: false,
//         page: 1,
//       ),
//     );

//     await tester.pumpWidget(
//       ProviderScope(
//         overrides: [
//           menuViewModelProvider.overrideWithValue(mockMenuViewModel),
//           cartViewModelProvider.overrideWithValue(mockCartViewModel),
//         ],
//         child: MaterialApp(home: MenuPage()),
//       ),
//     );

//     expect(find.byType(FoodGrid), findsOneWidget);
//     expect(find.text('Test Product'), findsOneWidget);
//     expect(find.text('Test Description'), findsOneWidget);
//     expect(find.text('\$10.00'), findsOneWidget);
//   });

//   testWidgets('Tapping Add button adds product to cart',
//       (WidgetTester tester) async {
//     final mockProducts = [
//       GetProductEntity(
//         productId: '1',
//         productName: 'Test Product',
//         productPrice: 10,
//         productDescription: 'Test Description',
//         productCategory: 'Food',
//         productImage: 'test_image.jpg',
//       ),
//     ];

//     when(() => mockMenuViewModel.state).thenReturn(
//       ProductState(
//         lstproduct: mockProducts,
//         isLoading: false,
//         hasReachedMax: false,
//         page: 1,
//       ),
//     );

//     await tester.pumpWidget(
//       ProviderScope(
//         overrides: [
//           menuViewModelProvider.overrideWithValue(mockMenuViewModel),
//           cartViewModelProvider.overrideWithValue(mockCartViewModel),
//         ],
//         child: MaterialApp(home: MenuPage()),
//       ),
//     );

//     await tester.tap(find.text('Add'));
//     await tester.pump();

//     verify(() => mockCartViewModel.addProductToCart('1')).called(1);
//     verify(() => mockCartViewModel.openCartView()).called(1);
//     expect(find.text('Product added'), findsOneWidget);
//   });
// }

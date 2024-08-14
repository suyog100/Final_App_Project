// import 'package:finalproject/features/cart/presentation/state/cart_state.dart';
// import 'package:finalproject/features/menu/presentation/state/product_state.dart';
// import 'package:finalproject/features/menu/presentation/view/Menu.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mockito/mockito.dart';

// import 'package:finalproject/features/menu/presentation/viewmodel/menu_view_model.dart';
// import 'package:finalproject/features/cart/presentation/viewmodel/cart_view_model.dart';
// import 'package:finalproject/features/menu/domain/entity/get_product_entity.dart';
// import 'cart_test.mocks.dart';

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

//   testWidgets('Pressing Add button adds product to cart',
//       (WidgetTester tester) async {
//     // Arrange
//     final mockProducts = [
//       GetProductEntity(
//         productId: '1',
//         productName: 'Test Product',
//         productPrice: 100,
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
//       ) as Function(),
//     );

//     // Act
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

//     // Assert
//     verify(() => mockCartViewModel.addProductToCart('1')).called(1);
//     verify(() => mockCartViewModel.openCartView()).called(1);
//     expect(find.text('Product added'), findsOneWidget);
//   });
// }

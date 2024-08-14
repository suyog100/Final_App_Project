import 'package:dartz/dartz.dart';
import 'package:finalproject/features/menu/domain/entity/get_product_entity.dart';
import 'package:finalproject/features/menu/domain/usecase/product_usecase.dart';
import 'package:finalproject/features/menu/presentation/navigator/menu_navigator.dart';
import 'package:finalproject/features/menu/presentation/view/Menu.dart';
import 'package:finalproject/features/menu/presentation/viewmodel/menu_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
// import '../unit_test/unit_test.mocks.dart';
import 'home_test.mocks.dart';

@GenerateMocks([ProductUsecase])
void main() {
  late ProductUsecase mockPostUsecase;

  setUp(() {
    mockPostUsecase = MockProductUsecase();
  });

  testWidgets('load posts and check whether they are displayed or not',
      (tester) async {
    await mockNetworkImagesFor(() async {
      const page = 1;
      const postEntities = [
        GetProductEntity(
          productId: '1',
          productName: 'Product 1',
          productPrice: 100,
          productDescription: 'Description 1',
          productCategory: 'Category 1',
          productImage: 'image1.jpg',
        ),
        GetProductEntity(
          productId: '2',
          productName: 'Product 2',
          productPrice: 200,
          productDescription: 'Description 2',
          productCategory: 'Category 2',
          productImage: 'image2.jpg',
        ),
      ];

      when(mockPostUsecase.getAllProduct(page)).thenAnswer(
        (_) => Future.value(const Right(postEntities)),
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            menuViewModelProvider.overrideWith(
              (ref) => MenuViewModel(
                ref.read(menuViewNavigatorProvider),
                mockPostUsecase,
              ),
            ),
          ],
          child: const MaterialApp(
            home: MenuPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Check if the posts are displayed
      expect(find.text('Product 1'), findsOneWidget);
      expect(find.text('Product 2'), findsOneWidget);
    });
  });

  testWidgets(
      'fetch products by category and check whether they are displayed or not',
      (tester) async {
    await mockNetworkImagesFor(() async {
      const category = 'Arts and Crafts';
      const page = 1;
      const postEntities = [
        GetProductEntity(
          productId: '1',
          productName: 'Product 1',
          productPrice: 100,
          productDescription: 'Description 1',
          productCategory: 'Arts and Crafts',
          productImage: 'image1.jpg',
        ),
      ];

      when(mockPostUsecase.getProductsByCategory(category, page)).thenAnswer(
        (_) => Future.value(const Right(postEntities)),
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            menuViewModelProvider.overrideWith(
              (ref) => MenuViewModel(
                ref.read(menuViewNavigatorProvider),
                mockPostUsecase,
              ),
            ),
          ],
          child: const MaterialApp(
            home: MenuPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Simulate tapping on a category
      await tester.tap(find.text('Art'));
      await tester.pumpAndSettle();

      // Check if the products in the selected category are displayed
      expect(find.text('Product 1'), findsOneWidget);
    });
  });
}

import 'package:dartz/dartz.dart';
import 'package:finalproject/features/home/domain/entity/paginated_products.dart';
import 'package:finalproject/features/home/domain/usecases/product_usecase.dart';
import 'package:finalproject/features/home/presentation/viewmodel/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_test.mocks.dart';
import 'test_data/product_test_data.dart';

@GenerateNiceMocks([
  MockSpec<ProductUseCase>()
])

void main() {
  late ProductUseCase mockProductUseCase;
  late ProviderContainer container;
  late List<ProductEntity> lstProjects;

  setUp(() {
    mockProductUseCase = MockProductUseCase();
    lstProjects = ProductTestData.getProductTestData();
    container = ProviderContainer(overrides: [
      productViewModelProvider.overrideWith(
              (ref) => ProductViewModel(productUseCase: mockProductUseCase))
    ]);
  });

  test('Fetch products ', () async {
    when(mockProductUseCase.getProduct(1))
        .thenAnswer((_) async => Right(lstProjects));

    // Fetch products
    await container.read(productViewModelProvider.notifier).getProduct();

    // Store the state
    final productState = container.read(productViewModelProvider);

    // Check the state
    expect(productState.isLoading, equals(false));
    expect(productState.productListings, equals(lstProjects));
  });
}


import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../entity/paginated_products.dart';
import '../repository/product_repository.dart';

final productUseCaseProvider = Provider((ref) {
  return ProductUseCase(ref.read(productRepositoryProvider));
});

class ProductUseCase {
  final IProductRepository _productRepository;

  ProductUseCase(this._productRepository);

  Future<Either<Failure, List<ProductEntity>>> getProduct(
      int page) async {
    return await _productRepository.getProduct(page);
  }
}
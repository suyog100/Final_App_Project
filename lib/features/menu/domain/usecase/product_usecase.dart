import 'package:dartz/dartz.dart';
import 'package:finalproject/core/failure/product_failure.dart';
import 'package:finalproject/features/menu/domain/entity/get_product_entity.dart';
import 'package:finalproject/features/menu/domain/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final productUsecaseProvider = Provider<ProductUsecase>((ref) => ProductUsecase(
  productRepository: ref.read(productRepositoryProvider),
));
class ProductUsecase {
  final IProductRepository productRepository;

  ProductUsecase({required this.productRepository});

  Future<Either<ProductFailure, List<GetProductEntity>>> getAllProduct(int page) {
    return productRepository.getAllProduct(page);
  }

  Future<Either<ProductFailure, List<GetProductEntity>>> getProductsByCategory(
      String category, int page) {
    return productRepository.getProductsByCategory(category, page);
  }
}

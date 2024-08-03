import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/failure/failure.dart';
import '../../data/repository/product_remote_repository.dart';
import '../entity/paginated_products.dart';

final productRepositoryProvider = Provider<IProductRepository>((ref) {
  return ref.read(productRemoteRepositoryProvider);
});

abstract class IProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProduct(int page);
}

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/paginated_products.dart';
import '../../domain/repository/product_repository.dart';
import '../data_source/product_data_source.dart';

final productRemoteRepositoryProvider = Provider<IProductRepository>((ref) {
  return ProductRemoteRepository(productDataSource: ref.read(productDataSourceProvider));
});

class ProductRemoteRepository implements IProductRepository {
  final ProductDataSource productDataSource;

  ProductRemoteRepository({required this.productDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> getProduct(int page) async {
    return productDataSource.getProduct(page);
  }


}

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haatbazar/features/home/data/data_source/product_data_source.dart';
import 'package:haatbazar/features/home/domain/entity/paginated_products.dart';

class ProductRepository {
  final ProductDataSource _productDataSource;
  ProductRepository(this._productDataSource);

  Future<Either<Failure, List<Product>>> fetchPaginatedProducts(int page) async {
    return await _productDataSource.getProducts(page);
  }
}

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final productDataSource = ref.read(productDataSourceProvider);
  return ProductRepository(productDataSource);
});
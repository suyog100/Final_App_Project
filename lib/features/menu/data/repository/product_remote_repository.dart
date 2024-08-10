import 'package:dartz/dartz.dart';
import 'package:finalproject/core/failure/failure.dart';

import 'package:finalproject/features/menu/domain/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../../core/failure/product_failure.dart';

import '../../domain/entity/get_product_entity.dart';
import '../data_source/remote/product_remote_data_source.dart';

final productRemoteRepositoryProvider = Provider<IProductRepository>(
      (ref) => ProductRemoteRepository(
    productRemoteDataSource: ref.read(productRemoteDataSourceProvider),
  ),
);

class ProductRemoteRepository implements IProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRemoteRepository({required this.productRemoteDataSource});

  @override
  Future<Either<ProductFailure, List<GetProductEntity>>> getAllProduct(int page) {
    return productRemoteDataSource.getAllProduct(page);
  }



  @override
  Future<Either<Failure, List<GetProductEntity>>> getProduct(int page) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<ProductFailure, List<GetProductEntity>>> getProductsByCategory(
      String category, int page) {
    return productRemoteDataSource.getProductsByCategory(category, page);
  }
}

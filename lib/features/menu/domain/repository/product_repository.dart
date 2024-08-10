import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../../core/failure/product_failure.dart';

import '../entity/get_product_entity.dart';
import "../../data/repository/product_remote_repository.dart";

final productRepositoryProvider = Provider<IProductRepository>(
      (ref) => ref.read( productRemoteRepositoryProvider),
);

abstract class IProductRepository {
  Future<Either<ProductFailure, List<GetProductEntity>>> getAllProduct(int page);
  Future<Either<ProductFailure, List<GetProductEntity>>> getProductsByCategory(String category, int page);
}

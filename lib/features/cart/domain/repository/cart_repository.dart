import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../../core/failure/failure.dart';
import '../../data/repository/cart_repository_impl.dart';
import '../entity/cart_entity.dart';

final cartRepositoryProvider = Provider<ICartRepository>((ref) {
  return ref.read(cartRepositoryImplProvider);
});

abstract class ICartRepository {
  Future<Either<Failure, bool>> addProductToCart(String productId);
  Future<Either<Failure, List<CartEntity>>> getCartItems();
  Future<Either<Failure, bool>> removeProductFromCart(String productId);
}

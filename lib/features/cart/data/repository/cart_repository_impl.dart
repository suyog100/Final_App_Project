import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/cart_entity.dart';
import '../../domain/repository/cart_repository.dart';
import '../data_source/remote/cart_remote_data_source.dart';

final cartRepositoryImplProvider = Provider<ICartRepository>((ref) {
  return CartRepositoryImpl(ref.read(cartRemoteDataSourceProvider));
});

class CartRepositoryImpl implements ICartRepository {
  final CartRemoteDataSource _cartRemoteDataSource;
  CartRepositoryImpl(this._cartRemoteDataSource);

  @override
  Future<Either<Failure, bool>> addProductToCart(String productId) {
    return _cartRemoteDataSource.addProductToCart(productId);
  }

  @override
  Future<Either<Failure, List<CartEntity>>> getCartItems() async {
    final result = await _cartRemoteDataSource.getCartItems();

    // Map the result from CartDto to CartEntity
    return result;
  }

  @override
  Future<Either<Failure, bool>> removeProductFromCart(String productId) {
    return _cartRemoteDataSource.removeProductFromCart(productId);
  }
}

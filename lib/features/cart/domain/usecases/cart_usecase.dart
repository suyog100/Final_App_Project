import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../../core/failure/failure.dart';
import '../entity/cart_entity.dart';
import '../repository/cart_repository.dart';

final cartUseCaseProvider = Provider<CartUseCase>(
  (ref) => CartUseCase(ref.read(cartRepositoryProvider)),
);

class CartUseCase {
  final ICartRepository cartRepository;

  CartUseCase(this.cartRepository);

  Future<Either<Failure, bool>> addProductToCart(String productId) async {
    return await cartRepository.addProductToCart(productId);
  }

  Future<Either<Failure, List<CartEntity>>> getCartItems() async {
    return await cartRepository.getCartItems();
  }

  Future<Either<Failure, bool>> removeProductFromCart(String productId) async {
    return await cartRepository.removeProductFromCart(productId);
  }
}

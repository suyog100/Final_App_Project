import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/cart_entity.dart';
import '../../domain/usecases/cart_usecase.dart';
import '../navigator/cart_navigator.dart';
import '../state/cart_state.dart';

final cartViewModelProvider = StateNotifierProvider<CartViewModel, CartState>(
  (ref) => CartViewModel(
      ref.read(cartUseCaseProvider), ref.read(cartViewNavigatorProvider)),
);

class CartViewModel extends StateNotifier<CartState> {
  final CartUseCase cartUseCase;
  final CartViewNavigator navigator;

  CartViewModel(this.cartUseCase, this.navigator) : super(CartState.init()) {
    getCartItems();
  }
//add product to cart
  Future<void> addProductToCart(String productId) async {
    state = state.copyWith(isLoading: true);
    final result = await cartUseCase.addProductToCart(productId);
    result.fold(
      (failure) =>
          state = state.copyWith(isLoading: false, error: failure.error),
      (success) async {
        await getCartItems();
      },
    );
  }

//get cart items
  Future<void> getCartItems() async {
    print("Cart items");
    state = state.copyWith(isLoading: true);
    final result = await cartUseCase.getCartItems();
    result.fold(
      (failure) =>
          state = state.copyWith(isLoading: false, error: failure.error),
      (items) => state = state.copyWith(isLoading: false, cartItems: items),
    );
  }

//remove product from cart
  // Future<void> removeProductFromCart(int index) async {
  //   final productId = state.cartItems[index].productId;
  //   state = state.copyWith(isLoading: true);
  //   final result = await cartUseCase.removeProductFromCart(productId);
  //   result.fold(
  //     (failure) =>
  //         state = state.copyWith(isLoading: false, error: failure.error),
  //     (success) {
  //       final List<CartEntity> updatedItems = List.from(state.cartItems)
  //         ..removeAt(index);
  //       state = state.copyWith(isLoading: false, cartItems: updatedItems);
  //     },
  //   );
  // }

  Future<void> removeProductFromCart(String productId) async {
    state = state.copyWith(isLoading: true);
    final result = await cartUseCase.removeProductFromCart(productId);
    result.fold(
      (failure) =>
          state = state.copyWith(isLoading: false, error: failure.error),
      (success) async {
        // Refresh the cart items after successful deletion
        await getCartItems();
      },
    );
  }

  void incrementQuantity(int index) {
    final cartItems = [...state.cartItems];
    cartItems[index] = cartItems[index].copyWith(
      quantity: cartItems[index].quantity + 1,
    );
    state = state.copyWith(cartItems: cartItems);
  }

  void decrementQuantity(int index) {
    final cartItems = [...state.cartItems];
    if (cartItems[index].quantity > 1) {
      cartItems[index] = cartItems[index].copyWith(
        quantity: cartItems[index].quantity - 1,
      );
      state = state.copyWith(cartItems: cartItems);
    }
  }

  void openCartView() {
    navigator.openCartView();
  }
}

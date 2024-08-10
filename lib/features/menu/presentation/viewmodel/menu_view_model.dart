import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../../app/constants/api_endpoint.dart';
import '../../../cart/presentation/state/product_state.dart';
import '../../domain/usecase/product_usecase.dart';
import '../navigator/menu_navigator.dart';

final menuViewModelProvider =
StateNotifierProvider<MenuViewModel, ProductState>((ref) {
  final navigator = ref.read(menuViewNavigatorProvider);
  final productUsecase = ref.read(productUsecaseProvider);
  return MenuViewModel(navigator, productUsecase);
});

class MenuViewModel extends StateNotifier<ProductState> {
  MenuViewNavigator navigator;
  final ProductUsecase _productUsecase;

  MenuViewModel(this.navigator, this._productUsecase)
      : super(ProductState.initial()) {
    getProduct();
  }

  Future resetState() async {
    state = ProductState.initial();
    await getProduct();
  }

  Future<bool> getProduct({int? page}) async {
    if (state.isLoading) return false;

    try {
      state = state.copyWith(isLoading: true);
      final currentPage = page ?? state.page + 1;
      final result = await _productUsecase.getAllProduct(currentPage);

      return result.fold(
            (failure) {
          state = state.copyWith(
            isLoading: false,
            hasReachedMax: true, // Consider setting hasReachedMax based on actual logic
          );
          return false;
        },
            (data) {
          state = state.copyWith(
            lstproduct: [...state.lstproduct, ...data],
            page: currentPage,
            isLoading: false,
            hasReachedMax: data.isEmpty || data.length < ApiEndpoints.limitPage,
          );
          return true;
        },
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
      // Handle error appropriately
      return false;
    }
  }

  Future<bool> getProductsByCategory(String category, {int? page}) async {
    if (state.isLoading) return false;

    try {
      state = state.copyWith(isLoading: true);
      final currentPage = page ?? state.page + 1;
      final result = await _productUsecase.getProductsByCategory(category, currentPage);

      return result.fold(
            (failure) {
          state = state.copyWith(
            isLoading: false,
            hasReachedMax: true,
          );
          return false;
        },
            (data) {
          state = state.copyWith(
            lstproduct: [...state.lstproduct, ...data],
            page: currentPage,
            isLoading: false,
            hasReachedMax: data.isEmpty || data.length < ApiEndpoints.limitPage,
          );
          return true;
        },
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
      // Handle error appropriately
      return false;
    }
  }

  Future<void> refreshProduct() async {
    state = ProductState.initial();
    await getProduct(page: 1);
  }

  Future<void> refreshProductsByCategory(String category) async {
    state = ProductState.initial();
    await getProductsByCategory(category, page: 1);
  }

  // void openPostPage(String postId) {
  //   navigator.openProductDetailsView(postId);
  // }
}

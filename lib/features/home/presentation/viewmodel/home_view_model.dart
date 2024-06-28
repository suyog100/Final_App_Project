
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data_source/product_data_source.dart';
import '../state/product_state.dart';

final productViewModelProvider = StateNotifierProvider<ProductViewModel,ProductState>((ref){
  final productDataSource = ref.read(productDataSourceProvider);
  return ProductViewModel(productDataSource);
});


class ProductViewModel extends StateNotifier<ProductState>{
  final ProductDataSource _productDataSource;
  ProductViewModel(this._productDataSource):super(ProductState.inital()){
    getProduct();

  }

  Future resetState() async{
    state = ProductState.inital();
    getProduct();
  }

  Future getProduct() async{
    state = state.copyWith(isLoading: true);
    final currentState = state;
    final page = currentState.page+1;
    final productListings = currentState.productListings;
    final hasReachedMax = currentState.hasMaxReached;

    if (!hasReachedMax) {
      // get data from data source
      final result = await _productDataSource.getProduct(page);
      result.fold(
            (failure) =>
        state = state.copyWith(hasMaxReached: true, isLoading: false),
            (data) {
          if (data.isEmpty) {
            state = state.copyWith(hasMaxReached: true);
          } else {
            state = state.copyWith(
              productListings: [...productListings, ...data],
              page: page,
              isLoading: false,
            );
          }
        },
      );

    }
  }
}


import '../../../cart/presentation/state/product_state.dart';
import '../../../menu/domain/entity/get_product_entity.dart';

class ProductState {
  final List<GetProductEntity> lstproduct;
  final bool hasReachedMax;
  final int page;
  final bool isLoading;

  ProductState({
    required this.lstproduct,
    required this.hasReachedMax,
    required this.page,
    required this.isLoading,
  });

  factory ProductState.initial() {
    return ProductState(
      lstproduct: [],
      hasReachedMax: false,
      page: 0,
      isLoading: false,
    );
  }

  ProductState copyWith({
    List<GetProductEntity>? lstproduct,
    bool? hasReachedMax,
    int? page,
    bool? isLoading,
  }) {
    return ProductState(
      lstproduct: lstproduct ?? this.lstproduct,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

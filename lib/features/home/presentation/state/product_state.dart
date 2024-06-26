import 'package:haatbazar/features/home/domain/entity/paginated_products.dart';

class ProductState {
  final List<Product> products;
  final bool isLoading;
  final bool hasReachedMax;
  final int page;

  const ProductState({
    required this.products,
    required this.isLoading,
    required this.hasReachedMax,
    required this.page,
  });

  factory ProductState.initial() {
    return const ProductState(
      //fetching the product state to maintain the data flow
      products: [],
      isLoading: false,
      hasReachedMax: false,
      page: 0, // Assuming the first page starts with 0
    );
  }
//using copywith function

  ProductState copyWith({
    List<Product>? products,
    bool? isLoading,
    bool? hasReachedMax,
    int? page,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }
}

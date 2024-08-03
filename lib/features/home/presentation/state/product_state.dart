import 'package:finalproject/features/home/data/model/product_model.dart';

import '../../domain/entity/paginated_products.dart';



class ProductState{
  final List<ProductEntity> productListings;
  final bool isLoading;
  final bool hasMaxReached;
  final int page;

  const ProductState({
    required this.productListings,
    required this.isLoading,
    required this.hasMaxReached,
    required this.page,
  });
  factory ProductState.initial(){
    return const ProductState(
        productListings: [],
        isLoading: false,
        hasMaxReached: false,
        page: 0);
  }
  ProductState copyWith({
    List<ProductEntity>? productListings,
    bool? isLoading,
    bool? hasMaxReached,
    int? page,
  }){
    return ProductState(
      productListings: productListings ?? this.productListings,
      isLoading: isLoading ?? this.isLoading,
      hasMaxReached: hasMaxReached ?? this.hasMaxReached,
      page: page ?? this.page,
    );
  }
}
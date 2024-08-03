import 'package:finalproject/features/home/data/model/product_model.dart';



class ProductState{
  final List<ProductModel> productListings;
  final bool isLoading;
  final bool hasMaxReached;
  final int page;

  const ProductState({
    required this.productListings,
    required this.isLoading,
    required this.hasMaxReached,
    required this.page,
  });
  factory ProductState.inital(){
    return const ProductState(
        productListings: [],
        isLoading: false,
        hasMaxReached: false,
        page: 0);
  }
  ProductState copyWith({
    List<ProductModel>? productListings,
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
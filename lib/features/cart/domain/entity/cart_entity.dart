import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final String productId;
  final String productName;
  final int productPrice;
  final String productImage;
  final String productDescription;
  final int quantity;

  const CartEntity(
      {required this.productId,
      required this.productName,
      required this.productPrice,
      required this.productImage,
      required this.quantity,
      required this.productDescription});

  @override
  List<Object?> get props => [
        productId,
        productName,
        productPrice,
        productImage,
        quantity,
        productDescription,
      ];

  CartEntity copyWith({
    String? productId,
    String? productTitle,
    int? productPrice,
    String? productImage,
    String? productDescription,
    int? quantity,
  }) {
    return CartEntity(
      productId: productId ?? this.productId,
      productName: productTitle ?? this.productName,
      productPrice: productPrice ?? this.productPrice,
      productImage: productImage ?? this.productImage,
      productDescription: productDescription ?? this.productDescription,
      quantity: quantity ?? this.quantity,
    );
  }
}

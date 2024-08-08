import 'package:equatable/equatable.dart';

class GetPostEntity extends Equatable {
  final String productId;
  final String productName;
  final int productPrice;
  final String productDescription;
  final String productCategory;
  final String productImage;

  const GetPostEntity({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productCategory,
    required this.productImage,
  });
  @override
  List<Object?> get props => [
    productId,
    productName,
    productPrice,
    productDescription,
    productCategory,
    productImage
  ];
}


import 'package:equatable/equatable.dart';

class Product extends Equatable {
  //examining the data in entity
  final String id;
  final String productName;
  final double productPrice;
  final String productCategory;
  final String productDescription;
  final String productImage;

  const Product({
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.productCategory,
    required this.productDescription,
    required this.productImage,
  });

  @override
  //listing the data in object
  List<Object?> get props => [
    id,
    productName,
    productPrice,
    productCategory,
    productDescription,
    productImage,
  ];
}

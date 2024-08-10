import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/get_product_entity.dart';


final productModelProvider = Provider((ref) {
  return Product.empty();
});

@JsonSerializable()
class Product {
  @JsonKey(name: '_id')
  final String productId;
  final String productName;
  final int productPrice;
  final String productDescription;
  final String productCategory;

  final String productImage;

  const Product({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productCategory,

    required this.productImage,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['_id'],
      productName: json['productName'],
      productDescription: json['productDescription'],
      productCategory: json['productCategory'],
      productPrice: json['productPrice'],

      productImage: json['productImage'],
    );
  }

  GetProductEntity toEntity() => GetProductEntity(
      productId: productId,
      productName: productName,
      productDescription: productDescription,
      productCategory: productCategory,
      productPrice: productPrice,
      productImage: productImage);

  Product.empty()
      : productId = '',
        productName = '',
        productDescription = '',
        productCategory = '',
        productPrice = 0,
        productImage = '';
}

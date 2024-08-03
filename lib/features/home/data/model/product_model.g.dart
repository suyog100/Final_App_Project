// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String,
      productName: json['productName'] as String,
      productPrice: (json['productPrice'] as num).toDouble(),
      productCategory: json['productCategory'] as String,
      productDescription: json['productDescription'] as String,
      productImage: json['productImage'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'productCategory': instance.productCategory,
      'productDescription': instance.productDescription,
      'productImage': instance.productImage,
    };

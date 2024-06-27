// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDTO _$ProductDTOFromJson(Map<String, dynamic> json) => ProductDTO(
      id: json['id'] as String,
      productName: json['productName'] as String,
      productPrice: (json['productPrice'] as num).toDouble(),
      productCategory: json['productCategory'] as String,
      productDescription: json['productDescription'] as String,
      productImage: json['productImage'] as String,
    );

Map<String, dynamic> _$ProductDTOToJson(ProductDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'productCategory': instance.productCategory,
      'productDescription': instance.productDescription,
      'productImage': instance.productImage,
    };

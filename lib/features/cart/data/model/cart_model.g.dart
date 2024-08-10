// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      productId: json['_id'] as String,
      productName: json['productName'] as String,
      productPrice: (json['productPrice'] as num).toInt(),
      productImage: json['productImage'] as String,
      productDescription: json['productDescription'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      '_id': instance.productId,
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'productImage': instance.productImage,
      'productDescription': instance.productDescription,
      'quantity': instance.quantity,
    };

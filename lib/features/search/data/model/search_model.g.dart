// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
      productId: json['_id'] as String,
      productName: json['productName'] as String,
      productPrice: (json['productPrice'] as num).toInt(),
      productDescription: json['productDescription'] as String,
      productCategory: json['productCategory'] as String,
      productImage: json['productImage'] as String,
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      '_id': instance.productId,
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'productDescription': instance.productDescription,
      'productCategory': instance.productCategory,
      'productImage': instance.productImage,
    };

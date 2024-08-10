// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductDto _$GetProductDtoFromJson(Map<String, dynamic> json) =>
    GetProductDto(
      success: json['success'] as bool,
      data: (json['products'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GetProductDtoToJson(GetProductDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'products': instance.data,
    };

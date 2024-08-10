import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:finalproject/features/menu/domain/entity/get_product_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../app/constants/api_endpoint.dart';
import '../../../../../core/failure/product_failure.dart';
import '../../../../../core/networking/remote/http_service.dart';
import '../../dto/get_product_dto.dart';

final productRemoteDataSourceProvider =
    Provider<ProductRemoteDataSource>((ref) {
  final dio = ref.read(httpServiceProvider);
  return ProductRemoteDataSource(dio);
});

class ProductRemoteDataSource {
  final Dio _dio;
  ProductRemoteDataSource(this._dio);
  Future<Either<ProductFailure, List<GetProductEntity>>> getAllProduct(
      int page) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.productPagination,
        queryParameters: {
          'page': page,
          'limit': ApiEndpoints.limitPage,
        },
      );
      // final data = response.data as List;
      if (response.statusCode == 200) {
        final getAllProductDto = GetProductDto.fromJson(response.data);
        final product = getAllProductDto.data.map((e) => e.toEntity()).toList();
        return Right(product);
      } else {
        return const Left(
          ProductFailure(
            message: 'Product Failed to achieved',
          ),
        );
      }
      // final posts = data.map((e) => Posts.fromJson(e)).toList();
      // return Right(posts);
    } on DioException catch (e) {
      return Left(ProductFailure(message: e.message.toString()));
    }
  }

  Future<Either<ProductFailure, List<GetProductEntity>>> getProductsByCategory(
      String category, int page) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.productPagination,
        queryParameters: {
          'category': category,
          '_page': page,
          '_limit': ApiEndpoints.limitPage,
        },
      );
      if (response.statusCode == 200) {
        final getAllPostDto = GetProductDto.fromJson(response.data);
        final posts = getAllPostDto.data.map((e) => e.toEntity()).toList();
        return Right(posts);
      } else {
        return const Left(
          ProductFailure(
            message: 'Post Failed to achieve',
          ),
        );
      }
    } on DioException catch (e) {
      return Left(ProductFailure(message: e.message.toString()));
    }
  }
}

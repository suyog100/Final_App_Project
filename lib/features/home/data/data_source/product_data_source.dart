
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/networking/remote/http_service.dart';
import '../model/product_model.dart';

final productDataSourceProvider = Provider.autoDispose(
        (ref) => ProductDataSource(ref.read(httpServiceProvider)));

class ProductDataSource {
  final Dio _dio;
  ProductDataSource(this._dio);
  Future<Either<Failure, List<ProductModel>>> getProduct(int page) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.products,
        queryParameters: {
          '_page': page,
          '_limit': ApiEndpoints.limitPage,
        },
      );

      return Right(
          (response.data['products'] as List)
               .map((batch) => ProductModel.fromJson(batch))
             .toList(),
      );
    } on DioException catch (e) {

      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }
}

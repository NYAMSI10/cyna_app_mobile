import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/core/dio_eroor_exception.dart';
import 'package:cyna/features/product-detail/data/datasources/product_api.dart';
import 'package:cyna/features/product-detail/data/model/product_response.dart';
import 'package:cyna/features/product-detail/domain/repository/product_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRepositoryProvider =
    Provider.autoDispose<ProductRepository>((ref) {
  final productApi = ref.watch(productApiProvider);

  return ProductRepositoryImpl(productApi);
});

final class ProductRepositoryImpl implements ProductRepository {
  final ProductApi _productApi;

  ProductRepositoryImpl(this._productApi);

  @override
  Future<ApiResponse<List<ProductResponse>>> getProductsByOrder() async {
    try {
      final response = await _productApi.getProductsByOrder();
      return response;
    } on DioException catch (e) {
      throw e.toFailure();
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred".hardcoded,
        // Si 'e' est déjà une Exception, on la garde, sinon on crée une nouvelle Exception
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }
}

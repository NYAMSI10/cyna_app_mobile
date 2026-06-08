import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:cyna/features/product-detail/data/model/product_response.dart';
import 'package:cyna/features/product-detail/data/model/sliders/slider_response.dart';
import 'package:cyna/features/product-detail/data/repositoryImpl/product_repository_impl.dart';
import 'package:cyna/features/product-detail/domain/repository/product_repository.dart';
import 'package:cyna/features/product-detail/domain/usecases/product_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

final productUsecaseProvider = Provider.autoDispose<ProductUseCase>((ref) {
  final productRepository = ref.watch(productRepositoryProvider);

  return ProductUsecaseImpl(productRepository);
});

final class ProductUsecaseImpl implements ProductUseCase {
  final ProductRepository _productRepository;

  ProductUsecaseImpl(this._productRepository);

  @override
  Future<Result<ApiResponse<List<ProductResponse>>, Failure>>
      getProductsByOrder() async {
    try {
      final response = await _productRepository.getProductsByOrder();

      if (!response.success) {
        return Result.error(
          Failure(
            message: response.message ??
                "Une erreur inattendue est survenue".hardcoded,
          ),
        );
      }

      return Result.success(response);
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred".hardcoded,
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }

  @override
  Future<Result<ApiResponse<List<ProductResponse>>, Failure>>
      getSimilarProducts(String categoryId) async {
    try {
      final response = await _productRepository.getSimilarProducts(categoryId);

      if (!response.success) {
        return Result.error(
          Failure(
            message: response.message ??
                "Une erreur inattendue est survenue".hardcoded,
          ),
        );
      }

      return Result.success(response);
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred".hardcoded,
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }

  @override
  Future<Result<ApiResponse<List<SliderResponse>>, Failure>> getTopSliders({
    int? limit,
  }) async {
    try {
      final response = await _productRepository.getTopSliders(limit: limit);

      if (!response.success) {
        return Result.error(
          Failure(
            message: response.message ??
                "Une erreur inattendue est survenue".hardcoded,
          ),
        );
      }

      return Result.success(response);
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred".hardcoded,
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }
}

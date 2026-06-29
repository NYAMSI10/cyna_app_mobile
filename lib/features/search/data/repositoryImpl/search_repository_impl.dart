import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';
import 'package:cyna/core/dio_eroor_exception.dart';
import 'package:cyna/features/search/data/datasources/search_api.dart';
import 'package:cyna/features/search/data/model/search_request_dto.dart';
import 'package:cyna/features/search/data/model/search_response.dart';
import 'package:cyna/features/search/domain/repository/search_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchRepositoryProvider = Provider.autoDispose<SearchRepository>((ref) {
  final searchApi = ref.watch(searchApiProvider);
  return SearchRepositoryImpl(searchApi);
});

final class SearchRepositoryImpl implements SearchRepository {
  final SearchApi _searchApi;

  SearchRepositoryImpl(this._searchApi);

  @override
  Future<SearchPaginatedResponse> search(SearchRequestDto request) async {
    try {
      final response = await _searchApi.search(request.toQueryParams());
      return response;
    } on DioException catch (e) {
      throw e.toFailure();
    } catch (e, s) {
      throw Failure(
        message: "An unexpected error occurred".hardcoded,
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: s,
      );
    }
  }
}

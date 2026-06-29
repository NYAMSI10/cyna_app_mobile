import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';
import 'package:cyna/features/search/data/model/search_request_dto.dart';
import 'package:cyna/features/search/data/model/search_response.dart';
import 'package:cyna/features/search/data/repositoryImpl/search_repository_impl.dart';
import 'package:cyna/features/search/domain/repository/search_repository.dart';
import 'package:cyna/features/search/domain/usecases/search_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

final searchUseCaseProvider = Provider.autoDispose<SearchUseCase>((ref) {
  final searchRepository = ref.watch(searchRepositoryProvider);
  return SearchUseCaseImpl(searchRepository);
});

final class SearchUseCaseImpl implements SearchUseCase {
  final SearchRepository _searchRepository;

  SearchUseCaseImpl(this._searchRepository);

  @override
  Future<Result<SearchPaginatedResponse, Failure>> search(
    SearchRequestDto request,
  ) async {
    try {
      final response = await _searchRepository.search(request);
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

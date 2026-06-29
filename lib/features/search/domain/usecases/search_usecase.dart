import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/features/search/data/model/search_request_dto.dart';
import 'package:cyna/features/search/data/model/search_response.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class SearchUseCase {
  Future<Result<SearchPaginatedResponse, Failure>> search(
    SearchRequestDto request,
  );
}

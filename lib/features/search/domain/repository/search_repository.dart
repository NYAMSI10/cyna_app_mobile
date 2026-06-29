import 'package:cyna/features/search/data/model/search_request_dto.dart';
import 'package:cyna/features/search/data/model/search_response.dart';

abstract interface class SearchRepository {
  Future<SearchPaginatedResponse> search(SearchRequestDto request);
}

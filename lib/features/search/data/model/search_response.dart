import 'package:cyna/features/search/data/model/search_product_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_response.freezed.dart';
part 'search_response.g.dart';

@freezed
abstract class SearchPaginatedResponse with _$SearchPaginatedResponse {
  const factory SearchPaginatedResponse({
    required List<SearchProductDto> data,
    required int total,
    required int page,
    required int lastPage,
  }) = _SearchPaginatedResponse;

  factory SearchPaginatedResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchPaginatedResponseFromJson(json);
}

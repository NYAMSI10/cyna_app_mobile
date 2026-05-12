import 'package:cyna/features/commande/data/model/commande_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'commande_list_response.freezed.dart';
part 'commande_list_response.g.dart';

@freezed
abstract class CommandeListResponse with _$CommandeListResponse {
  factory CommandeListResponse({
    required Map<String, List<CommandeResponse>> results,
    required int total,
    required int page,
    required int limit,
    required int totalPage,
  }) = _CommandeListResponse;

  factory CommandeListResponse.fromJson(Map<String, dynamic> json) =>
      _$CommandeListResponseFromJson(json);
}

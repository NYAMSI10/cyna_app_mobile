import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_response.freezed.dart';
part 'category_response.g.dart';

@freezed
abstract class CategoryResponse with _$CategoryResponse {
  factory CategoryResponse({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id')
    required String
        id, // Changement ici : paramètre nommé sans _, annotation pour le JSON
    required String name,
    required String image,
    required String slug,
    int? order,
  }) = _CategoryResponse;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
}

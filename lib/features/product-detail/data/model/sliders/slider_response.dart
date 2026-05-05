import 'package:freezed_annotation/freezed_annotation.dart';

part 'slider_response.freezed.dart';
part 'slider_response.g.dart';

@freezed
abstract class SliderResponse with _$SliderResponse {
  factory SliderResponse({
    @JsonKey(name: '_id') required String id,
    String? title,
    String? image,
    String? nameUrl,
    String? linkUrl,
    int? order,
  }) = _SliderResponse;

  factory SliderResponse.fromJson(Map<String, dynamic> json) =>
      _$SliderResponseFromJson(json);
}

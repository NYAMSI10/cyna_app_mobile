import 'package:freezed_annotation/freezed_annotation.dart';

part 'setup_intent_reponse.freezed.dart';
part 'setup_intent_reponse.g.dart';

@freezed
abstract class SetupIntentResponse with _$SetupIntentResponse {
  factory SetupIntentResponse({
    required String clientSecret,
    String? setupIntentId,
    String? stripeCustomerId,
  }) = _SetupIntentResponse;

  factory SetupIntentResponse.fromJson(Map<String, dynamic> json) =>
      _$SetupIntentResponseFromJson(json);
}

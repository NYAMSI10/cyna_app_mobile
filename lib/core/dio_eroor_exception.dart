import 'package:cyna/common/exception/failure.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';
import 'package:cyna/common/model/response/api_response.dart';
import 'package:dio/dio.dart';

extension DioErrorExtension on DioException {
  Failure toFailure() {
    String message = "Une erreur inattendue est survenue".hardcoded;

    // Si le serveur a renvoyé une réponse JSON de type Map
    if (response?.data != null && response?.data is Map<String, dynamic>) {
      try {
        final data = response!.data as Map<String, dynamic>;

        final rawMessage = data['message'];
        if (rawMessage is String && rawMessage.isNotEmpty) {
          message = rawMessage;
        } else if (rawMessage is List && rawMessage.isNotEmpty) {
          message = rawMessage.join('\n');
        }

        // On parse en ApiResponse<dynamic> (ou ApiResponse<void>)
        final apiResponse = ApiResponse<dynamic>.fromJson(
          data,
          (obj) => obj, // data est ignoré pour l'erreur, donc identitaire
        );

        // Si le backend met bien success:false + message
        if (apiResponse.message != null && apiResponse.message!.isNotEmpty) {
          message = apiResponse.message!;
        }
      } catch (_) {
        // Si le JSON ne correspond pas au format attendu, on garde le message par défaut
      }
    }

    return Failure(
      message: message,
      statusCode: response?.statusCode,
      exception: this,
      stackTrace: stackTrace,
    );
  }
}

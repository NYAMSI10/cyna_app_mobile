import 'package:cyna/core/data/remote/network_service_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkServiceProvider = Provider<Dio>((ref) {
  final options = BaseOptions(
    // Utilisation d'une constante ou d'une logique d'IP selon la plateforme
    // baseUrl: "http://10.0.2.2:3000",
    baseUrl: "http://localhost:3000",
    contentType: Headers.jsonContentType,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    sendTimeout: kIsWeb ? null : const Duration(seconds: 60),
  );

  final dio = Dio(options);

  // On utilise 'watch' ici pour l'intercepteur
  // Si l'intercepteur change (ex: rafraîchissement de token),
  // le provider Dio sera recréé proprement.
  final networkServiceInterceptor = ref.watch(
    networkServiceInterceptorProvider(dio),
  );

  dio.interceptors.addAll([
    networkServiceInterceptor,
    // Conseil : Ajoutez un LogInterceptor en debug pour voir vos requêtes
    // if (kDebugMode) LogInterceptor(responseBody: true, requestBody: true),
  ]);

  return dio;
});

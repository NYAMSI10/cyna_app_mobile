// lib/core/data/local/secure_storage/token_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

final tokenProvider = FutureProvider<String?>((ref) async {
  final getStorage = GetStorage();

  return getStorage.read('auth_token');
});

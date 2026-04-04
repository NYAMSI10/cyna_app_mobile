import 'package:flutter_riverpod/legacy.dart';

final currentIndexProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

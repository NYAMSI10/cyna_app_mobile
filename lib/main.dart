import 'package:cyna/common/route/go_router_provider.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, // ne l'active pas en release
      builder: (context) => ProviderScope(child: MainApp()),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return ToastificationWrapper(
      child: MaterialApp.router(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        routerConfig: goRouter,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.kumbhSansTextTheme(),
        ),
      ),
    );
  }
}

import 'package:cyna/common/constant/stripe_config.dart';
import 'package:cyna/common/route/go_router_provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:toastification/toastification.dart';

void main() async {
  // 1. TOUJOURS en premier
  WidgetsFlutterBinding.ensureInitialized();

  // Configuration de Stripe (clé publishable) avant le runApp.
  Stripe.publishableKey = StripeConfig.publishableKey;
  await Stripe.instance.applySettings();

  // 2. Initialisations asynchrones
  await Future.wait([
    GetStorage.init(),
    initializeDateFormatting('fr_FR', ''),
  ]);

  runApp(
    // DevicePreview(
    //   enabled: true, ne l'active pas en release
    //   builder: (context) => ProviderScope(child: MainApp()),
    // ),
    ProviderScope(child: MainApp()),
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

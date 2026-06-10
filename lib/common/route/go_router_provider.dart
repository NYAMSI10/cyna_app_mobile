import 'package:cyna/common/route/route_name.dart';
import 'package:cyna/features/abonnement/presentation/screens/abonnement_screen.dart';
import 'package:cyna/features/adresse/presentation/screen/adresse_screen.dart';
import 'package:cyna/features/carte_bancaire/presentation/screen/carte_bancaire_screen.dart';
import 'package:cyna/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:cyna/features/authentication/presentation/screens/login/login_screen.dart';
import 'package:cyna/features/authentication/presentation/screens/register/register_screen.dart';
import 'package:cyna/features/commande/presentation/screens/commande_screen.dart';
import 'package:cyna/features/navigation_menu.dart';
import 'package:cyna/features/onboarding/screens/onboarding_screen.dart';
import 'package:cyna/features/profile/presentation/screen/user_info_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final getStorage = GetStorage();
  return GoRouter(
    // On peut laisser /onboarding ou mettre /
    initialLocation: '/',
    debugLogDiagnostics:
        true, // Très utile pour voir ce que fait GoRouter en console

    redirect: (context, state) {
      if (kDebugMode) {
        print(getStorage.read('has_seen_onboarding'));
      }
      if (kDebugMode) {
        print(getStorage.read('auth_token'));
      }
      final bool loggedIn = getStorage.read('auth_token') != null;
      final bool hasSeenOnboarding =
          getStorage.read('has_seen_onboarding') ?? false;

      // On récupère le chemin actuel
      final path = state.matchedLocation;

      // LOGIQUE DE REDIRECTION
      if (!hasSeenOnboarding) {
        return path == '/onboarding' ? null : '/onboarding';
      }

      if (!loggedIn) {
        return (path == '/login' ||
                path == '/onboarding' ||
                path == '/register')
            ? null
            : '/login';
      }

      if (loggedIn &&
          (path == '/login' || path == '/onboarding' || path == '/')) {
        return '/navigationMenu';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/onboarding',
        name: onboardingRoute,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        name: loginRoute,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: registerRoute,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/navigationMenu',
        name: navigationMenuRoute,
        builder: (context, state) => const NavigationMenu(),
      ),
      GoRoute(
        path: '/userInfo',
        name: userInfoRoute,
        builder: (context, state) => const UserInfoScreen(),
      ),
      GoRoute(
        path: '/abonnement',
        name: abonnementRoute,
        builder: (context, state) => const AbonnementScreen(),
      ),
      GoRoute(
        path: '/commande',
        name: commandeRoute,
        builder: (context, state) => const CommandeScreen(),
      ),
      GoRoute(
        path: '/adresse',
        name: adresseRoute,
        builder: (context, state) => const AdresseScreen(),
      ),
      GoRoute(
        path: '/carte-bancaire',
        name: carteBancaireRoute,
        builder: (context, state) => const CarteBancaireScreen(),
      ),
      GoRoute(
        path: '/checkout',
        name: checkoutRoute,
        builder: (context, state) => const CheckoutScreen(),
      ),
    ],
  );
});

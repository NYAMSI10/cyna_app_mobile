import 'package:cyna/common/route/route_name.dart';
import 'package:cyna/features/abonnement/presentation/screens/abonnement_screen.dart';
import 'package:cyna/features/adresse/presentation/screen/adresse_screen.dart';
import 'package:cyna/features/authentication/presentation/screens/login/login_screen.dart';
import 'package:cyna/features/authentication/presentation/screens/register/register_screen.dart';
import 'package:cyna/features/commande/presentation/screens/commande_screen.dart';
import 'package:cyna/features/navigation_menu.dart';
import 'package:cyna/features/onboarding/screens/onboarding_screen.dart';
import 'package:cyna/features/profile/presentation/screen/user_info_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    // On peut laisser /onboarding ou mettre /
    initialLocation: '/navigationMenu',

    routes: [
      // // Ajoute cette route racine qui redirige ou affiche un splash
      // GoRoute(
      //   path: '/',
      //   builder: (context, state) =>
      //       const Scaffold(body: Center(child: CircularProgressIndicator())),
      // ),
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
    ],
  );
});

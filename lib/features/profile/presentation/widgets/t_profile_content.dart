import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/image_strings.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/common/widgets/image/t_rounded_image.dart';
import 'package:cyna/features/profile/presentation/providers/user_controller.dart';
import 'package:cyna/features/profile/presentation/shimmer/profile_shimmer.dart';
import 'package:cyna/features/profile/presentation/screen/password_change_screen.dart';
import 'package:cyna/features/profile/presentation/screen/user_info_screen.dart';
import 'package:cyna/features/profile/presentation/widgets/setting_menu_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

class TProfileContent extends ConsumerStatefulWidget {
  const TProfileContent({super.key});

  @override
  ConsumerState<TProfileContent> createState() => _TProfileContentState();
}

class _TProfileContentState extends ConsumerState<TProfileContent> {
  /// Ouvre [url] dans un navigateur intégré à l'application
  /// (SFSafariViewController sur iOS, Custom Tab sur Android),
  /// sans quitter l'app.
  Future<void> _openInApp(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    final launched = await launchUrl(
      uri,
      mode: LaunchMode.inAppBrowserView,
    );
    if (!launched && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Impossible d'ouvrir le lien.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userControllerProvider);

    return userState.when(
      data: (user) {
        return RefreshIndicator(
          // Contenu de l'indicateur de rafraîchissement
          color: TColors.primaryColor,
          // On déclenche le refresh du controller
          onRefresh: () =>
              ref.read(userControllerProvider.notifier).refreshUser(),

          child: ListView(
            // Important : permet de tirer l'écran même si le contenu ne dépasse pas la taille de l'écran
            physics: const AlwaysScrollableScrollPhysics(),
            padding: Responsive.pagePadding(context),
            children: [
              // En-tête avec Avatar
              Center(
                child: Column(
                  children: [
                    // image
                    TRoundedImage(
                      imageUrl: TImages.avatar,
                      width: 70,
                      height: 70,
                      borderRadius: 50,
                      padding: EdgeInsets.all(10),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "${user.data?.firstName} ${user.data?.lastName}",
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${user.data?.email}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
              const Text("Paramètres du compte",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const Divider(),

              TSettingsMenuTile(
                onTap: () async {
                  await showMaterialModalBottomSheet(
                    context: context,
                    barrierColor: Colors.black54,
                    enableDrag: true,
                    expand: true,
                    duration: const Duration(
                        milliseconds: 500), // Plus lent et fluide
                    backgroundColor: Colors
                        .transparent, // Important pour voir les bords arrondis
                    builder: (context) => Container(
                      height: MediaQuery.of(context).size.height * 0.77,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      // On utilise padding pour ne pas coller au clavier
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: UserInfoScreen(
                        firstName: user.data?.firstName,
                        lastName: user.data?.lastName,
                        email: user.data?.email,
                        id: user.data?.id,
                      ), // Ton widget de formulaire
                    ),
                  );
                },
                icon: Iconsax.user,
                title: 'Mon Profil',
              ),
              TSettingsMenuTile(
                onTap: () async {
                  await showMaterialModalBottomSheet(
                    context: context,
                    barrierColor: Colors.black54,
                    enableDrag: true,
                    expand: true,
                    duration: const Duration(
                        milliseconds: 500), // Plus lent et fluide
                    backgroundColor: Colors
                        .transparent, // Important pour voir les bords arrondis
                    builder: (context) => Container(
                      height: MediaQuery.of(context).size.height * 0.77,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      // On utilise padding pour ne pas coller au clavier
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: PasswordChangeScreen(),
                    ),
                  );
                },
                icon: Iconsax.lock,
                title: 'Changer le mot de passe',
              ),

              TSettingsMenuTile(
                onTap: () => context.push('/abonnement'),
                icon: Iconsax.receipt_2,
                title: 'Mes Abonnements',
              ),
              TSettingsMenuTile(
                onTap: () => context.push('/commande'),
                icon: Iconsax.shopping_cart,
                title: 'Mes Commandes',
              ),
              TSettingsMenuTile(
                onTap: () => context.push('/adresse'),
                icon: Iconsax.location,
                title: 'Mes Adresses',
              ),
              TSettingsMenuTile(
                onTap: () => context.push('/carte-bancaire'),
                icon: Iconsax.card,
                title: 'Mes Cartes Bancaires',
              ),

              TSettingsMenuTile(
                onTap: () {},
                icon: Iconsax.notification,
                title: 'Notifications',
              ),

              TSettingsMenuTile(
                onTap: () => _openInApp(
                  context,
                  'https://cynaapp.vercel.app/terms-of-use',
                ),
                icon: Iconsax.document_text,
                title: "Conditions d'Utilisation",
              ),
              TSettingsMenuTile(
                onTap: () => _openInApp(
                  context,
                  'https://cynaapp.vercel.app/privacy-policy',
                ),
                icon: Iconsax.shield_tick,
                title: 'Politique de Confidentialité',
              ),
              TSettingsMenuTile(
                onTap: () => _openInApp(
                  context,
                  'https://cynaapp.vercel.app/cookie-policy',
                ),
                icon: Iconsax.security_safe,
                title: 'Politique de Cookies',
              ),

              // Bouton de déconnexion
              TextButton.icon(
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text("Confirmer la déconnexion"),
                      content: const Text(
                        "Êtes-vous sûr de vouloir vous déconnecter ?",
                      ),
                      actions: [
                        CupertinoDialogAction(
                          child: const Text("Annuler"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        CupertinoDialogAction(
                          child: const Text(
                            "Déconnexion",
                            style: TextStyle(color: Colors.red),
                          ),
                          onPressed: () {
                            ref.read(userControllerProvider.notifier).logout();
                            Navigator.of(context).pop(); // fermer le dialog
                            context.go('/login'); // puis rediriger
                          },
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.logout, color: Colors.red),
                label: const Text(
                  "Se déconnecter",
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              )
            ],
          ),
        );
      },
      loading: () => const ProfileShimmer(),
      error: (error, stack) => Center(child: Text("Erreur : $error")),
    );
  }
}

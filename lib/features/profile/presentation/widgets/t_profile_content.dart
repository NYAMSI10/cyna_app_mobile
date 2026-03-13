import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/image_strings.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/common/widgets/image/t_rounded_image.dart';
import 'package:cyna/features/profile/presentation/screen/password_change_screen.dart';
import 'package:cyna/features/profile/presentation/screen/user_info_screen.dart';
import 'package:cyna/features/profile/presentation/widgets/setting_menu_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class TProfileContent extends ConsumerStatefulWidget {
  const TProfileContent({super.key});

  @override
  ConsumerState<TProfileContent> createState() => _TProfileContentState();
}

class _TProfileContentState extends ConsumerState<TProfileContent> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      // Contenu de l'indicateur de rafraîchissement
      color: TColors.primaryColor,
      // On déclenche le refresh du controller
      onRefresh: () {
        return Future.delayed(const Duration(seconds: 1));
      },
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
                  "NYAMSI Abdoulaye",
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  "bnyamsi10@gmail.com",
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
                expand: false,
                duration:
                    const Duration(milliseconds: 500), // Plus lent et fluide
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
                  child: UserInfoScreen(), // Ton widget de formulaire
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
                expand: false,
                duration:
                    const Duration(milliseconds: 500), // Plus lent et fluide
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
            onTap: () => context.push('/abonnement'),
            icon: Iconsax.location,
            title: 'Mes Adresses',
          ),
          TSettingsMenuTile(
            onTap: () => context.push('/abonnement'),
            icon: Iconsax.card,
            title: 'Mes Cartes Bancaires',
          ),

          TSettingsMenuTile(
            onTap: () {},
            icon: Iconsax.notification,
            title: 'Notifications',
          ),

          TSettingsMenuTile(
            onTap: () {},
            icon: Iconsax.info_circle,
            title: 'À propos',
          ),

          // Bouton de déconnexion
          TextButton.icon(
            onPressed: () {
              // Logique de déconnexion (ref.read(authProvider).logout())
            },
            icon: const Icon(Icons.logout, color: Colors.red),
            label: const Text("Se déconnecter",
                style: TextStyle(color: Colors.red, fontSize: 16)),
          ),
        ],
      ),
    );
  }
}

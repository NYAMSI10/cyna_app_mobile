import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/image_strings.dart';
import 'package:cyna/common/widgets/image/t_rounded_image.dart';
import 'package:cyna/features/profile/presentation/widgets/setting_menu_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
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
            onTap: () => context.push('/userInfo'),
            icon: Iconsax.user,
            title: 'Mon Profil',
          ),
          TSettingsMenuTile(
            onTap: () {},
            icon: Iconsax.lock,
            title: 'Changer le mot de passe',
          ),
          TSettingsMenuTile(
            onTap: () {},
            icon: Iconsax.receipt_2,
            title: 'Mes Abonnements',
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
          const SizedBox(height: 40),

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

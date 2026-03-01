import 'package:carousel_slider/carousel_slider.dart';
import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/sizes.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/onboarding/providers/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class THomeCarousel extends ConsumerWidget {
  const THomeCarousel({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Liste de tes données (tu pourras les mettre dans un modèle plus tard)
    final List<Map<String, String>> banners = [
      {
        "title": "New Year 40% Off",
        "subtitle":
            "Bold Looks. Clean Lines.Bold Looks. Clean Lines. Bold Looks. Clean Lines. Bold Looks. Clean Lines.",
        "image": "assets/images/station.png", // Remplace par tes images
      },
      {
        "title": "Eco Friendly",
        "subtitle": "Recharge en toute liberté.",
        "image": "assets/images/station.png",
      },
      {
        "title": "VoltShare Plus",
        "subtitle": "Découvrez nos nouveaux tarifs.",
        "image": "assets/images/station.png",
      },
    ];

    bool isMobile = Responsive.isMobile(context);
    final controller = ref.read(onBoardingControllerProvider.notifier);

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
            height: isMobile ? 200 : 300, // Plus grand sur tablette
            autoPlay: true, // Défilement automatique
            enlargeCenterPage: true, // Effet de zoom sur la page centrale
            aspectRatio: 16 / 9,
            viewportFraction:
                isMobile ? 1 : 0.7, // On voit un peu des slides voisins
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
          ),
          items: banners.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return _buildBannerCard(banner, context);
              },
            );
          }).toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < banners.length; i++)
                Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ref.watch(onBoardingControllerProvider) == i
                        ? TColors.primaryColor
                        : TColors.primaryColor.withOpacity(0.3),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }

  // Le widget de la carte (Design basé sur ta capture d'écran)
  Widget _buildBannerCard(Map<String, String> data, BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: TColors.secondColor, // Ton Cyan Primaire
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          // Texte à gauche
          Padding(
            // 💡 LA CORRECTION EST ICI :
            // On ajoute un padding 'right' de 160 (150 pour l'image + 10 d'espacement)
            padding: const EdgeInsets.only(
                left: 15.0, top: 15.0, bottom: 15.0, right: 160.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['title']!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  data['subtitle']!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 12),
                // Bouton "DÉCOUVRIR"
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "DÉCOUVRIR",
                    // J'ai ajouté une couleur au texte du bouton pour qu'il soit visible sur le fond blanc
                    style: TextStyle(color: TColors.secondColor),
                  ),
                ),
              ],
            ),
          ),
          // Image à droite
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              child: Image.asset(
                data['image']!,
                fit: BoxFit.cover,
                width:
                    150, // La largeur est de 150, donc le padding droit du texte doit être > 150
              ),
            ),
          ),
        ],
      ),
    );
  }
}

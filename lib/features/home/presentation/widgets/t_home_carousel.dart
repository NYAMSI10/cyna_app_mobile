import 'package:carousel_slider/carousel_slider.dart';
import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/helpers/responsive.dart';
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
        "subtitle": "Bold Looks. Clean Lines.",
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

    return CarouselSlider(
      options: CarouselOptions(
        height: isMobile ? 180.0 : 250.0, // Plus grand sur tablette
        autoPlay: true, // Défilement automatique
        enlargeCenterPage: true, // Effet de zoom sur la page centrale
        aspectRatio: 16 / 9,
        viewportFraction:
            isMobile ? 0.85 : 0.7, // On voit un peu des slides voisins
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
    );
  }

  // Le widget de la carte (Design basé sur ta capture d'écran)
  Widget _buildBannerCard(Map<String, String> data, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: TColors.secondColor, // Ton Cyan Primaire
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          // Texte à gauche
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['title']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  data['subtitle']!,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 15),
                // Bouton "Shop Now" ou "Découvrir"
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF00B5D0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("DÉCOUVRIR"),
                ),
              ],
            ),
          ),
          // Image à droite (Positionnée pour dépasser ou s'aligner comme ton chat)
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
                width: 150, // Ajuste selon ton image
              ),
            ),
          ),
        ],
      ),
    );
  }
}

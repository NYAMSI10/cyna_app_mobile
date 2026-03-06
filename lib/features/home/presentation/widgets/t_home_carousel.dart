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
    final controller = ref.watch(onBoardingControllerProvider.notifier);
    final isMobile = Responsive.isMobile(context);

    return SizedBox(
      // Hauteur totale du bloc (slider + points)
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index),
              // On laisse un peu de marge pour les indicateurs
              height: isMobile ? 200 : 280,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              viewportFraction: isMobile ? 1 : 0.8,
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
      ),
    );
  }

  Widget _buildBannerCard(Map<String, String> data, BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: TColors.secondColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              top: 15.0,
              bottom: 15.0,
              right: 160.0,
            ),
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
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  data['subtitle']!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 12),
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
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.copyWith(color: TColors.secondColor),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(
                data['image']!,
                fit: BoxFit.cover,
                width: 150,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

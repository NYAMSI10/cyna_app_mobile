import 'package:carousel_slider/carousel_slider.dart';
import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/sizes.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/onboarding/providers/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TProductDetailCarousel extends ConsumerWidget {
  const TProductDetailCarousel({super.key, required this.images});
  final List<String> images;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            items: images.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(10), // Petit bonus esthétique
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < images.length; i++)
                  Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ref.watch(onBoardingControllerProvider) == i
                          ? TColors.secondColor
                          : TColors.white,
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/sizes.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/home/presentation/shimmers/home_carousel_shimmer.dart';
import 'package:cyna/features/onboarding/providers/onboarding_provider.dart';
import 'package:cyna/features/product-detail/data/model/sliders/slider_response.dart';
import 'package:cyna/features/product-detail/presentation/provider/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

// THomeCarousel.dart

class THomeCarousel extends ConsumerStatefulWidget {
  const THomeCarousel({super.key});

  @override
  ConsumerState<THomeCarousel> createState() => _THomeCarouselState();
}

class _THomeCarouselState extends ConsumerState<THomeCarousel> {
  late Future<List<SliderResponse>> _sliderFuture;

  @override
  void initState() {
    super.initState();
    _sliderFuture =
        ref.read(productControllerProvider.notifier).getTopSliders(limit: 4);
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(onBoardingControllerProvider.notifier);
    final isMobile = Responsive.isMobile(context);

    return FutureBuilder<List<SliderResponse>>(
      future: _sliderFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Ici tu peux mettre un shimmer à la place
          return const HomeCarouselShimmer();
        } else if (snapshot.hasError) {
          return const HomeCarouselShimmer();
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const HomeCarouselShimmer();
        } else {
          final sliders = snapshot.data!;

          return SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    onPageChanged: (index, _) =>
                        controller.updatePageIndicator(index),
                    height: isMobile ? 200 : 280,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: isMobile ? 1 : 0.8,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                  ),
                  items: sliders.map((slider) {
                    return Builder(
                      builder: (BuildContext context) {
                        return _buildBannerCard(slider, context);
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < sliders.length; i++)
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
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Future<void> _launchUrl(String? url) async {
    if (url == null || url.isEmpty) return;
    final uri = Uri.parse('http://localhost:5173$url');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Widget _buildBannerCard(SliderResponse slider, BuildContext context) {
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
                  slider.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Text(
                //   slider.subtitle,
                //   maxLines: 2,
                //   overflow: TextOverflow.ellipsis,
                //   style: const TextStyle(
                //     color: Colors.white70,
                //     fontSize: 10,
                //   ),
                // ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => _launchUrl(slider.linkUrl),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "${slider.nameUrl}",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: TColors.secondColor),
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
              child: Image.network(
                slider.image.toString(), // adapte au vrai champ de ton modèle
                fit: BoxFit.cover,
                width: 150,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    width: 150,
                    child: ColoredBox(color: Colors.black12),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

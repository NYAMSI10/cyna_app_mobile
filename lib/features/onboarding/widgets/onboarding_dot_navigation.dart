import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/features/onboarding/providers/onboarding_provider.dart';

class OnBoardingDotNavigation extends ConsumerWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(onBoardingControllerProvider.notifier);
    return SmoothPageIndicator(
      controller: controller.pageController,
      onDotClicked: controller.dotNavigationClick,
      count: 3,
      effect: WormEffect(
        dotHeight: 10,
        dotWidth: 10,
        activeDotColor: TColors.secondColor, // Adjust color
        dotColor: TColors.grey,
      ),
    );
  }
}

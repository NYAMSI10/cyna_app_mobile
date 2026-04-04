import 'package:cyna/common/helpers/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/image_strings.dart';
import 'package:cyna/common/constant/text_string.dart';
import 'package:cyna/features/onboarding/providers/onboarding_provider.dart';
import 'package:cyna/features/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:cyna/features/onboarding/widgets/onboarding_page.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.read(onBoardingControllerProvider.notifier);
    final pageIndicator = ref.watch(onBoardingControllerProvider);
    final getStorage = GetStorage();
    final bool isMobile = Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: TColors.primaryColor,
      body: Stack(
        children: [
          /// Contenu défilant
          PageView(
            physics: const BouncingScrollPhysics(),
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              TOnBoardingPage(
                image: TImages.onboarding1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              TOnBoardingPage(
                image: TImages.onboarding2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              TOnBoardingPage(
                image: TImages.onboarding3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Navigation (Dots + Boutons) en bas
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // Limite la largeur sur tablette pour l'ergonomie
              constraints: const BoxConstraints(maxWidth: 500),
              padding: EdgeInsets.symmetric(
                  horizontal: 24, vertical: isMobile ? 20 : 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Zone des boutons dynamiques
                  pageIndicator < 2
                      ? _buildNextButton(controller, context)
                      : _buildAuthButtons(getStorage, context),
                  const SizedBox(height: 32),

                  /// Indicateur de page (Dots)
                  const OnBoardingDotNavigation(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Bouton Suivant classique
  Widget _buildNextButton(
      OnBoardingController controller, BuildContext context) {
    return ElevatedButton(
      onPressed: () => controller.nextPage(context),
      style: _buttonStyle(),
      child: const Text(
        TTexts.next,
        style: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }

  /// Boutons de fin (Login / Sign Up)
  Widget _buildAuthButtons(GetStorage getStorage, BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              getStorage.write('has_seen_onboarding', true);
              context.go('/login');
            },
            style: _buttonStyle(),
            child: const Text(TTexts.signIn,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: OutlinedButton(
            // Utilisation d'un Outlined pour varier comme sur ton image
            onPressed: () => context.go('/signUp'),
            style: _buttonStyle(),
            child: const Text(TTexts.signUp,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ),
        ),
      ],
    );
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: TColors.secondColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      minimumSize: const Size(double.infinity, 50),
      elevation: 0,
    );
  }
}

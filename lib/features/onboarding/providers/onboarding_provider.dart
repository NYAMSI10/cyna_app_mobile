import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final onBoardingControllerProvider =
    StateNotifierProvider<OnBoardingController, int>(
      (ref) => OnBoardingController(ref),
    );

class OnBoardingController extends StateNotifier<int> {
  final PageController pageController = PageController();
  final Ref ref;

  OnBoardingController(this.ref) : super(0);

  void updatePageIndicator(int index) {
    state = index;
  }

  void dotNavigationClick(int index) {
    state = index;
    pageController.jumpToPage(index);
  }

  void nextPage(BuildContext context) {
    if (state < 2) {
      state++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      // Naviguer vers l'écran d'authentification
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (_) => const AuthScreen()),
      // );
    }
  }

  void skipPage() {
    state = 2;
    pageController.jumpToPage(2);
  }
}

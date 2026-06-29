import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:cyna/core/provider/navigation_menu_provider.dart';
import 'package:cyna/features/home/presentation/screens/home_screen.dart';
import 'package:cyna/features/panier/presentation/screens/panier_screen.dart';
import 'package:cyna/features/profile/presentation/screen/profile_screen.dart';
import 'package:cyna/features/search/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:cyna/common/constant/colors.dart';

class NavigationMenu extends ConsumerStatefulWidget {
  const NavigationMenu({super.key});

  @override
  ConsumerState<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends ConsumerState<NavigationMenu> {
  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(currentIndexProvider);
    final List<Widget> screens = [
      const HomeScreen(),
      const SearchScreen(),
      const PanierScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: SafeArea(
        top: false,
        child: CurvedNavigationBar(
        index: currentIndex,
        backgroundColor: TColors.primaryColor,
        items: [
          CurvedNavigationBarItem(
            child: Icon(
                size: 20,
                Iconsax.home,
                color: currentIndex == 0
                    ? TColors.primaryColor
                    : TColors.darkGrey,
                fontWeight: currentIndex == 0 ? FontWeight.bold : null),
            label: 'Accueil',
            labelStyle: TextStyle(
                fontSize: 12,
                color: currentIndex == 0
                    ? TColors.primaryColor
                    : TColors.darkGrey,
                fontWeight: currentIndex == 0 ? FontWeight.bold : null),
          ),
          CurvedNavigationBarItem(
            child: Icon(
                size: 20,
                Iconsax.search_favorite,
                color: currentIndex == 1
                    ? TColors.primaryColor
                    : TColors.darkGrey,
                fontWeight: currentIndex == 1 ? FontWeight.bold : null),
            label: 'Rechercher',
            labelStyle: TextStyle(
                fontSize: 12,
                color: currentIndex == 1
                    ? TColors.primaryColor
                    : TColors.darkGrey,
                fontWeight: currentIndex == 1 ? FontWeight.bold : null),
          ),
          CurvedNavigationBarItem(
            child: Icon(
                size: 20,
                Iconsax.shopping_cart,
                color: currentIndex == 2
                    ? TColors.primaryColor
                    : TColors.darkGrey,
                fontWeight: currentIndex == 2 ? FontWeight.bold : null),
            label: 'Pannier',
            labelStyle: TextStyle(
                fontSize: 12,
                color: currentIndex == 2
                    ? TColors.primaryColor
                    : TColors.darkGrey,
                fontWeight: currentIndex == 2 ? FontWeight.bold : null),
          ),
          CurvedNavigationBarItem(
            child: Icon(
                size: 20,
                Iconsax.user,
                color: currentIndex == 3
                    ? TColors.primaryColor
                    : TColors.darkGrey,
                fontWeight: currentIndex == 3 ? FontWeight.bold : null),
            label: 'Profile',
            labelStyle: TextStyle(
                fontSize: 12,
                color: currentIndex == 3
                    ? TColors.primaryColor
                    : TColors.darkGrey,
                fontWeight: currentIndex == 3 ? FontWeight.bold : null),
          ),
        ],
        onTap: (index) {
          ref.read(currentIndexProvider.notifier).state = index;
        },
        ),
      ),
      body: screens[currentIndex],
    );
  }
}

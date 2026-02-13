import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:cyna/features/home/presentation/screens/home_screen.dart';
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
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeScreen(),
      const Center(child: Text('Search')),
      const Center(child: Text('Pannier')),
      const Center(child: Text('Mon compte')),
    ];
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: TColors.primaryColor,
        items: [
          CurvedNavigationBarItem(
            child: Icon(Iconsax.home,
                color: _currentIndex == 0
                    ? TColors.primaryColor
                    : TColors.darkGrey,
                fontWeight: _currentIndex == 0 ? FontWeight.bold : null),
            label: 'Accueil',
            labelStyle: TextStyle(
                color: _currentIndex == 0
                    ? TColors.primaryColor
                    : TColors.darkGrey,
                fontWeight: _currentIndex == 0 ? FontWeight.bold : null),
          ),
          CurvedNavigationBarItem(
            child: Icon(Iconsax.search_favorite,
                color: _currentIndex == 1
                    ? TColors.primaryColor
                    : TColors.darkGrey,
                fontWeight: _currentIndex == 1 ? FontWeight.bold : null),
            label: 'Rechercher',
            labelStyle: TextStyle(
                color: _currentIndex == 1
                    ? TColors.primaryColor
                    : TColors.darkGrey,
                fontWeight: _currentIndex == 1 ? FontWeight.bold : null),
          ),
          CurvedNavigationBarItem(
            child: Icon(Iconsax.shopping_cart,
                color: _currentIndex == 2
                    ? TColors.primaryColor
                    : TColors.darkGrey,
                fontWeight: _currentIndex == 2 ? FontWeight.bold : null),
            label: 'Pannier',
            labelStyle: TextStyle(
                color: _currentIndex == 2
                    ? TColors.primaryColor
                    : TColors.darkGrey,
                fontWeight: _currentIndex == 2 ? FontWeight.bold : null),
          ),
          CurvedNavigationBarItem(
            child: Icon(Iconsax.user,
                color: _currentIndex == 3
                    ? TColors.primaryColor
                    : TColors.darkGrey,
                fontWeight: _currentIndex == 3 ? FontWeight.bold : null),
            label: 'Profile',
            labelStyle: TextStyle(
                color: _currentIndex == 3
                    ? TColors.primaryColor
                    : TColors.darkGrey,
                fontWeight: _currentIndex == 3 ? FontWeight.bold : null),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: screens[_currentIndex],
    );
  }
}

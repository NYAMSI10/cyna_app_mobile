import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/sizes.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/home/presentation/widgets/t_home_carousel.dart';
import 'package:cyna/features/home/presentation/widgets/t_home_category.dart';
import 'package:cyna/features/home/presentation/widgets/t_home_header.dart';
import 'package:cyna/features/home/presentation/widgets/t_home_product.dart';
import 'package:cyna/features/profile/presentation/providers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);

    return RefreshIndicator(
      // Contenu de l'indicateur de rafraîchissement
      color: TColors.primaryColor,
      // On déclenche le refresh du controller
      onRefresh: () => ref.read(userControllerProvider.notifier).refreshUser(),

      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          padding: isMobile
              ? const EdgeInsets.only(top: 60, left: 20, right: 20)
              : const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header home
              THomeHeader(),

              const SizedBox(height: TSizes.defaultSpace),

              // Carousel
              THomeCarousel(),

              const SizedBox(height: TSizes.defaultSpace),
              Text(
                "Nos Catégories",
                style: Theme.of(context).textTheme.titleMedium!.apply(
                      fontWeightDelta: 5,
                    ),
              ),
              const SizedBox(height: 10),
              // Categories
              THomeCategory(),
              Text(
                "Les Top Produits du moment",
                style: Theme.of(context).textTheme.titleMedium!.apply(
                      fontWeightDelta: 5,
                    ),
              ),
              const SizedBox(height: 10),
              // Product
              THomeProduct(),
            ],
          ),
        )),
      ),
    );
  }
}

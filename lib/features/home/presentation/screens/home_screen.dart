import 'package:cyna/common/constant/sizes.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/home/presentation/widgets/t_home_carousel.dart';
import 'package:cyna/features/home/presentation/widgets/t_home_category.dart';
import 'package:cyna/features/home/presentation/widgets/t_home_header.dart';
import 'package:cyna/features/home/presentation/widgets/t_home_product.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: isMobile
            ? const EdgeInsets.only(top: 60, left: 10, right: 10)
            : const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
        child: Column(
          children: [
            // Header home
            const THomeHeader(),

            const SizedBox(height: TSizes.defaultSpace),

            // Carousel
            THomeCarousel(),

            const SizedBox(height: TSizes.defaultSpace),

            // Categories
            THomeCategory(),

            const SizedBox(height: TSizes.defaultSpace),

            // Product
            THomeProduct(),
          ],
        ),
      )),
    );
  }
}

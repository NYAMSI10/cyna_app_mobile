import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/home/presentation/widgets/t_home_carousel.dart';
import 'package:cyna/features/home/presentation/widgets/t_home_category.dart';
import 'package:cyna/features/home/presentation/widgets/t_home_header.dart';
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
            ? const EdgeInsets.only(top: 60, left: 20, right: 20)
            : const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
        child: Column(
          children: [
            // Header homex

            const SizedBox(height: 50),

            // Carousel
            THomeCarousel(),

            const SizedBox(height: 50),

            // Categories
            THomeCategory(),
          ],
        ),
      )),
    );
  }
}

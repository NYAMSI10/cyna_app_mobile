import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/image_strings.dart';
import 'package:cyna/common/constant/sizes.dart';
import 'package:cyna/common/widgets/image/t_rounded_image.dart';
import 'package:cyna/core/provider/navigation_menu_provider.dart';
import 'package:cyna/features/home/presentation/shimmers/home_header_shimmer.dart';
import 'package:cyna/features/panier/presentation/provider/cart_controller.dart';
import 'package:cyna/features/profile/presentation/providers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class THomeHeader extends ConsumerStatefulWidget {
  const THomeHeader({super.key});

  @override
  ConsumerState<THomeHeader> createState() => _THomeHeaderState();
}

class _THomeHeaderState extends ConsumerState<THomeHeader> {
  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userControllerProvider);
    final cartCount = ref.watch(cartControllerProvider).itemCount;

    return userState.when(
      data: (user) {
        return Column(spacing: TSizes.defaultSpace, children: [
          Row(
            children: [
              // image
              TRoundedImage(
                imageUrl: TImages.avatar,
                width: 50,
                height: 50,
                borderRadius: 50,
                padding: EdgeInsets.all(10),
              ),

              // space
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bon retour !",
                      style: Theme.of(context).textTheme.bodySmall!.apply(
                            fontWeightDelta: 5,
                          ),
                    ),
                    Text(
                      "${user.data?.firstName} ${user.data?.lastName}",
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              const Spacer(),
              Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: TColors.white.withOpacity(0.9)),
                  child: IconButton(
                    onPressed: () =>
                        ref.read(currentIndexProvider.notifier).state = 2,
                    icon: Badge.count(
                        count: cartCount,
                        isLabelVisible: cartCount > 0,
                        child: const Icon(Iconsax.shopping_cart)),
                  )),
              const SizedBox(width: 7),
              Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: TColors.white.withOpacity(0.9)),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Iconsax.search_favorite,
                      color: TColors.darkGrey,
                    ),
                  ))
            ],
          ),
        ]);
      },
      loading: () => const HomeHeaderShimmer(),
      error: (error, stackTrace) => const HomeHeaderShimmer(),
    );
  }
}

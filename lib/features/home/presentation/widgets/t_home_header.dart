import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/image_strings.dart';
import 'package:cyna/common/constant/sizes.dart';
import 'package:cyna/common/widgets/image/t_rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class THomeHeader extends ConsumerStatefulWidget {
  const THomeHeader(this.userName, {super.key});
  final String userName;
  @override
  ConsumerState<THomeHeader> createState() => _THomeHeaderState();
}

class _THomeHeaderState extends ConsumerState<THomeHeader> {
  @override
  Widget build(BuildContext context) {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bon retour !",
                style: Theme.of(context).textTheme.titleSmall!.apply(
                      fontWeightDelta: 5,
                    ),
              ),
              Text(
                widget.userName,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),

          const Spacer(),
          Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: TColors.white.withOpacity(0.9)),
              child: IconButton(
                onPressed: () {},
                icon: Badge.count(
                    count: 0, child: const Icon(Iconsax.shopping_cart)),
              ))
        ],
      ),

      // search
      Container(
        width: double.infinity,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: TColors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: TColors.darkGrey,
            ),
            const SizedBox(width: 10),
            Text(
              "Rechercher",
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: TColors.darkGrey,
                    fontWeightDelta: 2,
                  ),
            ),
            const Spacer(),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: TColors.secondColor),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.notification, color: TColors.white),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}

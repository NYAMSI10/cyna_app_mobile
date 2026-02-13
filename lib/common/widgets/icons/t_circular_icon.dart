import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TCircularIcon extends ConsumerWidget {
  const TCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = TSizes.lg,
    this.isCount = false,
    required this.icon,
    this.color,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final bool isCount;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: TColors.white.withOpacity(0.9)),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: color,
            size: size,
          ),
        ));
  }
}

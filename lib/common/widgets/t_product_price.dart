import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TProductPrice extends ConsumerWidget {
  const TProductPrice({
    Key? key,
    required this.curencySign,
    required this.price,
    this.isLarge = false,
    this.maxlines = 1,
    this.lignThrough = false,
  }) : super(key: key);
  final String curencySign, price;
  final bool isLarge;
  final int maxlines;
  final bool lignThrough;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      price + curencySign,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: lignThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration: lignThrough ? TextDecoration.lineThrough : null),
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,
    );
  }
}

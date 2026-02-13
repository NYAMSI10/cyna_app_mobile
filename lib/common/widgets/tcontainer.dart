import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TContainer extends ConsumerWidget {
  const TContainer({
    super.key,
    this.height = 40,
    this.width = 250,
    this.raduis = 20,
    this.borderColor = Colors.black,
    this.backgroundColor = Colors.white,
    required this.child,
  });

  final double height, width, raduis;
  final Color borderColor, backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(raduis)),
        border: Border.all(color: borderColor),
      ),
      child: child,
    );
  }
}

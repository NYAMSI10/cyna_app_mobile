import 'package:cyna/common/constant/colors.dart';
import 'package:flutter/material.dart';

class TFormDrivider extends StatelessWidget {
  const TFormDrivider({super.key, required this.drividerText});

  final String drividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: TColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          drividerText,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.apply(fontSizeDelta: 2),
        ),
        Flexible(
          child: Divider(
            color: TColors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}

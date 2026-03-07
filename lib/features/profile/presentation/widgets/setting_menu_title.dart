import 'package:cyna/common/constant/colors.dart';
import 'package:flutter/material.dart';

class TSettingsMenuTile extends StatelessWidget {
  const TSettingsMenuTile(
      {super.key,
      required this.icon,
      required this.title,
      this.trailing,
      this.onTap});
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: TColors.secondColor,
        fontWeight: FontWeight.bold,
        size: 22,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 20,
        color: TColors.secondColor,
      ),
      onTap: onTap,
    );
  }
}

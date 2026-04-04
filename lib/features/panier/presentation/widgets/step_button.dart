import 'package:flutter/material.dart';

class StepButton extends StatelessWidget {
  const StepButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.isPrimary = false,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isPrimary ? const Color(0xFF080B35) : Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          height: 30,
          width: 30,
          child: Icon(
            icon,
            color: isPrimary ? Colors.white : const Color(0xFF1D1D2A),
            size: 18,
          ),
        ),
      ),
    );
  }
}

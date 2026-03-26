import 'package:cyna/common/constant/colors.dart';
import 'package:flutter/material.dart';

class TSelectablePlanTile extends StatelessWidget {
  const TSelectablePlanTile({
    super.key,
    required this.child,
    required this.isSelected,
    required this.onTap,
  });

  final Widget child;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isSelected ? TColors.secondColor : Colors.transparent,
          width: 2,
        ),
        boxShadow: isSelected
            ? const [
                BoxShadow(
                  color: Color(0x1A0078C7),
                  blurRadius: 16,
                  offset: Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: Stack(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: onTap,
              child: child,
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? TColors.secondColor : Colors.white,
                border: Border.all(
                  color: isSelected
                      ? TColors.secondColor
                      : const Color(0xFFD1D5DB),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      size: 14,
                      color: Colors.white,
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}

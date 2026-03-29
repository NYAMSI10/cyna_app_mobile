import 'package:cyna/common/helpers/responsive.dart';
import 'package:flutter/material.dart';

class TPlanTile extends StatelessWidget {
  const TPlanTile({
    super.key,
    required this.title,
    required this.priceLabel,
    required this.subtitle,
    required this.accentColor,
    required this.borderColor,
    required this.icon,
    this.tag,
  });

  final String title;
  final String priceLabel;
  final String subtitle;
  final Color accentColor;
  final Color borderColor;
  final IconData icon;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Responsive.pagePadding(context),
      decoration: BoxDecoration(
        color: accentColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: const Color(0xFF111827)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF111827),
                            ),
                      ),
                    ),
                    if (tag != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF111827),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          tag!,
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  priceLabel,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: const Color(0xFF111827),
                      ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF4B5563),
                        height: 1.4,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

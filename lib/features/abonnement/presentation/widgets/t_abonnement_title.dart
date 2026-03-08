import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/abonnement/presentation/widgets/t_abonnement_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TAbonnementTitle extends ConsumerWidget {
  const TAbonnementTitle({super.key, required this.abo});
  final Map<String, dynamic> abo;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formattedDate =
        "${abo['endDate'].day.toString().padLeft(2, '0')}/${abo['endDate'].month.toString().padLeft(2, '0')}/${abo['endDate'].year}";

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => abonnementActionsBottomSheet(context, abo),
      child: Ink(
        padding: Responsive.pagePadding(context),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: TColors.primaryColor.withOpacity(0.1),
              child: Text(
                abo['name'][0].toUpperCase(),
                style: const TextStyle(
                  color: TColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    abo['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    abo['plan'],
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Renouvellement le $formattedDate",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${abo['price'].toStringAsFixed(2)} €/ ${abo['billingPeriod']}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade600,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

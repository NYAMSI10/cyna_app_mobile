import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/abonnement/data/model/abonnement_response.dart';
import 'package:cyna/features/abonnement/presentation/widgets/t_abonnement_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TAbonnementTitle extends ConsumerWidget {
  const TAbonnementTitle({super.key, required this.abonnement});
  final AbonnementResponse abonnement;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => abonnementActionsBottomSheet(context, abonnement),
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
                abonnement.product.name!.substring(0, 1).toUpperCase(),
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
                spacing: 8,
                children: [
                  Text(
                    abonnement.product.name!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    abonnement.periode == "MOIS"
                        ? " Plan Mensuel "
                        : "Plan Annuel ",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Text(
                    "Clé : ${abonnement.keyLicence}",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "${abonnement.dateDebut} - ${abonnement.dateFin}",
                    style: TextStyle(
                      fontSize: 13,
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
                  "${abonnement.price.toStringAsFixed(2)} €/ ${abonnement.periode == "MOIS" ? "mois" : "an"}",
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

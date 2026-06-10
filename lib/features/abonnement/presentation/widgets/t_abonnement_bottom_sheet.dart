import 'package:cyna/features/abonnement/data/model/abonnement_response.dart';
import 'package:flutter/material.dart';
import 'package:cyna/common/constant/colors.dart';

void abonnementActionsBottomSheet(
    BuildContext context, AbonnementResponse abo) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: TColors.primaryColor,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              abo.product?.name ?? 'Produit indisponible',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              abo.periode == "MOIS" ? "Plan Mensuel" : "Plan Annuel",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 16),

            // Renouveler
            ListTile(
              leading: const Icon(Icons.refresh, color: TColors.primaryColor),
              title: const Text("Renouveler l’abonnement"),
              subtitle: const Text(
                  "Prolonger la durée à partir de la date de fin actuelle."),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(height: 0),

            // Mettre à jour
            ListTile(
              leading: const Icon(Icons.upgrade, color: TColors.primaryColor),
              title: const Text("Mettre à jour l’abonnement"),
              subtitle: const Text(
                  "Changer de formule ou augmenter le nombre d’utilisateurs."),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(height: 0),

            // Résilier
            ListTile(
              leading: const Icon(Icons.cancel, color: Colors.red),
              title: const Text(
                "Résilier l’abonnement",
                style: TextStyle(color: Colors.red),
              ),
              subtitle: const Text(
                  "L’abonnement sera désactivé à la fin de la période en cours."),
              onTap: () {
                Navigator.pop(context);
                _confirmCancel(context, abo);
              },
            ),
          ],
        ),
      );
    },
  );
}

void _confirmCancel(BuildContext context, AbonnementResponse abo) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          "Confirmer la résiliation",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .apply(fontWeightDelta: 3),
        ),
        content: Text(
          "Voulez-vous vraiment résilier l’abonnement à ${abo.product?.name ?? 'ce produit'} ? "
          "Il restera actif jusqu’à la fin de la période en cours.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Annuler"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Résilier",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}

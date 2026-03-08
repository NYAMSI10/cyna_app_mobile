import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/features/abonnement/presentation/widgets/t_abonnement_bottom_sheet.dart';
import 'package:cyna/features/abonnement/presentation/widgets/t_abonnement_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AbonnementScreen extends ConsumerStatefulWidget {
  const AbonnementScreen({super.key});

  @override
  ConsumerState<AbonnementScreen> createState() => AbonnementScreenState();
}

class AbonnementScreenState extends ConsumerState<AbonnementScreen> {
  final List<Map<String, dynamic>> abonnements = [
    {
      'name': "Notion",
      'plan': "Mensuel • Personal Pro",
      'endDate': DateTime(2026, 4, 12),
      'price': 8.0,
      'billingPeriod': "mois",
    },
    {
      'name': "Figma",
      'plan': "Annuel • Team",
      'endDate': DateTime(2026, 9, 1),
      'price': 180.0,
      'billingPeriod': "an",
    },
    {
      'name': "Carte de visite",
      'plan': "Mensuel • Personal Pro",
      'endDate': DateTime(2026, 4, 8),
      'price': 8.0,
      'billingPeriod': "mois",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
        backgroundColor: TColors.primaryColor,
        title: const Text(
          "Mes Abonnements",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: abonnements.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final abo = abonnements[index];
          return TAbonnementTitle(abo: abo);
        },
      ),
    );
  }
}

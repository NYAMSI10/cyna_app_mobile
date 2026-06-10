import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/widgets/t_empty_state.dart';
import 'package:cyna/features/abonnement/presentation/provider/abonnement_controller.dart';
import 'package:cyna/features/abonnement/presentation/shimmer/abonnment_shimmer.dart';
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
    final abonnementState = ref.watch(abonnementControllerProvider);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const BackButton(color: Colors.white),
          backgroundColor: TColors.primaryColor,
          title: const Text(
            "Mes Abonnements",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: abonnementState.when(
          data: (abonnements) {
            if (abonnements.isEmpty) {
              return const TEmptyState(
                icon: Icons.subscriptions_outlined,
                message: "Aucun abonnement pour le moment",
              );
            }
            return RefreshIndicator(
                color: TColors.primaryColor,
                onRefresh: () => ref
                    .read(abonnementControllerProvider.notifier)
                    .refreshAbonnement(),
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: abonnements.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final abo = abonnements[index];
                    return TAbonnementTitle(abonnement: abo);
                  },
                ));
          },
          loading: () {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: 5, // Affiche 3 placeholders
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) => const AbonnmentShimmer(),
            );
          },
          error: (error, stack) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: 5, // Affiche 5 placeholders
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) => const AbonnmentShimmer(),
            );
          },
        ));
  }
}

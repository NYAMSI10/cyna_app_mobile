import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/carte_bancaire/data/model/reponse/carte_bancaire_reponse.dart';
import 'package:cyna/features/carte_bancaire/presentation/provider/carte_bancaire_controller.dart';
import 'package:cyna/features/carte_bancaire/presentation/screen/carte_bancaire_form_screen.dart';
import 'package:cyna/features/carte_bancaire/presentation/shimmer/carte_bancaire_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CarteBancaireScreen extends ConsumerStatefulWidget {
  const CarteBancaireScreen({super.key});

  @override
  ConsumerState<CarteBancaireScreen> createState() =>
      _CarteBancaireScreenState();
}

class _CarteBancaireScreenState extends ConsumerState<CarteBancaireScreen> {
  Future<bool> _confirmCarteAction({
    required String title,
    required String message,
    required String confirmLabel,
    required Color confirmColor,
  }) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              confirmLabel,
              style: TextStyle(
                color: confirmColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );

    return confirmed ?? false;
  }

  void _openForm({CarteBancaireResponse? carte}) {
    showMaterialModalBottomSheet(
      context: context,
      barrierColor: Colors.black54,
      enableDrag: true,
      expand: true,
      duration: const Duration(milliseconds: 500),
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.77,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: CarteBancaireFormScreen(carte: carte),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final carteState = ref.watch(carteBancaireControllerProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
        backgroundColor: TColors.primaryColor,
        title: const Text(
          "Mes Cartes Bancaires",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: carteState.when(
        data: (cartes) {
          if (cartes.isEmpty) {
            return const Center(
              child: Text("Aucune carte bancaire enregistrée"),
            );
          }
          return RefreshIndicator(
            onRefresh: () =>
                ref.refresh(carteBancaireControllerProvider.notifier).refresh(),
            child: ListView.separated(
              padding: Responsive.pagePadding(context),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: cartes.length,
              itemBuilder: (context, index) {
                final carte = cartes[index];
                return Card(
                  elevation: 0,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                  child: Padding(
                    padding: Responsive.pagePadding(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        if (carte.isDefault == true) ...[
                          const Text(
                            'Par defaut',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: TColors.secondColor,
                            ),
                          ),
                          const Divider(),
                        ],
                        Row(
                          children: [
                            const Icon(Icons.credit_card,
                                color: TColors.primaryColor),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                carte.carteName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          carte.carteNumber,
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 1.5,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        Text(
                          'Expire le : ${carte.carteDate}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => _openForm(carte: carte),
                              child: const Text(
                                'Modifier',
                                style: TextStyle(
                                  color: TColors.primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                final confirmed = await _confirmCarteAction(
                                  title: 'Supprimer cette carte ?',
                                  message:
                                      'Cette action supprimera définitivement cette carte bancaire.',
                                  confirmLabel: 'Supprimer',
                                  confirmColor: Colors.red,
                                );

                                if (!confirmed || !context.mounted) {
                                  return;
                                }

                                await ref
                                    .read(carteBancaireControllerProvider
                                        .notifier)
                                    .deleteCarte(carte.id);
                              },
                              child: const Text(
                                'Supprimer',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            if (carte.isDefault != true)
                              TextButton(
                                onPressed: () async {
                                  final confirmed = await _confirmCarteAction(
                                    title: 'Définir cette carte par défaut ?',
                                    message:
                                        'Cette carte sera utilisée comme moyen de paiement par défaut.',
                                    confirmLabel: 'Définir',
                                    confirmColor: Colors.green,
                                  );

                                  if (!confirmed || !context.mounted) {
                                    return;
                                  }

                                  await ref
                                      .read(carteBancaireControllerProvider
                                          .notifier)
                                      .setDefaultCarte(carte.id);
                                },
                                child: const Text(
                                  'Définir par défaut',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
        error: (error, stackTrace) => const CarteBancaireShimmer(),
        loading: () => const CarteBancaireShimmer(),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primaryColor,
        child: const Icon(Icons.add, color: Colors.white, size: 24),
        onPressed: () => _openForm(),
      ),
    );
  }
}

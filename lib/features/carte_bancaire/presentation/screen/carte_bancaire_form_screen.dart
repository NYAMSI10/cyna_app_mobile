import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/sizes.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/carte_bancaire/data/model/reponse/carte_bancaire_reponse.dart';
import 'package:cyna/features/carte_bancaire/data/model/request/carte_bancaire_request.dart';
import 'package:cyna/features/carte_bancaire/presentation/provider/carte_bancaire_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CarteBancaireFormScreen extends ConsumerStatefulWidget {
  const CarteBancaireFormScreen({super.key, this.carte});
  final CarteBancaireResponse? carte;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      CarteBancaireFormScreenState();
}

class CarteBancaireFormScreenState
    extends ConsumerState<CarteBancaireFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController carteNameController = TextEditingController();

  bool _isDefault = false;
  bool _cardComplete = false;
  bool _loading = false;

  bool get _isEdit => widget.carte != null;

  @override
  void initState() {
    super.initState();
    if (_isEdit) {
      carteNameController.text = widget.carte!.carteName;
      _isDefault = widget.carte!.isDefault ?? false;
    }
  }

  @override
  void dispose() {
    carteNameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    // En création, la carte doit être saisie et valide dans le CardField.
    if (!_isEdit && !_cardComplete) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez saisir des informations de carte valides'),
        ),
      );
      return;
    }

    setState(() => _loading = true);

    final notifier = ref.read(carteBancaireControllerProvider.notifier);

    final bool isSaved;
    if (_isEdit) {
      final request = CarteBancaireRequest(
        carteName: carteNameController.text,
        isDefault: _isDefault,
      );
      isSaved = await notifier.updateCarte(request, widget.carte!.id);
    } else {
      isSaved = await notifier.createCarte(
        carteName: carteNameController.text,
        isDefault: _isDefault,
      );
    }

    if (!mounted) return;
    setState(() => _loading = false);

    if (isSaved) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            backgroundColor: TColors.primaryColor,
            title: Text(
              _isEdit ? "Modifier la carte" : "Ajouter une carte",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: Responsive.pagePadding(context).copyWith(
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: TSizes.spaceBtwInputFields,
                  children: [
                    TextFormField(
                      controller: carteNameController,
                      cursorColor: TColors.darkGrey,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: TColors.darkGrey,
                            width: 2,
                          ),
                        ),
                        labelStyle: const TextStyle(color: Colors.black),
                        labelText: 'Nom de la carte',
                        hintText: 'Ex : Carte perso Visa',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Veuillez entrer un nom pour la carte';
                        }
                        return null;
                      },
                    ),
                    if (!_isEdit) ...[
                      // CardField sécurisé Stripe : les données de carte ne
                      // transitent jamais par notre backend en clair.
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: TColors.darkGrey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: CardField(
                          onCardChanged: (card) {
                            setState(() => _cardComplete = card?.complete ?? false);
                          },
                        ),
                      ),
                    ] else ...[
                      // En modification, on ne resaisit pas le numéro de carte.
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.carte!.carteNumber,
                              style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 1.5,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Expire le : ${widget.carte!.carteDate}',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      activeColor: TColors.primaryColor,
                      title: const Text('Définir comme carte par défaut'),
                      value: _isDefault,
                      onChanged: (value) =>
                          setState(() => _isDefault = value),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: TColors.secondColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: _loading ? null : _submit,
                      child: _loading
                          ? const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.5,
                              ),
                            )
                          : Text(
                              _isEdit
                                  ? 'Modifier la carte'
                                  : 'Ajouter la carte',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .apply(
                                    color: Colors.white,
                                    fontWeightDelta: 2,
                                  ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

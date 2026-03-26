import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/sizes.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdresseFormScreen extends ConsumerStatefulWidget {
  const AdresseFormScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdresseFormScreenState();
}

class _AdresseFormScreenState extends ConsumerState<AdresseFormScreen> {
  final _formKey = GlobalKey<FormState>();

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
            title: const Text(
              "Ajouter une adresse de facturation",
              style: TextStyle(
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
                      cursorColor: TColors.darkGrey,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: TColors.darkGrey,
                            width: 2,
                          ),
                        ),
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: 'Prénom',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    TextFormField(
                      cursorColor: TColors.darkGrey,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: TColors.darkGrey,
                            width: 2,
                          ),
                        ),
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: 'Nom',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    TextFormField(
                      cursorColor: TColors.darkGrey,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: TColors.darkGrey,
                            width: 2,
                          ),
                        ),
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: 'Numéro de téléphone',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    TextFormField(
                      cursorColor: TColors.darkGrey,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: TColors.darkGrey,
                            width: 2,
                          ),
                        ),
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: 'Ligne d\'adresse 1',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    TextFormField(
                      cursorColor: TColors.darkGrey,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: TColors.darkGrey,
                            width: 2,
                          ),
                        ),
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: 'Informations complémentaires',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Expanded(
                          child: TextFormField(
                            cursorColor: TColors.darkGrey,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: TColors.darkGrey,
                                  width: 2,
                                ),
                              ),
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Code Postal',
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            cursorColor: TColors.darkGrey,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: TColors.darkGrey,
                                  width: 2,
                                ),
                              ),
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Pays',
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(spacing: 5, children: [
                      Expanded(
                        child: TextFormField(
                          cursorColor: TColors.darkGrey,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: TColors.darkGrey,
                                width: 2,
                              ),
                            ),
                            labelStyle: TextStyle(color: Colors.black),
                            labelText: 'Pays',
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          cursorColor: TColors.darkGrey,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: TColors.darkGrey,
                                width: 2,
                              ),
                            ),
                            labelStyle: TextStyle(color: Colors.black),
                            labelText: 'Région',
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: TColors.secondColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () async {},
                      child: Text("Ajouter l'adresse",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(color: Colors.white, fontWeightDelta: 2)),
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

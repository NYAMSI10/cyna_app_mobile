import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/sizes.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/adresse/data/model/reponse/adresse_facturation_reponse.dart';
import 'package:cyna/features/adresse/data/model/request/adresse_facturation_request.dart';
import 'package:cyna/features/adresse/presentation/provider/adresse_facturation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdresseFormScreen extends ConsumerStatefulWidget {
  const AdresseFormScreen({super.key, this.adresse});
  final AdresseFacturationResponse? adresse;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      AdresseFormScreenState();
}

class AdresseFormScreenState extends ConsumerState<AdresseFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController adresseController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController codePostalController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController complementAdresseController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.adresse?.id != null) {
      firstNameController.text = widget.adresse!.firstName;
      lastNameController.text = widget.adresse!.lastName;
      adresseController.text = widget.adresse!.adresse;
      cityController.text = widget.adresse!.city;
      codePostalController.text = widget.adresse!.codePostal;
      countryController.text = widget.adresse!.country;
      regionController.text = widget.adresse!.region;
      phoneController.text = widget.adresse!.phone;
      complementAdresseController.text =
          widget.adresse!.complementAdresse ?? '';
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    adresseController.dispose();
    cityController.dispose();
    codePostalController.dispose();
    countryController.dispose();
    regionController.dispose();
    phoneController.dispose();
    complementAdresseController.dispose();
    super.dispose();
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
              widget.adresse != null
                  ? "Modifier l'adresse"
                  : "Ajouter une adresse",
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
                      controller: firstNameController,
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
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: 'Prénom',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre prénom';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: lastNameController,
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
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: 'Nom',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre nom';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: phoneController,
                      cursorColor: TColors.darkGrey,
                      keyboardType: TextInputType.number,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre numéro de téléphone';
                        }
                        if (value.length < 10) {
                          return 'Veuillez entrer un numéro de téléphone valide';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: adresseController,
                      cursorColor: TColors.darkGrey,
                      keyboardType: TextInputType.streetAddress,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre rue et numéro de maison';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: complementAdresseController,
                      cursorColor: TColors.darkGrey,
                      keyboardType: TextInputType.streetAddress,
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
                            controller: codePostalController,
                            cursorColor: TColors.darkGrey,
                            keyboardType: TextInputType.number,
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer votre code postal';
                              }
                              if (value.length < 5) {
                                return 'Veuillez entrer un code postal valide';
                              }
                              return null;
                            },
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: cityController,
                            cursorColor: TColors.darkGrey,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: TColors.darkGrey,
                                  width: 2,
                                ),
                              ),
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Ville',
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer votre ville';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(spacing: 5, children: [
                      Expanded(
                        child: TextFormField(
                          controller: countryController,
                          cursorColor: TColors.darkGrey,
                          keyboardType: TextInputType.text,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer votre pays';
                            }
                            return null;
                          },
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: regionController,
                          cursorColor: TColors.darkGrey,
                          keyboardType: TextInputType.text,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer votre région';
                            }
                            return null;
                          },
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final adresse = AdresseFacturationRequest(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            phone: phoneController.text,
                            adresse: adresseController.text,
                            complementAdresse:
                                complementAdresseController.text.isEmpty
                                    ? null
                                    : complementAdresseController.text,
                            city: cityController.text,
                            codePostal: codePostalController.text,
                            country: countryController.text,
                            region: regionController.text,
                            isDefault: false,
                          );
                          final isSaved = widget.adresse != null
                              ? await ref
                                  .read(adresseFacturationControllerProvider
                                      .notifier)
                                  .updateAdresse(adresse, widget.adresse!.id)
                              : await ref
                                  .read(adresseFacturationControllerProvider
                                      .notifier)
                                  .createAdresse(adresse);

                          if (isSaved && context.mounted) {
                            Navigator.pop(context);
                          }
                        }
                      },
                      child: Text(
                          widget.adresse != null
                              ? 'Modifier l\'adresse'
                              : 'Ajouter l\'adresse',
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

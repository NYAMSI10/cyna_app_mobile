import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/sizes.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordChangeScreen extends ConsumerStatefulWidget {
  const PasswordChangeScreen({super.key});

  @override
  ConsumerState<PasswordChangeScreen> createState() =>
      _PasswordChangeScreenState();
}

class _PasswordChangeScreenState extends ConsumerState<PasswordChangeScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        mainAxisSize:
            MainAxisSize.min, // important pour s'adapter à la height du parent
        children: [
          AppBar(
            centerTitle: true,
            backgroundColor: TColors.primaryColor,
            automaticallyImplyLeading: false,
            title: const Text(
              "Changer le mot de passe",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  size: 30,
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: Responsive.pagePadding(context),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: TSizes.spaceBtwSections,
                    children: [
                      const SizedBox(height: TSizes.spaceBtwInputFields / 2),
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
                          labelText: 'Mot de passe actuel',
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
                          labelText: 'Nouveau mot de passe',
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      TextFormField(
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
                          labelText: 'Confirmer le nouveau mot de passe',
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      // Bouton de connexion dynamique
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          backgroundColor: TColors.secondColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () async {},
                        child: Text("Modifier le mot de passe",
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: Colors.white, fontWeightDelta: 2)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

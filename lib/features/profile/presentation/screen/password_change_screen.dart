import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/sizes.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/profile/data/model/request/user_change_password.dart';
import 'package:cyna/features/profile/presentation/providers/user_controller.dart';
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

  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userControllerProvider);

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
                        controller: _currentPasswordController,
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Champ obligatoire'.hardcoded;
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _newPasswordController,
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Champ obligatoire'.hardcoded;
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _confirmPasswordController,
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Champ obligatoire'.hardcoded;
                          }
                          return null;
                        },
                      ),
                      // Bouton de connexion dynamique
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          backgroundColor: TColors.secondColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: userState.isLoading
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  final changePassword = UserChangePassword(
                                    currentPassword:
                                        _currentPasswordController.text.trim(),
                                    newPassword:
                                        _newPasswordController.text.trim(),
                                    confirmPassword:
                                        _confirmPasswordController.text.trim(),
                                  );
                                  await ref
                                      .read(userControllerProvider.notifier)
                                      .changePassword(changePassword);
                                }
                              },
                        child: userState.isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                    color: Colors.white, strokeWidth: 2))
                            : Text("Modifier le mot de passe",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(
                                        color: Colors.white,
                                        fontWeightDelta: 2)),
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

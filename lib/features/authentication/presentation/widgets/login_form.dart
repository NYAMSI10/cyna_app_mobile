import 'package:cyna/common/helpers/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/sizes.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final getStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.pagePadding(context),
      child: Form(
        key: _formKey,
        child: Column(
          // Utilisation du nouveau paramètre 'spacing' de Flutter 3.x
          spacing: TSizes.defaultSpace,
          children: [
            TextFormField(
              controller: _emailController,
              cursorColor: TColors.darkGrey,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.message, color: Colors.black),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: TColors.darkGrey,
                    width: 2,
                  ),
                ),
                labelStyle: TextStyle(color: Colors.black),
                labelText: 'Email',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Champ obligatoire'.hardcoded;
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Veuillez entrer une adresse email valide'.hardcoded;
                }

                return null;
              },
            ),

            TextFormField(
              controller: _passwordController,
              cursorColor: TColors.darkGrey,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.lock, color: Colors.black),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Iconsax.eye,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: TColors.darkGrey,
                    width: 2,
                  ),
                ),
                labelStyle: TextStyle(color: Colors.black),
                labelText: 'Mot de passe ',
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

            // Row "Rester connecté" (inchangée)
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                      value: true,
                      activeColor: TColors.secondColor,
                      onChanged: (v) {}),
                ),
                Text("Se souvenir de moi",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(fontSizeDelta: -1)),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text("Mot de passe oublié ?",
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          fontWeightDelta: 2,
                          fontSizeDelta: -1,
                          color: TColors.secondColor)),
                ),
              ],
            ),

            // Bouton de connexion dynamique
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: TColors.secondColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                context.go('/navigationMenu');
              },
              child: Text(
                "Se connecter", // J'ai changé 'M'inscrire' en 'Se connecter'
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                      color: Colors.white,
                      fontWeightDelta: 2,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

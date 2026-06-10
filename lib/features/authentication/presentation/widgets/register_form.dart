import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/authentication/presentation/provider/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/sizes.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';
import 'package:toastification/toastification.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _passwordController;
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ref.read(registerControllerProvider.notifier).register(
            firstName: _firstNameController.text.trim(),
            lastName: _lastNameController.text.trim(),
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<String?>>(
      registerControllerProvider,
      (previous, next) {
        next.whenOrNull(
          data: (message) {
            toastification.show(
              type: ToastificationType.success,
              style: ToastificationStyle.flatColored,
              title: Text(
                message ??
                    "Inscription réussie. Vérifiez votre email pour confirmer votre compte.",
              ),
              alignment: Alignment.topRight,
              autoCloseDuration: const Duration(seconds: 5),
              icon: const Icon(Icons.check_circle_outline),
            );
            // Le compte doit être confirmé par email avant connexion.
            context.go('/login');
          },
          error: (error, stackTrace) {
            toastification.show(
              type: ToastificationType.error,
              style: ToastificationStyle.flatColored,
              title: Text(error.toString()),
              alignment: Alignment.topRight,
              icon: const Icon(Icons.error_outline),
              autoCloseDuration: const Duration(seconds: 4),
            );
          },
        );
      },
    );

    final registerState = ref.watch(registerControllerProvider);

    return Padding(
      padding: Responsive.pagePadding(context),
      child: Form(
        key: _formKey,
        child: Column(
          spacing: TSizes.defaultSpace,
          children: [
            TextFormField(
              controller: _firstNameController,
              cursorColor: TColors.darkGrey,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              decoration: _decoration(
                label: 'Prénom',
                icon: Iconsax.user,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Champ obligatoire'.hardcoded;
                }
                return null;
              },
            ),
            TextFormField(
              controller: _lastNameController,
              cursorColor: TColors.darkGrey,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              decoration: _decoration(
                label: 'Nom',
                icon: Iconsax.user,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Champ obligatoire'.hardcoded;
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
              cursorColor: TColors.darkGrey,
              keyboardType: TextInputType.emailAddress,
              decoration: _decoration(
                label: 'Email',
                icon: Iconsax.message,
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
              obscureText: !_showPassword,
              cursorColor: TColors.darkGrey,
              decoration: _decoration(
                label: 'Mot de passe',
                icon: Iconsax.lock,
                suffix: IconButton(
                  icon: Icon(
                    _showPassword ? Iconsax.eye : Iconsax.eye_slash,
                    color: Colors.black,
                  ),
                  onPressed: () =>
                      setState(() => _showPassword = !_showPassword),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Champ obligatoire'.hardcoded;
                }
                // Doit correspondre aux règles du backend.
                final strong = RegExp(
                  r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,}$',
                );
                if (!strong.hasMatch(value)) {
                  return '8 caractères min., avec majuscule, minuscule, chiffre et caractère spécial'
                      .hardcoded;
                }
                return null;
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: TColors.secondColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: registerState.isLoading ? null : _submit,
              child: registerState.isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2),
                    )
                  : Text(
                      "S'inscrire",
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

  InputDecoration _decoration({
    required String label,
    required IconData icon,
    Widget? suffix,
  }) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: Colors.black),
      suffixIcon: suffix,
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: TColors.darkGrey, width: 2),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}

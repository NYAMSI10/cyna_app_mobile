import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/sizes.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/authentication/presentation/provider/forgot_password/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:toastification/toastification.dart';

class ForgotPasswordForm extends ConsumerStatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  ConsumerState<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends ConsumerState<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(
      forgotPasswordControllerProvider,
      (previous, next) {
        next.whenOrNull(
          data: (_) {
            toastification.show(
              type: ToastificationType.success,
              style: ToastificationStyle.flatColored,
              title: const Text(
                  "Un email de réinitialisation a été envoyé si ce compte existe."),
              alignment: Alignment.topRight,
              autoCloseDuration: const Duration(seconds: 5),
              icon: const Icon(Icons.check_circle_outline),
            );
            context.go('/login');
          },
          error: (error, _) {
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

    final forgotState = ref.watch(forgotPasswordControllerProvider);

    return Padding(
      padding: Responsive.pagePadding(context),
      child: Form(
        key: _formKey,
        child: Column(
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
                labelStyle: const TextStyle(color: Colors.black),
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: TColors.secondColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: forgotState.isLoading
                  ? null
                  : () {
                      if (_formKey.currentState!.validate()) {
                        ref
                            .read(forgotPasswordControllerProvider.notifier)
                            .forgotPassword(_emailController.text.trim());
                      }
                    },
              child: forgotState.isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2),
                    )
                  : Text(
                      "Envoyer le lien",
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

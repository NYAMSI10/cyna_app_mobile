import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/image_strings.dart';
import 'package:cyna/common/constant/sizes.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/authentication/presentation/widgets/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Center(
                  child: Image.asset(
                    TImages.logo,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                "Mot de passe oublié ?",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Padding(
                padding: Responsive.pagePadding(context),
                child: Text(
                  "Saisissez votre adresse email. Nous vous enverrons un lien pour réinitialiser votre mot de passe.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const ForgotPasswordForm(),
              Padding(
                padding: Responsive.pagePadding(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Retour à la",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () => context.go('/login'),
                      child: Text(
                        "Connexion",
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: TColors.secondColor,
                              fontWeightDelta: 2,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/authentication/presentation/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/image_strings.dart';
import 'package:cyna/common/constant/sizes.dart';
import 'package:cyna/common/constant/text_string.dart';
import 'package:cyna/common/widgets/form_divider.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Permet de scroller si le contenu est trop grand (ou quand le clavier sort)
        child: Column(
          mainAxisSize: MainAxisSize
              .min, // Indique à la colonne de ne prendre que la place nécessaire
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 20,
                right: 20,
              ), // Un peu plus de top pour le logo
              child: Center(
                child: Image.asset(
                  TImages.logo,
                  height: 150, // Réduit légèrement pour gagner de la place
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Text(
              TTexts.signUpTitle,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            // On s'assure que le formulaire ne crée pas de conflit de taille
            const RegisterForm(),

            const SizedBox(height: TSizes.spaceBtwItems),
            const TFormDrivider(drividerText: "ou"),
            const SizedBox(height: TSizes.spaceBtwItems),

            Padding(
              padding: Responsive.pagePadding(context),
              child: OutlinedButton(
                // Google est souvent en Outlined pour contraster avec le bouton principal
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(55),
                  side: const BorderSide(color: TColors.secondColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Ajoute ton icône Google ici si tu l'as
                    Text(
                      "S'inscrire avec Google",
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: TColors.secondColor,
                            fontWeightDelta: 1,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  TTexts.alreadyAccount,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextButton(
                  onPressed: () => context.go('/login'),
                  child: Text(
                    TTexts.signIn,
                    style: Theme.of(context).textTheme.bodyLarge!.apply(
                          color: TColors.secondColor,
                          fontWeightDelta: 2,
                        ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

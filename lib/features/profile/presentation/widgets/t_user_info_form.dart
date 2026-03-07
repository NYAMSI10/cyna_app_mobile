import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/sizes.dart';
import 'package:cyna/common/extension/string_hardcoded.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class TUserInfoForm extends ConsumerStatefulWidget {
  const TUserInfoForm({super.key});

  @override
  ConsumerState<TUserInfoForm> createState() => _TUserInfoFormState();
}

class _TUserInfoFormState extends ConsumerState<TUserInfoForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.pagePadding(context),
      child: Form(
          key: _formKey,
          child: Column(
            spacing: TSizes.defaultSpace,
            children: [
              Row(
                spacing: 5,
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: TColors.darkGrey,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Iconsax.message, color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: TColors.darkGrey,
                            width: 2,
                          ),
                        ),
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 17),
                        labelText: 'Prénom',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      cursorColor: TColors.darkGrey,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Iconsax.message, color: Colors.black),
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
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

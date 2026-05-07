import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/constant/sizes.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/profile/data/model/request/user_request.dart';
import 'package:cyna/features/profile/presentation/providers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfoScreen extends ConsumerStatefulWidget {
  const UserInfoScreen(
      {super.key, this.firstName, this.lastName, this.email, this.id});
  final String? firstName, lastName, email, id;

  @override
  ConsumerState<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends ConsumerState<UserInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _firstNameController.text = widget.firstName ?? '';
    _lastNameController.text = widget.lastName ?? '';
    _emailController.text = widget.email ?? '';
  }

  @override
  void dispose() {
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
              "Mes Informations",
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
                        controller: _firstNameController,
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
                      ),
                      TextFormField(
                        controller: _lastNameController,
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
                      ),
                      TextFormField(
                        controller: _emailController,
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
                          labelText: 'Adresse Email',
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
                        onPressed: userState.isLoading
                            ? () {
                                print("User update in progress...");
                              }
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  final userRequest = UserRequest(
                                    firstName: _firstNameController.text,
                                    lastName: _lastNameController.text,
                                    email: _emailController.text,
                                  );
                                  Future.delayed(
                                      const Duration(milliseconds: 500),
                                      () async {
                                    await ref
                                        .read(userControllerProvider.notifier)
                                        .updateUser(userRequest, widget.id!);
                                  });
                                }
                              },
                        child: userState.isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                    color: Colors.white, strokeWidth: 2))
                            : Text("Modifier mes informations",
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

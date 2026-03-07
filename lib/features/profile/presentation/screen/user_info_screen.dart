import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/features/profile/presentation/widgets/t_user_info_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfoScreen extends ConsumerStatefulWidget {
  const UserInfoScreen({super.key});

  @override
  ConsumerState<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends ConsumerState<UserInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: TColors.primaryColor,
            leading: const BackButton(color: Colors.white),
            title: const Text("Mes Informations",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))),
        body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(child: const TUserInfoForm())));
  }
}

import 'package:cyna/common/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AbonnementScreen extends ConsumerStatefulWidget {
  const AbonnementScreen({super.key});

  @override
  ConsumerState<AbonnementScreen> createState() => _AbonnementScreenState();
}

class _AbonnementScreenState extends ConsumerState<AbonnementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading: const BackButton(color: Colors.white),
          backgroundColor: TColors.primaryColor,
          title: const Text("Mes Abonnements",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
    );
  }
}

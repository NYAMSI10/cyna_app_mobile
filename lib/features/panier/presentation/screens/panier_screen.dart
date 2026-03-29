import 'package:cyna/common/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PanierScreen extends ConsumerStatefulWidget {
  const PanierScreen({super.key});

  @override
  ConsumerState<PanierScreen> createState() => _PanierScreenState();
}

class _PanierScreenState extends ConsumerState<PanierScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.primaryColor,
        automaticallyImplyLeading: false,
        title: const Text(
          'Mon Panier',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.bold,
              fontSize: 17),
          maxLines: 1,
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Contenu du panier'),
      ),
    );
  }
}

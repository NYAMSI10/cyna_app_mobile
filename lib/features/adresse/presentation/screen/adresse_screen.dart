import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/adresse/presentation/screen/adresse_form_screen.dart';
import 'package:cyna/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AdresseScreen extends ConsumerStatefulWidget {
  const AdresseScreen({super.key});

  @override
  ConsumerState<AdresseScreen> createState() => _AdresseScreenState();
}

class _AdresseScreenState extends ConsumerState<AdresseScreen> {
  final List<Map<String, dynamic>> adresses = [
    {
      'id': 1,
      'firstName': 'Jean',
      'lastName': 'Dupont',
      'address': '123 Rue de la Paix',
      'city': 'Ville',
      'postalCode': '12345',
      'phone': '0123456789',
    },
    {
      'id': 2,
      'firstName': 'Maria',
      'lastName': 'Garcia',
      'address': '456 Rue de la Liberté',
      'city': 'Ville',
      'postalCode': '67890',
      'phone': '9876543210',
    },
    {
      'id': 3,
      'firstName': 'Pierre',
      'lastName': 'Martin',
      'address': '789 Rue de la Justice',
      'city': 'Ville',
      'postalCode': '54321',
      'phone': '5555555555',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
        backgroundColor: TColors.primaryColor,
        title: const Text(
          "Mes Adresses de facturation",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.separated(
        padding: Responsive.pagePadding(context),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: adresses.length,
        itemBuilder: (context, index) {
          final adresse = adresses[index];
          return Card(
            elevation: 0,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => HomeScreen(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${adresse['firstName']} ${adresse['lastName']}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${adresse['address']}, ${adresse['city']}, ${adresse['postalCode']}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${adresse['phone']}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.chevron_right,
                          size: 22,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primaryColor,
        child: const Icon(Icons.add, color: Colors.white, size: 24),
        onPressed: () {
          showMaterialModalBottomSheet(
            context: context,
            barrierColor: Colors.black54,
            enableDrag: true,
            expand: true,
            duration: const Duration(milliseconds: 500), // Plus lent et fluide
            backgroundColor:
                Colors.transparent, // Important pour voir les bords arrondis
            builder: (context) => Container(
              height: MediaQuery.of(context).size.height * 0.77,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              // On utilise padding pour ne pas coller au clavier
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: AdresseFormScreen(),
            ),
          );
        },
      ),
    );
  }
}

import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/widgets/t_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Fausse liste de produits spécifiques à cette catégorie (à remplacer par tes vraies données/API plus tard)
    final List<Map<String, dynamic>> categoryProducts = [
      {
        'id': 1,
        'name': 'Veste en Lin Premium',
        'price': 129.99,
        'image':
            'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?q=80&w=500',
        'stock': 10,
      },
      {
        'id': 2,
        'name': 'Sac à dos Urbain',
        'price': 85.0,
        'image':
            'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=500',
        'stock': 0, // Rupture de stock pour tester le badge
      },
      {
        'id': 3,
        'name': 'Sneakers White Edition',
        'price': 110.5,
        'image':
            'https://images.unsplash.com/photo-1549298916-b41d501d3772?q=80&w=500',
        'stock': 12,
      },
      {
        'id': 4,
        'name': 'Montre Minimaliste',
        'price': 199.0,
        'image':
            'https://images.unsplash.com/photo-1524592094714-0f0654e20314?q=80&w=500',
        'stock': 5,
      },
    ];
    return Scaffold(
      // Une AppBar simple avec un bouton retour automatique
      appBar: AppBar(
        backgroundColor: TColors.primaryColor,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'Accessoires',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.bold),
          maxLines: 1,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. IMAGE PRINCIPALE AVEC SURIMPRESSION ---
            Stack(
              alignment: Alignment.center, // Centre les éléments superposés
              children: [
                // Image de fond de la catégorie
                Image.network(
                  'https://images.unsplash.com/photo-1434389677669-e08b4cac3105?q=80&w=500',
                  width: double.infinity,
                  height: 250, // Hauteur de la bannière
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Container(height: 250, color: Colors.grey),
                ),

                // Surimpression sombre (Filtre) pour que le texte blanc ressorte bien
                Container(
                  width: double.infinity,
                  height: 250,
                  color: Colors.black.withOpacity(0.4), // 40% d'opacité
                ),

                // Nom de la catégorie superposé
                Text(
                  'Accessoires',
                  style: Theme.of(context).textTheme.headlineMedium!.apply(
                        color: Colors.white,
                        fontWeightDelta: 2, // Rend le texte un peu plus gras
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            // --- 2. DESCRIPTION DE LA CATÉGORIE ---
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Découvrez notre sélection exclusive de produits pour cette catégorie. Trouvez ce qu\'il vous faut au meilleur prix.',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: Colors.grey[700],
                      heightFactor: 1.5, // Interligne plus aéré pour la lecture
                    ),
                textAlign: TextAlign.justify,
              ),
            ),
            // --- 3. ENTÊTE DE LA LISTE DE PRODUITS (Optionnel mais joli) ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${categoryProducts.length} Produits",
                    style: Theme.of(context).textTheme.titleMedium!.apply(
                          color: Colors.black,
                          fontWeightDelta: 2, // Rend le texte un peu plus gras
                        ),
                  ),
                  const Icon(Icons.sort,
                      color: Colors.grey), // Icône pour un futur filtre/tri
                ],
              ),
            ),
            const SizedBox(height: 16),

            // --- 4. LA GRILLE DES PRODUITS ---
            GridView.builder(
              shrinkWrap: true, // Indispensable ici
              physics:
                  const NeverScrollableScrollPhysics(), // Indispensable ici
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: 260, // La même hauteur fixe que sur l'accueil
              ),
              itemCount: categoryProducts.length,
              itemBuilder: (context, index) {
                // On appelle simplement la carte produit que tu as déjà codée !
                return TProductCard(product: categoryProducts[index]);
              },
            ),

            const SizedBox(
                height: 40), // Petit espace en bas de page pour respirer
          ],
        ),
      ),
    );
  }
}

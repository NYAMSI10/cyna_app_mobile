import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/features/search/presentation/provider/search_controller.dart';
import 'package:cyna/features/search/presentation/widgets/search_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      ref.read(searchControllerProvider.notifier).loadMore();
    }
  }

  void _clearSearch() {
    _textController.clear();
    ref.read(searchControllerProvider.notifier).onQueryChanged('');
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchControllerProvider);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: TColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // En-tête
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Text(
                'Rechercher',
                style: textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            // Barre de recherche
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _textController,
                onChanged: (query) {
                  setState(() {});
                  ref
                      .read(searchControllerProvider.notifier)
                      .onQueryChanged(query);
                },
                decoration: InputDecoration(
                  hintText: 'Nom du produit, service...',
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  prefixIcon: Icon(
                    Iconsax.search_normal,
                    color: TColors.primaryColor,
                    size: 20,
                  ),
                  suffixIcon: _textController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Colors.grey.shade500,
                            size: 20,
                          ),
                          onPressed: _clearSearch,
                        )
                      : null,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: TColors.primaryColor, width: 1.5),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Compteur de résultats
            if (state.products.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '${state.products.length} résultat${state.products.length > 1 ? 's' : ''}',
                  style: textTheme.bodySmall!
                      .copyWith(color: TColors.darkGrey),
                ),
              ),

            if (state.products.isNotEmpty) const SizedBox(height: 12),

            // Contenu principal
            Expanded(child: _buildBody(state)),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(SearchState state) {
    // Chargement initial
    if (state.isLoading) {
      return _buildShimmerGrid();
    }

    // Erreur
    if (state.error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.warning_2, size: 56, color: TColors.error),
              const SizedBox(height: 16),
              Text(
                state.error!,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: TColors.darkGrey),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => ref
                    .read(searchControllerProvider.notifier)
                    .search(query: state.currentQuery),
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Réessayer'),
              ),
            ],
          ),
        ),
      );
    }

    // Aucun résultat après une recherche
    if (state.products.isEmpty && state.currentQuery.isNotEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.search_status_1, size: 72, color: TColors.grey),
              const SizedBox(height: 20),
              Text(
                'Aucun résultat pour',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: TColors.darkGrey),
              ),
              const SizedBox(height: 4),
              Text(
                '"${state.currentQuery}"',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Essayez avec d\'autres mots-clés',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: TColors.grey),
              ),
            ],
          ),
        ),
      );
    }

    // État initial — pas encore de recherche
    if (state.products.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.search_favorite, size: 72, color: TColors.grey),
              const SizedBox(height: 20),
              Text(
                'Commencez votre recherche',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Trouvez vos produits de cybersécurité',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: TColors.grey),
              ),
            ],
          ),
        ),
      );
    }

    // Grille de résultats
    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.72,
      ),
      itemCount:
          state.products.length + (state.isLoadingMore ? 2 : 0),
      itemBuilder: (context, index) {
        if (index >= state.products.length) {
          return _buildShimmerCard();
        }
        return SearchProductCard(product: state.products[index]);
      },
    );
  }

  Widget _buildShimmerGrid() {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.72,
      ),
      itemCount: 6,
      itemBuilder: (_, __) => _buildShimmerCard(),
    );
  }

  Widget _buildShimmerCard() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade100,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

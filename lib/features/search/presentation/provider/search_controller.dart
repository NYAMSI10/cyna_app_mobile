import 'dart:async';

import 'package:cyna/features/search/data/model/search_product_dto.dart';
import 'package:cyna/features/search/data/model/search_request_dto.dart';
import 'package:cyna/features/search/data/usecasesImpl/search_usecase_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_controller.g.dart';

class SearchState {
  final List<SearchProductDto> products;
  final bool isLoading;
  final bool isLoadingMore;
  final String? error;
  final int currentPage;
  final int lastPage;
  final String currentQuery;

  const SearchState({
    this.products = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.error,
    this.currentPage = 1,
    this.lastPage = 1,
    this.currentQuery = '',
  });

  bool get hasMore => currentPage < lastPage;

  SearchState copyWith({
    List<SearchProductDto>? products,
    bool? isLoading,
    bool? isLoadingMore,
    String? error,
    int? currentPage,
    int? lastPage,
    String? currentQuery,
    bool clearError = false,
  }) {
    return SearchState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: clearError ? null : (error ?? this.error),
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
      currentQuery: currentQuery ?? this.currentQuery,
    );
  }
}

@riverpod
class SearchController extends _$SearchController {
  Timer? _debounceTimer;

  @override
  SearchState build() {
    ref.onDispose(() => _debounceTimer?.cancel());
    return const SearchState();
  }

  void onQueryChanged(String query) {
    _debounceTimer?.cancel();
    if (query.isEmpty) {
      state = const SearchState();
      return;
    }
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      search(query: query);
    });
  }

  Future<void> search({required String query, bool reset = true}) async {
    final useCase = ref.read(searchUseCaseProvider);

    if (reset) {
      state = state.copyWith(
        isLoading: true,
        products: [],
        currentPage: 1,
        lastPage: 1,
        currentQuery: query,
        clearError: true,
      );
    } else {
      state = state.copyWith(isLoadingMore: true);
    }

    final request = SearchRequestDto(
      text: query,
      page: reset ? 1 : state.currentPage + 1,
      limit: 10,
    );

    final result = await useCase.search(request);

    result.when(
      (paginated) {
        final newProducts = paginated.data;
        state = state.copyWith(
          isLoading: false,
          isLoadingMore: false,
          products: reset ? newProducts : [...state.products, ...newProducts],
          currentPage: paginated.page,
          lastPage: paginated.lastPage,
          clearError: true,
        );
      },
      (failure) {
        state = state.copyWith(
          isLoading: false,
          isLoadingMore: false,
          error: failure.message,
        );
      },
    );
  }

  Future<void> loadMore() async {
    if (!state.hasMore || state.isLoadingMore || state.isLoading) return;
    await search(query: state.currentQuery, reset: false);
  }
}

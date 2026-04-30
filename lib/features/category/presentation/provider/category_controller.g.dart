// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CategoryController)
final categoryControllerProvider = CategoryControllerProvider._();

final class CategoryControllerProvider
    extends $AsyncNotifierProvider<CategoryController, List<CategoryResponse>> {
  CategoryControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'categoryControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$categoryControllerHash();

  @$internal
  @override
  CategoryController create() => CategoryController();
}

String _$categoryControllerHash() =>
    r'3c6001cd6ddc549fa4849d2d873eec142d6a451f';

abstract class _$CategoryController
    extends $AsyncNotifier<List<CategoryResponse>> {
  FutureOr<List<CategoryResponse>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref
        as $Ref<AsyncValue<List<CategoryResponse>>, List<CategoryResponse>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<CategoryResponse>>, List<CategoryResponse>>,
        AsyncValue<List<CategoryResponse>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

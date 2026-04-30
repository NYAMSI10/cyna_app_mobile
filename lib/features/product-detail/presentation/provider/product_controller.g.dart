// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProductController)
final productControllerProvider = ProductControllerProvider._();

final class ProductControllerProvider
    extends $AsyncNotifierProvider<ProductController, List<ProductResponse>> {
  ProductControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'productControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$productControllerHash();

  @$internal
  @override
  ProductController create() => ProductController();
}

String _$productControllerHash() => r'406b11c0612430cbaefa63a40a23dbc9cc130c8b';

abstract class _$ProductController
    extends $AsyncNotifier<List<ProductResponse>> {
  FutureOr<List<ProductResponse>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref
        as $Ref<AsyncValue<List<ProductResponse>>, List<ProductResponse>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<ProductResponse>>, List<ProductResponse>>,
        AsyncValue<List<ProductResponse>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

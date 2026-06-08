// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carte_bancaire_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CarteBancaireController)
final carteBancaireControllerProvider = CarteBancaireControllerProvider._();

final class CarteBancaireControllerProvider extends $AsyncNotifierProvider<
    CarteBancaireController, List<CarteBancaireResponse>> {
  CarteBancaireControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'carteBancaireControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$carteBancaireControllerHash();

  @$internal
  @override
  CarteBancaireController create() => CarteBancaireController();
}

String _$carteBancaireControllerHash() =>
    r'22a307e9127bf2bc4ac9b171a94a9ce65f4c0403';

abstract class _$CarteBancaireController
    extends $AsyncNotifier<List<CarteBancaireResponse>> {
  FutureOr<List<CarteBancaireResponse>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<CarteBancaireResponse>>,
        List<CarteBancaireResponse>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<CarteBancaireResponse>>,
            List<CarteBancaireResponse>>,
        AsyncValue<List<CarteBancaireResponse>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

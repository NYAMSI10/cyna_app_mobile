// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abonnement_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AbonnementController)
final abonnementControllerProvider = AbonnementControllerProvider._();

final class AbonnementControllerProvider extends $AsyncNotifierProvider<
    AbonnementController, List<AbonnementResponse>> {
  AbonnementControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'abonnementControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$abonnementControllerHash();

  @$internal
  @override
  AbonnementController create() => AbonnementController();
}

String _$abonnementControllerHash() =>
    r'0283ad66d372933ba58aa437111b09ee59484dc1';

abstract class _$AbonnementController
    extends $AsyncNotifier<List<AbonnementResponse>> {
  FutureOr<List<AbonnementResponse>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref
        as $Ref<AsyncValue<List<AbonnementResponse>>, List<AbonnementResponse>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<AbonnementResponse>>,
            List<AbonnementResponse>>,
        AsyncValue<List<AbonnementResponse>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

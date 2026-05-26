// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adresse_facturation_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AdresseFacturationController)
final adresseFacturationControllerProvider =
    AdresseFacturationControllerProvider._();

final class AdresseFacturationControllerProvider extends $AsyncNotifierProvider<
    AdresseFacturationController, List<AdresseFacturationResponse>> {
  AdresseFacturationControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'adresseFacturationControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$adresseFacturationControllerHash();

  @$internal
  @override
  AdresseFacturationController create() => AdresseFacturationController();
}

String _$adresseFacturationControllerHash() =>
    r'8491ff7309d75bd16ec253b86610a159faa9ad86';

abstract class _$AdresseFacturationController
    extends $AsyncNotifier<List<AdresseFacturationResponse>> {
  FutureOr<List<AdresseFacturationResponse>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<AdresseFacturationResponse>>,
        List<AdresseFacturationResponse>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<AdresseFacturationResponse>>,
            List<AdresseFacturationResponse>>,
        AsyncValue<List<AdresseFacturationResponse>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

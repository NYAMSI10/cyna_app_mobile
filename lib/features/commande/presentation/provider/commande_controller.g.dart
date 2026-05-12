// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commande_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CommandeController)
final commandeControllerProvider = CommandeControllerProvider._();

final class CommandeControllerProvider
    extends $AsyncNotifierProvider<CommandeController, List<CommandeResponse>> {
  CommandeControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'commandeControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$commandeControllerHash();

  @$internal
  @override
  CommandeController create() => CommandeController();
}

String _$commandeControllerHash() =>
    r'bf2cdfd782728247e5bc6768386995695387fd49';

abstract class _$CommandeController
    extends $AsyncNotifier<List<CommandeResponse>> {
  FutureOr<List<CommandeResponse>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref
        as $Ref<AsyncValue<List<CommandeResponse>>, List<CommandeResponse>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<CommandeResponse>>, List<CommandeResponse>>,
        AsyncValue<List<CommandeResponse>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

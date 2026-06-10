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
    r'2df92bfb8bbebfd9e093ca21148093abc2bcaef9';

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

@ProviderFor(commandeDetail)
final commandeDetailProvider = CommandeDetailFamily._();

final class CommandeDetailProvider extends $FunctionalProvider<
        AsyncValue<CommandeResponse>,
        CommandeResponse,
        FutureOr<CommandeResponse>>
    with $FutureModifier<CommandeResponse>, $FutureProvider<CommandeResponse> {
  CommandeDetailProvider._(
      {required CommandeDetailFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'commandeDetailProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$commandeDetailHash();

  @override
  String toString() {
    return r'commandeDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<CommandeResponse> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<CommandeResponse> create(Ref ref) {
    final argument = this.argument as String;
    return commandeDetail(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CommandeDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$commandeDetailHash() => r'7dbbdba73d3f30a957b31e7fd795c0bd2dc0ff4e';

final class CommandeDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<CommandeResponse>, String> {
  CommandeDetailFamily._()
      : super(
          retry: null,
          name: r'commandeDetailProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  CommandeDetailProvider call(
    String reference,
  ) =>
      CommandeDetailProvider._(argument: reference, from: this);

  @override
  String toString() => r'commandeDetailProvider';
}

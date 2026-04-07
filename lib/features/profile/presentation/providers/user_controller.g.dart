// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserController)
final userControllerProvider = UserControllerProvider._();

final class UserControllerProvider
    extends $AsyncNotifierProvider<UserController, ApiResponse<UserResponse>> {
  UserControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userControllerHash();

  @$internal
  @override
  UserController create() => UserController();
}

String _$userControllerHash() => r'c0ac2d0c29139deebfdacdbc682467418a71a279';

abstract class _$UserController
    extends $AsyncNotifier<ApiResponse<UserResponse>> {
  FutureOr<ApiResponse<UserResponse>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ApiResponse<UserResponse>>,
        ApiResponse<UserResponse>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<ApiResponse<UserResponse>>,
            ApiResponse<UserResponse>>,
        AsyncValue<ApiResponse<UserResponse>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

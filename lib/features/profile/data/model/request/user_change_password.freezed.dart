// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_change_password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserChangePassword {
  String get confirmPassword;
  String get currentPassword;
  String get newPassword;

  /// Create a copy of UserChangePassword
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserChangePasswordCopyWith<UserChangePassword> get copyWith =>
      _$UserChangePasswordCopyWithImpl<UserChangePassword>(
          this as UserChangePassword, _$identity);

  /// Serializes this UserChangePassword to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserChangePassword &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, confirmPassword, currentPassword, newPassword);

  @override
  String toString() {
    return 'UserChangePassword(confirmPassword: $confirmPassword, currentPassword: $currentPassword, newPassword: $newPassword)';
  }
}

/// @nodoc
abstract mixin class $UserChangePasswordCopyWith<$Res> {
  factory $UserChangePasswordCopyWith(
          UserChangePassword value, $Res Function(UserChangePassword) _then) =
      _$UserChangePasswordCopyWithImpl;
  @useResult
  $Res call(
      {String confirmPassword, String currentPassword, String newPassword});
}

/// @nodoc
class _$UserChangePasswordCopyWithImpl<$Res>
    implements $UserChangePasswordCopyWith<$Res> {
  _$UserChangePasswordCopyWithImpl(this._self, this._then);

  final UserChangePassword _self;
  final $Res Function(UserChangePassword) _then;

  /// Create a copy of UserChangePassword
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confirmPassword = null,
    Object? currentPassword = null,
    Object? newPassword = null,
  }) {
    return _then(_self.copyWith(
      confirmPassword: null == confirmPassword
          ? _self.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      currentPassword: null == currentPassword
          ? _self.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _self.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserChangePassword].
extension UserChangePasswordPatterns on UserChangePassword {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserChangePassword value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserChangePassword() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserChangePassword value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserChangePassword():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserChangePassword value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserChangePassword() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String confirmPassword, String currentPassword, String newPassword)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserChangePassword() when $default != null:
        return $default(
            _that.confirmPassword, _that.currentPassword, _that.newPassword);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String confirmPassword, String currentPassword, String newPassword)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserChangePassword():
        return $default(
            _that.confirmPassword, _that.currentPassword, _that.newPassword);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String confirmPassword, String currentPassword, String newPassword)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserChangePassword() when $default != null:
        return $default(
            _that.confirmPassword, _that.currentPassword, _that.newPassword);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserChangePassword implements UserChangePassword {
  _UserChangePassword(
      {required this.confirmPassword,
      required this.currentPassword,
      required this.newPassword});
  factory _UserChangePassword.fromJson(Map<String, dynamic> json) =>
      _$UserChangePasswordFromJson(json);

  @override
  final String confirmPassword;
  @override
  final String currentPassword;
  @override
  final String newPassword;

  /// Create a copy of UserChangePassword
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserChangePasswordCopyWith<_UserChangePassword> get copyWith =>
      __$UserChangePasswordCopyWithImpl<_UserChangePassword>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserChangePasswordToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserChangePassword &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, confirmPassword, currentPassword, newPassword);

  @override
  String toString() {
    return 'UserChangePassword(confirmPassword: $confirmPassword, currentPassword: $currentPassword, newPassword: $newPassword)';
  }
}

/// @nodoc
abstract mixin class _$UserChangePasswordCopyWith<$Res>
    implements $UserChangePasswordCopyWith<$Res> {
  factory _$UserChangePasswordCopyWith(
          _UserChangePassword value, $Res Function(_UserChangePassword) _then) =
      __$UserChangePasswordCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String confirmPassword, String currentPassword, String newPassword});
}

/// @nodoc
class __$UserChangePasswordCopyWithImpl<$Res>
    implements _$UserChangePasswordCopyWith<$Res> {
  __$UserChangePasswordCopyWithImpl(this._self, this._then);

  final _UserChangePassword _self;
  final $Res Function(_UserChangePassword) _then;

  /// Create a copy of UserChangePassword
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? confirmPassword = null,
    Object? currentPassword = null,
    Object? newPassword = null,
  }) {
    return _then(_UserChangePassword(
      confirmPassword: null == confirmPassword
          ? _self.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      currentPassword: null == currentPassword
          ? _self.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _self.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

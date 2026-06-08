// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setup_intent_reponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SetupIntentResponse {
  String get clientSecret;
  String? get setupIntentId;
  String? get stripeCustomerId;

  /// Create a copy of SetupIntentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetupIntentResponseCopyWith<SetupIntentResponse> get copyWith =>
      _$SetupIntentResponseCopyWithImpl<SetupIntentResponse>(
          this as SetupIntentResponse, _$identity);

  /// Serializes this SetupIntentResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetupIntentResponse &&
            (identical(other.clientSecret, clientSecret) ||
                other.clientSecret == clientSecret) &&
            (identical(other.setupIntentId, setupIntentId) ||
                other.setupIntentId == setupIntentId) &&
            (identical(other.stripeCustomerId, stripeCustomerId) ||
                other.stripeCustomerId == stripeCustomerId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clientSecret, setupIntentId, stripeCustomerId);

  @override
  String toString() {
    return 'SetupIntentResponse(clientSecret: $clientSecret, setupIntentId: $setupIntentId, stripeCustomerId: $stripeCustomerId)';
  }
}

/// @nodoc
abstract mixin class $SetupIntentResponseCopyWith<$Res> {
  factory $SetupIntentResponseCopyWith(
          SetupIntentResponse value, $Res Function(SetupIntentResponse) _then) =
      _$SetupIntentResponseCopyWithImpl;
  @useResult
  $Res call(
      {String clientSecret, String? setupIntentId, String? stripeCustomerId});
}

/// @nodoc
class _$SetupIntentResponseCopyWithImpl<$Res>
    implements $SetupIntentResponseCopyWith<$Res> {
  _$SetupIntentResponseCopyWithImpl(this._self, this._then);

  final SetupIntentResponse _self;
  final $Res Function(SetupIntentResponse) _then;

  /// Create a copy of SetupIntentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientSecret = null,
    Object? setupIntentId = freezed,
    Object? stripeCustomerId = freezed,
  }) {
    return _then(_self.copyWith(
      clientSecret: null == clientSecret
          ? _self.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String,
      setupIntentId: freezed == setupIntentId
          ? _self.setupIntentId
          : setupIntentId // ignore: cast_nullable_to_non_nullable
              as String?,
      stripeCustomerId: freezed == stripeCustomerId
          ? _self.stripeCustomerId
          : stripeCustomerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SetupIntentResponse].
extension SetupIntentResponsePatterns on SetupIntentResponse {
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
    TResult Function(_SetupIntentResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SetupIntentResponse() when $default != null:
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
    TResult Function(_SetupIntentResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SetupIntentResponse():
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
    TResult? Function(_SetupIntentResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SetupIntentResponse() when $default != null:
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
    TResult Function(String clientSecret, String? setupIntentId,
            String? stripeCustomerId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SetupIntentResponse() when $default != null:
        return $default(
            _that.clientSecret, _that.setupIntentId, _that.stripeCustomerId);
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
    TResult Function(String clientSecret, String? setupIntentId,
            String? stripeCustomerId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SetupIntentResponse():
        return $default(
            _that.clientSecret, _that.setupIntentId, _that.stripeCustomerId);
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
    TResult? Function(String clientSecret, String? setupIntentId,
            String? stripeCustomerId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SetupIntentResponse() when $default != null:
        return $default(
            _that.clientSecret, _that.setupIntentId, _that.stripeCustomerId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SetupIntentResponse implements SetupIntentResponse {
  _SetupIntentResponse(
      {required this.clientSecret, this.setupIntentId, this.stripeCustomerId});
  factory _SetupIntentResponse.fromJson(Map<String, dynamic> json) =>
      _$SetupIntentResponseFromJson(json);

  @override
  final String clientSecret;
  @override
  final String? setupIntentId;
  @override
  final String? stripeCustomerId;

  /// Create a copy of SetupIntentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SetupIntentResponseCopyWith<_SetupIntentResponse> get copyWith =>
      __$SetupIntentResponseCopyWithImpl<_SetupIntentResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SetupIntentResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetupIntentResponse &&
            (identical(other.clientSecret, clientSecret) ||
                other.clientSecret == clientSecret) &&
            (identical(other.setupIntentId, setupIntentId) ||
                other.setupIntentId == setupIntentId) &&
            (identical(other.stripeCustomerId, stripeCustomerId) ||
                other.stripeCustomerId == stripeCustomerId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clientSecret, setupIntentId, stripeCustomerId);

  @override
  String toString() {
    return 'SetupIntentResponse(clientSecret: $clientSecret, setupIntentId: $setupIntentId, stripeCustomerId: $stripeCustomerId)';
  }
}

/// @nodoc
abstract mixin class _$SetupIntentResponseCopyWith<$Res>
    implements $SetupIntentResponseCopyWith<$Res> {
  factory _$SetupIntentResponseCopyWith(_SetupIntentResponse value,
          $Res Function(_SetupIntentResponse) _then) =
      __$SetupIntentResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String clientSecret, String? setupIntentId, String? stripeCustomerId});
}

/// @nodoc
class __$SetupIntentResponseCopyWithImpl<$Res>
    implements _$SetupIntentResponseCopyWith<$Res> {
  __$SetupIntentResponseCopyWithImpl(this._self, this._then);

  final _SetupIntentResponse _self;
  final $Res Function(_SetupIntentResponse) _then;

  /// Create a copy of SetupIntentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? clientSecret = null,
    Object? setupIntentId = freezed,
    Object? stripeCustomerId = freezed,
  }) {
    return _then(_SetupIntentResponse(
      clientSecret: null == clientSecret
          ? _self.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String,
      setupIntentId: freezed == setupIntentId
          ? _self.setupIntentId
          : setupIntentId // ignore: cast_nullable_to_non_nullable
              as String?,
      stripeCustomerId: freezed == stripeCustomerId
          ? _self.stripeCustomerId
          : stripeCustomerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

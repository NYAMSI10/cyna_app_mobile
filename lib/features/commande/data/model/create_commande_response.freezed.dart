// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_commande_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateCommandeResponse {
  String? get orderId;
  String? get paymentIntentId;
  String? get clientSecret;
  String? get paymentStatus;
  String? get status;

  /// Create a copy of CreateCommandeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateCommandeResponseCopyWith<CreateCommandeResponse> get copyWith =>
      _$CreateCommandeResponseCopyWithImpl<CreateCommandeResponse>(
          this as CreateCommandeResponse, _$identity);

  /// Serializes this CreateCommandeResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateCommandeResponse &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.paymentIntentId, paymentIntentId) ||
                other.paymentIntentId == paymentIntentId) &&
            (identical(other.clientSecret, clientSecret) ||
                other.clientSecret == clientSecret) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, paymentIntentId,
      clientSecret, paymentStatus, status);

  @override
  String toString() {
    return 'CreateCommandeResponse(orderId: $orderId, paymentIntentId: $paymentIntentId, clientSecret: $clientSecret, paymentStatus: $paymentStatus, status: $status)';
  }
}

/// @nodoc
abstract mixin class $CreateCommandeResponseCopyWith<$Res> {
  factory $CreateCommandeResponseCopyWith(CreateCommandeResponse value,
          $Res Function(CreateCommandeResponse) _then) =
      _$CreateCommandeResponseCopyWithImpl;
  @useResult
  $Res call(
      {String? orderId,
      String? paymentIntentId,
      String? clientSecret,
      String? paymentStatus,
      String? status});
}

/// @nodoc
class _$CreateCommandeResponseCopyWithImpl<$Res>
    implements $CreateCommandeResponseCopyWith<$Res> {
  _$CreateCommandeResponseCopyWithImpl(this._self, this._then);

  final CreateCommandeResponse _self;
  final $Res Function(CreateCommandeResponse) _then;

  /// Create a copy of CreateCommandeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? paymentIntentId = freezed,
    Object? clientSecret = freezed,
    Object? paymentStatus = freezed,
    Object? status = freezed,
  }) {
    return _then(_self.copyWith(
      orderId: freezed == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentIntentId: freezed == paymentIntentId
          ? _self.paymentIntentId
          : paymentIntentId // ignore: cast_nullable_to_non_nullable
              as String?,
      clientSecret: freezed == clientSecret
          ? _self.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: freezed == paymentStatus
          ? _self.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CreateCommandeResponse].
extension CreateCommandeResponsePatterns on CreateCommandeResponse {
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
    TResult Function(_CreateCommandeResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateCommandeResponse() when $default != null:
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
    TResult Function(_CreateCommandeResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateCommandeResponse():
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
    TResult? Function(_CreateCommandeResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateCommandeResponse() when $default != null:
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
    TResult Function(String? orderId, String? paymentIntentId,
            String? clientSecret, String? paymentStatus, String? status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateCommandeResponse() when $default != null:
        return $default(_that.orderId, _that.paymentIntentId,
            _that.clientSecret, _that.paymentStatus, _that.status);
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
    TResult Function(String? orderId, String? paymentIntentId,
            String? clientSecret, String? paymentStatus, String? status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateCommandeResponse():
        return $default(_that.orderId, _that.paymentIntentId,
            _that.clientSecret, _that.paymentStatus, _that.status);
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
    TResult? Function(String? orderId, String? paymentIntentId,
            String? clientSecret, String? paymentStatus, String? status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateCommandeResponse() when $default != null:
        return $default(_that.orderId, _that.paymentIntentId,
            _that.clientSecret, _that.paymentStatus, _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CreateCommandeResponse implements CreateCommandeResponse {
  _CreateCommandeResponse(
      {this.orderId,
      this.paymentIntentId,
      this.clientSecret,
      this.paymentStatus,
      this.status});
  factory _CreateCommandeResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCommandeResponseFromJson(json);

  @override
  final String? orderId;
  @override
  final String? paymentIntentId;
  @override
  final String? clientSecret;
  @override
  final String? paymentStatus;
  @override
  final String? status;

  /// Create a copy of CreateCommandeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateCommandeResponseCopyWith<_CreateCommandeResponse> get copyWith =>
      __$CreateCommandeResponseCopyWithImpl<_CreateCommandeResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateCommandeResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateCommandeResponse &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.paymentIntentId, paymentIntentId) ||
                other.paymentIntentId == paymentIntentId) &&
            (identical(other.clientSecret, clientSecret) ||
                other.clientSecret == clientSecret) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, paymentIntentId,
      clientSecret, paymentStatus, status);

  @override
  String toString() {
    return 'CreateCommandeResponse(orderId: $orderId, paymentIntentId: $paymentIntentId, clientSecret: $clientSecret, paymentStatus: $paymentStatus, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$CreateCommandeResponseCopyWith<$Res>
    implements $CreateCommandeResponseCopyWith<$Res> {
  factory _$CreateCommandeResponseCopyWith(_CreateCommandeResponse value,
          $Res Function(_CreateCommandeResponse) _then) =
      __$CreateCommandeResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? orderId,
      String? paymentIntentId,
      String? clientSecret,
      String? paymentStatus,
      String? status});
}

/// @nodoc
class __$CreateCommandeResponseCopyWithImpl<$Res>
    implements _$CreateCommandeResponseCopyWith<$Res> {
  __$CreateCommandeResponseCopyWithImpl(this._self, this._then);

  final _CreateCommandeResponse _self;
  final $Res Function(_CreateCommandeResponse) _then;

  /// Create a copy of CreateCommandeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? orderId = freezed,
    Object? paymentIntentId = freezed,
    Object? clientSecret = freezed,
    Object? paymentStatus = freezed,
    Object? status = freezed,
  }) {
    return _then(_CreateCommandeResponse(
      orderId: freezed == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentIntentId: freezed == paymentIntentId
          ? _self.paymentIntentId
          : paymentIntentId // ignore: cast_nullable_to_non_nullable
              as String?,
      clientSecret: freezed == clientSecret
          ? _self.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: freezed == paymentStatus
          ? _self.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carte_bancaire_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CarteBancaireRequest {
  String get carteName;
  String? get stripePaymentMethodId;
  bool? get isDefault;

  /// Create a copy of CarteBancaireRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CarteBancaireRequestCopyWith<CarteBancaireRequest> get copyWith =>
      _$CarteBancaireRequestCopyWithImpl<CarteBancaireRequest>(
          this as CarteBancaireRequest, _$identity);

  /// Serializes this CarteBancaireRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CarteBancaireRequest &&
            (identical(other.carteName, carteName) ||
                other.carteName == carteName) &&
            (identical(other.stripePaymentMethodId, stripePaymentMethodId) ||
                other.stripePaymentMethodId == stripePaymentMethodId) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, carteName, stripePaymentMethodId, isDefault);

  @override
  String toString() {
    return 'CarteBancaireRequest(carteName: $carteName, stripePaymentMethodId: $stripePaymentMethodId, isDefault: $isDefault)';
  }
}

/// @nodoc
abstract mixin class $CarteBancaireRequestCopyWith<$Res> {
  factory $CarteBancaireRequestCopyWith(CarteBancaireRequest value,
          $Res Function(CarteBancaireRequest) _then) =
      _$CarteBancaireRequestCopyWithImpl;
  @useResult
  $Res call({String carteName, String? stripePaymentMethodId, bool? isDefault});
}

/// @nodoc
class _$CarteBancaireRequestCopyWithImpl<$Res>
    implements $CarteBancaireRequestCopyWith<$Res> {
  _$CarteBancaireRequestCopyWithImpl(this._self, this._then);

  final CarteBancaireRequest _self;
  final $Res Function(CarteBancaireRequest) _then;

  /// Create a copy of CarteBancaireRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carteName = null,
    Object? stripePaymentMethodId = freezed,
    Object? isDefault = freezed,
  }) {
    return _then(_self.copyWith(
      carteName: null == carteName
          ? _self.carteName
          : carteName // ignore: cast_nullable_to_non_nullable
              as String,
      stripePaymentMethodId: freezed == stripePaymentMethodId
          ? _self.stripePaymentMethodId
          : stripePaymentMethodId // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: freezed == isDefault
          ? _self.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CarteBancaireRequest].
extension CarteBancaireRequestPatterns on CarteBancaireRequest {
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
    TResult Function(_CarteBancaireRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CarteBancaireRequest() when $default != null:
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
    TResult Function(_CarteBancaireRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CarteBancaireRequest():
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
    TResult? Function(_CarteBancaireRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CarteBancaireRequest() when $default != null:
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
            String carteName, String? stripePaymentMethodId, bool? isDefault)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CarteBancaireRequest() when $default != null:
        return $default(
            _that.carteName, _that.stripePaymentMethodId, _that.isDefault);
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
            String carteName, String? stripePaymentMethodId, bool? isDefault)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CarteBancaireRequest():
        return $default(
            _that.carteName, _that.stripePaymentMethodId, _that.isDefault);
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
            String carteName, String? stripePaymentMethodId, bool? isDefault)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CarteBancaireRequest() when $default != null:
        return $default(
            _that.carteName, _that.stripePaymentMethodId, _that.isDefault);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CarteBancaireRequest implements CarteBancaireRequest {
  _CarteBancaireRequest(
      {required this.carteName, this.stripePaymentMethodId, this.isDefault});
  factory _CarteBancaireRequest.fromJson(Map<String, dynamic> json) =>
      _$CarteBancaireRequestFromJson(json);

  @override
  final String carteName;
  @override
  final String? stripePaymentMethodId;
  @override
  final bool? isDefault;

  /// Create a copy of CarteBancaireRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CarteBancaireRequestCopyWith<_CarteBancaireRequest> get copyWith =>
      __$CarteBancaireRequestCopyWithImpl<_CarteBancaireRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CarteBancaireRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CarteBancaireRequest &&
            (identical(other.carteName, carteName) ||
                other.carteName == carteName) &&
            (identical(other.stripePaymentMethodId, stripePaymentMethodId) ||
                other.stripePaymentMethodId == stripePaymentMethodId) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, carteName, stripePaymentMethodId, isDefault);

  @override
  String toString() {
    return 'CarteBancaireRequest(carteName: $carteName, stripePaymentMethodId: $stripePaymentMethodId, isDefault: $isDefault)';
  }
}

/// @nodoc
abstract mixin class _$CarteBancaireRequestCopyWith<$Res>
    implements $CarteBancaireRequestCopyWith<$Res> {
  factory _$CarteBancaireRequestCopyWith(_CarteBancaireRequest value,
          $Res Function(_CarteBancaireRequest) _then) =
      __$CarteBancaireRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String carteName, String? stripePaymentMethodId, bool? isDefault});
}

/// @nodoc
class __$CarteBancaireRequestCopyWithImpl<$Res>
    implements _$CarteBancaireRequestCopyWith<$Res> {
  __$CarteBancaireRequestCopyWithImpl(this._self, this._then);

  final _CarteBancaireRequest _self;
  final $Res Function(_CarteBancaireRequest) _then;

  /// Create a copy of CarteBancaireRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? carteName = null,
    Object? stripePaymentMethodId = freezed,
    Object? isDefault = freezed,
  }) {
    return _then(_CarteBancaireRequest(
      carteName: null == carteName
          ? _self.carteName
          : carteName // ignore: cast_nullable_to_non_nullable
              as String,
      stripePaymentMethodId: freezed == stripePaymentMethodId
          ? _self.stripePaymentMethodId
          : stripePaymentMethodId // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: freezed == isDefault
          ? _self.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on

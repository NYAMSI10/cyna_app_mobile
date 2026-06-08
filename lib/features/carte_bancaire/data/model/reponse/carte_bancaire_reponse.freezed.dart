// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carte_bancaire_reponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CarteBancaireResponse {
// ignore: invalid_annotation_target
  @JsonKey(name: '_id')
  String get id;
  String get carteName;
  String get carteNumber;
  String get carteDate;
  String? get carteCVV;
  bool? get isDefault;
  String? get stripePaymentMethodId;
  String? get stripeCustomerId;

  /// Create a copy of CarteBancaireResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CarteBancaireResponseCopyWith<CarteBancaireResponse> get copyWith =>
      _$CarteBancaireResponseCopyWithImpl<CarteBancaireResponse>(
          this as CarteBancaireResponse, _$identity);

  /// Serializes this CarteBancaireResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CarteBancaireResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.carteName, carteName) ||
                other.carteName == carteName) &&
            (identical(other.carteNumber, carteNumber) ||
                other.carteNumber == carteNumber) &&
            (identical(other.carteDate, carteDate) ||
                other.carteDate == carteDate) &&
            (identical(other.carteCVV, carteCVV) ||
                other.carteCVV == carteCVV) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.stripePaymentMethodId, stripePaymentMethodId) ||
                other.stripePaymentMethodId == stripePaymentMethodId) &&
            (identical(other.stripeCustomerId, stripeCustomerId) ||
                other.stripeCustomerId == stripeCustomerId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, carteName, carteNumber,
      carteDate, carteCVV, isDefault, stripePaymentMethodId, stripeCustomerId);

  @override
  String toString() {
    return 'CarteBancaireResponse(id: $id, carteName: $carteName, carteNumber: $carteNumber, carteDate: $carteDate, carteCVV: $carteCVV, isDefault: $isDefault, stripePaymentMethodId: $stripePaymentMethodId, stripeCustomerId: $stripeCustomerId)';
  }
}

/// @nodoc
abstract mixin class $CarteBancaireResponseCopyWith<$Res> {
  factory $CarteBancaireResponseCopyWith(CarteBancaireResponse value,
          $Res Function(CarteBancaireResponse) _then) =
      _$CarteBancaireResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String carteName,
      String carteNumber,
      String carteDate,
      String? carteCVV,
      bool? isDefault,
      String? stripePaymentMethodId,
      String? stripeCustomerId});
}

/// @nodoc
class _$CarteBancaireResponseCopyWithImpl<$Res>
    implements $CarteBancaireResponseCopyWith<$Res> {
  _$CarteBancaireResponseCopyWithImpl(this._self, this._then);

  final CarteBancaireResponse _self;
  final $Res Function(CarteBancaireResponse) _then;

  /// Create a copy of CarteBancaireResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? carteName = null,
    Object? carteNumber = null,
    Object? carteDate = null,
    Object? carteCVV = freezed,
    Object? isDefault = freezed,
    Object? stripePaymentMethodId = freezed,
    Object? stripeCustomerId = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      carteName: null == carteName
          ? _self.carteName
          : carteName // ignore: cast_nullable_to_non_nullable
              as String,
      carteNumber: null == carteNumber
          ? _self.carteNumber
          : carteNumber // ignore: cast_nullable_to_non_nullable
              as String,
      carteDate: null == carteDate
          ? _self.carteDate
          : carteDate // ignore: cast_nullable_to_non_nullable
              as String,
      carteCVV: freezed == carteCVV
          ? _self.carteCVV
          : carteCVV // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: freezed == isDefault
          ? _self.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      stripePaymentMethodId: freezed == stripePaymentMethodId
          ? _self.stripePaymentMethodId
          : stripePaymentMethodId // ignore: cast_nullable_to_non_nullable
              as String?,
      stripeCustomerId: freezed == stripeCustomerId
          ? _self.stripeCustomerId
          : stripeCustomerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CarteBancaireResponse].
extension CarteBancaireResponsePatterns on CarteBancaireResponse {
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
    TResult Function(_CarteBancaireResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CarteBancaireResponse() when $default != null:
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
    TResult Function(_CarteBancaireResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CarteBancaireResponse():
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
    TResult? Function(_CarteBancaireResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CarteBancaireResponse() when $default != null:
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
            @JsonKey(name: '_id') String id,
            String carteName,
            String carteNumber,
            String carteDate,
            String? carteCVV,
            bool? isDefault,
            String? stripePaymentMethodId,
            String? stripeCustomerId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CarteBancaireResponse() when $default != null:
        return $default(
            _that.id,
            _that.carteName,
            _that.carteNumber,
            _that.carteDate,
            _that.carteCVV,
            _that.isDefault,
            _that.stripePaymentMethodId,
            _that.stripeCustomerId);
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
            @JsonKey(name: '_id') String id,
            String carteName,
            String carteNumber,
            String carteDate,
            String? carteCVV,
            bool? isDefault,
            String? stripePaymentMethodId,
            String? stripeCustomerId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CarteBancaireResponse():
        return $default(
            _that.id,
            _that.carteName,
            _that.carteNumber,
            _that.carteDate,
            _that.carteCVV,
            _that.isDefault,
            _that.stripePaymentMethodId,
            _that.stripeCustomerId);
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
            @JsonKey(name: '_id') String id,
            String carteName,
            String carteNumber,
            String carteDate,
            String? carteCVV,
            bool? isDefault,
            String? stripePaymentMethodId,
            String? stripeCustomerId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CarteBancaireResponse() when $default != null:
        return $default(
            _that.id,
            _that.carteName,
            _that.carteNumber,
            _that.carteDate,
            _that.carteCVV,
            _that.isDefault,
            _that.stripePaymentMethodId,
            _that.stripeCustomerId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CarteBancaireResponse implements CarteBancaireResponse {
  _CarteBancaireResponse(
      {@JsonKey(name: '_id') required this.id,
      required this.carteName,
      required this.carteNumber,
      required this.carteDate,
      this.carteCVV,
      this.isDefault,
      this.stripePaymentMethodId,
      this.stripeCustomerId});
  factory _CarteBancaireResponse.fromJson(Map<String, dynamic> json) =>
      _$CarteBancaireResponseFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String carteName;
  @override
  final String carteNumber;
  @override
  final String carteDate;
  @override
  final String? carteCVV;
  @override
  final bool? isDefault;
  @override
  final String? stripePaymentMethodId;
  @override
  final String? stripeCustomerId;

  /// Create a copy of CarteBancaireResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CarteBancaireResponseCopyWith<_CarteBancaireResponse> get copyWith =>
      __$CarteBancaireResponseCopyWithImpl<_CarteBancaireResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CarteBancaireResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CarteBancaireResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.carteName, carteName) ||
                other.carteName == carteName) &&
            (identical(other.carteNumber, carteNumber) ||
                other.carteNumber == carteNumber) &&
            (identical(other.carteDate, carteDate) ||
                other.carteDate == carteDate) &&
            (identical(other.carteCVV, carteCVV) ||
                other.carteCVV == carteCVV) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.stripePaymentMethodId, stripePaymentMethodId) ||
                other.stripePaymentMethodId == stripePaymentMethodId) &&
            (identical(other.stripeCustomerId, stripeCustomerId) ||
                other.stripeCustomerId == stripeCustomerId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, carteName, carteNumber,
      carteDate, carteCVV, isDefault, stripePaymentMethodId, stripeCustomerId);

  @override
  String toString() {
    return 'CarteBancaireResponse(id: $id, carteName: $carteName, carteNumber: $carteNumber, carteDate: $carteDate, carteCVV: $carteCVV, isDefault: $isDefault, stripePaymentMethodId: $stripePaymentMethodId, stripeCustomerId: $stripeCustomerId)';
  }
}

/// @nodoc
abstract mixin class _$CarteBancaireResponseCopyWith<$Res>
    implements $CarteBancaireResponseCopyWith<$Res> {
  factory _$CarteBancaireResponseCopyWith(_CarteBancaireResponse value,
          $Res Function(_CarteBancaireResponse) _then) =
      __$CarteBancaireResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String carteName,
      String carteNumber,
      String carteDate,
      String? carteCVV,
      bool? isDefault,
      String? stripePaymentMethodId,
      String? stripeCustomerId});
}

/// @nodoc
class __$CarteBancaireResponseCopyWithImpl<$Res>
    implements _$CarteBancaireResponseCopyWith<$Res> {
  __$CarteBancaireResponseCopyWithImpl(this._self, this._then);

  final _CarteBancaireResponse _self;
  final $Res Function(_CarteBancaireResponse) _then;

  /// Create a copy of CarteBancaireResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? carteName = null,
    Object? carteNumber = null,
    Object? carteDate = null,
    Object? carteCVV = freezed,
    Object? isDefault = freezed,
    Object? stripePaymentMethodId = freezed,
    Object? stripeCustomerId = freezed,
  }) {
    return _then(_CarteBancaireResponse(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      carteName: null == carteName
          ? _self.carteName
          : carteName // ignore: cast_nullable_to_non_nullable
              as String,
      carteNumber: null == carteNumber
          ? _self.carteNumber
          : carteNumber // ignore: cast_nullable_to_non_nullable
              as String,
      carteDate: null == carteDate
          ? _self.carteDate
          : carteDate // ignore: cast_nullable_to_non_nullable
              as String,
      carteCVV: freezed == carteCVV
          ? _self.carteCVV
          : carteCVV // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: freezed == isDefault
          ? _self.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      stripePaymentMethodId: freezed == stripePaymentMethodId
          ? _self.stripePaymentMethodId
          : stripePaymentMethodId // ignore: cast_nullable_to_non_nullable
              as String?,
      stripeCustomerId: freezed == stripeCustomerId
          ? _self.stripeCustomerId
          : stripeCustomerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'abonnement_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AbonnementResponse {
  @JsonKey(name: '_id')
  String
      get id; // Changement ici : paramètre nommé sans _, annotation pour le JSON
  String get dateFin;
  String get dateDebut;
  int get quantity;
  String get keyLicence;
  String get periode;
  int get price;
  String get statut;
  ProductResponse get product;

  /// Create a copy of AbonnementResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AbonnementResponseCopyWith<AbonnementResponse> get copyWith =>
      _$AbonnementResponseCopyWithImpl<AbonnementResponse>(
          this as AbonnementResponse, _$identity);

  /// Serializes this AbonnementResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AbonnementResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dateFin, dateFin) || other.dateFin == dateFin) &&
            (identical(other.dateDebut, dateDebut) ||
                other.dateDebut == dateDebut) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.keyLicence, keyLicence) ||
                other.keyLicence == keyLicence) &&
            (identical(other.periode, periode) || other.periode == periode) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.statut, statut) || other.statut == statut) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, dateFin, dateDebut, quantity,
      keyLicence, periode, price, statut, product);

  @override
  String toString() {
    return 'AbonnementResponse(id: $id, dateFin: $dateFin, dateDebut: $dateDebut, quantity: $quantity, keyLicence: $keyLicence, periode: $periode, price: $price, statut: $statut, product: $product)';
  }
}

/// @nodoc
abstract mixin class $AbonnementResponseCopyWith<$Res> {
  factory $AbonnementResponseCopyWith(
          AbonnementResponse value, $Res Function(AbonnementResponse) _then) =
      _$AbonnementResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String dateFin,
      String dateDebut,
      int quantity,
      String keyLicence,
      String periode,
      int price,
      String statut,
      ProductResponse product});

  $ProductResponseCopyWith<$Res> get product;
}

/// @nodoc
class _$AbonnementResponseCopyWithImpl<$Res>
    implements $AbonnementResponseCopyWith<$Res> {
  _$AbonnementResponseCopyWithImpl(this._self, this._then);

  final AbonnementResponse _self;
  final $Res Function(AbonnementResponse) _then;

  /// Create a copy of AbonnementResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dateFin = null,
    Object? dateDebut = null,
    Object? quantity = null,
    Object? keyLicence = null,
    Object? periode = null,
    Object? price = null,
    Object? statut = null,
    Object? product = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dateFin: null == dateFin
          ? _self.dateFin
          : dateFin // ignore: cast_nullable_to_non_nullable
              as String,
      dateDebut: null == dateDebut
          ? _self.dateDebut
          : dateDebut // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      keyLicence: null == keyLicence
          ? _self.keyLicence
          : keyLicence // ignore: cast_nullable_to_non_nullable
              as String,
      periode: null == periode
          ? _self.periode
          : periode // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      statut: null == statut
          ? _self.statut
          : statut // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductResponse,
    ));
  }

  /// Create a copy of AbonnementResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductResponseCopyWith<$Res> get product {
    return $ProductResponseCopyWith<$Res>(_self.product, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AbonnementResponse].
extension AbonnementResponsePatterns on AbonnementResponse {
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
    TResult Function(_AbonnementResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AbonnementResponse() when $default != null:
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
    TResult Function(_AbonnementResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AbonnementResponse():
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
    TResult? Function(_AbonnementResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AbonnementResponse() when $default != null:
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
            String dateFin,
            String dateDebut,
            int quantity,
            String keyLicence,
            String periode,
            int price,
            String statut,
            ProductResponse product)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AbonnementResponse() when $default != null:
        return $default(
            _that.id,
            _that.dateFin,
            _that.dateDebut,
            _that.quantity,
            _that.keyLicence,
            _that.periode,
            _that.price,
            _that.statut,
            _that.product);
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
            String dateFin,
            String dateDebut,
            int quantity,
            String keyLicence,
            String periode,
            int price,
            String statut,
            ProductResponse product)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AbonnementResponse():
        return $default(
            _that.id,
            _that.dateFin,
            _that.dateDebut,
            _that.quantity,
            _that.keyLicence,
            _that.periode,
            _that.price,
            _that.statut,
            _that.product);
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
            String dateFin,
            String dateDebut,
            int quantity,
            String keyLicence,
            String periode,
            int price,
            String statut,
            ProductResponse product)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AbonnementResponse() when $default != null:
        return $default(
            _that.id,
            _that.dateFin,
            _that.dateDebut,
            _that.quantity,
            _that.keyLicence,
            _that.periode,
            _that.price,
            _that.statut,
            _that.product);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AbonnementResponse implements AbonnementResponse {
  _AbonnementResponse(
      {@JsonKey(name: '_id') required this.id,
      required this.dateFin,
      required this.dateDebut,
      required this.quantity,
      required this.keyLicence,
      required this.periode,
      required this.price,
      required this.statut,
      required this.product});
  factory _AbonnementResponse.fromJson(Map<String, dynamic> json) =>
      _$AbonnementResponseFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  final String id;
// Changement ici : paramètre nommé sans _, annotation pour le JSON
  @override
  final String dateFin;
  @override
  final String dateDebut;
  @override
  final int quantity;
  @override
  final String keyLicence;
  @override
  final String periode;
  @override
  final int price;
  @override
  final String statut;
  @override
  final ProductResponse product;

  /// Create a copy of AbonnementResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AbonnementResponseCopyWith<_AbonnementResponse> get copyWith =>
      __$AbonnementResponseCopyWithImpl<_AbonnementResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AbonnementResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AbonnementResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dateFin, dateFin) || other.dateFin == dateFin) &&
            (identical(other.dateDebut, dateDebut) ||
                other.dateDebut == dateDebut) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.keyLicence, keyLicence) ||
                other.keyLicence == keyLicence) &&
            (identical(other.periode, periode) || other.periode == periode) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.statut, statut) || other.statut == statut) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, dateFin, dateDebut, quantity,
      keyLicence, periode, price, statut, product);

  @override
  String toString() {
    return 'AbonnementResponse(id: $id, dateFin: $dateFin, dateDebut: $dateDebut, quantity: $quantity, keyLicence: $keyLicence, periode: $periode, price: $price, statut: $statut, product: $product)';
  }
}

/// @nodoc
abstract mixin class _$AbonnementResponseCopyWith<$Res>
    implements $AbonnementResponseCopyWith<$Res> {
  factory _$AbonnementResponseCopyWith(
          _AbonnementResponse value, $Res Function(_AbonnementResponse) _then) =
      __$AbonnementResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String dateFin,
      String dateDebut,
      int quantity,
      String keyLicence,
      String periode,
      int price,
      String statut,
      ProductResponse product});

  @override
  $ProductResponseCopyWith<$Res> get product;
}

/// @nodoc
class __$AbonnementResponseCopyWithImpl<$Res>
    implements _$AbonnementResponseCopyWith<$Res> {
  __$AbonnementResponseCopyWithImpl(this._self, this._then);

  final _AbonnementResponse _self;
  final $Res Function(_AbonnementResponse) _then;

  /// Create a copy of AbonnementResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? dateFin = null,
    Object? dateDebut = null,
    Object? quantity = null,
    Object? keyLicence = null,
    Object? periode = null,
    Object? price = null,
    Object? statut = null,
    Object? product = null,
  }) {
    return _then(_AbonnementResponse(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dateFin: null == dateFin
          ? _self.dateFin
          : dateFin // ignore: cast_nullable_to_non_nullable
              as String,
      dateDebut: null == dateDebut
          ? _self.dateDebut
          : dateDebut // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      keyLicence: null == keyLicence
          ? _self.keyLicence
          : keyLicence // ignore: cast_nullable_to_non_nullable
              as String,
      periode: null == periode
          ? _self.periode
          : periode // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      statut: null == statut
          ? _self.statut
          : statut // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductResponse,
    ));
  }

  /// Create a copy of AbonnementResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductResponseCopyWith<$Res> get product {
    return $ProductResponseCopyWith<$Res>(_self.product, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}

// dart format on

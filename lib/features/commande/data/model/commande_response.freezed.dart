// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'commande_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommandeResponse {
  @JsonKey(name: '_id')
  String
      get id; // Changement ici : paramètre nommé sans _, annotation pour le JSON
  String get reference;
  String get periode;
  int get nbreProducts;
  int get totalPrice;
  String get statut;
  List<AbonnementResponse> get abonnements;

  /// Create a copy of CommandeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommandeResponseCopyWith<CommandeResponse> get copyWith =>
      _$CommandeResponseCopyWithImpl<CommandeResponse>(
          this as CommandeResponse, _$identity);

  /// Serializes this CommandeResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommandeResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.periode, periode) || other.periode == periode) &&
            (identical(other.nbreProducts, nbreProducts) ||
                other.nbreProducts == nbreProducts) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.statut, statut) || other.statut == statut) &&
            const DeepCollectionEquality()
                .equals(other.abonnements, abonnements));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      reference,
      periode,
      nbreProducts,
      totalPrice,
      statut,
      const DeepCollectionEquality().hash(abonnements));

  @override
  String toString() {
    return 'CommandeResponse(id: $id, reference: $reference, periode: $periode, nbreProducts: $nbreProducts, totalPrice: $totalPrice, statut: $statut, abonnements: $abonnements)';
  }
}

/// @nodoc
abstract mixin class $CommandeResponseCopyWith<$Res> {
  factory $CommandeResponseCopyWith(
          CommandeResponse value, $Res Function(CommandeResponse) _then) =
      _$CommandeResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String reference,
      String periode,
      int nbreProducts,
      int totalPrice,
      String statut,
      List<AbonnementResponse> abonnements});
}

/// @nodoc
class _$CommandeResponseCopyWithImpl<$Res>
    implements $CommandeResponseCopyWith<$Res> {
  _$CommandeResponseCopyWithImpl(this._self, this._then);

  final CommandeResponse _self;
  final $Res Function(CommandeResponse) _then;

  /// Create a copy of CommandeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reference = null,
    Object? periode = null,
    Object? nbreProducts = null,
    Object? totalPrice = null,
    Object? statut = null,
    Object? abonnements = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _self.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      periode: null == periode
          ? _self.periode
          : periode // ignore: cast_nullable_to_non_nullable
              as String,
      nbreProducts: null == nbreProducts
          ? _self.nbreProducts
          : nbreProducts // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _self.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      statut: null == statut
          ? _self.statut
          : statut // ignore: cast_nullable_to_non_nullable
              as String,
      abonnements: null == abonnements
          ? _self.abonnements
          : abonnements // ignore: cast_nullable_to_non_nullable
              as List<AbonnementResponse>,
    ));
  }
}

/// Adds pattern-matching-related methods to [CommandeResponse].
extension CommandeResponsePatterns on CommandeResponse {
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
    TResult Function(_CommandeResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CommandeResponse() when $default != null:
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
    TResult Function(_CommandeResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommandeResponse():
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
    TResult? Function(_CommandeResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommandeResponse() when $default != null:
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
            String reference,
            String periode,
            int nbreProducts,
            int totalPrice,
            String statut,
            List<AbonnementResponse> abonnements)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CommandeResponse() when $default != null:
        return $default(
            _that.id,
            _that.reference,
            _that.periode,
            _that.nbreProducts,
            _that.totalPrice,
            _that.statut,
            _that.abonnements);
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
            String reference,
            String periode,
            int nbreProducts,
            int totalPrice,
            String statut,
            List<AbonnementResponse> abonnements)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommandeResponse():
        return $default(
            _that.id,
            _that.reference,
            _that.periode,
            _that.nbreProducts,
            _that.totalPrice,
            _that.statut,
            _that.abonnements);
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
            String reference,
            String periode,
            int nbreProducts,
            int totalPrice,
            String statut,
            List<AbonnementResponse> abonnements)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommandeResponse() when $default != null:
        return $default(
            _that.id,
            _that.reference,
            _that.periode,
            _that.nbreProducts,
            _that.totalPrice,
            _that.statut,
            _that.abonnements);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CommandeResponse implements CommandeResponse {
  _CommandeResponse(
      {@JsonKey(name: '_id') required this.id,
      required this.reference,
      required this.periode,
      required this.nbreProducts,
      required this.totalPrice,
      required this.statut,
      required final List<AbonnementResponse> abonnements})
      : _abonnements = abonnements;
  factory _CommandeResponse.fromJson(Map<String, dynamic> json) =>
      _$CommandeResponseFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  final String id;
// Changement ici : paramètre nommé sans _, annotation pour le JSON
  @override
  final String reference;
  @override
  final String periode;
  @override
  final int nbreProducts;
  @override
  final int totalPrice;
  @override
  final String statut;
  final List<AbonnementResponse> _abonnements;
  @override
  List<AbonnementResponse> get abonnements {
    if (_abonnements is EqualUnmodifiableListView) return _abonnements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_abonnements);
  }

  /// Create a copy of CommandeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CommandeResponseCopyWith<_CommandeResponse> get copyWith =>
      __$CommandeResponseCopyWithImpl<_CommandeResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CommandeResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommandeResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.periode, periode) || other.periode == periode) &&
            (identical(other.nbreProducts, nbreProducts) ||
                other.nbreProducts == nbreProducts) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.statut, statut) || other.statut == statut) &&
            const DeepCollectionEquality()
                .equals(other._abonnements, _abonnements));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      reference,
      periode,
      nbreProducts,
      totalPrice,
      statut,
      const DeepCollectionEquality().hash(_abonnements));

  @override
  String toString() {
    return 'CommandeResponse(id: $id, reference: $reference, periode: $periode, nbreProducts: $nbreProducts, totalPrice: $totalPrice, statut: $statut, abonnements: $abonnements)';
  }
}

/// @nodoc
abstract mixin class _$CommandeResponseCopyWith<$Res>
    implements $CommandeResponseCopyWith<$Res> {
  factory _$CommandeResponseCopyWith(
          _CommandeResponse value, $Res Function(_CommandeResponse) _then) =
      __$CommandeResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String reference,
      String periode,
      int nbreProducts,
      int totalPrice,
      String statut,
      List<AbonnementResponse> abonnements});
}

/// @nodoc
class __$CommandeResponseCopyWithImpl<$Res>
    implements _$CommandeResponseCopyWith<$Res> {
  __$CommandeResponseCopyWithImpl(this._self, this._then);

  final _CommandeResponse _self;
  final $Res Function(_CommandeResponse) _then;

  /// Create a copy of CommandeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? reference = null,
    Object? periode = null,
    Object? nbreProducts = null,
    Object? totalPrice = null,
    Object? statut = null,
    Object? abonnements = null,
  }) {
    return _then(_CommandeResponse(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _self.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      periode: null == periode
          ? _self.periode
          : periode // ignore: cast_nullable_to_non_nullable
              as String,
      nbreProducts: null == nbreProducts
          ? _self.nbreProducts
          : nbreProducts // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _self.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      statut: null == statut
          ? _self.statut
          : statut // ignore: cast_nullable_to_non_nullable
              as String,
      abonnements: null == abonnements
          ? _self._abonnements
          : abonnements // ignore: cast_nullable_to_non_nullable
              as List<AbonnementResponse>,
    ));
  }
}

// dart format on

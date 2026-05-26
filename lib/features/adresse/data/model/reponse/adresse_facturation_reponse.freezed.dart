// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adresse_facturation_reponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdresseFacturationResponse {
// ignore: invalid_annotation_target
  @JsonKey(name: '_id')
  String? get id;
  String get firstName;
  String get lastName;
  String get adresse;
  String? get complementAdresse;
  String get city;
  String get codePostal;
  String get region;
  String get country;
  String get phone;
  bool? get isDefault;

  /// Create a copy of AdresseFacturationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdresseFacturationResponseCopyWith<AdresseFacturationResponse>
      get copyWith =>
          _$AdresseFacturationResponseCopyWithImpl<AdresseFacturationResponse>(
              this as AdresseFacturationResponse, _$identity);

  /// Serializes this AdresseFacturationResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdresseFacturationResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.adresse, adresse) || other.adresse == adresse) &&
            (identical(other.complementAdresse, complementAdresse) ||
                other.complementAdresse == complementAdresse) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.codePostal, codePostal) ||
                other.codePostal == codePostal) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, adresse,
      complementAdresse, city, codePostal, region, country, phone, isDefault);

  @override
  String toString() {
    return 'AdresseFacturationResponse(id: $id, firstName: $firstName, lastName: $lastName, adresse: $adresse, complementAdresse: $complementAdresse, city: $city, codePostal: $codePostal, region: $region, country: $country, phone: $phone, isDefault: $isDefault)';
  }
}

/// @nodoc
abstract mixin class $AdresseFacturationResponseCopyWith<$Res> {
  factory $AdresseFacturationResponseCopyWith(AdresseFacturationResponse value,
          $Res Function(AdresseFacturationResponse) _then) =
      _$AdresseFacturationResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String firstName,
      String lastName,
      String adresse,
      String? complementAdresse,
      String city,
      String codePostal,
      String region,
      String country,
      String phone,
      bool? isDefault});
}

/// @nodoc
class _$AdresseFacturationResponseCopyWithImpl<$Res>
    implements $AdresseFacturationResponseCopyWith<$Res> {
  _$AdresseFacturationResponseCopyWithImpl(this._self, this._then);

  final AdresseFacturationResponse _self;
  final $Res Function(AdresseFacturationResponse) _then;

  /// Create a copy of AdresseFacturationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? adresse = null,
    Object? complementAdresse = freezed,
    Object? city = null,
    Object? codePostal = null,
    Object? region = null,
    Object? country = null,
    Object? phone = null,
    Object? isDefault = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      adresse: null == adresse
          ? _self.adresse
          : adresse // ignore: cast_nullable_to_non_nullable
              as String,
      complementAdresse: freezed == complementAdresse
          ? _self.complementAdresse
          : complementAdresse // ignore: cast_nullable_to_non_nullable
              as String?,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      codePostal: null == codePostal
          ? _self.codePostal
          : codePostal // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: freezed == isDefault
          ? _self.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AdresseFacturationResponse].
extension AdresseFacturationResponsePatterns on AdresseFacturationResponse {
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
    TResult Function(_AdresseFacturationResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdresseFacturationResponse() when $default != null:
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
    TResult Function(_AdresseFacturationResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdresseFacturationResponse():
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
    TResult? Function(_AdresseFacturationResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdresseFacturationResponse() when $default != null:
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
            @JsonKey(name: '_id') String? id,
            String firstName,
            String lastName,
            String adresse,
            String? complementAdresse,
            String city,
            String codePostal,
            String region,
            String country,
            String phone,
            bool? isDefault)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdresseFacturationResponse() when $default != null:
        return $default(
            _that.id,
            _that.firstName,
            _that.lastName,
            _that.adresse,
            _that.complementAdresse,
            _that.city,
            _that.codePostal,
            _that.region,
            _that.country,
            _that.phone,
            _that.isDefault);
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
            @JsonKey(name: '_id') String? id,
            String firstName,
            String lastName,
            String adresse,
            String? complementAdresse,
            String city,
            String codePostal,
            String region,
            String country,
            String phone,
            bool? isDefault)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdresseFacturationResponse():
        return $default(
            _that.id,
            _that.firstName,
            _that.lastName,
            _that.adresse,
            _that.complementAdresse,
            _that.city,
            _that.codePostal,
            _that.region,
            _that.country,
            _that.phone,
            _that.isDefault);
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
            @JsonKey(name: '_id') String? id,
            String firstName,
            String lastName,
            String adresse,
            String? complementAdresse,
            String city,
            String codePostal,
            String region,
            String country,
            String phone,
            bool? isDefault)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdresseFacturationResponse() when $default != null:
        return $default(
            _that.id,
            _that.firstName,
            _that.lastName,
            _that.adresse,
            _that.complementAdresse,
            _that.city,
            _that.codePostal,
            _that.region,
            _that.country,
            _that.phone,
            _that.isDefault);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AdresseFacturationResponse implements AdresseFacturationResponse {
  _AdresseFacturationResponse(
      {@JsonKey(name: '_id') this.id,
      required this.firstName,
      required this.lastName,
      required this.adresse,
      this.complementAdresse,
      required this.city,
      required this.codePostal,
      required this.region,
      required this.country,
      required this.phone,
      this.isDefault});
  factory _AdresseFacturationResponse.fromJson(Map<String, dynamic> json) =>
      _$AdresseFacturationResponseFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String adresse;
  @override
  final String? complementAdresse;
  @override
  final String city;
  @override
  final String codePostal;
  @override
  final String region;
  @override
  final String country;
  @override
  final String phone;
  @override
  final bool? isDefault;

  /// Create a copy of AdresseFacturationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdresseFacturationResponseCopyWith<_AdresseFacturationResponse>
      get copyWith => __$AdresseFacturationResponseCopyWithImpl<
          _AdresseFacturationResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AdresseFacturationResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdresseFacturationResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.adresse, adresse) || other.adresse == adresse) &&
            (identical(other.complementAdresse, complementAdresse) ||
                other.complementAdresse == complementAdresse) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.codePostal, codePostal) ||
                other.codePostal == codePostal) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, adresse,
      complementAdresse, city, codePostal, region, country, phone, isDefault);

  @override
  String toString() {
    return 'AdresseFacturationResponse(id: $id, firstName: $firstName, lastName: $lastName, adresse: $adresse, complementAdresse: $complementAdresse, city: $city, codePostal: $codePostal, region: $region, country: $country, phone: $phone, isDefault: $isDefault)';
  }
}

/// @nodoc
abstract mixin class _$AdresseFacturationResponseCopyWith<$Res>
    implements $AdresseFacturationResponseCopyWith<$Res> {
  factory _$AdresseFacturationResponseCopyWith(
          _AdresseFacturationResponse value,
          $Res Function(_AdresseFacturationResponse) _then) =
      __$AdresseFacturationResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String firstName,
      String lastName,
      String adresse,
      String? complementAdresse,
      String city,
      String codePostal,
      String region,
      String country,
      String phone,
      bool? isDefault});
}

/// @nodoc
class __$AdresseFacturationResponseCopyWithImpl<$Res>
    implements _$AdresseFacturationResponseCopyWith<$Res> {
  __$AdresseFacturationResponseCopyWithImpl(this._self, this._then);

  final _AdresseFacturationResponse _self;
  final $Res Function(_AdresseFacturationResponse) _then;

  /// Create a copy of AdresseFacturationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? adresse = null,
    Object? complementAdresse = freezed,
    Object? city = null,
    Object? codePostal = null,
    Object? region = null,
    Object? country = null,
    Object? phone = null,
    Object? isDefault = freezed,
  }) {
    return _then(_AdresseFacturationResponse(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      adresse: null == adresse
          ? _self.adresse
          : adresse // ignore: cast_nullable_to_non_nullable
              as String,
      complementAdresse: freezed == complementAdresse
          ? _self.complementAdresse
          : complementAdresse // ignore: cast_nullable_to_non_nullable
              as String?,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      codePostal: null == codePostal
          ? _self.codePostal
          : codePostal // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: freezed == isDefault
          ? _self.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on

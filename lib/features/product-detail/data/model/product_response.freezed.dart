// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductResponse {
  @JsonKey(name: '_id')
  String get id;
  String? get name;
  List<ImageDto>? get images;
  String? get slug;
  double? get priceMonth;
  double? get priceYear;
  int? get stock;
  String? get description;
  bool? get priority;
  int? get order;

  /// Create a copy of ProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductResponseCopyWith<ProductResponse> get copyWith =>
      _$ProductResponseCopyWithImpl<ProductResponse>(
          this as ProductResponse, _$identity);

  /// Serializes this ProductResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.priceMonth, priceMonth) ||
                other.priceMonth == priceMonth) &&
            (identical(other.priceYear, priceYear) ||
                other.priceYear == priceYear) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(images),
      slug,
      priceMonth,
      priceYear,
      stock,
      description,
      priority,
      order);

  @override
  String toString() {
    return 'ProductResponse(id: $id, name: $name, images: $images, slug: $slug, priceMonth: $priceMonth, priceYear: $priceYear, stock: $stock, description: $description, priority: $priority, order: $order)';
  }
}

/// @nodoc
abstract mixin class $ProductResponseCopyWith<$Res> {
  factory $ProductResponseCopyWith(
          ProductResponse value, $Res Function(ProductResponse) _then) =
      _$ProductResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String? name,
      List<ImageDto>? images,
      String? slug,
      double? priceMonth,
      double? priceYear,
      int? stock,
      String? description,
      bool? priority,
      int? order});
}

/// @nodoc
class _$ProductResponseCopyWithImpl<$Res>
    implements $ProductResponseCopyWith<$Res> {
  _$ProductResponseCopyWithImpl(this._self, this._then);

  final ProductResponse _self;
  final $Res Function(ProductResponse) _then;

  /// Create a copy of ProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? images = freezed,
    Object? slug = freezed,
    Object? priceMonth = freezed,
    Object? priceYear = freezed,
    Object? stock = freezed,
    Object? description = freezed,
    Object? priority = freezed,
    Object? order = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageDto>?,
      slug: freezed == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      priceMonth: freezed == priceMonth
          ? _self.priceMonth
          : priceMonth // ignore: cast_nullable_to_non_nullable
              as double?,
      priceYear: freezed == priceYear
          ? _self.priceYear
          : priceYear // ignore: cast_nullable_to_non_nullable
              as double?,
      stock: freezed == stock
          ? _self.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as bool?,
      order: freezed == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProductResponse].
extension ProductResponsePatterns on ProductResponse {
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
    TResult Function(_ProductResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductResponse() when $default != null:
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
    TResult Function(_ProductResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductResponse():
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
    TResult? Function(_ProductResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductResponse() when $default != null:
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
            String? name,
            List<ImageDto>? images,
            String? slug,
            double? priceMonth,
            double? priceYear,
            int? stock,
            String? description,
            bool? priority,
            int? order)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductResponse() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.images,
            _that.slug,
            _that.priceMonth,
            _that.priceYear,
            _that.stock,
            _that.description,
            _that.priority,
            _that.order);
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
            String? name,
            List<ImageDto>? images,
            String? slug,
            double? priceMonth,
            double? priceYear,
            int? stock,
            String? description,
            bool? priority,
            int? order)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductResponse():
        return $default(
            _that.id,
            _that.name,
            _that.images,
            _that.slug,
            _that.priceMonth,
            _that.priceYear,
            _that.stock,
            _that.description,
            _that.priority,
            _that.order);
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
            String? name,
            List<ImageDto>? images,
            String? slug,
            double? priceMonth,
            double? priceYear,
            int? stock,
            String? description,
            bool? priority,
            int? order)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductResponse() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.images,
            _that.slug,
            _that.priceMonth,
            _that.priceYear,
            _that.stock,
            _that.description,
            _that.priority,
            _that.order);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProductResponse implements ProductResponse {
  const _ProductResponse(
      {@JsonKey(name: '_id') required this.id,
      this.name,
      final List<ImageDto>? images,
      this.slug,
      this.priceMonth,
      this.priceYear,
      this.stock,
      this.description,
      this.priority,
      this.order})
      : _images = images;
  factory _ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String? name;
  final List<ImageDto>? _images;
  @override
  List<ImageDto>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? slug;
  @override
  final double? priceMonth;
  @override
  final double? priceYear;
  @override
  final int? stock;
  @override
  final String? description;
  @override
  final bool? priority;
  @override
  final int? order;

  /// Create a copy of ProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductResponseCopyWith<_ProductResponse> get copyWith =>
      __$ProductResponseCopyWithImpl<_ProductResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.priceMonth, priceMonth) ||
                other.priceMonth == priceMonth) &&
            (identical(other.priceYear, priceYear) ||
                other.priceYear == priceYear) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_images),
      slug,
      priceMonth,
      priceYear,
      stock,
      description,
      priority,
      order);

  @override
  String toString() {
    return 'ProductResponse(id: $id, name: $name, images: $images, slug: $slug, priceMonth: $priceMonth, priceYear: $priceYear, stock: $stock, description: $description, priority: $priority, order: $order)';
  }
}

/// @nodoc
abstract mixin class _$ProductResponseCopyWith<$Res>
    implements $ProductResponseCopyWith<$Res> {
  factory _$ProductResponseCopyWith(
          _ProductResponse value, $Res Function(_ProductResponse) _then) =
      __$ProductResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String? name,
      List<ImageDto>? images,
      String? slug,
      double? priceMonth,
      double? priceYear,
      int? stock,
      String? description,
      bool? priority,
      int? order});
}

/// @nodoc
class __$ProductResponseCopyWithImpl<$Res>
    implements _$ProductResponseCopyWith<$Res> {
  __$ProductResponseCopyWithImpl(this._self, this._then);

  final _ProductResponse _self;
  final $Res Function(_ProductResponse) _then;

  /// Create a copy of ProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? images = freezed,
    Object? slug = freezed,
    Object? priceMonth = freezed,
    Object? priceYear = freezed,
    Object? stock = freezed,
    Object? description = freezed,
    Object? priority = freezed,
    Object? order = freezed,
  }) {
    return _then(_ProductResponse(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageDto>?,
      slug: freezed == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      priceMonth: freezed == priceMonth
          ? _self.priceMonth
          : priceMonth // ignore: cast_nullable_to_non_nullable
              as double?,
      priceYear: freezed == priceYear
          ? _self.priceYear
          : priceYear // ignore: cast_nullable_to_non_nullable
              as double?,
      stock: freezed == stock
          ? _self.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as bool?,
      order: freezed == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$ImageDto {
  @JsonKey(name: '_id')
  String get id;
  String get url;

  /// Create a copy of ImageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ImageDtoCopyWith<ImageDto> get copyWith =>
      _$ImageDtoCopyWithImpl<ImageDto>(this as ImageDto, _$identity);

  /// Serializes this ImageDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ImageDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, url);

  @override
  String toString() {
    return 'ImageDto(id: $id, url: $url)';
  }
}

/// @nodoc
abstract mixin class $ImageDtoCopyWith<$Res> {
  factory $ImageDtoCopyWith(ImageDto value, $Res Function(ImageDto) _then) =
      _$ImageDtoCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String url});
}

/// @nodoc
class _$ImageDtoCopyWithImpl<$Res> implements $ImageDtoCopyWith<$Res> {
  _$ImageDtoCopyWithImpl(this._self, this._then);

  final ImageDto _self;
  final $Res Function(ImageDto) _then;

  /// Create a copy of ImageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ImageDto].
extension ImageDtoPatterns on ImageDto {
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
    TResult Function(_ImageDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ImageDto() when $default != null:
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
    TResult Function(_ImageDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ImageDto():
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
    TResult? Function(_ImageDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ImageDto() when $default != null:
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
    TResult Function(@JsonKey(name: '_id') String id, String url)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ImageDto() when $default != null:
        return $default(_that.id, _that.url);
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
    TResult Function(@JsonKey(name: '_id') String id, String url) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ImageDto():
        return $default(_that.id, _that.url);
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
    TResult? Function(@JsonKey(name: '_id') String id, String url)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ImageDto() when $default != null:
        return $default(_that.id, _that.url);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ImageDto implements ImageDto {
  const _ImageDto({@JsonKey(name: '_id') required this.id, required this.url});
  factory _ImageDto.fromJson(Map<String, dynamic> json) =>
      _$ImageDtoFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String url;

  /// Create a copy of ImageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ImageDtoCopyWith<_ImageDto> get copyWith =>
      __$ImageDtoCopyWithImpl<_ImageDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ImageDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ImageDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, url);

  @override
  String toString() {
    return 'ImageDto(id: $id, url: $url)';
  }
}

/// @nodoc
abstract mixin class _$ImageDtoCopyWith<$Res>
    implements $ImageDtoCopyWith<$Res> {
  factory _$ImageDtoCopyWith(_ImageDto value, $Res Function(_ImageDto) _then) =
      __$ImageDtoCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String url});
}

/// @nodoc
class __$ImageDtoCopyWithImpl<$Res> implements _$ImageDtoCopyWith<$Res> {
  __$ImageDtoCopyWithImpl(this._self, this._then);

  final _ImageDto _self;
  final $Res Function(_ImageDto) _then;

  /// Create a copy of ImageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_ImageDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

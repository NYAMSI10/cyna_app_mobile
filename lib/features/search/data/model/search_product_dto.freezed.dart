// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchProductDto {
  @JsonKey(name: '_id')
  String get id;
  String? get name;
  List<SearchImageDto>? get images;
  String? get slug;
  double? get priceMonth;
  double? get priceYear;
  int? get stock;
  String? get description;
  bool? get priority;
  int?
      get order; // Champs spécifiques au résultat de recherche (jointure backend)
  @JsonKey(name: 'service_info')
  SearchServiceDto? get serviceInfo;
  @JsonKey(name: 'category_info')
  SearchCategoryDto? get categoryInfo;

  /// Create a copy of SearchProductDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchProductDtoCopyWith<SearchProductDto> get copyWith =>
      _$SearchProductDtoCopyWithImpl<SearchProductDto>(
          this as SearchProductDto, _$identity);

  /// Serializes this SearchProductDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchProductDto &&
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
            (identical(other.order, order) || other.order == order) &&
            (identical(other.serviceInfo, serviceInfo) ||
                other.serviceInfo == serviceInfo) &&
            (identical(other.categoryInfo, categoryInfo) ||
                other.categoryInfo == categoryInfo));
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
      order,
      serviceInfo,
      categoryInfo);

  @override
  String toString() {
    return 'SearchProductDto(id: $id, name: $name, images: $images, slug: $slug, priceMonth: $priceMonth, priceYear: $priceYear, stock: $stock, description: $description, priority: $priority, order: $order, serviceInfo: $serviceInfo, categoryInfo: $categoryInfo)';
  }
}

/// @nodoc
abstract mixin class $SearchProductDtoCopyWith<$Res> {
  factory $SearchProductDtoCopyWith(
          SearchProductDto value, $Res Function(SearchProductDto) _then) =
      _$SearchProductDtoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String? name,
      List<SearchImageDto>? images,
      String? slug,
      double? priceMonth,
      double? priceYear,
      int? stock,
      String? description,
      bool? priority,
      int? order,
      @JsonKey(name: 'service_info') SearchServiceDto? serviceInfo,
      @JsonKey(name: 'category_info') SearchCategoryDto? categoryInfo});

  $SearchServiceDtoCopyWith<$Res>? get serviceInfo;
  $SearchCategoryDtoCopyWith<$Res>? get categoryInfo;
}

/// @nodoc
class _$SearchProductDtoCopyWithImpl<$Res>
    implements $SearchProductDtoCopyWith<$Res> {
  _$SearchProductDtoCopyWithImpl(this._self, this._then);

  final SearchProductDto _self;
  final $Res Function(SearchProductDto) _then;

  /// Create a copy of SearchProductDto
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
    Object? serviceInfo = freezed,
    Object? categoryInfo = freezed,
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
              as List<SearchImageDto>?,
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
      serviceInfo: freezed == serviceInfo
          ? _self.serviceInfo
          : serviceInfo // ignore: cast_nullable_to_non_nullable
              as SearchServiceDto?,
      categoryInfo: freezed == categoryInfo
          ? _self.categoryInfo
          : categoryInfo // ignore: cast_nullable_to_non_nullable
              as SearchCategoryDto?,
    ));
  }

  /// Create a copy of SearchProductDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchServiceDtoCopyWith<$Res>? get serviceInfo {
    if (_self.serviceInfo == null) {
      return null;
    }

    return $SearchServiceDtoCopyWith<$Res>(_self.serviceInfo!, (value) {
      return _then(_self.copyWith(serviceInfo: value));
    });
  }

  /// Create a copy of SearchProductDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchCategoryDtoCopyWith<$Res>? get categoryInfo {
    if (_self.categoryInfo == null) {
      return null;
    }

    return $SearchCategoryDtoCopyWith<$Res>(_self.categoryInfo!, (value) {
      return _then(_self.copyWith(categoryInfo: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SearchProductDto].
extension SearchProductDtoPatterns on SearchProductDto {
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
    TResult Function(_SearchProductDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchProductDto() when $default != null:
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
    TResult Function(_SearchProductDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchProductDto():
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
    TResult? Function(_SearchProductDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchProductDto() when $default != null:
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
            List<SearchImageDto>? images,
            String? slug,
            double? priceMonth,
            double? priceYear,
            int? stock,
            String? description,
            bool? priority,
            int? order,
            @JsonKey(name: 'service_info') SearchServiceDto? serviceInfo,
            @JsonKey(name: 'category_info') SearchCategoryDto? categoryInfo)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchProductDto() when $default != null:
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
            _that.order,
            _that.serviceInfo,
            _that.categoryInfo);
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
            List<SearchImageDto>? images,
            String? slug,
            double? priceMonth,
            double? priceYear,
            int? stock,
            String? description,
            bool? priority,
            int? order,
            @JsonKey(name: 'service_info') SearchServiceDto? serviceInfo,
            @JsonKey(name: 'category_info') SearchCategoryDto? categoryInfo)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchProductDto():
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
            _that.order,
            _that.serviceInfo,
            _that.categoryInfo);
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
            List<SearchImageDto>? images,
            String? slug,
            double? priceMonth,
            double? priceYear,
            int? stock,
            String? description,
            bool? priority,
            int? order,
            @JsonKey(name: 'service_info') SearchServiceDto? serviceInfo,
            @JsonKey(name: 'category_info') SearchCategoryDto? categoryInfo)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchProductDto() when $default != null:
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
            _that.order,
            _that.serviceInfo,
            _that.categoryInfo);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchProductDto implements SearchProductDto {
  const _SearchProductDto(
      {@JsonKey(name: '_id') required this.id,
      this.name,
      final List<SearchImageDto>? images,
      this.slug,
      this.priceMonth,
      this.priceYear,
      this.stock,
      this.description,
      this.priority,
      this.order,
      @JsonKey(name: 'service_info') this.serviceInfo,
      @JsonKey(name: 'category_info') this.categoryInfo})
      : _images = images;
  factory _SearchProductDto.fromJson(Map<String, dynamic> json) =>
      _$SearchProductDtoFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String? name;
  final List<SearchImageDto>? _images;
  @override
  List<SearchImageDto>? get images {
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
// Champs spécifiques au résultat de recherche (jointure backend)
  @override
  @JsonKey(name: 'service_info')
  final SearchServiceDto? serviceInfo;
  @override
  @JsonKey(name: 'category_info')
  final SearchCategoryDto? categoryInfo;

  /// Create a copy of SearchProductDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchProductDtoCopyWith<_SearchProductDto> get copyWith =>
      __$SearchProductDtoCopyWithImpl<_SearchProductDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchProductDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchProductDto &&
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
            (identical(other.order, order) || other.order == order) &&
            (identical(other.serviceInfo, serviceInfo) ||
                other.serviceInfo == serviceInfo) &&
            (identical(other.categoryInfo, categoryInfo) ||
                other.categoryInfo == categoryInfo));
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
      order,
      serviceInfo,
      categoryInfo);

  @override
  String toString() {
    return 'SearchProductDto(id: $id, name: $name, images: $images, slug: $slug, priceMonth: $priceMonth, priceYear: $priceYear, stock: $stock, description: $description, priority: $priority, order: $order, serviceInfo: $serviceInfo, categoryInfo: $categoryInfo)';
  }
}

/// @nodoc
abstract mixin class _$SearchProductDtoCopyWith<$Res>
    implements $SearchProductDtoCopyWith<$Res> {
  factory _$SearchProductDtoCopyWith(
          _SearchProductDto value, $Res Function(_SearchProductDto) _then) =
      __$SearchProductDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String? name,
      List<SearchImageDto>? images,
      String? slug,
      double? priceMonth,
      double? priceYear,
      int? stock,
      String? description,
      bool? priority,
      int? order,
      @JsonKey(name: 'service_info') SearchServiceDto? serviceInfo,
      @JsonKey(name: 'category_info') SearchCategoryDto? categoryInfo});

  @override
  $SearchServiceDtoCopyWith<$Res>? get serviceInfo;
  @override
  $SearchCategoryDtoCopyWith<$Res>? get categoryInfo;
}

/// @nodoc
class __$SearchProductDtoCopyWithImpl<$Res>
    implements _$SearchProductDtoCopyWith<$Res> {
  __$SearchProductDtoCopyWithImpl(this._self, this._then);

  final _SearchProductDto _self;
  final $Res Function(_SearchProductDto) _then;

  /// Create a copy of SearchProductDto
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
    Object? serviceInfo = freezed,
    Object? categoryInfo = freezed,
  }) {
    return _then(_SearchProductDto(
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
              as List<SearchImageDto>?,
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
      serviceInfo: freezed == serviceInfo
          ? _self.serviceInfo
          : serviceInfo // ignore: cast_nullable_to_non_nullable
              as SearchServiceDto?,
      categoryInfo: freezed == categoryInfo
          ? _self.categoryInfo
          : categoryInfo // ignore: cast_nullable_to_non_nullable
              as SearchCategoryDto?,
    ));
  }

  /// Create a copy of SearchProductDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchServiceDtoCopyWith<$Res>? get serviceInfo {
    if (_self.serviceInfo == null) {
      return null;
    }

    return $SearchServiceDtoCopyWith<$Res>(_self.serviceInfo!, (value) {
      return _then(_self.copyWith(serviceInfo: value));
    });
  }

  /// Create a copy of SearchProductDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchCategoryDtoCopyWith<$Res>? get categoryInfo {
    if (_self.categoryInfo == null) {
      return null;
    }

    return $SearchCategoryDtoCopyWith<$Res>(_self.categoryInfo!, (value) {
      return _then(_self.copyWith(categoryInfo: value));
    });
  }
}

/// @nodoc
mixin _$SearchImageDto {
  @JsonKey(name: '_id')
  String get id;
  String get url;

  /// Create a copy of SearchImageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchImageDtoCopyWith<SearchImageDto> get copyWith =>
      _$SearchImageDtoCopyWithImpl<SearchImageDto>(
          this as SearchImageDto, _$identity);

  /// Serializes this SearchImageDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchImageDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, url);

  @override
  String toString() {
    return 'SearchImageDto(id: $id, url: $url)';
  }
}

/// @nodoc
abstract mixin class $SearchImageDtoCopyWith<$Res> {
  factory $SearchImageDtoCopyWith(
          SearchImageDto value, $Res Function(SearchImageDto) _then) =
      _$SearchImageDtoCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String url});
}

/// @nodoc
class _$SearchImageDtoCopyWithImpl<$Res>
    implements $SearchImageDtoCopyWith<$Res> {
  _$SearchImageDtoCopyWithImpl(this._self, this._then);

  final SearchImageDto _self;
  final $Res Function(SearchImageDto) _then;

  /// Create a copy of SearchImageDto
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

/// Adds pattern-matching-related methods to [SearchImageDto].
extension SearchImageDtoPatterns on SearchImageDto {
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
    TResult Function(_SearchImageDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchImageDto() when $default != null:
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
    TResult Function(_SearchImageDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchImageDto():
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
    TResult? Function(_SearchImageDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchImageDto() when $default != null:
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
      case _SearchImageDto() when $default != null:
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
      case _SearchImageDto():
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
      case _SearchImageDto() when $default != null:
        return $default(_that.id, _that.url);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchImageDto implements SearchImageDto {
  const _SearchImageDto(
      {@JsonKey(name: '_id') required this.id, required this.url});
  factory _SearchImageDto.fromJson(Map<String, dynamic> json) =>
      _$SearchImageDtoFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String url;

  /// Create a copy of SearchImageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchImageDtoCopyWith<_SearchImageDto> get copyWith =>
      __$SearchImageDtoCopyWithImpl<_SearchImageDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchImageDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchImageDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, url);

  @override
  String toString() {
    return 'SearchImageDto(id: $id, url: $url)';
  }
}

/// @nodoc
abstract mixin class _$SearchImageDtoCopyWith<$Res>
    implements $SearchImageDtoCopyWith<$Res> {
  factory _$SearchImageDtoCopyWith(
          _SearchImageDto value, $Res Function(_SearchImageDto) _then) =
      __$SearchImageDtoCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String url});
}

/// @nodoc
class __$SearchImageDtoCopyWithImpl<$Res>
    implements _$SearchImageDtoCopyWith<$Res> {
  __$SearchImageDtoCopyWithImpl(this._self, this._then);

  final _SearchImageDto _self;
  final $Res Function(_SearchImageDto) _then;

  /// Create a copy of SearchImageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_SearchImageDto(
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

/// @nodoc
mixin _$SearchServiceDto {
  @JsonKey(name: '_id')
  String? get id;
  String? get name;
  String? get slug;
  bool? get available;

  /// Create a copy of SearchServiceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchServiceDtoCopyWith<SearchServiceDto> get copyWith =>
      _$SearchServiceDtoCopyWithImpl<SearchServiceDto>(
          this as SearchServiceDto, _$identity);

  /// Serializes this SearchServiceDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchServiceDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.available, available) ||
                other.available == available));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug, available);

  @override
  String toString() {
    return 'SearchServiceDto(id: $id, name: $name, slug: $slug, available: $available)';
  }
}

/// @nodoc
abstract mixin class $SearchServiceDtoCopyWith<$Res> {
  factory $SearchServiceDtoCopyWith(
          SearchServiceDto value, $Res Function(SearchServiceDto) _then) =
      _$SearchServiceDtoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? name,
      String? slug,
      bool? available});
}

/// @nodoc
class _$SearchServiceDtoCopyWithImpl<$Res>
    implements $SearchServiceDtoCopyWith<$Res> {
  _$SearchServiceDtoCopyWithImpl(this._self, this._then);

  final SearchServiceDto _self;
  final $Res Function(SearchServiceDto) _then;

  /// Create a copy of SearchServiceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? available = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      available: freezed == available
          ? _self.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SearchServiceDto].
extension SearchServiceDtoPatterns on SearchServiceDto {
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
    TResult Function(_SearchServiceDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchServiceDto() when $default != null:
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
    TResult Function(_SearchServiceDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchServiceDto():
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
    TResult? Function(_SearchServiceDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchServiceDto() when $default != null:
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
    TResult Function(@JsonKey(name: '_id') String? id, String? name,
            String? slug, bool? available)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchServiceDto() when $default != null:
        return $default(_that.id, _that.name, _that.slug, _that.available);
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
    TResult Function(@JsonKey(name: '_id') String? id, String? name,
            String? slug, bool? available)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchServiceDto():
        return $default(_that.id, _that.name, _that.slug, _that.available);
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
    TResult? Function(@JsonKey(name: '_id') String? id, String? name,
            String? slug, bool? available)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchServiceDto() when $default != null:
        return $default(_that.id, _that.name, _that.slug, _that.available);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchServiceDto implements SearchServiceDto {
  const _SearchServiceDto(
      {@JsonKey(name: '_id') this.id, this.name, this.slug, this.available});
  factory _SearchServiceDto.fromJson(Map<String, dynamic> json) =>
      _$SearchServiceDtoFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? name;
  @override
  final String? slug;
  @override
  final bool? available;

  /// Create a copy of SearchServiceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchServiceDtoCopyWith<_SearchServiceDto> get copyWith =>
      __$SearchServiceDtoCopyWithImpl<_SearchServiceDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchServiceDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchServiceDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.available, available) ||
                other.available == available));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug, available);

  @override
  String toString() {
    return 'SearchServiceDto(id: $id, name: $name, slug: $slug, available: $available)';
  }
}

/// @nodoc
abstract mixin class _$SearchServiceDtoCopyWith<$Res>
    implements $SearchServiceDtoCopyWith<$Res> {
  factory _$SearchServiceDtoCopyWith(
          _SearchServiceDto value, $Res Function(_SearchServiceDto) _then) =
      __$SearchServiceDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? name,
      String? slug,
      bool? available});
}

/// @nodoc
class __$SearchServiceDtoCopyWithImpl<$Res>
    implements _$SearchServiceDtoCopyWith<$Res> {
  __$SearchServiceDtoCopyWithImpl(this._self, this._then);

  final _SearchServiceDto _self;
  final $Res Function(_SearchServiceDto) _then;

  /// Create a copy of SearchServiceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? available = freezed,
  }) {
    return _then(_SearchServiceDto(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      available: freezed == available
          ? _self.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
mixin _$SearchCategoryDto {
  @JsonKey(name: '_id')
  String? get id;
  String? get name;
  String? get slug;
  String? get image;

  /// Create a copy of SearchCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchCategoryDtoCopyWith<SearchCategoryDto> get copyWith =>
      _$SearchCategoryDtoCopyWithImpl<SearchCategoryDto>(
          this as SearchCategoryDto, _$identity);

  /// Serializes this SearchCategoryDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchCategoryDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug, image);

  @override
  String toString() {
    return 'SearchCategoryDto(id: $id, name: $name, slug: $slug, image: $image)';
  }
}

/// @nodoc
abstract mixin class $SearchCategoryDtoCopyWith<$Res> {
  factory $SearchCategoryDtoCopyWith(
          SearchCategoryDto value, $Res Function(SearchCategoryDto) _then) =
      _$SearchCategoryDtoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? name,
      String? slug,
      String? image});
}

/// @nodoc
class _$SearchCategoryDtoCopyWithImpl<$Res>
    implements $SearchCategoryDtoCopyWith<$Res> {
  _$SearchCategoryDtoCopyWithImpl(this._self, this._then);

  final SearchCategoryDto _self;
  final $Res Function(SearchCategoryDto) _then;

  /// Create a copy of SearchCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? image = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SearchCategoryDto].
extension SearchCategoryDtoPatterns on SearchCategoryDto {
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
    TResult Function(_SearchCategoryDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchCategoryDto() when $default != null:
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
    TResult Function(_SearchCategoryDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchCategoryDto():
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
    TResult? Function(_SearchCategoryDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchCategoryDto() when $default != null:
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
    TResult Function(@JsonKey(name: '_id') String? id, String? name,
            String? slug, String? image)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchCategoryDto() when $default != null:
        return $default(_that.id, _that.name, _that.slug, _that.image);
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
    TResult Function(@JsonKey(name: '_id') String? id, String? name,
            String? slug, String? image)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchCategoryDto():
        return $default(_that.id, _that.name, _that.slug, _that.image);
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
    TResult? Function(@JsonKey(name: '_id') String? id, String? name,
            String? slug, String? image)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchCategoryDto() when $default != null:
        return $default(_that.id, _that.name, _that.slug, _that.image);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchCategoryDto implements SearchCategoryDto {
  const _SearchCategoryDto(
      {@JsonKey(name: '_id') this.id, this.name, this.slug, this.image});
  factory _SearchCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$SearchCategoryDtoFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? name;
  @override
  final String? slug;
  @override
  final String? image;

  /// Create a copy of SearchCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchCategoryDtoCopyWith<_SearchCategoryDto> get copyWith =>
      __$SearchCategoryDtoCopyWithImpl<_SearchCategoryDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchCategoryDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchCategoryDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug, image);

  @override
  String toString() {
    return 'SearchCategoryDto(id: $id, name: $name, slug: $slug, image: $image)';
  }
}

/// @nodoc
abstract mixin class _$SearchCategoryDtoCopyWith<$Res>
    implements $SearchCategoryDtoCopyWith<$Res> {
  factory _$SearchCategoryDtoCopyWith(
          _SearchCategoryDto value, $Res Function(_SearchCategoryDto) _then) =
      __$SearchCategoryDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? name,
      String? slug,
      String? image});
}

/// @nodoc
class __$SearchCategoryDtoCopyWithImpl<$Res>
    implements _$SearchCategoryDtoCopyWith<$Res> {
  __$SearchCategoryDtoCopyWithImpl(this._self, this._then);

  final _SearchCategoryDto _self;
  final $Res Function(_SearchCategoryDto) _then;

  /// Create a copy of SearchCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? image = freezed,
  }) {
    return _then(_SearchCategoryDto(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

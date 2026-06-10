// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryDetailResponse {
  CategoryResponse get category;
  List<ProductResponse> get products;

  /// Create a copy of CategoryDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryDetailResponseCopyWith<CategoryDetailResponse> get copyWith =>
      _$CategoryDetailResponseCopyWithImpl<CategoryDetailResponse>(
          this as CategoryDetailResponse, _$identity);

  /// Serializes this CategoryDetailResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryDetailResponse &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other.products, products));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, category, const DeepCollectionEquality().hash(products));

  @override
  String toString() {
    return 'CategoryDetailResponse(category: $category, products: $products)';
  }
}

/// @nodoc
abstract mixin class $CategoryDetailResponseCopyWith<$Res> {
  factory $CategoryDetailResponseCopyWith(CategoryDetailResponse value,
          $Res Function(CategoryDetailResponse) _then) =
      _$CategoryDetailResponseCopyWithImpl;
  @useResult
  $Res call({CategoryResponse category, List<ProductResponse> products});

  $CategoryResponseCopyWith<$Res> get category;
}

/// @nodoc
class _$CategoryDetailResponseCopyWithImpl<$Res>
    implements $CategoryDetailResponseCopyWith<$Res> {
  _$CategoryDetailResponseCopyWithImpl(this._self, this._then);

  final CategoryDetailResponse _self;
  final $Res Function(CategoryDetailResponse) _then;

  /// Create a copy of CategoryDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? products = null,
  }) {
    return _then(_self.copyWith(
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryResponse,
      products: null == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductResponse>,
    ));
  }

  /// Create a copy of CategoryDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryResponseCopyWith<$Res> get category {
    return $CategoryResponseCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CategoryDetailResponse].
extension CategoryDetailResponsePatterns on CategoryDetailResponse {
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
    TResult Function(_CategoryDetailResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryDetailResponse() when $default != null:
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
    TResult Function(_CategoryDetailResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDetailResponse():
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
    TResult? Function(_CategoryDetailResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDetailResponse() when $default != null:
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
    TResult Function(CategoryResponse category, List<ProductResponse> products)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CategoryDetailResponse() when $default != null:
        return $default(_that.category, _that.products);
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
    TResult Function(CategoryResponse category, List<ProductResponse> products)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDetailResponse():
        return $default(_that.category, _that.products);
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
            CategoryResponse category, List<ProductResponse> products)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CategoryDetailResponse() when $default != null:
        return $default(_that.category, _that.products);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CategoryDetailResponse implements CategoryDetailResponse {
  const _CategoryDetailResponse(
      {required this.category,
      final List<ProductResponse> products = const <ProductResponse>[]})
      : _products = products;
  factory _CategoryDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryDetailResponseFromJson(json);

  @override
  final CategoryResponse category;
  final List<ProductResponse> _products;
  @override
  @JsonKey()
  List<ProductResponse> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  /// Create a copy of CategoryDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryDetailResponseCopyWith<_CategoryDetailResponse> get copyWith =>
      __$CategoryDetailResponseCopyWithImpl<_CategoryDetailResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryDetailResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryDetailResponse &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, category, const DeepCollectionEquality().hash(_products));

  @override
  String toString() {
    return 'CategoryDetailResponse(category: $category, products: $products)';
  }
}

/// @nodoc
abstract mixin class _$CategoryDetailResponseCopyWith<$Res>
    implements $CategoryDetailResponseCopyWith<$Res> {
  factory _$CategoryDetailResponseCopyWith(_CategoryDetailResponse value,
          $Res Function(_CategoryDetailResponse) _then) =
      __$CategoryDetailResponseCopyWithImpl;
  @override
  @useResult
  $Res call({CategoryResponse category, List<ProductResponse> products});

  @override
  $CategoryResponseCopyWith<$Res> get category;
}

/// @nodoc
class __$CategoryDetailResponseCopyWithImpl<$Res>
    implements _$CategoryDetailResponseCopyWith<$Res> {
  __$CategoryDetailResponseCopyWithImpl(this._self, this._then);

  final _CategoryDetailResponse _self;
  final $Res Function(_CategoryDetailResponse) _then;

  /// Create a copy of CategoryDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? category = null,
    Object? products = null,
  }) {
    return _then(_CategoryDetailResponse(
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryResponse,
      products: null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductResponse>,
    ));
  }

  /// Create a copy of CategoryDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryResponseCopyWith<$Res> get category {
    return $CategoryResponseCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

// dart format on

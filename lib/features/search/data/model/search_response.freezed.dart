// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchPaginatedResponse {
  List<SearchProductDto> get data;
  int get total;
  int get page;
  int get lastPage;

  /// Create a copy of SearchPaginatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchPaginatedResponseCopyWith<SearchPaginatedResponse> get copyWith =>
      _$SearchPaginatedResponseCopyWithImpl<SearchPaginatedResponse>(
          this as SearchPaginatedResponse, _$identity);

  /// Serializes this SearchPaginatedResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchPaginatedResponse &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(data), total, page, lastPage);

  @override
  String toString() {
    return 'SearchPaginatedResponse(data: $data, total: $total, page: $page, lastPage: $lastPage)';
  }
}

/// @nodoc
abstract mixin class $SearchPaginatedResponseCopyWith<$Res> {
  factory $SearchPaginatedResponseCopyWith(SearchPaginatedResponse value,
          $Res Function(SearchPaginatedResponse) _then) =
      _$SearchPaginatedResponseCopyWithImpl;
  @useResult
  $Res call({List<SearchProductDto> data, int total, int page, int lastPage});
}

/// @nodoc
class _$SearchPaginatedResponseCopyWithImpl<$Res>
    implements $SearchPaginatedResponseCopyWith<$Res> {
  _$SearchPaginatedResponseCopyWithImpl(this._self, this._then);

  final SearchPaginatedResponse _self;
  final $Res Function(SearchPaginatedResponse) _then;

  /// Create a copy of SearchPaginatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = null,
    Object? page = null,
    Object? lastPage = null,
  }) {
    return _then(_self.copyWith(
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SearchProductDto>,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _self.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [SearchPaginatedResponse].
extension SearchPaginatedResponsePatterns on SearchPaginatedResponse {
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
    TResult Function(_SearchPaginatedResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchPaginatedResponse() when $default != null:
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
    TResult Function(_SearchPaginatedResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchPaginatedResponse():
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
    TResult? Function(_SearchPaginatedResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchPaginatedResponse() when $default != null:
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
            List<SearchProductDto> data, int total, int page, int lastPage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchPaginatedResponse() when $default != null:
        return $default(_that.data, _that.total, _that.page, _that.lastPage);
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
            List<SearchProductDto> data, int total, int page, int lastPage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchPaginatedResponse():
        return $default(_that.data, _that.total, _that.page, _that.lastPage);
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
            List<SearchProductDto> data, int total, int page, int lastPage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchPaginatedResponse() when $default != null:
        return $default(_that.data, _that.total, _that.page, _that.lastPage);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SearchPaginatedResponse implements SearchPaginatedResponse {
  const _SearchPaginatedResponse(
      {required final List<SearchProductDto> data,
      required this.total,
      required this.page,
      required this.lastPage})
      : _data = data;
  factory _SearchPaginatedResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchPaginatedResponseFromJson(json);

  final List<SearchProductDto> _data;
  @override
  List<SearchProductDto> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int total;
  @override
  final int page;
  @override
  final int lastPage;

  /// Create a copy of SearchPaginatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchPaginatedResponseCopyWith<_SearchPaginatedResponse> get copyWith =>
      __$SearchPaginatedResponseCopyWithImpl<_SearchPaginatedResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchPaginatedResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchPaginatedResponse &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_data), total, page, lastPage);

  @override
  String toString() {
    return 'SearchPaginatedResponse(data: $data, total: $total, page: $page, lastPage: $lastPage)';
  }
}

/// @nodoc
abstract mixin class _$SearchPaginatedResponseCopyWith<$Res>
    implements $SearchPaginatedResponseCopyWith<$Res> {
  factory _$SearchPaginatedResponseCopyWith(_SearchPaginatedResponse value,
          $Res Function(_SearchPaginatedResponse) _then) =
      __$SearchPaginatedResponseCopyWithImpl;
  @override
  @useResult
  $Res call({List<SearchProductDto> data, int total, int page, int lastPage});
}

/// @nodoc
class __$SearchPaginatedResponseCopyWithImpl<$Res>
    implements _$SearchPaginatedResponseCopyWith<$Res> {
  __$SearchPaginatedResponseCopyWithImpl(this._self, this._then);

  final _SearchPaginatedResponse _self;
  final $Res Function(_SearchPaginatedResponse) _then;

  /// Create a copy of SearchPaginatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? total = null,
    Object? page = null,
    Object? lastPage = null,
  }) {
    return _then(_SearchPaginatedResponse(
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SearchProductDto>,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _self.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on

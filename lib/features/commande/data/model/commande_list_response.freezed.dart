// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'commande_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommandeListResponse {
  Map<String, List<CommandeResponse>> get results;
  int get total;
  int get page;
  int get limit;
  int get totalPage;

  /// Create a copy of CommandeListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommandeListResponseCopyWith<CommandeListResponse> get copyWith =>
      _$CommandeListResponseCopyWithImpl<CommandeListResponse>(
          this as CommandeListResponse, _$identity);

  /// Serializes this CommandeListResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommandeListResponse &&
            const DeepCollectionEquality().equals(other.results, results) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(results),
      total,
      page,
      limit,
      totalPage);

  @override
  String toString() {
    return 'CommandeListResponse(results: $results, total: $total, page: $page, limit: $limit, totalPage: $totalPage)';
  }
}

/// @nodoc
abstract mixin class $CommandeListResponseCopyWith<$Res> {
  factory $CommandeListResponseCopyWith(CommandeListResponse value,
          $Res Function(CommandeListResponse) _then) =
      _$CommandeListResponseCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, List<CommandeResponse>> results,
      int total,
      int page,
      int limit,
      int totalPage});
}

/// @nodoc
class _$CommandeListResponseCopyWithImpl<$Res>
    implements $CommandeListResponseCopyWith<$Res> {
  _$CommandeListResponseCopyWithImpl(this._self, this._then);

  final CommandeListResponse _self;
  final $Res Function(CommandeListResponse) _then;

  /// Create a copy of CommandeListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? total = null,
    Object? page = null,
    Object? limit = null,
    Object? totalPage = null,
  }) {
    return _then(_self.copyWith(
      results: null == results
          ? _self.results
          : results // ignore: cast_nullable_to_non_nullable
              as Map<String, List<CommandeResponse>>,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: null == totalPage
          ? _self.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [CommandeListResponse].
extension CommandeListResponsePatterns on CommandeListResponse {
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
    TResult Function(_CommandeListResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CommandeListResponse() when $default != null:
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
    TResult Function(_CommandeListResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommandeListResponse():
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
    TResult? Function(_CommandeListResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommandeListResponse() when $default != null:
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
    TResult Function(Map<String, List<CommandeResponse>> results, int total,
            int page, int limit, int totalPage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CommandeListResponse() when $default != null:
        return $default(_that.results, _that.total, _that.page, _that.limit,
            _that.totalPage);
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
    TResult Function(Map<String, List<CommandeResponse>> results, int total,
            int page, int limit, int totalPage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommandeListResponse():
        return $default(_that.results, _that.total, _that.page, _that.limit,
            _that.totalPage);
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
    TResult? Function(Map<String, List<CommandeResponse>> results, int total,
            int page, int limit, int totalPage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommandeListResponse() when $default != null:
        return $default(_that.results, _that.total, _that.page, _that.limit,
            _that.totalPage);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CommandeListResponse implements CommandeListResponse {
  _CommandeListResponse(
      {required final Map<String, List<CommandeResponse>> results,
      required this.total,
      required this.page,
      required this.limit,
      required this.totalPage})
      : _results = results;
  factory _CommandeListResponse.fromJson(Map<String, dynamic> json) =>
      _$CommandeListResponseFromJson(json);

  final Map<String, List<CommandeResponse>> _results;
  @override
  Map<String, List<CommandeResponse>> get results {
    if (_results is EqualUnmodifiableMapView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_results);
  }

  @override
  final int total;
  @override
  final int page;
  @override
  final int limit;
  @override
  final int totalPage;

  /// Create a copy of CommandeListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CommandeListResponseCopyWith<_CommandeListResponse> get copyWith =>
      __$CommandeListResponseCopyWithImpl<_CommandeListResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CommandeListResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommandeListResponse &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_results),
      total,
      page,
      limit,
      totalPage);

  @override
  String toString() {
    return 'CommandeListResponse(results: $results, total: $total, page: $page, limit: $limit, totalPage: $totalPage)';
  }
}

/// @nodoc
abstract mixin class _$CommandeListResponseCopyWith<$Res>
    implements $CommandeListResponseCopyWith<$Res> {
  factory _$CommandeListResponseCopyWith(_CommandeListResponse value,
          $Res Function(_CommandeListResponse) _then) =
      __$CommandeListResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Map<String, List<CommandeResponse>> results,
      int total,
      int page,
      int limit,
      int totalPage});
}

/// @nodoc
class __$CommandeListResponseCopyWithImpl<$Res>
    implements _$CommandeListResponseCopyWith<$Res> {
  __$CommandeListResponseCopyWithImpl(this._self, this._then);

  final _CommandeListResponse _self;
  final $Res Function(_CommandeListResponse) _then;

  /// Create a copy of CommandeListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? results = null,
    Object? total = null,
    Object? page = null,
    Object? limit = null,
    Object? totalPage = null,
  }) {
    return _then(_CommandeListResponse(
      results: null == results
          ? _self._results
          : results // ignore: cast_nullable_to_non_nullable
              as Map<String, List<CommandeResponse>>,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: null == totalPage
          ? _self.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on

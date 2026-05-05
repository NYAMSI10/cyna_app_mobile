// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slider_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SliderResponse {
  @JsonKey(name: '_id')
  String get id;
  String? get title;
  String? get image;
  String? get nameUrl;
  String? get linkUrl;
  int? get order;

  /// Create a copy of SliderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SliderResponseCopyWith<SliderResponse> get copyWith =>
      _$SliderResponseCopyWithImpl<SliderResponse>(
          this as SliderResponse, _$identity);

  /// Serializes this SliderResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SliderResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.nameUrl, nameUrl) || other.nameUrl == nameUrl) &&
            (identical(other.linkUrl, linkUrl) || other.linkUrl == linkUrl) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, image, nameUrl, linkUrl, order);

  @override
  String toString() {
    return 'SliderResponse(id: $id, title: $title, image: $image, nameUrl: $nameUrl, linkUrl: $linkUrl, order: $order)';
  }
}

/// @nodoc
abstract mixin class $SliderResponseCopyWith<$Res> {
  factory $SliderResponseCopyWith(
          SliderResponse value, $Res Function(SliderResponse) _then) =
      _$SliderResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String? title,
      String? image,
      String? nameUrl,
      String? linkUrl,
      int? order});
}

/// @nodoc
class _$SliderResponseCopyWithImpl<$Res>
    implements $SliderResponseCopyWith<$Res> {
  _$SliderResponseCopyWithImpl(this._self, this._then);

  final SliderResponse _self;
  final $Res Function(SliderResponse) _then;

  /// Create a copy of SliderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? image = freezed,
    Object? nameUrl = freezed,
    Object? linkUrl = freezed,
    Object? order = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      nameUrl: freezed == nameUrl
          ? _self.nameUrl
          : nameUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      linkUrl: freezed == linkUrl
          ? _self.linkUrl
          : linkUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SliderResponse].
extension SliderResponsePatterns on SliderResponse {
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
    TResult Function(_SliderResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SliderResponse() when $default != null:
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
    TResult Function(_SliderResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SliderResponse():
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
    TResult? Function(_SliderResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SliderResponse() when $default != null:
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
    TResult Function(@JsonKey(name: '_id') String id, String? title,
            String? image, String? nameUrl, String? linkUrl, int? order)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SliderResponse() when $default != null:
        return $default(_that.id, _that.title, _that.image, _that.nameUrl,
            _that.linkUrl, _that.order);
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
    TResult Function(@JsonKey(name: '_id') String id, String? title,
            String? image, String? nameUrl, String? linkUrl, int? order)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SliderResponse():
        return $default(_that.id, _that.title, _that.image, _that.nameUrl,
            _that.linkUrl, _that.order);
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
    TResult? Function(@JsonKey(name: '_id') String id, String? title,
            String? image, String? nameUrl, String? linkUrl, int? order)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SliderResponse() when $default != null:
        return $default(_that.id, _that.title, _that.image, _that.nameUrl,
            _that.linkUrl, _that.order);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SliderResponse implements SliderResponse {
  _SliderResponse(
      {@JsonKey(name: '_id') required this.id,
      this.title,
      this.image,
      this.nameUrl,
      this.linkUrl,
      this.order});
  factory _SliderResponse.fromJson(Map<String, dynamic> json) =>
      _$SliderResponseFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String? title;
  @override
  final String? image;
  @override
  final String? nameUrl;
  @override
  final String? linkUrl;
  @override
  final int? order;

  /// Create a copy of SliderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SliderResponseCopyWith<_SliderResponse> get copyWith =>
      __$SliderResponseCopyWithImpl<_SliderResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SliderResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SliderResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.nameUrl, nameUrl) || other.nameUrl == nameUrl) &&
            (identical(other.linkUrl, linkUrl) || other.linkUrl == linkUrl) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, image, nameUrl, linkUrl, order);

  @override
  String toString() {
    return 'SliderResponse(id: $id, title: $title, image: $image, nameUrl: $nameUrl, linkUrl: $linkUrl, order: $order)';
  }
}

/// @nodoc
abstract mixin class _$SliderResponseCopyWith<$Res>
    implements $SliderResponseCopyWith<$Res> {
  factory _$SliderResponseCopyWith(
          _SliderResponse value, $Res Function(_SliderResponse) _then) =
      __$SliderResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String? title,
      String? image,
      String? nameUrl,
      String? linkUrl,
      int? order});
}

/// @nodoc
class __$SliderResponseCopyWithImpl<$Res>
    implements _$SliderResponseCopyWith<$Res> {
  __$SliderResponseCopyWithImpl(this._self, this._then);

  final _SliderResponse _self;
  final $Res Function(_SliderResponse) _then;

  /// Create a copy of SliderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? image = freezed,
    Object? nameUrl = freezed,
    Object? linkUrl = freezed,
    Object? order = freezed,
  }) {
    return _then(_SliderResponse(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      nameUrl: freezed == nameUrl
          ? _self.nameUrl
          : nameUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      linkUrl: freezed == linkUrl
          ? _self.linkUrl
          : linkUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on

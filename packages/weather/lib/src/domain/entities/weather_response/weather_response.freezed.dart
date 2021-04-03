// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'weather_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) {
  return _WeatherResponse.fromJson(json);
}

/// @nodoc
class _$WeatherResponseTearOff {
  const _$WeatherResponseTearOff();

  _WeatherResponse call(
      {required String title,
      required LocationType locationType,
      required int woeid,
      required String lattLong}) {
    return _WeatherResponse(
      title: title,
      locationType: locationType,
      woeid: woeid,
      lattLong: lattLong,
    );
  }

  WeatherResponse fromJson(Map<String, Object> json) {
    return WeatherResponse.fromJson(json);
  }
}

/// @nodoc
const $WeatherResponse = _$WeatherResponseTearOff();

/// @nodoc
mixin _$WeatherResponse {
  String get title => throw _privateConstructorUsedError;
  LocationType get locationType => throw _privateConstructorUsedError;
  int get woeid => throw _privateConstructorUsedError;
  String get lattLong => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherResponseCopyWith<WeatherResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherResponseCopyWith<$Res> {
  factory $WeatherResponseCopyWith(
          WeatherResponse value, $Res Function(WeatherResponse) then) =
      _$WeatherResponseCopyWithImpl<$Res>;
  $Res call(
      {String title, LocationType locationType, int woeid, String lattLong});
}

/// @nodoc
class _$WeatherResponseCopyWithImpl<$Res>
    implements $WeatherResponseCopyWith<$Res> {
  _$WeatherResponseCopyWithImpl(this._value, this._then);

  final WeatherResponse _value;
  // ignore: unused_field
  final $Res Function(WeatherResponse) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? locationType = freezed,
    Object? woeid = freezed,
    Object? lattLong = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      locationType: locationType == freezed
          ? _value.locationType
          : locationType // ignore: cast_nullable_to_non_nullable
              as LocationType,
      woeid: woeid == freezed
          ? _value.woeid
          : woeid // ignore: cast_nullable_to_non_nullable
              as int,
      lattLong: lattLong == freezed
          ? _value.lattLong
          : lattLong // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$WeatherResponseCopyWith<$Res>
    implements $WeatherResponseCopyWith<$Res> {
  factory _$WeatherResponseCopyWith(
          _WeatherResponse value, $Res Function(_WeatherResponse) then) =
      __$WeatherResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title, LocationType locationType, int woeid, String lattLong});
}

/// @nodoc
class __$WeatherResponseCopyWithImpl<$Res>
    extends _$WeatherResponseCopyWithImpl<$Res>
    implements _$WeatherResponseCopyWith<$Res> {
  __$WeatherResponseCopyWithImpl(
      _WeatherResponse _value, $Res Function(_WeatherResponse) _then)
      : super(_value, (v) => _then(v as _WeatherResponse));

  @override
  _WeatherResponse get _value => super._value as _WeatherResponse;

  @override
  $Res call({
    Object? title = freezed,
    Object? locationType = freezed,
    Object? woeid = freezed,
    Object? lattLong = freezed,
  }) {
    return _then(_WeatherResponse(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      locationType: locationType == freezed
          ? _value.locationType
          : locationType // ignore: cast_nullable_to_non_nullable
              as LocationType,
      woeid: woeid == freezed
          ? _value.woeid
          : woeid // ignore: cast_nullable_to_non_nullable
              as int,
      lattLong: lattLong == freezed
          ? _value.lattLong
          : lattLong // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_WeatherResponse implements _WeatherResponse {
  const _$_WeatherResponse(
      {required this.title,
      required this.locationType,
      required this.woeid,
      required this.lattLong});

  factory _$_WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_WeatherResponseFromJson(json);

  @override
  final String title;
  @override
  final LocationType locationType;
  @override
  final int woeid;
  @override
  final String lattLong;

  @override
  String toString() {
    return 'WeatherResponse(title: $title, locationType: $locationType, woeid: $woeid, lattLong: $lattLong)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WeatherResponse &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.locationType, locationType) ||
                const DeepCollectionEquality()
                    .equals(other.locationType, locationType)) &&
            (identical(other.woeid, woeid) ||
                const DeepCollectionEquality().equals(other.woeid, woeid)) &&
            (identical(other.lattLong, lattLong) ||
                const DeepCollectionEquality()
                    .equals(other.lattLong, lattLong)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(locationType) ^
      const DeepCollectionEquality().hash(woeid) ^
      const DeepCollectionEquality().hash(lattLong);

  @JsonKey(ignore: true)
  @override
  _$WeatherResponseCopyWith<_WeatherResponse> get copyWith =>
      __$WeatherResponseCopyWithImpl<_WeatherResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WeatherResponseToJson(this);
  }
}

abstract class _WeatherResponse implements WeatherResponse {
  const factory _WeatherResponse(
      {required String title,
      required LocationType locationType,
      required int woeid,
      required String lattLong}) = _$_WeatherResponse;

  factory _WeatherResponse.fromJson(Map<String, dynamic> json) =
      _$_WeatherResponse.fromJson;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  LocationType get locationType => throw _privateConstructorUsedError;
  @override
  int get woeid => throw _privateConstructorUsedError;
  @override
  String get lattLong => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WeatherResponseCopyWith<_WeatherResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

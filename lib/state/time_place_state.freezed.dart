// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'time_place_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TimePlaceStateTearOff {
  const _$TimePlaceStateTearOff();

  _TimePlaceState call(
      {required String time, required String place, required int price}) {
    return _TimePlaceState(
      time: time,
      place: place,
      price: price,
    );
  }
}

/// @nodoc
const $TimePlaceState = _$TimePlaceStateTearOff();

/// @nodoc
mixin _$TimePlaceState {
  String get time => throw _privateConstructorUsedError;
  String get place => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimePlaceStateCopyWith<TimePlaceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimePlaceStateCopyWith<$Res> {
  factory $TimePlaceStateCopyWith(
          TimePlaceState value, $Res Function(TimePlaceState) then) =
      _$TimePlaceStateCopyWithImpl<$Res>;
  $Res call({String time, String place, int price});
}

/// @nodoc
class _$TimePlaceStateCopyWithImpl<$Res>
    implements $TimePlaceStateCopyWith<$Res> {
  _$TimePlaceStateCopyWithImpl(this._value, this._then);

  final TimePlaceState _value;
  // ignore: unused_field
  final $Res Function(TimePlaceState) _then;

  @override
  $Res call({
    Object? time = freezed,
    Object? place = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      place: place == freezed
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$TimePlaceStateCopyWith<$Res>
    implements $TimePlaceStateCopyWith<$Res> {
  factory _$TimePlaceStateCopyWith(
          _TimePlaceState value, $Res Function(_TimePlaceState) then) =
      __$TimePlaceStateCopyWithImpl<$Res>;
  @override
  $Res call({String time, String place, int price});
}

/// @nodoc
class __$TimePlaceStateCopyWithImpl<$Res>
    extends _$TimePlaceStateCopyWithImpl<$Res>
    implements _$TimePlaceStateCopyWith<$Res> {
  __$TimePlaceStateCopyWithImpl(
      _TimePlaceState _value, $Res Function(_TimePlaceState) _then)
      : super(_value, (v) => _then(v as _TimePlaceState));

  @override
  _TimePlaceState get _value => super._value as _TimePlaceState;

  @override
  $Res call({
    Object? time = freezed,
    Object? place = freezed,
    Object? price = freezed,
  }) {
    return _then(_TimePlaceState(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      place: place == freezed
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TimePlaceState implements _TimePlaceState {
  const _$_TimePlaceState(
      {required this.time, required this.place, required this.price});

  @override
  final String time;
  @override
  final String place;
  @override
  final int price;

  @override
  String toString() {
    return 'TimePlaceState(time: $time, place: $place, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimePlaceState &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other.place, place) &&
            const DeepCollectionEquality().equals(other.price, price));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(place),
      const DeepCollectionEquality().hash(price));

  @JsonKey(ignore: true)
  @override
  _$TimePlaceStateCopyWith<_TimePlaceState> get copyWith =>
      __$TimePlaceStateCopyWithImpl<_TimePlaceState>(this, _$identity);
}

abstract class _TimePlaceState implements TimePlaceState {
  const factory _TimePlaceState(
      {required String time,
      required String place,
      required int price}) = _$_TimePlaceState;

  @override
  String get time;
  @override
  String get place;
  @override
  int get price;
  @override
  @JsonKey(ignore: true)
  _$TimePlaceStateCopyWith<_TimePlaceState> get copyWith =>
      throw _privateConstructorUsedError;
}
